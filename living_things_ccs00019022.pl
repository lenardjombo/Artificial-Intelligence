
go_classification :- hypothesize_classification(Classification),
    write('I guess that the organism belongs to the classification: '),
    write(Classification),
    nl,
    undo_classification.

% Hypothesize based on classification
hypothesize_classification(mammal)     :- mammal_classification, !.
hypothesize_classification(bird)       :- bird_classification, !.
hypothesize_classification(fish)       :- fish_classification, !.
hypothesize_classification(reptile)    :- reptile_classification, !.
hypothesize_classification(amphibian)  :- amphibian_classification, !.
hypothesize_classification(insect)     :- insect_classification, !.
hypothesize_classification(crustacean) :- crustacean_classification, !.
hypothesize_classification(plant)      :- plant_classification, !.
hypothesize_classification(fungi)      :- fungi_classification, !.
hypothesize_classification(unknown).

% Mammal classification
mammal_classification :-
    verify_classification(has_hair_or_fur),
    verify_classification(gives_birth_to_live_young),
    verify_classification(warm_blooded),
    verify_classification(has_mammary_glands),
    verify_classification(breathes_air).

% Bird classification
bird_classification :-
    verify_classification(has_feathers),
    verify_classification(lays_eggs),
    verify_classification(has_beak),
    verify_classification(flies),
    verify_classification(warm_blooded).

% Fish classification
fish_classification :-
    verify_classification(has_scales),
    verify_classification(lives_in_water),
    verify_classification(lays_eggs),
    verify_classification(has_fins),
    verify_classification(has_gills),
    verify_classification(cold_blooded).

% Reptile classification
reptile_classification :-
    verify_classification(has_scales),
    verify_classification(lays_eggs),
    verify_classification(cold_blooded),
    verify_classification(breathes_air).

% Amphibian classification
amphibian_classification :-
    verify_classification(has_moist_skin),
    verify_classification(lays_eggs_in_water),
    verify_classification(lives_on_land_and_water),
    verify_classification(cold_blooded),
    verify_classification(undergoes_metamorphosis).

% Insect classification
insect_classification :-
    verify_classification(has_exoskeleton),
    verify_classification(has_three_body_parts),
    verify_classification(has_six_legs),
    verify_classification(has_wings_or_antennae).

% Crustacean classification
crustacean_classification :-
    verify_classification(has_exoskeleton),
    verify_classification(lives_in_water),
    verify_classification(has_claws),
    verify_classification(has_more_than_six_legs).

% Plant classification
plant_classification :-
    verify_classification(does_photosynthesis),
    verify_classification(has_leaves),
    verify_classification(has_roots),
    verify_classification(has_flowers_or_fruits).

% Fungi classification
fungi_classification :-
    verify_classification(produces_spores),
    verify_classification(grows_in_damp_places),
    verify_classification(no_chlorophyll),
    verify_classification(decomposes_organic_material).

/* How to ask classification questions */
ask_classification(Question) :-
    write('Does the organism have the following characteristic: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      -> 
      assert(yes_classification(Question)) ;
      assert(no_classification(Question)), fail).

:- dynamic yes_classification/1, no_classification/1.

/* How to verify classification */
verify_classification(S) :-
   (yes_classification(S)
    -> 
    true ;
    (no_classification(S)
     -> 
     fail ;
     ask_classification(S))).

/* Undo all yes/no assertions */
undo_classification :- retract(yes_classification(_)), fail.
undo_classification :- retract(no_classification(_)), fail.
undo_classification.
