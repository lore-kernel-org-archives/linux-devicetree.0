From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3 1/2] irq: add irq_domain translation infrastructure
Date: Tue, 26 Jul 2011 03:40:01 -0600
Message-ID: <CACxGe6vSfhWF_nRU0r=UG52W7UNwgXyWrJtiZ0JRwWy4f7FE0g@mail.gmail.com>
References: <20110726093141.12508.48108.stgit@ponder>
	<20110726093641.12508.82413.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110726093641.12508.82413.stgit@ponder>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, tglx@linutronix.de, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 26, 2011 at 3:36 AM, Grant Likely <grant.likely@secretlab.ca> w=
rote:
> This patch adds irq_domain infrastructure for translating from
> hardware irq numbers to linux irqs. =A0This is particularly important
> for architectures adding device tree support because the current
> implementation (excluding PowerPC and SPARC) cannot handle
> translation for more than a single interrupt controller. =A0irq_domain
> supports device tree translation for any number of interrupt
> controllers.
>
> This patch converts x86, Microblaze, ARM and MIPS to use irq_domain
> for device tree irq translation. =A0x86 is untested beyond compiling it,
> irq_domain is enabled for MIPS and Microblaze, but the old behaviour is
> preserved until the core code is modified to actually register an
> irq_domain yet. =A0On ARM it works and is required for much of the new
> ARM device tree board support.

Oops, I obviously forgot to update the commit text.  This patch only
affects ARM, I've split the MIPS, Microblaze and x86 bits out into a
separate patch.  I'll craft new commit text before reposting.

g.

