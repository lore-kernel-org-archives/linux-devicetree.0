From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Tue, 7 Oct 2008 11:50:38 -0500
Message-ID: <20081007165038.GA17126@ld0162-tx32.am.freescale.net>
References: <20081003043710.GH3002@yookeroo.seuss>
	<20081006170601.GA31967@ld0162-tx32.am.freescale.net>
	<20081007014103.GA23135@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081007014103.GA23135-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2008 at 12:41:03PM +1100, David Gibson wrote:
> > Instead of /addnode/, how about an alternate version of (or option to)
> > /merge/ that merges the second tree with the contents of the first,
> 
> Um.. I don't entirely see how this variant of /merge/ would differ
> from /addnode/.

/addnode/ can only add one node at a time, and has an different syntax
than normal for representing the node to be added (name is split from
body).  /mergeunder/ could add any number of nodes and/or properties,
and would use more normal syntax.

> > rather than treating the trees as sharing a root?  This could also
> > supersede /setprop/, if conflicts are defined to be resolved in favor of
> > the second tree.
> 
> True, and I was assuming /merge/ would resolve conflicts in favour of
> one of the trees.  As I said, these suggestions are only an outline -
> I'm not entirely sure what we need by way of node expressions.

Understood -- I was just trying to help refine the suggestion.  I think
the ideal way forward involves elements of both your proposal and Jon's.

> > > It's possible to do this just with the /setprop/, /addnode/ operators
> > > described above, but that's awkward and verbose, so allowing
> > > expressions in the same place the property/node names go now seems
> > > better.  jdl's patch series allows this, but I'm not sure what makes
> > > the grammatical distinction between the parser expecting a bare node
> > > name and an expression, which worries me.
> > 
> > I think it's the leading backslash before identifiers that distinguishes
> > it.
> 
> Uh.. this doesn't make sense, an expression doesn't have to contain
> identifiers (constant expressions).

It's not nonsensical, just incomplete -- I was assuming that it was
obvious that quote-marks differentiate string constants.  Integer
constants would need parentheses in that context, though.

> Actually I suspect it's the presence of quotes which does the trick,
> at least in the examples Jon's given.
> 
> > > What I would suggest here is that expressions for node/property names
> > > must be parenthesized.  ( and ) aren't used in node/property names
> > > either in theory or practice AFAIK and this is consistent with integer
> > > expressions having to be parenthesized within cell lists to avoid
> > > ambiguity.
> > 
> > I'd rather have an identifier prefix than to require parentheses in
> > otherwise unambiguous contexts (which would basically amount to needing
> > both a prefix and a suffix).  This applies to cell context as well.
> 
> As above, this doesn't work.  It doubly doesn't work for cell context,
> because we need to disambiguate <3 (-2)> (2 cells) from <(3-2)> (1 cell).

It was a bare identifier (or function call) that I had in mind as a
non-ambiguous context, though I can see how allowing that might
complicate the implementation a little -- and allowing things like 3*2
to be unparenthesized would be even more complex.

We probably should have added comma-delimiting when we switched to
decimal-by-default.

> Ah, yes, this is something I had a plan for, way back.  I wanted to
> keep the [...] construct as a being a very compact representation of
> bytestrings - bytestring literals effectively.  That means bare hex
> and no expressions (because expressions and bare hex are a highly
> confusing mix as we've discovered).  But, I was intending to extend
> the celllist construct to allow the "cells" to be of different sizes -
> this would be useful for dealing with 64-bit quantities too.  Not sure
> how to do the syntax, though  Possibly:
> 	<.1 0xab 0xcd > 		(1 byte entries)
> 	<.8 0xdeadbeef00000000 >	(8 byte entries)
> Defaulting to .4, of course.  I'm not over fond of that though.
> Better suggestions welcome.

Seems reasonable.

-Scott
