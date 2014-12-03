From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 04/12] irqchip: nvic: support routable irq domain ops
Date: Wed, 3 Dec 2014 10:39:00 +0100
Message-ID: <20141203093900.GL2129@pengutronix.de>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
 <1417565531-4507-5-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417565531-4507-5-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Stefan,

On Wed, Dec 03, 2014 at 01:12:03AM +0100, Stefan Agner wrote:
> Add support for routable irq domain ops like the GIC interrupt
> controller provides. This is useful for asymmetrical multi-
> processor SoCs, such as Freescale Vybrid (VF6xx) which have
> a Cortex-M4 alongside a Cortex-A5 and a interrupt router to
> route the peripheral interrupts between them.
>=20
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  drivers/irqchip/irq-nvic.c       | 70 ++++++++++++++++++++++++++++++=
+++++++++-
>  include/linux/irqchip/arm-nvic.h | 25 ++++++++++++++
>  2 files changed, 94 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/irqchip/arm-nvic.h
>=20
> diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
> index 4ff0805..dbfb5be 100644
> --- a/drivers/irqchip/irq-nvic.c
> +++ b/drivers/irqchip/irq-nvic.c
> @@ -40,6 +40,7 @@
>  #define NVIC_MAX_IRQ		((NVIC_MAX_BANKS - 1) * 32 + 16)
> =20
>  static struct irq_domain *nvic_irq_domain;
> +const struct irq_domain_ops *nvic_routable_irq_domain_ops;
Can you reshuffle the order of functions to make this forward
declaration unnecessary?
 =20
>  asmlinkage void __exception_irq_entry
>  nvic_handle_irq(irq_hw_number_t hwirq, struct pt_regs *regs)
> @@ -49,6 +50,73 @@ nvic_handle_irq(irq_hw_number_t hwirq, struct pt_r=
egs *regs)
>  	handle_IRQ(irq, regs);
>  }
> =20
> +static int nvic_irq_domain_map(struct irq_domain *d, unsigned int ir=
q,
> +				irq_hw_number_t hw)
> +{
> +	int ret;
> +
> +	ret =3D irq_map_generic_chip(d, irq, hw);
> +
> +	if (IS_ERR_VALUE(ret))
if (ret < 0)

> +		return ret;
> +
> +	return nvic_routable_irq_domain_ops->map(d, irq, hw);
You could save the default implementations if you do:

	if (nvic_routable_irq_domain_ops)
		return nvic_routable_irq_domain_ops->map(d, irq, hw);

(maybe also check for map?)

> +}
> +
> +static void nvic_irq_domain_unmap(struct irq_domain *d, unsigned int=
 irq)
> +{
> +	nvic_routable_irq_domain_ops->unmap(d, irq);
> +}
> +
> +static int nvic_irq_domain_xlate(struct irq_domain *d,
> +				 struct device_node *controller,
> +				 const u32 *intspec, unsigned int intsize,
> +				 unsigned long *out_hwirq,
> +				 unsigned int *out_type)
> +{
> +	*out_hwirq =3D intspec[0];
> +	*out_type =3D IRQ_TYPE_NONE;
If you demand from the callback to set this, you can just do

	nvic_irq_domain_ops.xlate =3D new_callback;

not sure this is sensible though. Up to you.

> +	return nvic_routable_irq_domain_ops->xlate(d, controller, intspec,
> +						  intsize, out_hwirq, out_type);
> +}
> +
> +struct irq_domain_ops nvic_irq_domain_ops =3D {
> +	.map	=3D nvic_irq_domain_map,
> +	.unmap	=3D nvic_irq_domain_unmap,
> +	.xlate	=3D nvic_irq_domain_xlate,
> +};
> +
> +/* Default functions for routable irq domain */
> +static int nvic_routable_irq_domain_map(struct irq_domain *d, unsign=
ed int irq,
> +			      irq_hw_number_t hw)
> +{
> +	return 0;
> +}
> +
> +static void nvic_routable_irq_domain_unmap(struct irq_domain *d,
> +					  unsigned int irq)
> +{
> +}
> +
> +static int nvic_routable_irq_domain_xlate(struct irq_domain *d,
> +				struct device_node *controller,
> +				const u32 *intspec, unsigned int intsize,
> +				unsigned long *out_hwirq,
> +				unsigned int *out_type)
> +{
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops nvic_default_routable_irq_domain_=
ops =3D {
> +	.map =3D nvic_routable_irq_domain_map,
> +	.unmap =3D nvic_routable_irq_domain_unmap,
> +	.xlate =3D nvic_routable_irq_domain_xlate,
> +};
> +
> +const struct irq_domain_ops *nvic_routable_irq_domain_ops =3D
> +					&nvic_default_routable_irq_domain_ops;
> +
>  static int __init nvic_of_init(struct device_node *node,
>  			       struct device_node *parent)
>  {
> @@ -70,7 +138,7 @@ static int __init nvic_of_init(struct device_node =
*node,
>  		irqs =3D NVIC_MAX_IRQ;
> =20
>  	nvic_irq_domain =3D
> -		irq_domain_add_linear(node, irqs, &irq_generic_chip_ops, NULL);
> +		irq_domain_add_linear(node, irqs, &nvic_irq_domain_ops, NULL);
>  	if (!nvic_irq_domain) {
>  		pr_warn("Failed to allocate irq domain\n");
>  		return -ENOMEM;
> diff --git a/include/linux/irqchip/arm-nvic.h b/include/linux/irqchip=
/arm-nvic.h
> new file mode 100644
> index 0000000..0e92a14
> --- /dev/null
> +++ b/include/linux/irqchip/arm-nvic.h
> @@ -0,0 +1,25 @@
> +/*
> + *  include/linux/irqchip/arm-nvic.h
Don't add the filename to a comment. There are more reliable means to
find it out than looking for that comment.

> + *
> + *  Copyright (C) 2014 Stefan Agner
Is this indented differently to the paragraph below on purpose?

> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#ifndef __LINUX_IRQCHIP_ARM_NVIC_H
> +#define __LINUX_IRQCHIP_ARM_NVIC_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#ifdef CONFIG_ARM_NVIC
> +extern const struct irq_domain_ops *nvic_routable_irq_domain_ops;
> +static inline void __init register_routable_domain_ops
> +					(const struct irq_domain_ops *ops)
> +{
> +		nvic_routable_irq_domain_ops =3D ops;
> +}
> +#endif /* CONFIG_ARM_NVIC */
> +
> +#endif /* __ASSEMBLY__ */
> +#endif /* __LINUX_IRQCHIP_ARM_NVIC_H */

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
