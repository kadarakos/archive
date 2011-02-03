Version 3 of Single Paragraph Description by Emily Short begins here.

"A room description extension based on Room Description Control (which is required). All contents of a room are summarized in a single paragraph, starting with the regular room description."

Include Room Description Control by Emily Short.
 
The room description body text rule is not listed in any rulebook.

Definition: a thing is initially-described if it provides the property initial appearance and it is not handled.

The new reporting descriptions rule is listed instead of the reporting descriptions rule in the description-priority rulebook.

A ranking rule for an initially-described thing (called special-target): 
	increase description-rank of the special-target by 5.

A ranking rule for a container (called special-target): 
	increase description-rank of the special-target by the number of mentionable things in the special-target.

A ranking rule for a supporter (called special-target): 
	increase description-rank of the special-target by the number of mentionable things on the special-target.

A ranking rule for something (called special-target) which is not in the location:
	increase description-rank of the special-target by 1. 

To decide whether (target - a room) offers description:
	(- (~~({target}.description == NULL)) -)

This is the new reporting descriptions rule:
	if the location offers description, say "[description of the location][run paragraph on]";
	repeat through the Table of Seen things
	begin;
		if the output entry is mentionable
		begin; 
			if the output entry is initially-described
			begin;
				say "[initial appearance of output entry][run paragraph on]";
				now output entry is mentioned;
			otherwise if output entry is in something (called special-vase);
				say "In [the special-vase] [is-are list of mentionable things in the special-vase]. ";
			otherwise if output entry is on something (called special-vase);
				say "On [the special-vase] [is-are list of mentionable things on the special-vase]. ";
			otherwise if output entry supports something mentionable;
				say "On [a output entry] [is-are list of mentionable things on the output entry]. ";
			otherwise if output entry contains something mentionable;
				say "In [a output entry] [is-are list of mentionable things in the output entry]. ";
			otherwise;
				say "You also see here [a list of mentionable things]. ";
			end if;
		end if;
	end repeat;
	say paragraph break.

After printing the name of something (called special-target):
	now the special-target is not marked for listing;
	now the special-target is mentioned.  

Single Paragraph Description ends here.

---- Documentation ----

Single Paragraph Description is an extension built on Room Description Control. It produces single paragraphs of output, like this:

	The amphitheater is currently empty of spectators, though you can see a magnificent view of the valley beyond the orchestra. On the ground is a mask. You can also see a play script and a ball of wax here.

and when the mask is taken

	The amphitheater is currently empty of spectators, though you can see a magnificent view of the valley beyond the orchestra. You can also see a mask, a play script and a ball of wax here.

In order to accomplish the smooth production of paragraphs, we must end all of our room descriptions and initial appearances with a space, so:

	Amphitheater is a room. "The amphitheater is currently empty of spectators, though you can see a magnificent view of the valley beyond the orchestra. ". 

Note that because of the space before the quotation mark, an extra . may be needed at the ends of these modified descriptions.

Because these single-paragraph descriptions can grow quite long and hard to read, it is likely that this technique will work best in small games or those with few portable objects.

Version 3 removes a bug in which rooms with no description could crash the game.

Example: * Scene Setting - The Amphitheater in full

	*: "Scene Setting"

	Include Single Paragraph Description by Emily Short.

	Amphitheater is a room. "The amphitheater is currently empty of spectators, though you can see a magnificent view of the valley beyond the orchestra. ". A play script and a ball of wax are here.

	A mask is here. "On the floor is a mask. "