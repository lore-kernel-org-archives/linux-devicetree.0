From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 07/11] x86/dtb: add support for PCI devices backed by dtb nodes
Date: Tue, 22 Feb 2011 14:08:07 -0700
Message-ID: <AANLkTikwHjs2Egvq3kq6YZzkGeGWy7U8uiV+6kcjWDve@mail.gmail.com>
References: <1298405266-1624-1-git-send-email-bigeasy@linutronix.de> <1298405266-1624-8-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298405266-1624-8-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, sodaville@linutronix.de, devicetree-discuss@lists.ozlabs.org, x86@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 22, 2011 at 1:07 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> x86_of_pci_init() does two things:
> - it provides a generic irq enable and disable function. enable queri=
es
> =A0the device tree for the interrupt information, calls ->xlate on th=
e
> =A0irq host and updates the pci->irq information for the device.
>
> - it walks through PCI buss(es) in the device tree and adds its child=
ren
> =A0(devices) nodes to appropriate pci_dev nodes in kernel. So the dtb
> =A0node information is available at probe time of the PCI device.
>
> Adding a PCI bus based on the information in the device tree is
> currently not supported. Right now direct access via ioports is used.
>
> Cc: devicetree-discuss@lists.ozlabs.org
> Tested-by: Dirk Brandewie <dirk.brandewie@gmail.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
> =A0arch/x86/include/asm/prom.h =A0| =A0 14 +++++++
> =A0arch/x86/kernel/devicetree.c | =A0 83 ++++++++++++++++++++++++++++=
++++++++++++++
> =A0drivers/of/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0drivers/of/of_pci.c =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A04 files changed, 99 insertions(+), 1 deletions(-)
>
> diff --git a/arch/x86/include/asm/prom.h b/arch/x86/include/asm/prom.=
h
> index 5aa2c32..3e441b3 100644
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
> @@ -28,8 +29,21 @@ extern void add_dtb(u64 data);
> =A0void x86_dtb_find_config(void);
> =A0void x86_dtb_get_config(unsigned int unused);
> =A0void add_interrupt_host(struct irq_domain *ih);
> +void __cpuinit x86_of_pci_init(void);
> +
> +static inline struct device_node *pci_device_to_OF_node(struct pci_d=
ev *pdev)
> +{
> + =A0 =A0 =A0 return pdev ? pdev->dev.of_node : NULL;
> +}
> +
> +static inline struct device_node *pci_bus_to_OF_node(struct pci_bus =
*bus)
> +{
> + =A0 =A0 =A0 return pci_device_to_OF_node(bus->self);
> +}
> +
> =A0#else
> =A0static inline void add_dtb(u64 data) { }
> +static inline void x86_of_pci_init(void) { }
> =A0#define x86_dtb_find_config x86_init_noop
> =A0#define x86_dtb_get_config x86_init_uint_noop
> =A0#define of_ioapic 0
> diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetre=
e.c
> index 8d7a2eb..b778ae5 100644
> --- a/arch/x86/kernel/devicetree.c
> +++ b/arch/x86/kernel/devicetree.c
> @@ -9,11 +9,15 @@
> =A0#include <linux/of_fdt.h>
> =A0#include <linux/of_address.h>
> =A0#include <linux/of_platform.h>
> +#include <linux/of_irq.h>
> =A0#include <linux/slab.h>
> +#include <linux/pci.h>
> +#include <linux/of_pci.h>
>
> =A0#include <asm/hpet.h>
> =A0#include <asm/irq_controller.h>
> =A0#include <asm/apic.h>
> +#include <asm/pci_x86.h>
>
> =A0__initdata u64 initial_dtb;
> =A0char __initdata cmd_line[COMMAND_LINE_SIZE];
> @@ -100,6 +104,85 @@ void __init add_dtb(u64 data)
> =A0 =A0 =A0 =A0initial_dtb =3D data + offsetof(struct setup_data, dat=
a);
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
> + =A0 =A0 =A0 ret =3D pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &p=
in);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 if (!pin)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 ret =3D of_irq_map_pci(dev, &oirq);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 virq =3D irq_create_of_mapping(oirq.controller, oirq.sp=
ecifier,
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
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(np, "bus-range=
", NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus_min =3D be32_to_cpup(prop);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus =3D pci_find_bus(0, bus_min);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!bus) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Can't =
find a node for bus %s.\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 np->full_name);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (bus->self)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus->self->dev.of_node =
=3D np;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus->dev.of_node =3D np=
;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_child_of_node(np, child) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pci_dev *dev;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 devfn;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_propert=
y(child, "reg", NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continu=
e;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devfn =3D (be32_to_cpup=
(prop) >> 8) & 0xff;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev =3D pci_get_slot(bu=
s, devfn);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!dev)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continu=
e;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev->dev.of_node =3D ch=
ild;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pci_dev_put(dev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +}
> +#endif
> +
> =A0static void __init dtb_setup_hpet(void)
> =A0{
> =A0 =A0 =A0 =A0struct device_node *dn;
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index efabbf9..d06a637 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -71,7 +71,7 @@ config OF_MDIO
>
> =A0config OF_PCI
> =A0 =A0 =A0 =A0def_tristate PCI
> - =A0 =A0 =A0 depends on PCI && (PPC || MICROBLAZE)
> + =A0 =A0 =A0 depends on PCI && (PPC || MICROBLAZE || X86)
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0OpenFirmware PCI bus accessors
>
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 314535f..ac1ec54 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -1,5 +1,6 @@
> =A0#include <linux/kernel.h>
> =A0#include <linux/of_pci.h>
> +#include <linux/of_irq.h>
> =A0#include <asm/prom.h>
>
> =A0/**
> --
> 1.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
