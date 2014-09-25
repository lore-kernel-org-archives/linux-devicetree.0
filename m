From: Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] [RFC] Using hierarchy irqdomian to implement MTK intpol.
Date: Thu, 25 Sep 2014 11:12:55 +0800
Message-ID: <54238837.7020508@linux.intel.com>
References: <1411574696-1881-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411574696-1881-1-git-send-email-srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Joe.C" <srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 2014/9/25 0:04, Joe.C wrote:
> From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>=20
> Here's the first draft of using hierarchy irqdomain to implement MTK =
intpol
> support. I have tested it and intpol works fine. Before continue, I'd=
 like
> to get your comments. This is based on Jiang's hierarchy irqdomian [1=
] and
> my mediatek SoC basic support [2].
>=20
> Simplified block diagram for interrupt:
>=20
>     ---------      ---------
>  ---| CIRQ  |------|ARM GIC|
>  ---|       |------|       |
>  ---|       |------|       |
>  ---|       |------|       |
>  ---|       |------|       |
>     ---------      ---------
>=20
> In device tree, interrupt-parent for other devices is cirq, child of =
gic.
> This describe HW better and allow device to specify polarity as it is=
 sent
> by the device. I'm using interrupt-parent to specify irq domain paren=
t in
> cirq now. Maybe adding another name like 'interrupt-domain-parent' wi=
ll be
> better.
>=20
> Currently only set_type is implement in CIRQ, but I think this could =
extended
> to cover all function gic_arch_extn provided.
>=20
> In order to use hierarchy irq domain, gic can't use legacy irq domain=
 anymore.
