From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Mon, 6 Oct 2008 12:06:01 -0500
Message-ID: <20081006170601.GA31967@ld0162-tx32.am.freescale.net>
References: <20081003043710.GH3002@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081003043710.GH3002-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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

On Fri, Oct 03, 2008 at 02:37:10PM +1000, David Gibson wrote:
> I'm less sure what other operators we'll need here - probably need to
> build these based on actual usage examples.  Likely candidates,
> however are:
> 	- set property
> e.g. /setprop/({ }, "reg", < 17 >) == { reg = < 17 >; }
> 	- remove property
> e.g. /delprop({ reg = <17>; }, "reg") == { }
> 	- add subnode
> e.g. /addnode/({ }, "subnode@17", {reg = <17>;}) == 
> 	{ subnode@17 { reg = <17>; }; }
> 	- merge
> e.g. /merge/({foo = "abc";}, {bar = <17>;}) == {foo = "abc"; bar=<17>;}
> (this would recurse down subnodes with identical names)

Instead of /addnode/, how about an alternate version of (or option to)
/merge/ that merges the second tree with the contents of the first,
rather than treating the trees as sharing a root?  This could also
supersede /setprop/, if conflicts are defined to be resolved in favor of
the second tree.

> It's possible to do this just with the /setprop/, /addnode/ operators
> described above, but that's awkward and verbose, so allowing
> expressions in the same place the property/node names go now seems
> better.  jdl's patch series allows this, but I'm not sure what makes
> the grammatical distinction between the parser expecting a bare node
> name and an expression, which worries me.

I think it's the leading backslash before identifiers that distinguishes
it.

> What I would suggest here is that expressions for node/property names
> must be parenthesized.  ( and ) aren't used in node/property names
> either in theory or practice AFAIK and this is consistent with integer
> expressions having to be parenthesized within cell lists to avoid
> ambiguity.

I'd rather have an identifier prefix than to require parentheses in
otherwise unambiguous contexts (which would basically amount to needing
both a prefix and a suffix).  This applies to cell context as well.

> Expressions in labels
> ---------------------
> 
> Jon's patch also allows expressions instead of literals in labels.
> I'm a lot more dubious about this feature: it's very un-C-like, and
> removes the current nice lexical distinctness of labels.

Why do we need it to be distinguished in the lexer?  We have a parser,
let's use it. :-)

> Lexical issues of property / node names
> =======================================
> 
> Property and node names are lexically troublesome because they can
> contain a bunch of characters that would usually have special
> meanings.  My intention for dealing with this is that property/node
> names will only be lexed in a small number of contexts.  Usually they
> will not be recognized, and we can lex C-like identifiers without
> trouble.

We could simplify the lexing, and eliminate the lexical restricitons on
when we can expect a property or node name, by letting the parser glue
together property/node names when in the appropriate context.  Doing
otherwise seems like a layering violation.

Is there any plan to support expressions in bytestring context? 
Otherwise, there's no way to construct things like MAC addresses that
aren't cell-aligned.

-Scott
