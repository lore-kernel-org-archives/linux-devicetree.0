From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/9] arch/x86: Add support for device tree code.
Date: Tue, 10 Aug 2010 12:00:34 -0600
Message-ID: <AANLkTimeVm52SwXSox_rxxoGxos+wHmfdCbcvrAuXjjr@mail.gmail.com>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<a85fdc9c-4a93-4381-b01e-5b9bc7666863@SG2EHSMHS007.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <a85fdc9c-4a93-4381-b01e-5b9bc7666863-RaUQJvECHitCYczPSvLbDrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 23, 2010 at 2:57 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> A few support device-tree related support functions that x86 didn't
> have before.
>
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>
> ----
>
> =A0I have no idea if continuing to add these functions to every arch is
> a good thing or whether they should (for instance) be weak symbols
> with a generic definition.
> ---
> =A0arch/x86/include/asm/device.h | =A0 =A03 ++
> =A0arch/x86/include/asm/irq.h =A0 =A0| =A0 =A04 ++
> =A0arch/x86/kernel/Makefile =A0 =A0 =A0| =A0 =A01 +
> =A0arch/x86/kernel/device_tree.c | =A0 63 +++++++++++++++++++++++++++++++=
++++++++++
> =A0drivers/of/platform.c =A0 =A0 =A0 =A0 | =A0 =A02 +
> =A0include/linux/of_irq.h =A0 =A0 =A0 =A0| =A0 =A01 +
> =A06 files changed, 74 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/x86/kernel/device_tree.c
>
> diff --git a/arch/x86/include/asm/device.h b/arch/x86/include/asm/device.h
> index 029f230..0bf0a17 100644
> --- a/arch/x86/include/asm/device.h
> +++ b/arch/x86/include/asm/device.h
> @@ -16,4 +16,7 @@ struct dma_map_ops *dma_ops;
> =A0struct pdev_archdata {
> =A0};
>
> +/* Don't override the default bus id behaviour */
> +#define of_device_make_bus_id __of_device_make_bus_id

This should be unnecessary now.

> =A0#endif /* _ASM_X86_DEVICE_H */
> diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
> index 5458380..6c61992 100644
> --- a/arch/x86/include/asm/irq.h
> +++ b/arch/x86/include/asm/irq.h
> @@ -10,6 +10,10 @@
> =A0#include <asm/apicdef.h>
> =A0#include <asm/irq_vectors.h>
>
> +#define NO_IRQ (-1)
> +

Remove

> +#define irq_dispose_mapping(...)

I need to create a default implementation for this.

>
> =A0static inline int irq_canonicalize(int irq)
> =A0{
> =A0 =A0 =A0 =A0return ((irq =3D=3D 2) ? 9 : irq);
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index e77b220..a5c20e8 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -105,6 +105,7 @@ scx200-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D =
scx200_32.o
>
> =A0obj-$(CONFIG_OLPC) =A0 =A0 =A0 =A0 =A0 =A0 +=3D olpc.o
> =A0obj-$(CONFIG_X86_MRST) =A0 =A0 =A0 =A0 +=3D mrst.o
> +obj-$(CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D device_tree.o
>
> =A0microcode-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=
=3D microcode_core.o
> =A0microcode-$(CONFIG_MICROCODE_INTEL) =A0 =A0+=3D microcode_intel.o
> diff --git a/arch/x86/kernel/device_tree.c b/arch/x86/kernel/device_tree.c
> new file mode 100644
> index 0000000..543884c
> --- /dev/null
> +++ b/arch/x86/kernel/device_tree.c
> @@ -0,0 +1,63 @@
> +#undef DEBUG
> +
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/pci_regs.h>
> +#include <linux/module.h>
> +#include <linux/ioport.h>
> +#include <linux/etherdevice.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +
> +struct bus_type of_platform_bus_type =3D {
> + =A0 =A0 =A0 .uevent =3D of_device_uevent,
> +};
> +EXPORT_SYMBOL(of_platform_bus_type);

Remove

> +
> +static int __init of_bus_driver_init(void)
> +{
> + =A0 =A0 =A0 return of_bus_type_init(&of_platform_bus_type, "of_platform=
");
> +}
> +postcore_initcall(of_bus_driver_init);

remove

> +
> +/*
> + * The list of OF IDs below is used for matching bus types in the
> + * system whose devices are to be exposed as of_platform_devices.
> + *
> + * This is the default list valid for most platforms. This file provides
> + * functions who can take an explicit list if necessary though
> + *
> + * The search is always performed recursively looking for children of
> + * the provided device_node and recursively if such a children matches
> + * a bus type in the list
> + */
> +
> +const struct of_device_id of_default_bus_ids[] =3D {
> + =A0 =A0 =A0 { .type =3D "soc", },
> + =A0 =A0 =A0 { .compatible =3D "soc", },
> + =A0 =A0 =A0 { .compatible =3D "simple-bus", },
> + =A0 =A0 =A0 { .type =3D "plb5", },
> + =A0 =A0 =A0 { .type =3D "plb4", },
> + =A0 =A0 =A0 { .type =3D "opb", },
> + =A0 =A0 =A0 { .type =3D "simple", },
> + =A0 =A0 =A0 {},
> +};

I believe this can also be removed.

> +
> +/*
> + * Interrupt remapper
> + */
> +
> +struct device_node *of_irq_find_parent_by_phandle(phandle p)
> +{
> + =A0 =A0 =A0 return of_find_node_by_phandle(p);
> +}
> +

remove

> +unsigned int irq_create_of_mapping(struct device_node *controller,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cons=
t u32 *intspec, unsigned int intsize)
> +{
> + =A0 =A0 =A0 return intspec[0] + 1;
> +}

Hmmm.  I need to bring up more of the OF irq infrastructure so that
this is handled correctly.

> +EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 9d3d932..0221125 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -20,6 +20,8 @@
> =A0#include <linux/of_device.h>
> =A0#include <linux/of_irq.h>
> =A0#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>

fixed in mainline.

>
> =A0#if defined(CONFIG_PPC_DCR)
> =A0#include <asm/dcr.h>
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index 5929781..25fc90d 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -7,6 +7,7 @@ struct of_irq;
> =A0#include <linux/errno.h>
> =A0#include <linux/ioport.h>
> =A0#include <linux/of.h>
> +#include <linux/irq.h>

irq.h shouldn't actually be needed by this header.
