%Author Vania Santillana
% Resources:class notes, https://language.tptp.org/home , https://tptp.org/cgi-bin/SystemOnTPTP
% Also I did oredered resolutions first in word which made this easy
% Atoms:
% party = the party happened
% ann   = Ann attended
% bill  = Bill attended
% carl  = Carl attended
% dave  = Dave attended
----------------------------------------------------------------------------------------------------------------
/*
2.  There was another party.  Ann and Bill and Carl and Dave
were invited.  Not all of them attended.  Whenever there is a party,
Bill attends when Ann attends.  Also, Carl attends when Bill attends.
Also, Dave attends when Carl attends.  Also, Ann attends when Dave attends.
Prove that nobody came to the party.
*/



% given: Not all four attended.
cnf(not_all_attended, axiom,
    (~ann | ~bill | ~carl | ~dave)).

% Given: The party happened.
cnf(party_happened, axiom, party).

% Given: Attendance rules // party atom isnt needed to proof 
cnf(ann_implies_bill, axiom, (~ann | bill)).
cnf(bill_implies_carl, axiom, (~bill | carl)).
cnf(carl_implies_dave, axiom, (~carl | dave)).
cnf(dave_implies_ann, axiom, (~dave | ann)).

% Negation of the conclusion at least one person attended.// not true
cnf(negated_goal, negated_conjecture,
    (ann | bill | carl | dave)).

----------------------------------------------------------------------------------------------------------

/*
3.  There was another party.  Ann and Bill and Carl and Dave
were invited.  There were at least two people at the party.
If Ann attended then everybody else attended.  And Bill always 
attends when Carl attends.  Prove that Bill came to the party.
*/


cnf(party_happened, axiom, party).

% At least two  attended:
cnf(at_least_two_1, axiom, (ann | bill | carl)).
cnf(at_least_two_2, axiom, (ann | bill | dave)).
cnf(at_least_two_3, axiom, (ann | carl | dave)).
cnf(at_least_two_4, axiom, (bill | carl | dave)).

% If Ann attended, everybody else attended.
cnf(ann_implies_bill, axiom, (~ann | bill)).
cnf(ann_implies_carl, axiom, (~ann | carl)).
cnf(ann_implies_dave, axiom, (~ann | dave)).

% Bill attends when Carl attends.
cnf(carl_implies_bill, axiom, (~carl | bill)).

% Negation of the conclusion: Bill did not attend.
cnf(negated_goal, negated_conjecture, ~bill).
--------------------------------------------------------------------------------------------------------
/*
4.  There was another party.  This time only Ann and Bill and
Carl were invited.  Either Ann or Bill attended, but not both.  Either
Bill or Carl attended, but not both.  Prove if either Ann or Carl came 
to the party, then both Ann and Carl came to the party.
*/
cnf(party_happened, axiom, party).

% Ann and Bill, either one attended, but not both.
cnf(ann_or_bill, axiom, (ann | bill)).
cnf(not_both_ann_bill, axiom, (~ann | ~bill)).

% Bill and Carl, either one attended, but not both.
cnf(bill_or_carl, axiom, (bill | carl)).
cnf(not_both_bill_carl, axiom, (~bill | ~carl)).

% conclusion. Ann or Carl attended, but they did not both attend.
cnf(negated_goal_1, negated_conjecture, (ann | carl)).
cnf(negated_goal_2, negated_conjecture, (~ann | ~carl)).