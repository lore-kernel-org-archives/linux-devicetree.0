From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/5] irqchip: add dumb demultiplexer implementation
Date: Wed, 14 Jan 2015 14:36:42 +0100
Message-ID: <54B670EA.1010800@atmel.com>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com> <1421174781-4340-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421174781-4340-2-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 13/01/2015 19:46, Boris Brezillon a =E9crit :
> Some interrupt controllers are multiplexing several peripheral IRQs o=
n
> a single interrupt line.
> While this is not a problem for most IRQs (as long as all peripherals
> request the interrupt with IRQF_SHARED flag set), multiplexing timers=
 and
> other type of peripherals will generate a WARNING (mixing IRQF_NO_SUS=
PEND
> and !IRQF_NO_SUSPEND is prohibited).
>=20
> Create a dumb irq demultiplexer which simply forwards interrupts to a=
ll
> peripherals (exactly what's happening with IRQ_SHARED) but keep a uni=
que
> irq number for each peripheral, thus preventing the IRQF_NO_SUSPEND
> and !IRQF_NO_SUSPEND mix on a given interrupt.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/irqchip/Kconfig          |   4 ++
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-dumb-demux.c |  70 ++++++++++++++++++++
>  include/linux/irq.h              |  49 ++++++++++++++
>  include/linux/irqdomain.h        |   1 +
>  kernel/irq/Kconfig               |   5 ++
>  kernel/irq/Makefile              |   1 +
>  kernel/irq/chip.c                |  41 ++++++++++++
>  kernel/irq/dumb-demux-chip.c     | 140 +++++++++++++++++++++++++++++=
++++++++++
>  kernel/irq/handle.c              |  31 ++++++++-
>  kernel/irq/internals.h           |   3 +
>  11 files changed, 344 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/irqchip/irq-dumb-demux.c
>  create mode 100644 kernel/irq/dumb-demux-chip.c
>=20
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index cc79d2a..8a9df88 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -70,6 +70,10 @@ config BRCMSTB_L2_IRQ
>  	select GENERIC_IRQ_CHIP
>  	select IRQ_DOMAIN
> =20
> +config DUMB_DEMUX_IRQ
> +	bool
> +	select DUMB_IRQ_DEMUX_CHIP
> +
>  config DW_APB_ICTL
>  	bool
>  	select GENERIC_IRQ_CHIP
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 9516a32..77f3c51 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_ARCH_MVEBU)		+=3D irq-armada-370-xp.o
>  obj-$(CONFIG_ARCH_MXS)			+=3D irq-mxs.o
>  obj-$(CONFIG_ARCH_S3C24XX)		+=3D irq-s3c24xx.o
>  obj-$(CONFIG_DW_APB_ICTL)		+=3D irq-dw-apb-ictl.o
> +obj-$(CONFIG_DUMB_DEMUX_IRQ)		+=3D irq-dumb-demux.o
>  obj-$(CONFIG_METAG)			+=3D irq-metag-ext.o
>  obj-$(CONFIG_METAG_PERFCOUNTER_IRQS)	+=3D irq-metag.o
>  obj-$(CONFIG_ARCH_MOXART)		+=3D irq-moxart.o
> diff --git a/drivers/irqchip/irq-dumb-demux.c b/drivers/irqchip/irq-d=
umb-demux.c
> new file mode 100644
> index 0000000..dfa05ce
> --- /dev/null
> +++ b/drivers/irqchip/irq-dumb-demux.c
> @@ -0,0 +1,70 @@

Maybe add a little file header here. It's always better.


> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_irq.h>
> +#include <linux/slab.h>
> +
> +#include "irqchip.h"
> +
> +static int __init dumb_irq_demux_of_init(struct device_node *node,
> +					 struct device_node *parent)
> +{
> +	struct irq_chip_dumb_demux *demux;
> +	unsigned int irq;
> +	u32 valid_irqs;
> +	int ret;
> +
> +	irq =3D irq_of_parse_and_map(node, 0);
> +	if (!irq) {
> +		pr_err("Failed to retrieve dumb irq demuxer source\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D of_property_read_u32(node, "irqs", &valid_irqs);
> +	if (ret) {
> +		pr_err("Invalid of missing 'irqs' property\n");
> +		return ret;
> +	}
> +
> +	demux =3D irq_alloc_dumb_demux_chip(irq, valid_irqs,
> +					  IRQ_NOREQUEST | IRQ_NOPROBE |
> +					  IRQ_NOAUTOEN, 0, 0);
> +	if (!demux) {
> +		pr_err("Failed to allocate dumb irq demuxer struct\n");
> +		return -ENOMEM;
> +	}
> +
> +	demux->domain =3D irq_domain_add_linear(node, BITS_PER_LONG,
> +					      &irq_dumb_demux_domain_ops,
> +					      demux);
> +	if (!demux->domain) {
> +		ret =3D -ENOMEM;
> +		goto err_free_demux;
> +	}
> +
> +	ret =3D irq_set_handler_data(irq, demux);
> +	if (ret) {
> +		pr_err("Failed to assign handler data\n");
> +		goto err_free_domain;
> +	}
> +
> +	irq_set_chained_handler(irq, irq_dumb_demux_handler);
> +
> +	/*
> +	 * Disable the src irq (automatically enabled by
> +	 * irq_set_chained_handler) to prevent irqs from happening while
> +	 * nobody requested any of the demuxed irqs.
> +	 */
> +	disable_irq(irq);
> +
> +	return 0;
> +
> +err_free_domain:
> +	irq_domain_remove(demux->domain);
> +
> +err_free_demux:
> +	kfree(demux);
> +
> +	return ret;
> +}
> +IRQCHIP_DECLARE(dumb_irq_demux, "irqchip-dumb-demux", dumb_irq_demux=
_of_init);
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index d09ec7a..ae8fa21 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -445,6 +445,10 @@ extern void handle_fasteoi_irq(unsigned int irq,=
 struct irq_desc *desc);
>  extern void handle_edge_irq(unsigned int irq, struct irq_desc *desc)=
;
>  extern void handle_edge_eoi_irq(unsigned int irq, struct irq_desc *d=
esc);
>  extern void handle_simple_irq(unsigned int irq, struct irq_desc *des=
c);
> +#ifdef CONFIG_DUMB_IRQ_DEMUX_CHIP
> +extern irqreturn_t handle_dumb_demux_irq(unsigned int irq,
> +					 struct irq_desc *desc);
> +#endif
>  extern void handle_percpu_irq(unsigned int irq, struct irq_desc *des=
c);
>  extern void handle_percpu_devid_irq(unsigned int irq, struct irq_des=
c *desc);
>  extern void handle_bad_irq(unsigned int irq, struct irq_desc *desc);
> @@ -862,4 +866,49 @@ static inline u32 irq_reg_readl(struct irq_chip_=
generic *gc,
>  		return readl(gc->reg_base + reg_offset);
>  }
> =20
> +/**
> + * enum irq_dumb_demux_flags - Initialization flags for generic irq =
chips
> + * @IRQ_DD_INIT_NESTED_LOCK:	Set the lock class of the irqs to neste=
d for
> + *				irq chips which need to call irq_set_wake() on
> + *				the parent irq. Usually GPIO implementations
> + */
> +enum irq_dumb_demux_flags {
> +	IRQ_DD_INIT_NESTED_LOCK		=3D 1 << 0,
> +};
> +
> +#ifdef CONFIG_DUMB_IRQ_DEMUX_CHIP
> +/**
> + * struct irq_chip_dumb_demux - Dumb demultiplexer irq chip data str=
ucture
> + * @domain:		irq domain pointer
> + * @available:		Bitfield of valid irqs
> + * @unmasked:		Bitfield containing irqs status
> + * @flags:		irq_dumb_demux_flags flags
> + * @src_irq:		irq feeding the dumb demux chip
> + *
> + * Note, that irq_chip_generic can have multiple irq_chip_type
> + * implementations which can be associated to a particular irq line =
of
> + * an irq_chip_generic instance. That allows to share and protect
> + * state in an irq_chip_generic instance when we need to implement
> + * different flow mechanisms (level/edge) for it.
> + */
> +struct irq_chip_dumb_demux {
> +	struct irq_domain *domain;
> +	unsigned long available;
> +	unsigned long unmasked;
> +	unsigned int flags;
> +	unsigned int src_irq;
> +	unsigned int irq_flags_to_clear;
> +	unsigned int irq_flags_to_set;
> +};
> +
> +void irq_dumb_demux_handler(unsigned int irq, struct irq_desc *desc)=
;
> +
> +struct irq_chip_dumb_demux *
> +irq_alloc_dumb_demux_chip(unsigned int src_irq,
> +			  unsigned long valid_irqs,
> +			  unsigned int clr_flags,
> +			  unsigned int set_flags,
> +			  unsigned int dd_flags);
> +#endif /* CONFIG_DUMB_IRQ_DEMUX_CHIP */
> +
>  #endif /* _LINUX_IRQ_H */
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 676d730..1de3808 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -80,6 +80,7 @@ struct irq_domain_ops {
>  };
> =20
>  extern struct irq_domain_ops irq_generic_chip_ops;
> +extern struct irq_domain_ops irq_dumb_demux_domain_ops;
> =20
>  struct irq_domain_chip_generic;
> =20
> diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> index 9a76e3b..d01554a 100644
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -51,6 +51,11 @@ config GENERIC_IRQ_CHIP
>         bool
>         select IRQ_DOMAIN
> =20
> +# Dumb interrupt demuxer chip implementation
> +config DUMB_IRQ_DEMUX_CHIP
> +	bool
> +	select IRQ_DOMAIN
> +
>  # Generic irq_domain hw <--> linux irq number translation
>  config IRQ_DOMAIN
>  	bool
> diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
> index d121235..1cd4e42 100644
> --- a/kernel/irq/Makefile
> +++ b/kernel/irq/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_PROC_FS) +=3D proc.o
>  obj-$(CONFIG_GENERIC_PENDING_IRQ) +=3D migration.o
>  obj-$(CONFIG_PM_SLEEP) +=3D pm.o
>  obj-$(CONFIG_GENERIC_MSI_IRQ) +=3D msi.o
> +obj-$(CONFIG_DUMB_IRQ_DEMUX_CHIP) +=3D dumb-demux-chip.o
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index 6f1c7a5..d2a5c96 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -405,6 +405,47 @@ out_unlock:
>  }
>  EXPORT_SYMBOL_GPL(handle_simple_irq);
> =20
> +#ifdef CONFIG_DUMB_IRQ_DEMUX_CHIP
> +/**
> + *	handle_dumb_demux_irq - Dumb demuxer irq handle function.
> + *	@irq:	the interrupt number
> + *	@desc:	the interrupt description structure for this irq
> + *
> + *	Dumb demux interrupts are sent from a demultiplexing interrupt ha=
ndler
> + *	which is not able to decide which child interrupt interrupt handl=
er

typo: "interrupt interrupt"

> + *	should be called.
> + *
> + *	Note: The caller is expected to handle the ack, clear, mask and
> + *	unmask issues if necessary.
> + */
> +irqreturn_t
> +handle_dumb_demux_irq(unsigned int irq, struct irq_desc *desc)
> +{
> +	irqreturn_t retval =3D IRQ_NONE;
> +
> +	raw_spin_lock(&desc->lock);
> +
> +	if (!irq_may_run(desc))
> +		goto out_unlock;
> +
> +	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
> +	kstat_incr_irqs_this_cpu(irq, desc);
> +
> +	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) =
{
> +		desc->istate |=3D IRQS_PENDING;
> +		goto out_unlock;
> +	}
> +
> +	retval =3D handle_irq_event_no_spurious_check(desc);
> +
> +out_unlock:
> +	raw_spin_unlock(&desc->lock);
> +
> +	return retval;
> +}
> +EXPORT_SYMBOL_GPL(handle_dumb_demux_irq);
> +#endif /* CONFIG_DUMB_IRQ_DEMUX_CHIP */
> +
>  /*
>   * Called unconditionally from handle_level_irq() and only for onesh=
ot
>   * interrupts from handle_fasteoi_irq()
> diff --git a/kernel/irq/dumb-demux-chip.c b/kernel/irq/dumb-demux-chi=
p.c
> new file mode 100644
> index 0000000..8e2de1d
> --- /dev/null
> +++ b/kernel/irq/dumb-demux-chip.c
> @@ -0,0 +1,140 @@
> +/*
> + * Library implementing common dumb irq demux chip functions
> + *
> + * Copyright (C) 2015, Boris Brezillon

License here, please.

> + */
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/slab.h>
> +#include <linux/export.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel_stat.h>
> +#include <linux/syscore_ops.h>
> +
> +#include "internals.h"
> +
> +static void irq_dumb_demux_mask(struct irq_data *d)
> +{
> +	struct irq_chip_dumb_demux *demux =3D irq_data_get_irq_chip_data(d)=
;
> +
> +	clear_bit(d->hwirq, &demux->unmasked);
> +
> +	if (!demux->unmasked)
> +		disable_irq_nosync(demux->src_irq);
> +}
> +
> +static void irq_dumb_demux_unmask(struct irq_data *d)
> +{
> +	struct irq_chip_dumb_demux *demux =3D irq_data_get_irq_chip_data(d)=
;
> +	bool enable_src_irq =3D !demux->unmasked;

Why this additional "bool" unlike the other function above?

> +
> +	set_bit(d->hwirq, &demux->unmasked);
> +
> +	if (enable_src_irq)
> +		enable_irq(demux->src_irq);
> +}
> +
> +static struct irq_chip irq_dumb_demux_chip =3D {
> +	.name =3D		"dumb-demux-irq",
> +	.irq_mask =3D	irq_dumb_demux_mask,
> +	.irq_unmask =3D	irq_dumb_demux_unmask,
> +};
> +
> +/*
> + * Separate lockdep class for interrupt chip which can nest irq_desc
> + * lock.
> + */
> +static struct lock_class_key irq_nested_lock_class;
> +
> +/*
> + * irq_map_dumb_demux_chip - Map a dumb demux chip for an irq domain
> + */
> +static int irq_map_dumb_demux_chip(struct irq_domain *d,
> +				   unsigned int virq,
> +				   irq_hw_number_t hw_irq)
> +{
> +	struct irq_chip_dumb_demux *demux =3D d->host_data;
> +
> +	if (!test_bit(hw_irq, &demux->available))
> +		return -EINVAL;
> +
> +	if (demux->flags & IRQ_DD_INIT_NESTED_LOCK)
> +		irq_set_lockdep_class(virq, &irq_nested_lock_class);
> +
> +	irq_set_chip(virq, &irq_dumb_demux_chip);
> +	irq_set_chip_data(virq, demux);
> +	irq_modify_status(virq, demux->irq_flags_to_clear,
> +			  demux->irq_flags_to_set);
> +
> +	return 0;
> +}
> +
> +struct irq_domain_ops irq_dumb_demux_domain_ops =3D {
> +	.map	=3D irq_map_dumb_demux_chip,
> +	.xlate	=3D irq_domain_xlate_onecell,
> +};
> +EXPORT_SYMBOL_GPL(irq_dumb_demux_domain_ops);
> +
> +/**
> + * irq_dumb_demux_handler - Dumb demux flow handler
> + * @irq:		Virtual irq number
> + * @irq_desc:		irq descriptor
> + */
> +void irq_dumb_demux_handler(unsigned int irq, struct irq_desc *desc)
> +{
> +	struct irq_chip_dumb_demux *demux =3D irq_get_handler_data(irq);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	irqreturn_t ret =3D IRQ_NONE;
> +	int i;
> +
> +	chained_irq_enter(chip, desc);
> +	for_each_set_bit(i, &demux->unmasked, BITS_PER_LONG) {
> +		int demuxed_irq =3D irq_find_mapping(demux->domain, i);
> +		struct irq_desc *desc =3D irq_to_desc(demuxed_irq);
> +
> +		ret |=3D handle_dumb_demux_irq(demuxed_irq, desc);
> +	}
> +	chained_irq_exit(chip, desc);
> +
> +	if (!noirqdebug)
> +		note_interrupt(irq, desc, ret);
> +}
> +EXPORT_SYMBOL_GPL(irq_dumb_demux_handler);
> +
> +/**
> + * irq_alloc_dumb_demux_chip - Allocate a dumb demux chip
> + * @src_irq:		irq feeding the dumb demux chip
> + * @dd_flags:		irq_dumb_demux_flags flags
> + * @valid_irqs:		Bitmask representing valid irqs
> + * @clr_flags:		irq_flags to clear when mapping an interrupt
> + * @set_flags:		irq_flags to set when mapping an interrupt

Nit. not same order as the function parameters...

> + */
> +struct irq_chip_dumb_demux *
> +irq_alloc_dumb_demux_chip(unsigned int src_irq,
> +			  unsigned long valid_irqs,
> +			  unsigned int clr_flags,
> +			  unsigned int set_flags,
> +			  unsigned int dd_flags)
> +{
> +	struct irq_chip_dumb_demux *demux;
> +
> +	if (!src_irq)
> +		return ERR_PTR(-EINVAL);
> +
> +	demux =3D kzalloc(sizeof(*demux), GFP_KERNEL);
> +	if (!demux)
> +		return ERR_PTR(-ENOMEM);
> +
> +	demux->available =3D valid_irqs;
> +	demux->flags =3D dd_flags;
> +	demux->src_irq =3D src_irq;
> +	demux->irq_flags_to_clear =3D clr_flags;
> +	demux->irq_flags_to_set =3D set_flags;
> +
> +	return demux;
> +}
> +EXPORT_SYMBOL_GPL(irq_alloc_dumb_demux_chip);
> diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
> index 6354802..f786850 100644
> --- a/kernel/irq/handle.c
> +++ b/kernel/irq/handle.c
> @@ -131,7 +131,8 @@ void __irq_wake_thread(struct irq_desc *desc, str=
uct irqaction *action)
>  }
> =20
>  irqreturn_t
> -handle_irq_event_percpu(struct irq_desc *desc, struct irqaction *act=
ion)
> +handle_irq_event_percpu_no_spurious_check(struct irq_desc *desc,
> +					  struct irqaction *action)
>  {
>  	irqreturn_t retval =3D IRQ_NONE;
>  	unsigned int flags =3D 0, irq =3D desc->irq_data.irq;
> @@ -175,8 +176,18 @@ handle_irq_event_percpu(struct irq_desc *desc, s=
truct irqaction *action)
> =20
>  	add_interrupt_randomness(irq, flags);
> =20
> +	return retval;
> +}
> +
> +irqreturn_t
> +handle_irq_event_percpu(struct irq_desc *desc, struct irqaction *act=
ion)
> +{
> +	irqreturn_t retval;
> +
> +	retval =3D handle_irq_event_percpu_no_spurious_check(desc, action);
> +
>  	if (!noirqdebug)
> -		note_interrupt(irq, desc, retval);
> +		note_interrupt(desc->irq_data.irq, desc, retval);
>  	return retval;
>  }
> =20
> @@ -195,3 +206,19 @@ irqreturn_t handle_irq_event(struct irq_desc *de=
sc)
>  	irqd_clear(&desc->irq_data, IRQD_IRQ_INPROGRESS);
>  	return ret;
>  }
> +
> +irqreturn_t handle_irq_event_no_spurious_check(struct irq_desc *desc=
)
> +{
> +	struct irqaction *action =3D desc->action;
> +	irqreturn_t ret;
> +
> +	desc->istate &=3D ~IRQS_PENDING;
> +	irqd_set(&desc->irq_data, IRQD_IRQ_INPROGRESS);
> +	raw_spin_unlock(&desc->lock);
> +
> +	ret =3D handle_irq_event_percpu_no_spurious_check(desc, action);
> +
> +	raw_spin_lock(&desc->lock);
> +	irqd_clear(&desc->irq_data, IRQD_IRQ_INPROGRESS);
> +	return ret;
> +}
> diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
> index df553b0..fe056fb 100644
> --- a/kernel/irq/internals.h
> +++ b/kernel/irq/internals.h
> @@ -90,6 +90,9 @@ extern void init_kstat_irqs(struct irq_desc *desc, =
int node, int nr);
> =20
>  irqreturn_t handle_irq_event_percpu(struct irq_desc *desc, struct ir=
qaction *action);
>  irqreturn_t handle_irq_event(struct irq_desc *desc);
> +irqreturn_t handle_irq_event_percpu_no_spurious_check(struct irq_des=
c *desc,
> +						      struct irqaction *action);
> +irqreturn_t handle_irq_event_no_spurious_check(struct irq_desc *desc=
);
> =20
>  /* Resending of interrupts :*/
>  void check_irq_resend(struct irq_desc *desc, unsigned int irq);

Otherwise, it look okay to me:

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

I'm still a little bit frighten about the additional latency added to
the timer interrupt. But if it's a valid way to solve the problem for
these older SoCs, I'm for it...

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
