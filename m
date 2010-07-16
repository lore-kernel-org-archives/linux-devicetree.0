From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 5/8] arch/x86: Add support for device tree code.
Date: Fri, 16 Jul 2010 11:42:53 -0700
Message-ID: <a33ca228-cb2c-4044-bf63-c653642415a0@SG2EHSMHS005.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<961e55b7-170c-45ac-a491-628797a0aa5e@VA3EHSMHS006.ehs.local>
	<AANLkTinPIY4N9Gv_J7Ief7Scd57c0KEY6WtHsvQTBrzb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTinPIY4N9Gv_J7Ief7Scd57c0KEY6WtHsvQTBrzb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
> Sent: Friday, July 16, 2010 11:40 AM
> To: Stephen Neuendorffer
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 5/8] arch/x86: Add support for device tree code.
> =

> On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > A few support device-tree related support functions that x86 didn't
> > have before.
> >
> > Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >
> > ----
> >
> > =A0I have no idea if continuing to add these functions to every arch is
> > a good thing or whether they should (for instance) be weak symbols
> > with a generic definition.
> > ---
> > =A0arch/x86/include/asm/device.h | =A0 =A06 ++++
> > =A0arch/x86/include/asm/irq.h =A0 =A0| =A0 =A04 ++
> > =A0arch/x86/kernel/Makefile =A0 =A0 =A0| =A0 =A01 +
> > =A0arch/x86/kernel/device_tree.c | =A0 63 +++++++++++++++++++++++++++++=
++++++++++++
> > =A0drivers/of/platform.c =A0 =A0 =A0 =A0 | =A0 =A02 +
> > =A0include/linux/of_irq.h =A0 =A0 =A0 =A0| =A0 =A01 +
> > =A06 files changed, 77 insertions(+), 0 deletions(-)
> > =A0create mode 100644 arch/x86/kernel/device_tree.c
> >
> > diff --git a/arch/x86/include/asm/device.h b/arch/x86/include/asm/devic=
e.h
> > index 029f230..01414f2 100644
> > --- a/arch/x86/include/asm/device.h
> > +++ b/arch/x86/include/asm/device.h
> > @@ -14,6 +14,12 @@ struct dma_map_ops *dma_ops;
> > =A0};
> >
> > =A0struct pdev_archdata {
> > +#ifdef CONFIG_OF
> > + =A0 =A0 =A0 u64 dma_mask;
> > +#endif
> =

> This hunk (probably) isn't necessary anymore

Doesn't compile without it because the code in fdt.c initializes it.

> > =A0};
> >
> > +/* Don't override the default bus id behaviour */
> > +#define of_device_make_bus_id __of_device_make_bus_id
> > +
> > =A0#endif /* _ASM_X86_DEVICE_H */
> > diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
> > index 5458380..6c61992 100644
> > --- a/arch/x86/include/asm/irq.h
> > +++ b/arch/x86/include/asm/irq.h
> > @@ -10,6 +10,10 @@
> > =A0#include <asm/apicdef.h>
> > =A0#include <asm/irq_vectors.h>
> >
> > +#define NO_IRQ (-1)
> > +
> =