> If arm,hierarchy-irq-domain property is specified, GIC will work in h=
ierarchy
> way and all interrupt must be set by device tree.
>=20
> One thing worth mention is arg in irq_domain_alloc_irqs. On x86, msi =
is using
> struct irq_alloc_info, to pass data between irq domain. In irq_create=
_of_mapping(),
> of_phandle_args is used. All allocs in irq_domain chain will need to =
use same
> interrupt-cells formats.
>=20
>=20
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-Septem=
ber/286542.html
> [2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-Septem=
ber/284553.html
>=20
> Signed-off-by: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt8135.dtsi     |  14 +++-
>  drivers/irqchip/Makefile          |   1 +
>  drivers/irqchip/irq-gic.c         |  53 +++++++++++--
>  drivers/irqchip/irq-mt65xx-cirq.c | 158 ++++++++++++++++++++++++++++=
++++++++++
>  include/linux/irq.h               |   5 ++
>  kernel/irq/chip.c                 |  28 +++++++
>  kernel/irq/irqdomain.c            |  14 ++--
>  7 files changed, 256 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/irqchip/irq-mt65xx-cirq.c
>=20
> diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135=
=2Edtsi
> index 90a56ad..e19ab1a 100644
> --- a/arch/arm/boot/dts/mt8135.dtsi
> +++ b/arch/arm/boot/dts/mt8135.dtsi
> @@ -18,7 +18,7 @@
> =20
>  / {
>  	compatible =3D "mediatek,mt8135";
> -	interrupt-parent =3D <&gic>;
> +	interrupt-parent =3D <&cirq>;
> =20
>  	cpu-map {
>  		cluster0 {
> @@ -97,15 +97,25 @@
>  		timer: timer@10008000 {
>  			compatible =3D "mediatek,mt8135-timer", "mediatek,mt6577-timer";
>  			reg =3D <0 0x10008000 0 0x80>;
> -			interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
>  			clocks =3D <&system_clk>, <&rtc_clk>;
>  			clock-names =3D "system-clk", "rtc-clk";
>  		};
> =20
> +		cirq: interrupt-controller@10200030 {
> +			compatible =3D "mediatek,mt8135-cirq", "mediatek,mt6577-cirq";
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +			interrupt-parent =3D <&gic>;
> +			reg =3D <0 0x10200030 0 0x1c>;
> +		};
> +
>  		gic: interrupt-controller@10211000 {
>  			compatible =3D "arm,cortex-a15-gic";
>  			interrupt-controller;
>  			#interrupt-cells =3D <3>;
> +			arm,hierarchy-irq-domain;
> +			interrupt-parent =3D <&gic>;
>  			reg =3D <0 0x10211000 0 0x1000>,
>  			      <0 0x10212000 0 0x1000>,
>  			      <0 0x10214000 0 0x2000>,
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 73052ba..0b34675 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -34,3 +34,4 @@ obj-$(CONFIG_XTENSA)			+=3D irq-xtensa-pic.o
>  obj-$(CONFIG_XTENSA_MX)			+=3D irq-xtensa-mx.o
>  obj-$(CONFIG_IRQ_CROSSBAR)		+=3D irq-crossbar.o
>  obj-$(CONFIG_BRCMSTB_L2_IRQ)		+=3D irq-brcmstb-l2.o
> +obj-$(CONFIG_ARCH_MEDIATEK)		+=3D irq-mt65xx-cirq.o
> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> index 4b959e6..d66d707 100644
> --- a/drivers/irqchip/irq-gic.c
> +++ b/drivers/irqchip/irq-gic.c
> @@ -767,22 +767,50 @@ void __init gic_init_physaddr(struct device_nod=
e *node)
>  static int gic_irq_domain_map(struct irq_domain *d, unsigned int irq=
,
>  				irq_hw_number_t hw)
>  {
> +	irq_domain_set_hwirq_and_chip(d, irq, hw, &gic_chip, d->host_data);
Hi Joe,
	Seems you missed the change to enable Kconfig option
CONFIG_IRQ_DOMAIN_HIERARCHY. If CONFIG_IRQ_DOMAIN_HIERARCHY
may be off under certain conditions, above code may cause
building failure.
Regards!
Gerry

>  	if (hw < 32) {
>  		irq_set_percpu_devid(irq);
> -		irq_set_chip_and_handler(irq, &gic_chip,
> -					 handle_percpu_devid_irq);
> +		irq_set_handler(irq, handle_percpu_devid_irq);
>  		set_irq_flags(irq, IRQF_VALID | IRQF_NOAUTOEN);
>  	} else {
> -		irq_set_chip_and_handler(irq, &gic_chip,
> -					 handle_fasteoi_irq);
> +		irq_set_handler(irq, handle_fasteoi_irq);
>  		set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
> =20
>  		gic_routable_irq_domain_ops->map(d, irq, hw);
>  	}
> -	irq_set_chip_data(irq, d->host_data);
>  	return 0;
>  }
> =20
> +static int gic_irq_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
> +				unsigned int nr_irqs, void *arg)
> +{
> +	int i, ret;
> +	irq_hw_number_t hwirq;
> +	unsigned int type =3D IRQ_TYPE_NONE;
> +	struct of_phandle_args *irq_data =3D arg;
> +
> +	ret =3D domain->ops->xlate(domain, irq_data->np, irq_data->args,
> +				 irq_data->args_count, &hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < nr_irqs; i++)
> +		gic_irq_domain_map(domain, virq+i, hwirq+i);
> +
> +	return 0;
> +}
> +
> +static void gic_irq_domain_free(struct irq_domain *domain, unsigned =
int virq,
> +				unsigned int nr_irqs)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < nr_irqs; i++) {
> +		irq_set_handler(virq + i, NULL);
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, 0, NULL, NULL);
> +	}
> +}
> +
>  static void gic_irq_domain_unmap(struct irq_domain *d, unsigned int =
irq)
>  {
>  	gic_routable_irq_domain_ops->unmap(d, irq);
> @@ -795,8 +823,6 @@ static int gic_irq_domain_xlate(struct irq_domain=
 *d,
>  {
>  	unsigned long ret =3D 0;
> =20
> -	if (d->of_node !=3D controller)
> -		return -EINVAL;
>  	if (intsize < 3)
>  		return -EINVAL;
> =20
> @@ -839,6 +865,14 @@ static struct notifier_block gic_cpu_notifier =3D=
 {
>  };
>  #endif
> =20
> +static const struct irq_domain_ops gic_irq_domain_hierarchy_ops =3D =
{
> +	.alloc =3D gic_irq_domain_alloc,
> +	.free =3D gic_irq_domain_free,
> +	.map =3D gic_irq_domain_map,
> +	.unmap =3D gic_irq_domain_unmap,
> +	.xlate =3D gic_irq_domain_xlate,
> +};
> +
>  static const struct irq_domain_ops gic_irq_domain_ops =3D {
>  	.map =3D gic_irq_domain_map,
>  	.unmap =3D gic_irq_domain_unmap,
> @@ -952,7 +986,10 @@ void __init gic_init_bases(unsigned int gic_nr, =
int irq_start,
> =20
>  	gic_irqs -=3D hwirq_base; /* calculate # of irqs to allocate */
> =20
> -	if (of_property_read_u32(node, "arm,routable-irqs",
> +	if (of_find_property(node, "arm,hierarchy-irq-domain", NULL))
> +		gic->domain =3D irq_domain_add_linear(node, gic_irqs,
> +					&gic_irq_domain_hierarchy_ops, gic);
> +	else if (of_property_read_u32(node, "arm,routable-irqs",
>  				 &nr_routable_irqs)) {
>  		irq_base =3D irq_alloc_descs(irq_start, 16, gic_irqs,
>  					   numa_node_id());
> diff --git a/drivers/irqchip/irq-mt65xx-cirq.c b/drivers/irqchip/irq-=
mt65xx-cirq.c
> new file mode 100644
> index 0000000..1243a7f
> --- /dev/null
> +++ b/drivers/irqchip/irq-mt65xx-cirq.c
> @@ -0,0 +1,158 @@
> +
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include "irqchip.h"
> +
> +#define MT6577_SYS_CIRQ_NUM	(168)
> +
> +struct mt_cirq_chip_data {
> +	spinlock_t lock;
> +	void __iomem *intpol_base;
> +};
> +
> +
> +static int mt_cirq_set_type(struct irq_data *data, unsigned int type=
)
> +{
> +	irq_hw_number_t hwirq =3D data->hwirq;
> +	struct mt_cirq_chip_data *chip_data =3D data->chip_data;
> +	u32 offset, reg_index, value;
> +	unsigned long flags;
> +	int ret;
> +
> +	offset =3D hwirq & 0x1f;
> +	reg_index =3D hwirq >> 5;
> +
> +	spin_lock_irqsave(&chip_data->lock, flags);
> +	value =3D readl_relaxed(chip_data->intpol_base + reg_index * 4);
> +	if (type =3D=3D IRQ_TYPE_LEVEL_LOW || type =3D=3D IRQ_TYPE_EDGE_FAL=
LING) {
> +		type =3D (type =3D=3D IRQ_TYPE_LEVEL_LOW) ?
> +			IRQ_TYPE_LEVEL_HIGH : IRQ_TYPE_EDGE_RISING;
> +		value |=3D (1 << offset);
> +	} else
> +		value &=3D ~(1 << offset);
> +	writel(value, chip_data->intpol_base + reg_index * 4);
> +
> +	data =3D data->parent_data;
> +	ret =3D data->chip->irq_set_type(data, type);
> +	spin_unlock_irqrestore(&chip_data->lock, flags);
> +	return ret;
> +}
> +
> +static struct irq_chip mt_cirq_chip =3D {
> +	.name			=3D "MT_CIRQ",
> +	.irq_mask		=3D irq_chip_mask_parent,
> +	.irq_unmask		=3D irq_chip_unmask_parent,
> +	.irq_eoi		=3D irq_chip_eoi_parent,
> +	.irq_set_type		=3D mt_cirq_set_type,
> +	.irq_retrigger		=3D irq_chip_retrigger_hierarchy,
> +	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
> +};
> +
> +static int mt_cirq_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
> +				unsigned int nr_irqs, void *arg)
> +{
> +	int i, ret;
> +	irq_hw_number_t hwirq;
> +	struct of_phandle_args *irq_data =3D arg;
> +
> +	if (irq_data->args_count !=3D 3)
> +		return -EINVAL;
> +
> +	hwirq =3D irq_data->args[1];
> +	if (irq_find_mapping(domain, hwirq) > 0)
> +		return -EEXIST;
> +
> +	for (i =3D 0; i < nr_irqs; i++)
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +					      &mt_cirq_chip, domain->host_data);
> +
> +	ret =3D irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void mt_cirq_domain_free(struct irq_domain *domain, unsigned =
int virq,
> +				unsigned int nr_irqs)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < nr_irqs; i++) {
> +		irq_set_handler(virq + i, NULL);
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, 0, NULL, NULL);
> +	}
> +	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> +}
> +
> +static int mt_cirq_domain_xlate(struct irq_domain *d,
> +				struct device_node *controller,
> +				const u32 *intspec, unsigned int intsize,
> +				unsigned long *out_hwirq,
> +				unsigned int *out_type)
> +{
> +	return d->parent->ops->xlate(d->parent, controller, intspec, intsiz=
e,
> +					out_hwirq, out_type);
> +}
> +
> +static struct irq_domain_ops cirq_domain_ops =3D {
> +	.alloc =3D mt_cirq_domain_alloc,
> +	.free =3D mt_cirq_domain_free,
> +	.xlate =3D mt_cirq_domain_xlate,
> +};
I'm trying to make change to irq_create_of_mapping() in next version,
which will affect you patch in two aspects:
1) no need to implement mt_cirq_domain_xlate=E3=80=82
2=EF=BC=89OF hierarchy irqdomain callbacks need to implement following =
logic:
        if (type !=3D IRQ_TYPE_NONE &&
            type !=3D irq_get_trigger_type(virq))
                irq_set_irq_type(virq, type);

Regards!
Gerry
> +
> +static int __init mtk_cirq_of_init(struct device_node *node,
> +				   struct device_node *parent)
> +{
> +	struct device_node *parent_node;
> +	struct irq_domain *domain, *domain_parent =3D NULL;
> +	struct mt_cirq_chip_data *chip_data;
> +	int ret =3D 0;
> +
> +	parent_node =3D of_irq_find_parent(node);
> +	if (parent_node) {
> +		domain_parent =3D irq_find_host(parent_node);
> +		of_node_put(parent_node);
> +	}
> +
> +	if (!domain_parent) {
> +		pr_err("mtk_cirq: interrupt-parent not found\n");
> +		return -EINVAL;
> +	}
> +
> +	chip_data =3D kzalloc(sizeof(*chip_data), GFP_KERNEL);
> +	if (!chip_data)
> +		return -ENOMEM;
> +
> +	chip_data->intpol_base =3D of_io_request_and_map(node, 0, "intpol")=
;
> +	if (!chip_data->intpol_base) {
> +		pr_err("mtk_cirq: unable to map cirq register\n");
> +		ret =3D -ENOMEM;
> +		goto out_free;
> +	}
> +
> +	domain =3D irq_domain_add_linear(node, MT6577_SYS_CIRQ_NUM,
> +				&cirq_domain_ops, chip_data);
> +	if (!domain) {
> +		ret =3D -ENOMEM;
> +		goto out_unmap;
> +	}
> +	domain->parent =3D domain_parent;
> +	spin_lock_init(&chip_data->lock);
> +
> +	return 0;
> +
> +out_unmap:
> +	iounmap(chip_data->intpol_base);
> +out_free:
> +	kfree(chip_data);
> +	return ret;
> +}
> +IRQCHIP_DECLARE(mtk_cirq, "mediatek,mt6577-cirq", mtk_cirq_of_init);
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index bfa027f..a877b88 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -435,6 +435,11 @@ extern void handle_nested_irq(unsigned int irq);
> =20
>  #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
>  extern void irq_chip_ack_parent(struct irq_data *data);
> +extern void irq_chip_mask_parent(struct irq_data *data);
> +extern void irq_chip_unmask_parent(struct irq_data *data);
> +extern void irq_chip_eoi_parent(struct irq_data *data);
> +extern int irq_chip_set_affinity_parent(struct irq_data *data,
> +				const struct cpumask *dest, bool force);
>  extern int irq_chip_retrigger_hierarchy(struct irq_data *data);
>  #endif
> =20
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index b8ee27e..da3042b 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -830,6 +830,34 @@ void irq_chip_ack_parent(struct irq_data *data)
>  		data->chip->irq_ack(data);
>  }
> =20
> +void irq_chip_mask_parent(struct irq_data *data)
> +{
> +	data =3D data->parent_data;
> +	data->chip->irq_mask(data);
> +}
> +
> +void irq_chip_unmask_parent(struct irq_data *data)
> +{
> +	data =3D data->parent_data;
> +	data->chip->irq_unmask(data);
> +}
> +
> +void irq_chip_eoi_parent(struct irq_data *data)
> +{
> +	data =3D data->parent_data;
> +	data->chip->irq_eoi(data);
> +}
> +
> +int irq_chip_set_affinity_parent(struct irq_data *data,
> +				 const struct cpumask *dest, bool force)
> +{
> +	data =3D data->parent_data;
> +	if (data->chip->irq_set_affinity)
> +		return data->chip->irq_set_affinity(data, dest, force);
> +
> +	return -ENOSYS;
> +}
> +
>  int irq_chip_retrigger_hierarchy(struct irq_data *data)
>  {
>  	for (data =3D data->parent_data; data; data =3D data->parent_data)
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index e285f3a..01e852b 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -467,7 +467,7 @@ unsigned int irq_create_of_mapping(struct of_phan=
dle_args *irq_data)
>  	struct irq_domain *domain;
>  	irq_hw_number_t hwirq;
>  	unsigned int type =3D IRQ_TYPE_NONE;
> -	unsigned int virq;
> +	int virq;
> =20
>  	domain =3D irq_data->np ? irq_find_host(irq_data->np) : irq_default=
_domain;
>  	if (!domain) {
> @@ -493,8 +493,8 @@ unsigned int irq_create_of_mapping(struct of_phan=
dle_args *irq_data)
>  	else
>  #endif
>  		virq =3D irq_create_mapping(domain, hwirq);
> -	if (!virq)
> -		return virq;
> +	if (virq <=3D 0)
> +		return 0;
> =20
>  	/* Set type if specified and different than the current one */
>  	if (type !=3D IRQ_TYPE_NONE &&
> @@ -716,20 +716,20 @@ const struct irq_domain_ops irq_domain_simple_o=
ps =3D {
>  };
>  EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
> =20
> -static int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
> +static int irq_domain_alloc_descs(int virq, unsigned int cnt,
>  				  irq_hw_number_t hwirq, int node)
>  {
>  	unsigned int hint;
> =20
>  	if (virq >=3D 0) {
> -		virq =3D irq_alloc_descs(virq, virq, nr_irqs, node);
> +		virq =3D irq_alloc_descs(virq, virq, cnt, node);
>  	} else {
>  		hint =3D hwirq % nr_irqs;
>  		if (hint =3D=3D 0)
>  			hint++;
> -		virq =3D irq_alloc_descs_from(hint, nr_irqs, node);
> +		virq =3D irq_alloc_descs_from(hint, cnt, node);
>  		if (virq <=3D 0 && hint > 1)
> -			virq =3D irq_alloc_descs_from(1, nr_irqs, node);
> +			virq =3D irq_alloc_descs_from(1, cnt, node);
>  	}
> =20
>  	return virq;
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
