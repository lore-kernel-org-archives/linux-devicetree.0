From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 REPOST] dtc: Add support for named integer constants
Date: Mon, 16 Jan 2012 12:54:21 +1100
Message-ID: <20120116015421.GC4512@truffala.fritz.box>
References: <1323720257-23847-1-git-send-email-swarren@nvidia.com>
 <CAPnjgZ3Rnbu6qZponnbQ8bRgABb-58HG-yYSxRu2FZfvwPnMJw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1751860874@HQMAIL01.nvidia.com>
 <CAPnjgZ19s-O2m3CnrfSNLhg4hA61kKiwFym7pOTZ=C7kG+SVbA@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17761F17D5@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A52D@HQMAIL01.nvidia.com>
 <20120111130056.GK4935@truffala.fritz.box>
 <E1RkzJs-000590-4s@jdl.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A7A5@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF177EE3A7A5-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 11, 2012 at 01:36:46PM -0800, Stephen Warren wrote:
> Jon Loeliger wrote at Wednesday, January 11, 2012 7:38 AM:
> > > On Tue, Jan 10, 2012 at 01:54:30PM -0800, Stephen Warren wrote:
> > > > John, David,
> > > >
> > > > What can we do to reach consensus on expanding dtc to handle named
> > > > constants, or in general any future direction to extend the syntax with
> > > > expressions etc.?
> > >
> > > Hrm, so, I'm not at all keen to add a named constant syntax without at
> > > least having an outline of what a future macro/function syntax would
> > > look like.
> > 
> > Which is where I thought it was left earlier...? :-)
> > And it's not just what the macro/function syntax will look like,
> > but also how these will play into a more generalized expression
> > handling mechanism.  Defining something one-off now that doesn't
> > fit well into a long term plan is less than ideal.
> > 
> > Yes, I know that is tantamount to requiring the whole, larger
> > picture be solved first.  But Dave is right -- at least an outline
> > of the direction.  Seriously, the lexical problems can form some
> > of the nastiest gotchas if we're not careful from the onset.
> 
> So that all makes sense.
> 
> My question is: How can we get consensus on what we want that complete
> future syntax to be?

Um.. try to make a detailed proposal (synthesised from earlier ones)
that enough people are happy with (Jon and myself for starters).

> IIRC, Jon has a branch that implements a proposal,
> and David at least posted a different proposal if not actual code that
> implemented it. We're not missing proposals, but rather a mechanism to
> decide between them?

Well.. that's not entirely true.  The proposed expression syntax was
essentially identical between Jon's proposal and mine (though the
implementation of it is quite different).  Jon's proposal includes
loops and "functions", mine started with just expressions.  I had in
mind some sort of macro language to allow making use of those
expressions.  I'm not sure quite what that would look like (or even if
it would be implemented withing dtc, or use an external helper like
cpp).  So there's really only one proposal that covers the full space,
it's just I don't like it that much.

> For what it's worth, I'd tend towards a simple expression-based syntax
> where property values can be calculated with C-style expressions. Basic
> math stuff like ( ) + - * / & | ~ << >> and some basic string handling
> operations (str(int) and concatenation).

Ok.  Well, I should de-bitrot and re-propose my integer expression
patch, which covered most of that.  I also intended basic string
operations as you suggest, though I can't remember if I made a start
on that.

I think applying that would be reasonably safe as it is.  If we go
with Jon's proposal or something like it in the end, we'll need to
reimplement most of the expression evaluation (to do delayed instead
of parse-time evaluation).  But I'm much less worried about having to
rework code - even substantially - than I am about user-visible syntax
regressions.

> I think that'd cover the vast
> majority of use-cases wouldn't it?

Not quite.  Expressions are interesting of themselves, but not all
that useful.  It's functions or macros plus expressions which gets us
close to where we want to be.  So expressions gives a little as it is,
a lot more for people already running their dts through cpp.  To
really make progress, we still want a proposal for a standard function
or macro syntax for dtc.  And, obviously, a decision whether to go
with functions or macros.  I like macros, because I think they give a
lot of flexibility with minimal conceptual complexity.  Jon's proposal
is based on functions.  I didn't like his proposal very much as a
whole, but I should take another look and see what I think of the
function syntax in isolation.

> For more advanced stuff like loops
> to synthesize multiple nodes, it seems like writing a custom script to
> generate the .dts file and then passing the result to dtc would be more
> modular, and not require us to create a whole new Turing-complete
> language in dtc?

Perhaps.  One of the reasons that I'm so doggedly conservative and
picky about new dtc syntax is that small languages have a tendency to
grow to Turing completeness, whether you intend it originally or not.
I'm ok with that happening, but I'd really like to make sure that when
and if it happens, we arrive at a decent Turing complete language, not
a horrible one.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
