From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Tue, 7 Oct 2008 12:41:03 +1100
Message-ID: <20081007014103.GA23135@yookeroo.seuss>
References: <20081003043710.GH3002@yookeroo.seuss>
	<20081006170601.GA31967@ld0162-tx32.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081006170601.GA31967-VKaLA/mbEU932VTgPCOETVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 06, 2008 at 12:06:01PM -0500, Scott Wood wrote:
> On Fri, Oct 03, 2008 at 02:37:10PM +1000, David Gibson wrote:
> > I'm less sure what other operators we'll need here - probably need to
> > build these based on actual usage examples.  Likely candidates,
> > however are:
> > 	- set property
> > e.g. /setprop/({ }, "reg", < 17 >) == { reg = < 17 >; }
> > 	- remove property
> > e.g. /delprop({ reg = <17>; }, "reg") == { }
> > 	- add subnode
> > e.g. /addnode/({ }, "subnode@17", {reg = <17>;}) == 
> > 	{ subnode@17 { reg = <17>; }; }
> > 	- merge
> > e.g. /merge/({foo = "abc";}, {bar = <17>;}) == {foo = "abc"; bar=<17>;}
> > (this would recurse down subnodes with identical names)
> 
> Instead of /addnode/, how about an alternate version of (or option to)
> /merge/ that merges the second tree with the contents of the first,

Um.. I don't entirely see how this variant of /merge/ would differ
from /addnode/.

> rather than treating the trees as sharing a root?  This could also
> supersede /setprop/, if conflicts are defined to be resolved in favor of
> the second tree.

True, and I was assuming /merge/ would resolve conflicts in favour of
one of the trees.  As I said, these suggestions are only an outline -
I'm not entirely sure what we need by way of node expressions.

> > It's possible to do this just with the /setprop/, /addnode/ operators
> > described above, but that's awkward and verbose, so allowing
> > expressions in the same place the property/node names go now seems
> > better.  jdl's patch series allows this, but I'm not sure what makes
> > the grammatical distinction between the parser expecting a bare node
> > name and an expression, which worries me.
> 
> I think it's the leading backslash before identifiers that distinguishes
> it.

Uh.. this doesn't make sense, an expression doesn't have to contain
identifiers (constant expressions).  Even if it does contain
identifiers, they could be arbitrarily far into it, which means we'd
nede to turn glr-parser mode back on, as well as being a bad idea from
a readability point of view.

Actually I suspect it's the presence of quotes which does the trick,
at least in the examples Jon's given.

> > What I would suggest here is that expressions for node/property names
> > must be parenthesized.  ( and ) aren't used in node/property names
> > either in theory or practice AFAIK and this is consistent with integer
> > expressions having to be parenthesized within cell lists to avoid
> > ambiguity.
> 
> I'd rather have an identifier prefix than to require parentheses in
> otherwise unambiguous contexts (which would basically amount to needing
> both a prefix and a suffix).  This applies to cell context as well.

As above, this doesn't work.  It doubly doesn't work for cell context,
because we need to disambiguate <3 (-2)> (2 cells) from <(3-2)> (1 cell).

> > Expressions in labels
> > ---------------------
> > 
> > Jon's patch also allows expressions instead of literals in labels.
> > I'm a lot more dubious about this feature: it's very un-C-like, and
> > removes the current nice lexical distinctness of labels.
> 
> Why do we need it to be distinguished in the lexer?  We have a parser,
> let's use it. :-)

Because they can appear in the same lexical context as propnodenames
which are lexically troublesome already.  Plus I really, really,
seriously want to use nice C like identifiers not these backslash
monstrosities.  That introduces more potential ambiguities if labels
don't have the : as part of the token.

> > Lexical issues of property / node names
> > =======================================
> > 
> > Property and node names are lexically troublesome because they can
> > contain a bunch of characters that would usually have special
> > meanings.  My intention for dealing with this is that property/node
> > names will only be lexed in a small number of contexts.  Usually they
> > will not be recognized, and we can lex C-like identifiers without
> > trouble.
> 
> We could simplify the lexing, and eliminate the lexical restricitons on
> when we can expect a property or node name, by letting the parser glue
> together property/node names when in the appropriate context.  Doing
> otherwise seems like a layering violation.

I've considered this in the past, and experimented.  We really don't
want to go there; attempting to achieve parsing sanity when the
propnodename isn't recognized as a token is just horrible.

I see your point w.r.t. a layering violation, but it's a pretty
standard one in lexer/parser combinations.  It's why it's usually best
to make all the tokens lexically distinct in all contexts.  In our
case I think the readability of bare propnodenames balances the
lex/parsing inconvenience - and in any case we're stuck with it now.

> Is there any plan to support expressions in bytestring context? 
> Otherwise, there's no way to construct things like MAC addresses that
> aren't cell-aligned.

Ah, yes, this is something I had a plan for, way back.  I wanted to
keep the [...] construct as a being a very compact representation of
bytestrings - bytestring literals effectively.  That means bare hex
and no expressions (because expressions and bare hex are a highly
confusing mix as we've discovered).  But, I was intending to extend
the celllist construct to allow the "cells" to be of different sizes -
this would be useful for dealing with 64-bit quantities too.  Not sure
how to do the syntax, though  Possibly:
	<.1 0xab 0xcd > 		(1 byte entries)
	<.8 0xdeadbeef00000000 >	(8 byte entries)
Defaulting to .4, of course.  I'm not over fond of that though.
Better suggestions welcome.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
