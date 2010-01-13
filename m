From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [Power.org:parch] Re: RFC: proposal to extend the open-pic
	interrupt specifierdefinition
Date: Wed, 13 Jan 2010 07:19:41 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA305988946@az33exm25.fsl.freescale.net>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<20100107005036.GB23206@yookeroo>
	<9696D7A991D0824DBA8DFAC74A9C5FA305987E61@az33exm25.fsl.freescale.net>
	<20100107045514.GF2847@yookeroo> <4B46176F.2040600@freescale.com>
	<fa686aa41001122204w3ce1a31m7debe52a4b5d4fc7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <fa686aa41001122204w3ce1a31m7debe52a4b5d4fc7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org, Gala Kumar-B11780 <B11780-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 =


> -----Original Message-----
> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On =

> Behalf Of Grant Likely
> Sent: Wednesday, January 13, 2010 12:04 AM
> To: Wood Scott-B07421
> Cc: David Gibson; Yoder Stuart-B08248; =

> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org; Gala =

> Kumar-B11780
> Subject: Re: [Power.org:parch] Re: RFC: proposal to extend =

> the open-pic interrupt specifierdefinition
> =

> On Thu, Jan 7, 2010 at 10:18 AM, Scott Wood =

> <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > David Gibson wrote:
> >>
> >> On Wed, Jan 06, 2010 at 08:33:03PM -0700, Yoder =

> Stuart-B08248 wrote:
> >>>
> >>> "type" specifies the type of interrupt-- example timer, MSI,
> >>> etc and would define the meaning of the interrupt number
> >>> portion of the interrupt specifier. =A0 A given "type" may or
> >>> may not have a "subtype" depending on the binding.
> >>>
> >>> As described in the proposal, "type" is a range of numbers,
> >>> divided between standard/architected types and implementation
> >>> specific types.
> >>>
> >>> We (Freescale) have at least one interrupt type "error" =

> in the P4080
> >>> that would have a "sub-type" that would indicate a related bit in
> >>> another
> >>> status register.
> >>
> >> And who is the type/subtype relevant to?
> >
> > The interrupt controller driver.
> >
> >> From what you've said here,
> >> I don't see why it needs to be in the interrupt specifiers.
> >
> > The case that this grew out of was the p4080 error =

> interrupt, which is
> > basically a cascaded interrupt controller within the mpic. =A0
All errors
> > arrive on the same mpic vector, but each has its own bit in =

> summary and mask
> > registers. =A0The subtype contains that bit number.
> >
> > It could also be used for expressing interrupts such as =

> IPIs and timers that
> > aren't part of the numbered interrupts that start at offset 0x10000.
> =

> If it really does behave as a cascaded irq, then give is a separate
> irq number space; either by a separate error-cascade interrupt
> controller node

We considered that-- treating this case as a separate interrupt
domain.  That starts getting really ugly in that a number of devices
will then have 2 interrupt controllers for the same device.  The
device tree does not support that nicely.  It requires creating
a interrupt-map under the device so that different interrupt
numbers can mapped to different interrupt controller.  It possible
but ugly.   Having numerous interrupt maps scattered around
under device nodes makes things must less human-readable and
less clear what is going on.

It also does not solve the problem of representing things
like the MPIC timers which do not behave as a cascaded
interrupt controller.

> or by choosing a new range of hw irq numbers outside
> of the current range handled by the mpic.

But where would the meaning of the new range live.  Yes, we
could pick interrupt numbers 2000-2032 to be error interrupts,
but we want to avoid hard coding assumptions like that
in the MPIC driver.

> It does not sound sane or
> particularly parseable to stuff it into bitfields within the second
> cell.

I think it is somewhat sane compared to the alternatives.  The
second cell encodes information about the interrupt source.  Allowing
some of those bits to encode information besides level/sense
doesn't seem that difficult.

> Users have enough trouble parsing irq specifiers as is.  It makes me
> nervous to see even more complicated irq specifiers being devised.

Yes, they become slightly more complicated, but the complexity needs to
go somewhere.

Stuart
