From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 04/11] x86/dtb: add irq domain abstraction
Date: Tue, 22 Feb 2011 14:06:55 -0700
Message-ID: <AANLkTimr7EnfC=qHkLJ30VniMU0X70dLGRP3-_Fo9qaX@mail.gmail.com>
References: <1298405266-1624-1-git-send-email-bigeasy@linutronix.de> <1298405266-1624-5-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298405266-1624-5-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, sodaville@linutronix.de, devicetree-discuss@lists.ozlabs.org, x86@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 22, 2011 at 1:07 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> The here introduced irq_domain abstraction represents a generic irq
> controller. It is a subset of powerpc's irq_host which is going to be
> renamed to irq_domain and then become generic. This implementation wi=
ll
> be removed once it is generic.
>
> The xlate callback is resposible to parse irq informations like irq t=
ype
> and number and returns the hardware irq number which is reported by t=
he
> hardware as active.
>
> Cc: devicetree-discuss@lists.ozlabs.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Tested-by: Dirk Brandewie <dirk.brandewie@gmail.com>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
> =A0arch/x86/include/asm/irq_controller.h | =A0 12 ++++++++
> =A0arch/x86/include/asm/prom.h =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +
> =A0arch/x86/kernel/devicetree.c =A0 =A0 =A0 =A0 =A0| =A0 47 +++++++++=
+++++++++++++++++++++++-
> =A03 files changed, 60 insertions(+), 1 deletions(-)
> =A0create mode 100644 arch/x86/include/asm/irq_controller.h
>
> diff --git a/arch/x86/include/asm/irq_controller.h b/arch/x86/include=
/asm/irq_controller.h
> new file mode 100644
> index 0000000..423bbbd
> --- /dev/null
> +++ b/arch/x86/include/asm/irq_controller.h
> @@ -0,0 +1,12 @@
> +#ifndef __IRQ_CONTROLLER__
> +#define __IRQ_CONTROLLER__
> +
> +struct irq_domain {
> + =A0 =A0 =A0 int (*xlate)(struct irq_domain *h, const u32 *intspec, =
u32 intsize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 *out_hwirq, u32 *ou=
t_type);
> + =A0 =A0 =A0 void *priv;
> + =A0 =A0 =A0 struct device_node *controller;
> + =A0 =A0 =A0 struct list_head l;
> +};
> +
> +#endif
> diff --git a/arch/x86/include/asm/prom.h b/arch/x86/include/asm/prom.=
h
> index 841697d..70467d1 100644
> --- a/arch/x86/include/asm/prom.h
> +++ b/arch/x86/include/asm/prom.h
> @@ -19,9 +19,11 @@
> =A0#include <asm/irq.h>
> =A0#include <asm/atomic.h>
> =A0#include <asm/setup.h>
> +#include <asm/irq_controller.h>
>
> =A0#ifdef CONFIG_OF
> =A0extern void add_dtb(u64 data);
> +void add_interrupt_host(struct irq_domain *ih);
> =A0#else
> =A0static inline void add_dtb(u64 data) { }
> =A0#endif
> diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetre=
e.c
> index b86c65e..f2f159c 100644
> --- a/arch/x86/kernel/devicetree.c
> +++ b/arch/x86/kernel/devicetree.c
> @@ -3,19 +3,64 @@
> =A0*/
> =A0#include <linux/bootmem.h>
> =A0#include <linux/io.h>
> +#include <linux/interrupt.h>
> =A0#include <linux/list.h>
> =A0#include <linux/of.h>
> =A0#include <linux/of_fdt.h>
> =A0#include <linux/of_platform.h>
> =A0#include <linux/slab.h>
>
> +#include <asm/irq_controller.h>
> +
> =A0char __initdata cmd_line[COMMAND_LINE_SIZE];
> +static LIST_HEAD(irq_domains);
> +static DEFINE_RAW_SPINLOCK(big_irq_lock);
> +
> +void add_interrupt_host(struct irq_domain *ih)
> +{
> + =A0 =A0 =A0 unsigned long flags;
> +
> + =A0 =A0 =A0 raw_spin_lock_irqsave(&big_irq_lock, flags);
> + =A0 =A0 =A0 list_add(&ih->l, &irq_domains);
> + =A0 =A0 =A0 raw_spin_unlock_irqrestore(&big_irq_lock, flags);
> +}
> +
> +static struct irq_domain *get_ih_from_node(struct device_node *contr=
oller)
> +{
> + =A0 =A0 =A0 struct irq_domain *ih, *found =3D NULL;
> + =A0 =A0 =A0 unsigned long flags;
> +
> + =A0 =A0 =A0 raw_spin_lock_irqsave(&big_irq_lock, flags);
> + =A0 =A0 =A0 list_for_each_entry(ih, &irq_domains, l) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ih->controller =3D=3D =A0controller=
) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D ih;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 raw_spin_unlock_irqrestore(&big_irq_lock, flags);
> + =A0 =A0 =A0 return found;
> +}
>
> =A0unsigned int irq_create_of_mapping(struct device_node *controller,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const u32 *intspec, unsigned int intsi=
ze)
> =A0{
> - =A0 =A0 =A0 return intspec[0];
> + =A0 =A0 =A0 struct irq_domain *ih;
> + =A0 =A0 =A0 u32 virq;
> + =A0 =A0 =A0 u32 type;
> + =A0 =A0 =A0 int ret;
>
> + =A0 =A0 =A0 ih =3D get_ih_from_node(controller);
> + =A0 =A0 =A0 if (!ih)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 ret =3D ih->xlate(ih, intspec, intsize, &virq, &type);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 if (type =3D=3D IRQ_TYPE_NONE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return virq;
> + =A0 =A0 =A0 /* set the mask if it is different from current */
> + =A0 =A0 =A0 if (type =3D=3D (irq_to_desc(virq)->status & IRQF_TRIGG=
ER_MASK))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_irq_type(virq, type);
> + =A0 =A0 =A0 return virq;
> =A0}
> =A0EXPORT_SYMBOL_GPL(irq_create_of_mapping);
>
> --
> 1.7.4
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