>
> PowerPC has /not/ been converted to use this new infrastructure. =A0It
> is still missing some features before it can replace the virq
> infrastructure already in powerpc (see documentation on
> irq_domain_map/unmap for details). =A0Followup patches will add the
> missing pieces and migrate PowerPC to use irq_domain.
>
> SPARC has its own method of managing interrupts from the device tree
> and is unaffected by this change.
>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01
> =A0arch/arm/include/asm/prom.h | =A0 =A05 --
> =A0arch/arm/kernel/devtree.c =A0 | =A0 14 -----
> =A0include/linux/irq.h =A0 =A0 =A0 =A0 | =A0 =A06 ++
> =A0include/linux/irqdomain.h =A0 | =A0 81 ++++++++++++++++++++++++++++
> =A0include/linux/of_irq.h =A0 =A0 =A0| =A0 =A04 +
> =A0kernel/irq/Kconfig =A0 =A0 =A0 =A0 =A0| =A0 =A04 +
> =A0kernel/irq/Makefile =A0 =A0 =A0 =A0 | =A0 =A01
> =A0kernel/irq/irqdomain.c =A0 =A0 =A0| =A0123 +++++++++++++++++++++++++++=
++++++++++++++++
> =A09 files changed, 220 insertions(+), 19 deletions(-)
> =A0create mode 100644 include/linux/irqdomain.h
> =A0create mode 100644 kernel/irq/irqdomain.c
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 9cb1f4b..b2695aa 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1680,6 +1680,7 @@ config USE_OF
> =A0 =A0 =A0 =A0bool "Flattened Device Tree support"
> =A0 =A0 =A0 =A0select OF
> =A0 =A0 =A0 =A0select OF_EARLY_FLATTREE
> + =A0 =A0 =A0 select IRQ_DOMAIN
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Include support for flattened device tree machine desc=
riptions.
>
> diff --git a/arch/arm/include/asm/prom.h b/arch/arm/include/asm/prom.h
> index 11b8708..6f65ca8 100644
> --- a/arch/arm/include/asm/prom.h
> +++ b/arch/arm/include/asm/prom.h
> @@ -16,11 +16,6 @@
> =A0#include <asm/setup.h>
> =A0#include <asm/irq.h>
>
> -static inline void irq_dispose_mapping(unsigned int virq)
> -{
> - =A0 =A0 =A0 return;
> -}
> -
> =A0extern struct machine_desc *setup_machine_fdt(unsigned int dt_phys);
> =A0extern void arm_dt_memblock_reserve(void);
>
> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> index 0cdd7b4..1a33e9d 100644
> --- a/arch/arm/kernel/devtree.c
> +++ b/arch/arm/kernel/devtree.c
> @@ -132,17 +132,3 @@ struct machine_desc * __init setup_machine_fdt(unsig=
ned int dt_phys)
>
> =A0 =A0 =A0 =A0return mdesc_best;
> =A0}
> -
> -/**
> - * irq_create_of_mapping - Hook to resolve OF irq specifier into a Linux=
 irq#
> - *
> - * Currently the mapping mechanism is trivial; simple flat hwirq numbers=
 are
> - * mapped 1:1 onto Linux irq numbers. =A0Cascaded irq controllers are not
> - * supported.
> - */
> -unsigned int irq_create_of_mapping(struct device_node *controller,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cons=
t u32 *intspec, unsigned int intsize)
> -{
> - =A0 =A0 =A0 return intspec[0];
> -}
> -EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index 5f69504..87a06f3 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -108,14 +108,18 @@ enum {
> =A0};
>
> =A0struct msi_desc;
> +struct irq_domain;
>
> =A0/**
> =A0* struct irq_data - per irq and irq chip data passed down to chip func=
tions
> =A0* @irq: =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt number
> + * @hwirq: =A0 =A0 =A0 =A0 =A0 =A0 hardware interrupt number, local to t=
he interrupt domain
> =A0* @node: =A0 =A0 =A0 =A0 =A0 =A0 =A0node index useful for balancing
> =A0* @state_use_accessors: status information for irq chip functions.
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Use accessor functions to de=
al with it
> =A0* @chip: =A0 =A0 =A0 =A0 =A0 =A0 =A0low level interrupt hardware access
> + * @domain: =A0 =A0 =A0 =A0 =A0 =A0Interrupt translation domain; respons=
ible for mapping
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 between hwirq number and linu=
x irq number.
> =A0* @handler_data: =A0 =A0 =A0per-IRQ data for the irq_chip methods
> =A0* @chip_data: =A0 =A0 =A0 =A0 platform-specific per-chip private data =
for the chip
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 methods, to allow shared chi=
p implementations
> @@ -128,9 +132,11 @@ struct msi_desc;
> =A0*/
> =A0struct irq_data {
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0irq;
> + =A0 =A0 =A0 unsigned long =A0 =A0 =A0 =A0 =A0 hwirq;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0node;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0state_use_accessors;
> =A0 =A0 =A0 =A0struct irq_chip =A0 =A0 =A0 =A0 *chip;
> + =A0 =A0 =A0 struct irq_domain =A0 =A0 =A0 *domain;
> =A0 =A0 =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*handler_data;
> =A0 =A0 =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*chip_data;
> =A0 =A0 =A0 =A0struct msi_desc =A0 =A0 =A0 =A0 *msi_desc;
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> new file mode 100644
> index 0000000..8f2c10a
> --- /dev/null
> +++ b/include/linux/irqdomain.h
> @@ -0,0 +1,81 @@
> +/*
> + * irq_domain - IRQ translation domains
> + *
> + * Translation infrastructure between hw and linux irq numbers. =A0This =
is
> + * helpful for interrupt controllers to implement mapping between hardwa=
re
> + * irq numbers and the Linux irq number space.
> + *
> + * irq_domains also have a hook for translating device tree interrupt
> + * representation into a hardware irq number that can be mapped back to a
> + * Linux irq number without any extra platform support code.
> + *
> + * irq_domain is expected to be embedded in an interrupt controller's pr=
ivate
> + * data structure.
> + */
> +#ifndef _LINUX_IRQDOMAIN_H
> +#define _LINUX_IRQDOMAIN_H
> +
> +#include <linux/irq.h>
> +
> +#ifdef CONFIG_IRQ_DOMAIN
> +struct device_node;
> +struct irq_domain;
> +
> +/**
> + * struct irq_domain_ops - Methods for irq_domain objects
> + * @to_irq: (optional) given a local hardware irq number, return the lin=
ux
> + * =A0 =A0 =A0 =A0 =A0irq number. =A0If to_irq is not implemented, then =
the irq_domain
> + * =A0 =A0 =A0 =A0 =A0will use this translation: irq =3D (domain->irq_ba=
se + hwirq)
> + * @dt_translate: Given a device tree node and interrupt specifier, deco=
de
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0the hardware irq number and linux irq =
type value.
> + */
> +struct irq_domain_ops {
> + =A0 =A0 =A0 unsigned int (*to_irq)(struct irq_domain *d, unsigned long =
hwirq);
> +
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 int (*dt_translate)(struct irq_domain *d, struct device_nod=
e *node,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const u32 *intspec,=
 unsigned int intsize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long *out_=
hwirq, unsigned int *out_type);
> +#endif /* CONFIG_OF */
> +};
> +
> +/**
> + * struct irq_domain - Hardware interrupt number translation object
> + * @list: Element in global irq_domain list.
> + * @irq_base: Start of irq_desc range assigned to the irq_domain. =A0The=
 creator
> + * =A0 =A0 =A0 =A0 =A0 =A0of the irq_domain is responsible for allocatin=
g the array of
> + * =A0 =A0 =A0 =A0 =A0 =A0irq_desc structures.
> + * @nr_irq: Number of irqs managed by the irq domain
> + * @ops: pointer to irq_domain methods
> + * @priv: private data pointer for use by owner. =A0Not touched by irq_d=
omain
> + * =A0 =A0 =A0 =A0core code.
> + * @of_node: (optional) Pointer to device tree nodes associated with the
> + * =A0 =A0 =A0 =A0 =A0 irq_domain. =A0Used when decoding device tree int=
errupt specifiers.
> + */
> +struct irq_domain {
> + =A0 =A0 =A0 struct list_head list;
> + =A0 =A0 =A0 unsigned int irq_base;
> + =A0 =A0 =A0 unsigned int nr_irq;
> + =A0 =A0 =A0 const struct irq_domain_ops *ops;
> + =A0 =A0 =A0 void *priv;
> + =A0 =A0 =A0 struct device_node *of_node;
> +};
> +
> +/**
> + * irq_domain_to_irq() - Translate from a hardware irq to a linux irq nu=
mber
> + *
> + * Returns the linux irq number associated with a hardware irq. =A0By de=
fault,
> + * the mapping is irq =3D=3D domain->irq_base + hwirq, but this mapping =
can
> + * be overridden if the irq_domain implements a .to_irq() hook.
> + */
> +static inline unsigned int irq_domain_to_irq(struct irq_domain *d,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0unsigned long hwirq)
> +{
> + =A0 =A0 =A0 return d->ops->to_irq ? d->ops->to_irq(d, hwirq) : d->irq_b=
ase + hwirq;
> +}
> +
> +extern void irq_domain_add(struct irq_domain *domain);
> +extern void irq_domain_del(struct irq_domain *domain);
> +#endif /* CONFIG_IRQ_DOMAIN */
> +
> +#endif /* _LINUX_IRQDOMAIN_H */
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index e6955f5..cd2e61c 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -63,6 +63,9 @@ extern int of_irq_map_one(struct device_node *device, i=
nt index,
> =A0extern unsigned int irq_create_of_mapping(struct device_node *controll=
er,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0const u32 *intspec,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0unsigned int intsize);
> +#ifdef CONFIG_IRQ_DOMAIN
> +extern void irq_dispose_mapping(unsigned int irq);
> +#endif
> =A0extern int of_irq_to_resource(struct device_node *dev, int index,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct resourc=
e *r);
> =A0extern int of_irq_count(struct device_node *dev);
> @@ -70,6 +73,7 @@ extern int of_irq_to_resource_table(struct device_node =
*dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct resource *res, int nr_irqs);
> =A0extern struct device_node *of_irq_find_parent(struct device_node *chil=
d);
>
> +
> =A0#endif /* CONFIG_OF_IRQ */
> =A0#endif /* CONFIG_OF */
> =A0#endif /* __OF_IRQ_H */
> diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> index d1d051b3..5a38bf4 100644
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -52,6 +52,10 @@ config IRQ_EDGE_EOI_HANDLER
> =A0config GENERIC_IRQ_CHIP
> =A0 =A0 =A0 =A0bool
>
> +# Generic irq_domain hw <--> linux irq number translation
> +config IRQ_DOMAIN
> + =A0 =A0 =A0 bool
> +
> =A0# Support forced irq threading
> =A0config IRQ_FORCED_THREADING
> =A0 =A0 =A0 =A0bool
> diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
> index 7329005..fff1738 100644
> --- a/kernel/irq/Makefile
> +++ b/kernel/irq/Makefile
> @@ -2,6 +2,7 @@
> =A0obj-y :=3D irqdesc.o handle.o manage.o spurious.o resend.o chip.o dumm=
ychip.o devres.o
> =A0obj-$(CONFIG_GENERIC_IRQ_CHIP) +=3D generic-chip.o
> =A0obj-$(CONFIG_GENERIC_IRQ_PROBE) +=3D autoprobe.o
> +obj-$(CONFIG_IRQ_DOMAIN) +=3D irqdomain.o
> =A0obj-$(CONFIG_PROC_FS) +=3D proc.o
> =A0obj-$(CONFIG_GENERIC_PENDING_IRQ) +=3D migration.o
> =A0obj-$(CONFIG_PM_SLEEP) +=3D pm.o
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> new file mode 100644
> index 0000000..171b754
> --- /dev/null
> +++ b/kernel/irq/irqdomain.c
> @@ -0,0 +1,123 @@
> +
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +
> +static LIST_HEAD(irq_domain_list);
> +static DEFINE_MUTEX(irq_domain_mutex);
> +
> +/**
> + * irq_domain_add() - Register an irq_domain
> + * @domain: ptr to initialized irq_domain structure
> + *
> + * Registers an irq_domain structure. =A0The irq_domain must at a minimu=
m be
> + * initialized with an ops structure pointer, and either a ->to_irq hook=
 or
> + * a valid irq_base value. =A0Everything else is optional.
> + */
> +void irq_domain_add(struct irq_domain *domain)
> +{
> + =A0 =A0 =A0 struct irq_data *d;
> + =A0 =A0 =A0 int hwirq;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* This assumes that the irq_domain owner has already all=
ocated
> + =A0 =A0 =A0 =A0* the irq_descs. =A0This block will be removed when supp=
ort for dynamic
> + =A0 =A0 =A0 =A0* allocation of irq_descs is added to irq_domain.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 for (hwirq =3D 0; hwirq < domain->nr_irq; hwirq++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 d =3D irq_get_irq_data(irq_domain_to_irq(do=
main, hwirq));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d || d->domain) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* things are broken; just =
report, don't clean up */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 WARN(1, "error: irq_desc al=
ready assigned to a domain");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 d->domain =3D domain;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 d->hwirq =3D hwirq;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 mutex_lock(&irq_domain_mutex);
> + =A0 =A0 =A0 list_add(&domain->list, &irq_domain_list);
> + =A0 =A0 =A0 mutex_unlock(&irq_domain_mutex);
> +}
> +
> +/**
> + * irq_domain_del() - Unregister an irq_domain
> + * @domain: ptr to registered irq_domain.
> + */
> +void irq_domain_del(struct irq_domain *domain)
> +{
> + =A0 =A0 =A0 struct irq_data *d;
> + =A0 =A0 =A0 int hwirq;
> +
> + =A0 =A0 =A0 mutex_lock(&irq_domain_mutex);
> + =A0 =A0 =A0 list_del(&domain->list);
> + =A0 =A0 =A0 mutex_unlock(&irq_domain_mutex);
> +
> + =A0 =A0 =A0 /* Clear the irq_domain assignments */
> + =A0 =A0 =A0 for (hwirq =3D 0; hwirq < domain->nr_irq; hwirq++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 d =3D irq_get_irq_data(irq_domain_to_irq(do=
main, hwirq));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 d->domain =3D NULL;
> + =A0 =A0 =A0 }
> +}
> +
> +#if defined(CONFIG_OF_IRQ)
> +/**
> + * irq_create_of_mapping() - Map a linux irq number from a DT interrupt =
spec
> + *
> + * Used by the device tree interrupt mapping code to translate a device =
tree
> + * interrupt specifier to a valid linux irq number. =A0Returns either a =
valid
> + * linux IRQ number or 0.
> + *
> + * When the caller no longer need the irq number returned by this functi=
on it
> + * should arrange to call irq_dispose_mapping().
> + */
> +unsigned int irq_create_of_mapping(struct device_node *controller,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cons=
t u32 *intspec, unsigned int intsize)
> +{
> + =A0 =A0 =A0 struct irq_domain *domain;
> + =A0 =A0 =A0 unsigned long hwirq;
> + =A0 =A0 =A0 unsigned int irq, type;
> + =A0 =A0 =A0 int rc =3D -EINVAL;
> +
> + =A0 =A0 =A0 /* Find a domain which can translate the irq spec */
> + =A0 =A0 =A0 mutex_lock(&irq_domain_mutex);
> + =A0 =A0 =A0 list_for_each_entry(domain, &irq_domain_list, list) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!domain->ops->dt_translate)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D domain->ops->dt_translate(domain, co=
ntroller,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 intspec, intsize, &hwirq, &type);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rc =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 mutex_unlock(&irq_domain_mutex);
> +
> + =A0 =A0 =A0 if (rc !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 irq =3D irq_domain_to_irq(domain, hwirq);
> + =A0 =A0 =A0 if (type !=3D IRQ_TYPE_NONE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_irq_type(irq, type);
> + =A0 =A0 =A0 pr_debug("%s: mapped hwirq=3D%i to irq=3D%i, flags=3D%x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0controller->full_name, (int)hwirq, irq, =
type);
> + =A0 =A0 =A0 return irq;
> +}
> +EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> +
> +/**
> + * irq_dispose_mapping() - Discard a mapping created by irq_create_of_ma=
pping()
> + * @irq: linux irq number to be discarded
> + *
> + * Calling this function indicates the caller no longer needs a referenc=
e to
> + * the linux irq number returned by a prior call to irq_create_of_mappin=
g().
> + */
> +void irq_dispose_mapping(unsigned int irq)
> +{
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* nothing yet; will be filled when support for dynamic a=
llocation of
> + =A0 =A0 =A0 =A0* irq_descs is added to irq_domain
> + =A0 =A0 =A0 =A0*/
> +}
> +EXPORT_SYMBOL_GPL(irq_dispose_mapping);
> +#endif /* CONFIG_OF_IRQ */
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
