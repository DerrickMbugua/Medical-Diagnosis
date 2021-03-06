check:-
    checkfor(Disease),
    write('I believe you have: '),
    write(Disease),
    nl,
    undo.


checkfor(corona):- corona, !.
checkfor(flu):- flu, !.
checkfor(pneumonia):-pneumonia, !.
checkfor(tuberculosis):-tuberculosis, !.
checkfor(byssinosis):-byssinosis, !.
checkfor(unknown).

corona:-
    checkSymptom(headache),
    checkSymptom(sneezing),
    checkSymptom(sore_throat),
    checkSymptom(fever),
    checkSymptom(tiredness),
    nl.

flu:-
    checkSymptom(fever),
    checkSymptom(headache),
    checkSymptom(chills),
    nl.

pneumonia:-
    checkSymptom(cough),
    checkSymptom(fever),
    checkSymptom(shaking_chills),
    checkSymptom(shortness_of_breath),
    nl.

tuberculosis:-
    checkSymptom(persistant_cough),
    checkSymptom(constant_fatigue),
    checkSymptom(weight_loss),
    checkSymptom(fever),
    checkSymptom(coughing_up_blood),
    checkSymptom(night_sweats),
    nl.

byssinosis:-
    checkSymptom(chest_tightness),
    checkSymptom(cough),
    checkSymptom(wheezing),
    nl.

askQuestion(Question):-
    write('Do you have the symptom:'),
    write(Question),
    write('?'),
    read(Reply),
    nl,
    (   (Reply == yes ; Reply == y)
    ->
    assert(yes(Question));
    assert(no(Question)),fail).

:- dynamic yes/1,no/1.

checkSymptom(S):-
    (yes(S)
    ->
    true ;
    (no(S)
    ->
    fail ;
    askQuestion(S))).

undo:-retract(yes(_)),fail.
undo:-retract(no(_)),fail.
undo.
