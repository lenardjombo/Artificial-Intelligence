# Artificial-Intelligence
Overview
This repository contains three SWI-Prolog projects:

Diseases (diseases.pl): A knowledge base of diseases, their symptoms, causes, and treatments.
Family Relations (family.pl): A family tree model that allows querying relationships like parent, child, sibling, and more.
Living Things (living_things.pl): A classification system for living organisms, categorizing them into biological groups.
Usage.
Ensure SWI-Prolog is installed. Load any project by running:

```bash
  swipl
  [diseases_ccs00019022].  % Or load the respective file
```
Then, you can query the knowledge base, for example:

```prolog
?- symptoms_of(flu, Symptoms).    % For diseases
?- parent(john, mary).            % For family relations
?- classify(tiger, Classification). % For living things
