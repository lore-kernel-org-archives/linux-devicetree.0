From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: RFC: proposal to extend the open-pic interrupt specifierdefinition
Date: Thu, 7 Jan 2010 10:39:10 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA305987F94@az33exm25.fsl.freescale.net>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net><20100107005036.GB23206@yookeroo><9696D7A991D0824DBA8DFAC74A9C5FA305987E61@az33exm25.fsl.freescale.net>
	<20100107045514.GF2847@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <20100107045514.GF2847@yookeroo>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

 

> -----Original Message-----
> From: 
> devicetree-discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY@public.gmane.org
labs.org [mailto:devicetree-discuss->
bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On 
> Behalf Of David Gibson
> Sent: Wednesday, January 06, 2010 10:55 PM
> To: Yoder Stuart-B08248
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
> Subject: Re: RFC: proposal to extend the open-pic interrupt 
> specifierdefinition
> 
> On Wed, Jan 06, 2010 at 08:33:03PM -0700, Yoder Stuart-B08248 wrote:
> > > From: 
> > > devicetree-discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY@public.gmane.org
> > labs.org [mailto:devicetree-discuss->
> > bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On 
> > > Behalf Of David Gibson
> > > Sent: Wednesday, January 06, 2010 6:51 PM
> > > To: Yoder Stuart-B08248
> > > Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
> > > Subject: Re: RFC: proposal to extend the open-pic interrupt 
> > > specifierdefinition
> > > 
> > > On Tue, Jan 05, 2010 at 04:28:12PM -0700, Yoder 
> Stuart-B08248 wrote:
> > > > 
> > > > The current open-pic binding defines that interrupt specifiers
> > > > have 2 cells-- an interrupt number and level/sense encoding.
> > > > 
> > > > With chips like the P4080 this is no longer sufficient to
> > > > represent the various types of interrupt sources handled by
> > > > the interrupt controller.  A linear list of interrupt numbers
> > > > doesn't handle all interrupt types-- there are at least 
> 4 different
> > > > kinds of interrupts on the P4080.
> > > > 
> > > > We have a proposal to extend the open-pic binding in
> > > > a backwards compatible way to encode additional information
> > > > in the level/sense field.
> > > > 
> > > > The current definition of level/sense is:
> > > >   0 = low to high edge sensitive type enabled
> > > >   1 = active low level sensitive type enabled
> > > >   2 = active high level sensitive type enabled
> > > >   3 = high to low edge sensitive type enabled
> > > > 
> > > > Those 2 bits would retain their current meaning, but the
> > > > full encoding would be extended as follows:
> > > > 
> > > >      bits      meaning
> > > >      ----------------------------------------------
> > > >      0-7       interrupt sub-type
> > > >      8-15      interrupt type
> > > >      16-23     implementation dependent
> > > >      24-29     reserved
> > > >      30-31     level/sense encoding
> > > 
> > > Um.. what do "type" and "sub-type" mean in this context?
> > 
> > "type" specifies the type of interrupt-- example timer, MSI,
> > etc and would define the meaning of the interrupt number
> > portion of the interrupt specifier.   A given "type" may or
> > may not have a "subtype" depending on the binding.
> > 
> > As described in the proposal, "type" is a range of numbers,
> > divided between standard/architected types and implementation
> > specific types.
> > 
> > We (Freescale) have at least one interrupt type "error" in the P4080
> > that would have a "sub-type" that would indicate a related bit in
> > another
> > status register.
> 
> And who is the type/subtype relevant to?  From what you've said here,
> I don't see why it needs to be in the interrupt specifiers.

It is relevant to whatever code manages the interrupt
controller.

A bit more background information. The MPIC in Freescale chips
supports several types of interrupts-- SOC devices, external 
interrupts, MSIs, timers.   The registers to manage these interrupt
sources are not laid out in a way that is conducive to just enumerating
all the interrupt sources starting from zero.   They are in different
discrete areas of the MPIC register map.

We need the device tree to be able to represent all interrupt sources
and distinguish between timer interrupt 0 and SOC device interrupt
0 and MSI interrupt 0.

In the P4080 we have additional complexity in that SOC device
interrupt 0 is error interrupt that has multiple sources of
errors ORed into it.   We don't want to hardcode knowlege of the
specific topography of the error interrupts into software and
want to represent in the dev tree.

Stuart
