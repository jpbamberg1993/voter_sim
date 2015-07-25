# Voter Simulation Project

Create a REPL-driven voting simulation program. It should work like this.

This is the main menu:

```
What would you like to do? Create, List, Update, or Vote
```

Use user-friendly shortcuts for your menu. Don't make your user type out each action.

When I type Create:

```
What would you like to create? Candidate or Voter
```

When I type Candidate:

```
Name?

Party? Democrat or Republican
```

When I type Voter:

```
Name?

Politics? Progressive, Conservative, Libertarian, Massachusetts Democrat, or Independent
```

When creating something is done, return to the main menu.

When I type List, output a list of all the created characters.
List
* Candidate, Marco Rubio, Conservative
* Voter, Juha Mikkola, Massachusetts Democrat

When I type Update, allow me to update a character.
Update

```
Name?
Marco Rubio

New name?

New Party?    # if a candidate
New Politics? # if a voter
```

When I type Vote, start the simulation.

First, run a campaign. Every candidate should visit every voter and do a stump speech.

If a candidate is a Conservative, they have a:

- 90% chance of convincing a Libertarian voter to vote for him
- 75% chance of convincing a Conservative voter to vote for him
- 50% chance of convincing a Independent voter to vote for him
- 25% chance of convincing a Progressive voter to vote for him
- 10% chance of convincing a Massachusetts Democrat voter to vote for him

If a candidate is a Democrat, they have a
- 90% chance of convincing a Massachusetts Democrat voter to vote for him
- 75% chance of convincing a Progressive voter to vote for him
- 50% chance of convincing a Independent voter to vote for him
- 25% chance of convincing a Conservative voter to vote for him
- 10% chance of convincing a Libertarian voter to vote for him

After every stump speech
- Puts a comment from the Voter indicating whether or not he has changed his mind
- If the Voter is also Candidate, puts a comment condemning what was said in the speech

The campaign is complete when every voter has listened to at least one stump speech.

When the campaign is over, tally up the votes and determine the winner.

Candidates are also Voters, but they will always vote for themselves.

You should practice using TDD to help you manage this large project.

----- Create Hash to store result of votes
----- 
