From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 REPOST] dtc: Add support for named integer constants
Date: Sun, 22 Jan 2012 08:56:56 +1100
Message-ID: <20120121215656.GN4512@truffala.fritz.box>
References: <CAPnjgZ3Rnbu6qZponnbQ8bRgABb-58HG-yYSxRu2FZfvwPnMJw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1751860874@HQMAIL01.nvidia.com>
 <CAPnjgZ19s-O2m3CnrfSNLhg4hA61kKiwFym7pOTZ=C7kG+SVbA@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17761F17D5@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A52D@HQMAIL01.nvidia.com>
 <20120111130056.GK4935@truffala.fritz.box>
 <E1RkzJs-000590-4s@jdl.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A7A5@HQMAIL01.nvidia.com>
 <20120116015421.GC4512@truffala.fritz.box>
 <E1RmnkQ-0006W9-OT@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1RmnkQ-0006W9-OT-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2012 at 08:41:22AM -0600, Jon Loeliger wrote:
> > 
> > > For what it's worth, I'd tend towards a simple expression-based syntax
> > > where property values can be calculated with C-style expressions. Basic
> > > math stuff like ( ) + - * / & | ~ << >> and some basic string handling
> > > operations (str(int) and concatenation).
> > 
> > ...
> >
> > I think applying that would be reasonably safe as it is.  If we go
> > with Jon's proposal or something like it in the end, we'll need to
> > reimplement most of the expression evaluation (to do delayed instead
> > of parse-time evaluation).  But I'm much less worried about having to
> > rework code - even substantially - than I am about user-visible syntax
> > regressions.
> 
> Even with that piece, there are substanial lexical and parsing
> issues that complicate things.  Bare numbers, or expressions,
> next to each other without syntactic glue can cause parsing fits. :-)

Well, my patch requires that expressions in cell lists have parens
around them.  I think that's the only sane choice, otherwise there's
no reasonable way to distinguish between the 1 cell construct
<(500-300)> and the 2 cell construct <500 (-300)>.

> > > I think that'd cover the vast
> > > majority of use-cases wouldn't it?
> > 
> > Not quite.  Expressions are interesting of themselves, but not all
> > that useful.  It's functions or macros plus expressions which gets us
> > close to where we want to be.  So expressions gives a little as it is,
> 
> That's the difficult and slippery slope here.  Being able to write
>     (FOO << (12 + 2))
> is nice, but it would be nicer and more useful to represent
>     (FOO << ((i) + 2))
> where (i) was actually parameterized or iterated in some way.

Right, exactly my point.

> > a lot more for people already running their dts through cpp.  To
> > really make progress, we still want a proposal for a standard function
> > or macro syntax for dtc.  And, obviously, a decision whether to go
> > with functions or macros.  I like macros, because I think they give a
> > lot of flexibility with minimal conceptual complexity.  Jon's proposal
> > is based on functions.  I didn't like his proposal very much as a
> > whole, but I should take another look and see what I think of the
> > function syntax in isolation.
> 
> It might also be instructive to isolate my expression parsing
> for its lexical and syntactic changes and work towards introducing
> those, perhaps in isolation, as a first step.

Right.  I think my expression code and your expression code were
essentially identical syntactically (possibly modulo a slightly
different set of implemented operators).

> The key there WRT your interest, Stephen, is that it can capture
> the use of apparent variables or #define'd-equivalent symbols within
> the expression handling.  (David's version did not.)

True, but constant definitions (as opposed to function definitions)
would be trivial to add to my code.

> > > For more advanced stuff like loops to synthesize multiple nodes, it
> > > seems like writing a custom script to generate the .dts file and
> > > then passing the result to dtc would be more modular, and not
> > > require us to create a whole new Turing-complete language in dtc?
> > 
> > Perhaps. 
> 
> OK.  Let's explore that approach.  We'll write a, say, Python collection
> of code-objects for each, what?, device.  Place them all in a large library.
> Your "device tree source" effectively now becomes a "main" that starts
> instantiating librarified devices, adding a litle glue to emit some
> one-off property or two.
> 
> That could work.  But is it now OK that the construction of the device
> tree source file is tied to Python?  Do we make the kernel builds now
> reliant upon Python too?  Or Perl?  But wasn't that shot down *again*?
> Hans wants shell.  Lotte likes Lua.  Suki plays with Python.  Willi
> is happy again.  Adolf builds his DTS with Perl.  No one uses Tcl.
> Everyone just checks-in their *generated* DTS results anyway.  It'll
> be a war without tears.
> 
> Or how do you see this working?
> 
> > .. One of the reasons that I'm so doggedly conservative and
> > picky about new dtc syntax is that small languages have a tendency to
> > grow to Turing completeness, whether you intend it originally or not.
> 
> Isn't that someone's observation...?  Behind every flat-file there is
> a Turing-complete language trying to get out.
> 
> > I'm ok with that happening, but I'd really like to make sure that when
> > and if it happens, we arrive at a decent Turing complete language, not
> > a horrible one.
> 
> Name two decent ones. :-)  C and ..., and ....  See?  There isn't another!
> 
> Never mind.
> 
> jdl
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
