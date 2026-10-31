/*
Name: Vania Santillana
1.  Last night, there was a party.  Ann and Bill and Carl and Dave
were invited.  Whenever, there is a party, Carl always attends when
Ann and Bill attend.  But Carl will not attend if Dave attends.  We know
that Ann attended the party.  Prove that either Bill or Dave did not
attend the party.

You should
represent the problem in propositional logic, convert the 
problem to clausal form, and represent it in TPTP format. 

A.  Prove it using TPTP and turn in the input and output file.
B.  Prove it yourself using Ordered Resolution, where symbols 
    earlier in alphabetical order are larger.
    - I did this on a seperate word document

atoms:
        party=there was a party
        ann = ann attened
        bill = bill attended
        carl = carl attended
        dave = dave attended
Proof:  either Bill or Dave did not attend the party.
https://language.tptp.org/home

Resources: class notes, https://language.tptp.org/home
*/

% Given: there was a party.
cnf(party_happened, axiom, party).

% Given: if there was a party and Ann and Bill attended, then Carl attended.
cnf(party_ann_bill_imply_carl,
    axiom,
    ~party | ~ann | ~bill | carl).

% Given: if Dave attended, Carl did not attend.
cnf(dave_attended_implies_carl_did_not,
    axiom,
    ~dave | ~carl).

% Given: Ann attended.
cnf(ann_attended, axiom, ann).

% Negation of the goal: assume Bill and Dave both attended.
cnf(assume_bill_attended, negated_conjecture, bill).
cnf(assume_dave_attended, negated_conjecture, dave).