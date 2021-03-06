Version 2 of Ordinary Room Description by Emily Short begins here.

"An extension to go with Room Description Control, which emulates as closely as possible the behavior of Inform defaults, but allows the intervention of Room Description Control."

Include Room Description Control by Emily Short. 

Section 1 - Use writing a paragraph rules to create initial descriptions

Rule for writing a paragraph about an initially-describable thing (called target) (this is the listing initial appearances of things rule):
	now the target is mentioned;
	say "[initial appearance of the target][paragraph break]".

Rule for writing a paragraph about an initially-describable supporter (called target) which supports something (this is the listing initial appearances of supporters rule):
	now the target is mentioned;
	say "[initial appearance of the target] [paragraph break]";
	carry out the disclosing supported contents activity with the target.

Rule for writing a paragraph about something which is on a scenery supporter (called target) (this is the listing things on supporters rule):
	carry out the disclosing supported contents activity with the target.  

Rule for writing a paragraph about something which is on a supporter (called target) which supports the player (this is the listing things on the player's supporter rule):
	carry out the disclosing supported contents activity with the target. 

Disclosing supported contents of something is an activity.


Rule for disclosing supported contents of something (called the target) which encloses the player (this is the default shared contents description rule):
	say "On [the target] you can see ";
	list the contents of the target, giving brief inventory information, as a sentence, including contents, tersely, not listing concealed items;
	say ".[paragraph break]". 

Rule for disclosing supported contents of something (called the target) (this is the default contents description rule):
	say "On [the target]";
	list the contents of the target, giving brief inventory information, as a sentence, including contents, tersely, prefacing with is/are, not listing concealed items;
	say ".[paragraph break]". 

Definition: a thing is initially-describable if it is initially-described and it is not handled.

Definition: a thing is initially-described if it provides the property initial appearance.

Section 2 - List Nondescript items
 
A last description-priority rule (this is the nondescript items preparation rule):
	now every thing is not marked for listing;
	repeat through the Table of Seen things
	begin; 
		if the output entry is unmentioned, change the output entry to marked for listing;
	end repeat;
	if a marked for listing thing is in the location, carry out the listing nondescript items activity with the location.

Rule for listing nondescript items of a room (called target) (this is the nondescript items listing rule):
	say "You can [if something is mentioned]also [end if]see "; 
	list the contents of the target, as a sentence, tersely, listing marked items only, including contents and giving brief inventory information; 
	say " here."	

Section 3 - Entering and Leaving

A description-concealing rule when entering something (called target) (this is the silence unnecessary description while entering rule):
	repeat with item running through marked for listing things:
		if the item is not enclosed by the target:
			now the item is not marked for listing.

Ordinary Room Description ends here.

---- Documentation ----

The purpose of Ordinary Room Description is to replicate as closely as possible the default room description behavior of Inform while relying on the framework provided by Room Description Control.

This means that including Ordinary Room Description should, by itself, change nothing about the way descriptions are presented in our game. 

The advantage of including it is that we can then make use of Room Description Control to make slight tweaks to Inform's default behavior, as for instance by writing description-concealing rules or changing the priority of items so that they are listed in a different order from the usual within a room.

For more detail on these abilities, see the documentation for Room Description Control.

Example: * Quiet Shelf - A scenery supporter which does not list its contents in the room description. 

	*: "Quiet Shelf"

	Include Ordinary Room Description by Emily Short.

	Sample Chamber is a room. The shelf is scenery in Sample Chamber. On the shelf is a gold coin.

	A description-concealing rule:
		now every thing on the shelf is not marked for listing.

	Test me with "look / get coin / look / drop coin / look".
