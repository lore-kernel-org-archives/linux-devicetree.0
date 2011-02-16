From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH TIP 08/14] x86/dtb: add support for PCI devices backed by
	dtb nodes
Date: Wed, 16 Feb 2011 14:59:15 -0700
Message-ID: <AANLkTimWxmEcr=7AibGUht3bBi7ms2MRqj4Qj-jwEGBB@mail.gmail.com>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-9-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1295843342-1122-9-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 23, 2011 at 9:28 PM, Sebastian Andrzej Siewior
<bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> x86_of_pci_init() does two things:
> - it provides a generic irq enable and disable function. enable queries
> =A0the device tree for the interrupt information, calls ->xlate on the
> =A0irq host and updates the pci->irq information for the device.
>
> - it walks through PCI buss(es) in the device tree and adds its children
> =A0(devices) nodes to appropriate pci_dev nodes in kernel. So the dtb
> =A0node information is available at probe time of the PCI device.
>
> Adding a PCI bus based on the information in the device tree is
> currently not supported. Right now direct access via ioports is used.
>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Tested-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> ---
> =A0arch/x86/include/asm/prom.h | =A0 17 +++++++++
> =A0arch/x86/kernel/prom.c =A0 =A0 =A0| =A0 82 +++++++++++++++++++++++++++=
++++++++++++++++
> =A02 files changed, 99 insertions(+), 0 deletions(-)
>
> diff --git a/arch/x86/include/asm/prom.h b/arch/x86/include/asm/prom.h
> index bd67ab2..3ed0bd6 100644
> --- a/arch/x86/include/asm/prom.h
> +++ b/arch/x86/include/asm/prom.h
> @@ -16,6 +16,7 @@
>
> =A0#include <linux/of.h>
> =A0#include <linux/types.h>
> +#include <linux/pci.h>
> =A0#include <asm/irq.h>
> =A0#include <asm/atomic.h>
> =A0#include <asm/setup.h>
> @@ -28,8 +29,24 @@ extern void add_dtb(u64 data);
> =A0void x86_dtb_find_config(void);
> =A0void x86_dtb_get_config(unsigned int unused);
> =A0void add_interrupt_host(struct irq_domain *ih);
> +void __cpuinit x86_of_pci_init(void);
> +
> +static inline struct device_node *pci_device_to_OF_node(struct pci_dev *=
pdev)
> +{
> + =A0 =A0 =A0 return pdev->dev.of_node;
> +}
> +
> +static inline struct device_node *pci_bus_to_OF_node(struct pci_bus *bus)
> +{
> + =A0 =A0 =A0 if (bus->self)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return pci_device_to_OF_node(bus->self);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> +}

Nit: could simply be:

static inline struct device_node *pci_device_to_OF_node(struct pci_dev *pde=
v)
{
       return pdev ? pdev->dev.of_node : NULL;
}

static inline struct device_node *pci_bus_to_OF_node(struct pci_bus *bus)
{
       return pci_device_to_OF_node(bus->self);
}


> +
> =A0#else
> =A0static inline void add_dtb(u64 data) { }
> +static inline void x86_of_pci_init(void) { }
> =A0#define x86_dtb_find_config x86_init_noop
> =A0#define x86_dtb_get_config x86_init_uint_noop
> =A0#define of_ioapic 0
> diff --git a/arch/x86/kernel/prom.c b/arch/x86/kernel/prom.c
> index 16c124e..8525ca0 100644
> --- a/arch/x86/kernel/prom.c
> +++ b/arch/x86/kernel/prom.c
> @@ -9,10 +9,13 @@
> =A0#include <linux/of_address.h>
> =A0#include <linux/of_platform.h>
> =A0#include <linux/slab.h>
> +#include <linux/pci.h>
> +#include <linux/of_pci.h>
>
> =A0#include <asm/hpet.h>
> =A0#include <asm/irq_controller.h>
> =A0#include <asm/io_apic.h>
> +#include <asm/pci_x86.h>
>
> =A0__initdata u64 initial_dtb;
> =A0char __initdata cmd_line[COMMAND_LINE_SIZE];
> @@ -99,6 +102,85 @@ void __init add_dtb(u64 data)
> =A0 =A0 =A0 =A0initial_dtb =3D data + offsetof(struct setup_data, data);
> =A0}
>
> +#ifdef CONFIG_PCI
> +static int x86_of_pci_irq_enable(struct pci_dev *dev)
> +{
> + =A0 =A0 =A0 struct of_irq oirq;
> + =A0 =A0 =A0 u32 virq;
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 u8 pin;
> +
> + =A0 =A0 =A0 ret =3D pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 if (!pin)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 ret =3D of_irq_map_pci(dev, &oirq);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 virq =3D irq_create_of_mapping(oirq.controller, oirq.specif=
ier,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oirq.size);
> + =A0 =A0 =A0 if (virq =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 dev->irq =3D virq;
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void x86_of_pci_irq_disable(struct pci_dev *dev)
> +{
> +}
> +
> +void __cpuinit x86_of_pci_init(void)
> +{
> + =A0 =A0 =A0 struct device_node *np;
> +
> + =A0 =A0 =A0 pcibios_enable_irq =3D x86_of_pci_irq_enable;
> + =A0 =A0 =A0 pcibios_disable_irq =3D x86_of_pci_irq_disable;
> +
> + =A0 =A0 =A0 for_each_node_by_type(np, "pci") {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const void *prop;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pci_bus *bus;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int bus_min;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *child;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(np, "bus-range", N=
ULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus_min =3D be32_to_cpup(prop);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus =3D pci_find_bus(0, bus_min);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!bus) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Can't find=
 a node for bus %s.\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 np->full_name);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (bus->self)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus->self->dev.of_node =3D =
np;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus->dev.of_node =3D np;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_child_of_node(np, child) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pci_dev *dev;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 devfn;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(ch=
ild, "reg", NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devfn =3D (be32_to_cpup(pro=
p) >> 8) & 0xff;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev =3D pci_get_slot(bus, d=
evfn);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!dev)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev->dev.of_node =3D child;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pci_dev_put(dev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +}
> +#endif
> +
> =A0static void __init dtb_setup_hpet(void)
> =A0{
> =A0 =A0 =A0 =A0struct device_node *dn;
> --
> 1.7.3.2
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
