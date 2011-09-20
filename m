From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add support for named integer constants
Date: Tue, 20 Sep 2011 18:04:09 +1000
Message-ID: <20110920080409.GL29197@yookeroo.fritz.box>
References: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B327A62D@HQMAIL01.nvidia.com>
	<CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg@mail.gmail.com>
	<20110908183211.GM2967@ponder.secretlab.ca>
	<20110909013433.GC21002@yookeroo.fritz.box>
	<74CDBE0F657A3D45AFBB94109FB122FF04B732144F@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B732144F-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
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
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2011 at 03:13:55PM -0700, Stephen Warren wrote:
> David Gibson wrote at Thursday, September 08, 2011 7:35 PM:
> > On Thu, Sep 08, 2011 at 11:32:11AM -0700, Grant Likely wrote:
> > > On Thu, Sep 08, 2011 at 06:09:27AM -0700, Simon Glass wrote:
> > > > Hi Stephen,
> > > >
> > > > On Fri, Sep 2, 2011 at 11:34 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > > > Stephen Warren wrote at Tuesday, August 30, 2011 3:30 PM:
> > > > >> You may define constants as follows:
> > > > >>
> > > > >> /define/ TWO 2;
> > > > >> /define/ FOUR 4;
> > > > >> /define/ OTHER FOUR;
> > > > >>
> > > > >> And properties may use these values as follows:
> > > > >>
> > > > >> foo = <1 TWO 3 FOUR 5>;
> > > > >>
> > > > >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ...
> > >
> > > What are the risks of symbol conflict with this approach?  I'm
> > > concerned that a poorly chosen /define/ name will break parsing in
> > > non-obvious ways.  Would it be better to have a every define reference
> > > to be explicit in the syntax?
> > 
> > I really don't want to make identifiers - which is essentially what
> > we're talking here - explicitly marked, on the basis of "be like C".
> > I believe they should be safe, as long as we don't attempt to
> > recognize them in property/nodename context.
> 
> Grant,
> 
> As far as I understand the parser code, the define names aren't accepted
> where they'd cause conflicts with node names etc. I just tested using
> node names that matched names set up with /define/, and didn't see it
> cause any unexpected syntax errors.
> 
> Jon, David, 
> 
> Does the change look good to go in?

Um, so.  I meant to discuss this earlier, but I've had many things to
do.

The complexity here is that as you've noted, this kind of all ties in
with more extensive expression / macro / function support as was toyed
with a while back in Jon's test branch.

As you've shown, simple constants are quite straightforward to
implement, and some of my experimental patches show that implementing
constant expressions evaluated during parse is also quite
straightforward.

Things get trickier when we want to extend this to macros or
functions.  The only problem I have with your patch at present is that
I'd prefer not to implement a constant defining syntax, only to have
it obsoleted by whatever we do for macros or functions.


So, there are basically two approaches to macro or function support.

A) Functions

We allow definition of functions with parameters.  These are stored
in some kind of parse tree representation in a symbol table.  Instead
of producing a more-or-less fully realised device tree as we parse, we
produce some kind of parse tree showing the expressions and function
calls.  After parsing is complete we make another pass evaluating all
the expressions and functions.

Advantages:
 * Allows repeats / iteration to be done simply.
 * Potentially allows superior type and other error reporting
 * Jon already has a prototype in the test branch

Disadvantages:
 * Requires a substantial runtime evaluation infrastructure to be
   implemented, including representation and storage of function
   definitions.
 * I don't like Jon's proposed syntax in the test branch because
   although it's C like, it's very much against the current
   declarative feel of dts.  That is, it feels somewhat like a program
   that's executed to produce the device tree rather than a
   representation of the device tree itself

B) Macros

Before parsing proper, we preprocess the source to expand macros
(which may expand to constant expressions).  Then we parse, evaluating
expressions as we go.

Advantages:
 * Lots of flexibility with a conceptually simple model; once we get
   to the parser we need only consider the declarative structure of
   the tree, not runtime evaluation.
 * Matches existing C prepropcessor usage.

Disadvantages:
 * Iteration is awkward.  Either special iteration built in functions
   or awkward macro constructs (THINGX1, THINGX2, THINGX4...) are
   required.

There are two specific suboptions of note here:

  B1) Use cpp itself

  Advantages:
   * Saves a lot of work implementing the preprocessor
   * I already have a prototype patch
   * cpp is already being used by some people, they wouldn't have to
     change anything

  Disadvantages:
   * The # used for preprocessor directives clashes with common
     property names beginning with #.  In practice this can be
     disambiguated by assuming only # in column 0 is for cpp, but the
     options to make cpp behave this way are not necessarily portable.
   
  B2) Make our own preprocessor, isomorphic to cpp

  Advantages:
   * We can change the directive format to avoid the # problem
   * We can potentially extend with new syntax if we want it
  Disadvantages:
   * Quite a lot of work in re-implementing cpp.
   * Not clear if this can sanely be done during lexing, or if it will
     need an explicit extra pass requiring awkward temporary storage
     of the preprocessed source.

Our current impasse is roughly that Jon prefers approach (A), whereas
I prefer (B1) on balance.  (B1) would obsolete your suggested define
syntax.  (A) and (B2) could both potentially subsume it, instead.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