> no.  irq 0 means no irq, and all patches adding #define NO_IRQ to x86
> have been nacked.  (Basically, all architectures using -1 to mean no
> irq are considered broken.  ARM is one of the few (albeit large)
> holdouts.  I've got a patch kicking around to change microblaze to use
> 0 for no_irq too.

OK, bogon there..  The question is: how to get rid of it, since the generic=
 of/irq.c
code references it?

> =

> > +#define irq_dispose_mapping(...)
> > +
> > =A0static inline int irq_canonicalize(int irq)
> > =A0{
> > =A0 =A0 =A0 =A0return ((irq =3D=3D 2) ? 9 : irq);
> > diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> > index e77b220..a5c20e8 100644
> > --- a/arch/x86/kernel/Makefile
> > +++ b/arch/x86/kernel/Makefile
> > @@ -105,6 +105,7 @@ scx200-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=
=3D scx200_32.o
> >
> > =A0obj-$(CONFIG_OLPC) =A0 =A0 =A0 =A0 =A0 =A0 +=3D olpc.o
> > =A0obj-$(CONFIG_X86_MRST) =A0 =A0 =A0 =A0 +=3D mrst.o
> > +obj-$(CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D device_tree.o
> >
> > =A0microcode-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=
=3D microcode_core.o
> > =A0microcode-$(CONFIG_MICROCODE_INTEL) =A0 =A0+=3D microcode_intel.o
> > diff --git a/arch/x86/kernel/device_tree.c b/arch/x86/kernel/device_tre=
e.c
> > new file mode 100644
> > index 0000000..f6d27f6
> > --- /dev/null
> > +++ b/arch/x86/kernel/device_tree.c
> > @@ -0,0 +1,63 @@
> > +#undef DEBUG
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/string.h>
> > +#include <linux/pci_regs.h>
> > +#include <linux/module.h>
> > +#include <linux/ioport.h>
> > +#include <linux/etherdevice.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +
> > +struct bus_type of_platform_bus_type =3D {
> > + =A0 =A0 =A0 .uevent =3D of_device_uevent,
> > +};
> > +EXPORT_SYMBOL(of_platform_bus_type);
> > +
> > +static int __init of_bus_driver_init(void)
> > +{
> > + =A0 =A0 =A0 return of_bus_type_init(&of_platform_bus_type, "of_platfo=
rm");
> > +}
> > +postcore_initcall(of_bus_driver_init);
> =

> of_platform_bus_type is going away, and besides it is currently
> defined in common code.  You shouldn't need this in arch code.
> =

> > +
> > +/*
> > + * The list of OF IDs below is used for matching bus types in the
> > + * system whose devices are to be exposed as of_platform_devices.
> > + *
> > + * This is the default list valid for most platforms. This file provid=
es
> > + * functions who can take an explicit list if necessary though
> > + *
> > + * The search is always performed recursively looking for children of
> > + * the provided device_node and recursively if such a children matches
> > + * a bus type in the list
> > + */
> > +
> > +const struct of_device_id of_default_bus_ids[] =3D {
> > + =A0 =A0 =A0 { .type =3D "soc", },
> > + =A0 =A0 =A0 { .compatible =3D "soc", },
> > + =A0 =A0 =A0 { .compatible =3D "simple-bus", },
> > + =A0 =A0 =A0 { .type =3D "plb5", },
> > + =A0 =A0 =A0 { .type =3D "plb4", },
> > + =A0 =A0 =A0 { .type =3D "opb", },
> > + =A0 =A0 =A0 { .type =3D "simple", },
> > + =A0 =A0 =A0 {},
> > +};
> > +
> > +/*
> > + * Interrupt remapper
> > + */
> > +
> > +struct device_node *of_irq_find_parent_by_phandle(phandle p)
> > +{
> > + =A0 =A0 =A0 return of_find_node_by_phandle(p);
> > +}
> =

> IIRC, this hook shouldn't be necessary anymore either.
> =

> > +unsigned int irq_create_of_mapping(struct device_node *controller,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst u32 *intspec, unsigned int intsize)
> > +{
> > + =A0 =A0 =A0 return intspec[0];
> > +}
> > +EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> =

> return intspec[0] + 1;  ... at least until I've got proper
> cross-platform devicetree to virtual irq mapping code implemented.
> =

> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index 125f2bc..3ec3147 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -18,6 +18,8 @@
> > =A0#include <linux/slab.h>
> > =A0#include <linux/of_device.h>
> > =A0#include <linux/of_platform.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> >
> > =A0extern struct device_attribute of_platform_device_attrs[];
> >
> > diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> > index 5929781..25fc90d 100644
> > --- a/include/linux/of_irq.h
> > +++ b/include/linux/of_irq.h
> > @@ -7,6 +7,7 @@ struct of_irq;
> > =A0#include <linux/errno.h>
> > =A0#include <linux/ioport.h>
> > =A0#include <linux/of.h>
> > +#include <linux/irq.h>
> >
> > =A0/*
> > =A0* irq_of_parse_and_map() is used ba all OF enabled platforms; but SP=
ARC
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
