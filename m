From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc expressions
Date: Sat, 17 Mar 2012 16:07:38 +1100
Message-ID: <20120317050738.GN24916@truffala.fritz.box>
References: <20120314144611.GZ24916@truffala.fritz.box>
 <4F60BBDD.2000807@wwwdotorg.org>
 <20120316002939.GH24916@truffala.fritz.box>
 <4F641753.5000504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F641753.5000504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 16, 2012 at 10:47:15PM -0600, Stephen Warren wrote:
> On 03/15/2012 06:29 PM, David Gibson wrote:
> > On Wed, Mar 14, 2012 at 09:40:13AM -0600, Stephen Warren wrote:
> >> On 03/14/2012 08:46 AM, David Gibson wrote:
> >>> So, in order to actually make progress on the dtc expressions / macros
> >>> / whatnot stuff, I really think I should dust off my integer (constant)
> >>> expressions patch, and we can apply that.
> >>>
> >>> While we still have disagreements on a bunch of stuff here, I think
> >>> we're at least agreed on what integer expressions should look like.
> >>> And even if we change approaches later (e.g. to your ifs and fors in
> >>> dtc approach) the integer expression syntax won't change, only the
> >>> implementation.
> >>
> >> I'd love to see something like that. I've don't think I've actually
> >> looked through your patches for that yet; I briefly looked at Jon's
> >> since they're in a branch in the dtc repo, but I don't think I managed
> >> to track down the patches you sent for this.
> > 
> > It was quite a while back that I posted.  I've got a version below,
> > but it's *very* bitrotted and won't even go close to applying at
> > present.  I'm meaning to update it, but it will take a little time.
> 
> That looks like a good set of integer expressions.

Unsurprising - I basically copied the grammar for them from a grammar
for C.

> Do you think it'd be easy to agree on a simple "#define foo (expr)"-like
> syntax on top of this?

I'm not sure.

> I think that'd cover a lot of the use-cases
> people are looking for right now, which are more about
> creating/naming/using constants rather than building whole nodes or
> properties in some programmatic way.

Right, that's why I'm suggesting this as a starting point.  I know
there are people manually using cpp or other preprocessors on dts
files already, and with this change alone, that becomes a lot more
useful.

In terms of allowing a #define of our own, I see two simple options:
	1) Just use cpp, and hack around the # issue, either by
invoking it with options to only recognize it in column 0, or by
writing our own cpp implementation which definitely only recognizes in
column 0.
	2) Write our own little preprocessor that does defines
basically the same way as cpp, but calls it !define or /define/ or
something.

> > Index: dtc/dtc-lexer.l
> ...
> > +<*>"<<"		{ return DT_LSHIFT; };
> > +<*>">>"		{ return DT_RSHIFT; };
> > +<*>"<="		{ return DT_LE; };
> > +<*>">="		{ return DT_GE; };
> > +<*>"=="		{ return DT_EQ; };
> > +<*>"!="		{ return DT_NE; };
> > +<*>"&&"		{ return DT_AND; };
> > +<*>"||"		{ return DT_OR; };
> 
> For my education, why aren't all the operators in the lexer file? When I
> first looked at this file, it seemed like a bunch were missing because
> they're only represented in the parser, as literal strings.

lex/yacc conventions.  If you look you'll see the last rule in the lex
file is <*>. and will pass through single characters as tokens to
bison with their token code same as the character code.  Using quoted
characters directly in bison rules assumes that behaviour.  The upshot
of all that is that we only need to explicitly declare tokens for
multi-character operators.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
