From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 4/9] drivers/of: Allow IRQ code to work properly on
	architectures without NO_IRQ
Date: Tue, 10 Aug 2010 10:57:18 -0700
Message-ID: <696fa87a-7034-4c92-8ad3-ccbcc0eb3fd6@SG2EHSMHS005.ehs.local>
References: <11fcb9aa-72df-45bb-b79f-3e463c32dc71@SG2EHSMHS005.ehs.local>
	<AANLkTikdrgxj3UoMfCzUEB2D7rdbtCnkTwHPbr_JsAcb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTikdrgxj3UoMfCzUEB2D7rdbtCnkTwHPbr_JsAcb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gra=
nt Likely
> Sent: Tuesday, August 10, 2010 10:55 AM
> To: Stephen Neuendorffer
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH v2 4/9] drivers/of: Allow IRQ code to work properly o=
n architectures without
> NO_IRQ
> =

> On Fri, Jul 23, 2010 at 4:15 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > Sane architectures don't rely on NO_IRQ. =A0The device tree code should=
n't
> > require it either.
> =

> I'm going to sit and think on this for a bit.  I've got the same
> problem in MIPS, and I want to use the same solution in both cases.

Agreed... I want to reiterate that the bulk of these changes are trying to =
make the problems
concrete: I love the fact that the patches are getting smaller as the probl=
ems get fixed in a
general way.

Steve

> =

> g.
> =

> > ---
> > =A0drivers/of/irq.c =A0 =A0 =A0 | =A0 =A04 ++--
> > =A0drivers/of/platform.c =A0| =A0 =A04 ++--
> > =A0include/linux/of_irq.h | =A0 =A06 ++++++
> > =A03 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index 6cfb307..438b761 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -37,7 +37,7 @@ unsigned int irq_of_parse_and_map(struct device_node =
*dev, int index)
> > =A0 =A0 =A0 =A0struct of_irq oirq;
> >
> > =A0 =A0 =A0 =A0if (of_irq_map_one(dev, index, &oirq))
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NO_IRQ;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return OF_NO_IRQ;
> >
> > =A0 =A0 =A0 =A0return irq_create_of_mapping(oirq.controller, oirq.speci=
fier,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 oirq.size);
> > @@ -337,7 +337,7 @@ int of_irq_to_resource(struct device_node *dev, int=
 index, struct resource *r)
> >
> > =A0 =A0 =A0 =A0/* Only dereference the resource if both the
> > =A0 =A0 =A0 =A0 * resource and the irq are valid. */
> > - =A0 =A0 =A0 if (r && irq !=3D NO_IRQ) {
> > + =A0 =A0 =A0 if (r && irq !=3D OF_NO_IRQ) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r->start =3D r->end =3D irq;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r->flags =3D IORESOURCE_IRQ;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r->name =3D dev->full_name;
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index 9d3d932..cb305ae 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -488,7 +488,7 @@ struct of_device *of_device_alloc(struct device_nod=
e *np,
> > =A0 =A0 =A0 =A0/* First count how many resources are needed */
> > =A0 =A0 =A0 =A0while (of_address_to_resource(np, num_reg, &temp_res) =
=3D=3D 0)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0num_reg++;
> > - =A0 =A0 =A0 while (of_irq_to_resource(np, num_irq, &temp_res) !=3D NO=
_IRQ)
> > + =A0 =A0 =A0 while (of_irq_to_resource(np, num_irq, &temp_res) !=3D OF=
_NO_IRQ)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0num_irq++;
> >
> > =A0 =A0 =A0 =A0/* Allocate memory for both the struct device and the re=
source table */
> > @@ -508,7 +508,7 @@ struct of_device *of_device_alloc(struct device_nod=
e *np,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < num_irq; i++, res++) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rc =3D of_irq_to_resourc=
e(np, i, res);
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 WARN_ON(rc =3D=3D NO_IRQ);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 WARN_ON(rc =3D=3D OF_NO_I=
RQ);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0}
> >
> > diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> > index 5929781..69e8a71 100644
> > --- a/include/linux/of_irq.h
> > +++ b/include/linux/of_irq.h
> > @@ -8,6 +8,12 @@ struct of_irq;
> > =A0#include <linux/ioport.h>
> > =A0#include <linux/of.h>
> >
> > +#ifdef NO_IRQ
> > +#define OF_NO_IRQ NO_IRQ
> > +#else
> > +#define OF_NO_IRQ 0
> > +#endif
> > +
> > =A0/*
> > =A0* irq_of_parse_and_map() is used ba all OF enabled platforms; but SP=
ARC
> > =A0* implements it differently. =A0However, the prototype is the same f=
or all,
> > --
> > 1.5.6.6
> >
> >
> >
> > This email and any attachments are intended for the sole use of the nam=
ed recipient(s) and
> contain(s) confidential information that may be proprietary, privileged o=
r copyrighted under
> applicable law. If you are not the intended recipient, do not read, copy,=
 or forward this email
> message or any attachments. Delete this email message and any attachments=
 immediately.
> >
> >
> >
> =

> =

> =

> --
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
