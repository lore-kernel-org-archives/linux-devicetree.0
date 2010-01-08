From: Benjamin Herrenschmidt <benh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Power.org:parch] Re: RFC: proposal to extend the open-pic
	interrupt specifier definition
Date: Fri, 08 Jan 2010 12:02:18 +1100
Message-ID: <1262912538.2173.690.camel@pasglop>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<20100107005036.GB23206@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100107005036.GB23206@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2010-01-07 at 11:50 +1100, David Gibson wrote:
> On Tue, Jan 05, 2010 at 04:28:12PM -0700, Yoder Stuart-B08248 wrote:
> > 
> > The current open-pic binding defines that interrupt specifiers
> > have 2 cells-- an interrupt number and level/sense encoding.
> > 
> > With chips like the P4080 this is no longer sufficient to
> > represent the various types of interrupt sources handled by
> > the interrupt controller.  A linear list of interrupt numbers
> > doesn't handle all interrupt types-- there are at least 4 different
> > kinds of interrupts on the P4080.
> > 
> > We have a proposal to extend the open-pic binding in
> > a backwards compatible way to encode additional information
> > in the level/sense field.
> > 
> > The current definition of level/sense is:
> >   0 = low to high edge sensitive type enabled
> >   1 = active low level sensitive type enabled
> >   2 = active high level sensitive type enabled
> >   3 = high to low edge sensitive type enabled
> > 
> > Those 2 bits would retain their current meaning, but the
> > full encoding would be extended as follows:
> > 
> >      bits      meaning
> >      ----------------------------------------------
> >      0-7       interrupt sub-type
> >      8-15      interrupt type
> >      16-23     implementation dependent
> >      24-29     reserved
> >      30-31     level/sense encoding
> 
> Um.. what do "type" and "sub-type" mean in this context?

Also keep in mind that Apple has already been playing games with the
first cell of the interrupt specifier on mpic :-)

Not a big deal, but we'll have to be careful in the driver to properly
flag the "standard" extensions vs. the "apple" ones.

Cheers,
Ben.
