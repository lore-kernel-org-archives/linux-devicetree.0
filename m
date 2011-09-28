From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add support for named integer constants
Date: Wed, 28 Sep 2011 10:29:42 +1000
Message-ID: <20110928002942.GE5361@yookeroo.fritz.box>
References: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B327A62D@HQMAIL01.nvidia.com>
	<CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg@mail.gmail.com>
	<20110908183211.GM2967@ponder.secretlab.ca>
	<20110909013433.GC21002@yookeroo.fritz.box>
	<74CDBE0F657A3D45AFBB94109FB122FF04B732144F@HQMAIL01.nvidia.com>
	<20110920080409.GL29197@yookeroo.fritz.box>
	<4E78CEE1.3090403@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E78CEE1.3090403-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 20, 2011 at 12:35:29PM -0500, Scott Wood wrote:
> On 09/20/2011 03:04 AM, David Gibson wrote:
> > So, there are basically two approaches to macro or function support.
> > 
> > A) Functions
> > 
> > We allow definition of functions with parameters.  These are stored
> > in some kind of parse tree representation in a symbol table.  Instead
> > of producing a more-or-less fully realised device tree as we parse, we
> > produce some kind of parse tree showing the expressions and function
> > calls.  After parsing is complete we make another pass evaluating all
> > the expressions and functions.
> > 
> > Advantages:
> >  * Allows repeats / iteration to be done simply.
> >  * Potentially allows superior type and other error reporting
> >  * Jon already has a prototype in the test branch
> > 
> > Disadvantages:
> >  * Requires a substantial runtime evaluation infrastructure to be
> >    implemented, including representation and storage of function
> >    definitions.
> >  * I don't like Jon's proposed syntax in the test branch because
> >    although it's C like, it's very much against the current
> >    declarative feel of dts.  That is, it feels somewhat like a program
> >    that's executed to produce the device tree rather than a
> >    representation of the device tree itself
> 
> You could say the same thing about macros.  This is just doing it at a
> higher semantic level.

I don't see it that way, but I recognize that that's a matter of
judgement on which reasonable people may disagree :).

> >   Disadvantages:
> >    * The # used for preprocessor directives clashes with common
> >      property names beginning with #.  In practice this can be
> >      disambiguated by assuming only # in column 0 is for cpp, but the
> >      options to make cpp behave this way are not necessarily portable.
> 
> There are other disadvantages, namely that cpp, while familiar, is not a
> very good macro language:
>  - No recursive macro expansion ("self-referential" in cpp's terms) --
>    useful for iteration in the absence of explicit support

Right, this something I mean when I say no iteration support.

>  - No conditionals inside the macro body -- needed to make recursive
>    macros work, but also useful on their own
>  - Awkward handling of multi-line macro bodies -- backslashes
>    everywhere, and makes it difficult/awkward to fix the previous
>    issues with incremental extensions of the macro language

Hm, true.

>  - Does not integrate well with the surrounding language's
>    indentation/formatting, especially if the directives need to be in
>    column 0
> 
> If we're going to use an existing macro language, something more like
> the GNU assembler's macros would be nicer.
> 
> Another disadvantage of any approach that tries to separate macros from
> the underlying language is that you can't have anything be conditional
> on an expression that the macro layer doesn't understand.

That one doesn't follow, actually.  The macro can't implement a
conditional itself, but it could expand to a (constant) conditional
expression which is evaluated later.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
