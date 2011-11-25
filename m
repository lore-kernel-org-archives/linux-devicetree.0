From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: at91/gpio: add irqdomain to gpio interrupts
Date: Fri, 25 Nov 2011 09:36:36 -0600
Message-ID: <CAL_JsqLnNtou2gPzEJ4U3_m=RB5FZx3HLoNU5WFAGZBAWSj1tw@mail.gmail.com>
References: <167b5ccfc31d9637186c5201cd83cb62df81fc0f.1322171620.git.nicolas.ferre@atmel.com>
 <edeb4da00527914f0e1038461539843c46ab0b50.1322171620.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <edeb4da00527914f0e1038461539843c46ab0b50.1322171620.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2011 at 3:56 PM, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wr=
ote:
> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> ---
> =A0arch/arm/mach-at91/gpio.c | =A0 19 +++++++++++++++++++
> =A01 files changed, 19 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-at91/gpio.c b/arch/arm/mach-at91/gpio.c
> index 74d6783..45a39d0 100644
> --- a/arch/arm/mach-at91/gpio.c
> +++ b/arch/arm/mach-at91/gpio.c
> @@ -20,6 +20,7 @@
> =A0#include <linux/list.h>
> =A0#include <linux/module.h>
> =A0#include <linux/io.h>
> +#include <linux/irqdomain.h>
>
> =A0#include <mach/hardware.h>
> =A0#include <mach/at91_pio.h>
> @@ -32,6 +33,7 @@ struct at91_gpio_chip {
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 id; =A0 =A0 =
=A0 =A0 =A0 =A0 /* ID of register bank */
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*regbase; =A0 =A0 =A0 =
/* Base of register bank */
> =A0 =A0 =A0 =A0struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clock; =A0 =A0 =A0 =
=A0 /* associated clock */
> + =A0 =A0 =A0 struct irq_domain =A0 =A0 =A0 domain; =A0 =A0 =A0 =A0 /* as=
sociated irq domain */
> =A0};
>
> =A0#define to_at91_gpio_chip(c) container_of(c, struct at91_gpio_chip, ch=
ip)
> @@ -483,6 +485,20 @@ postcore_initcall(at91_gpio_debugfs_init);
> =A0/*--------------------------------------------------------------------=
------*/
>
> =A0/*
> + * irqdomain initialization: pile up irqdomains on top of AIC range
> + */
> +static void __init at91_gpio_irqdomain(struct at91_gpio_chip *at91_gpio)
> +{
> + =A0 =A0 =A0 struct irq_domain =A0 =A0 =A0 *gpio_irq_d =3D &at91_gpio->d=
omain;
> +
> + =A0 =A0 =A0 gpio_irq_d->irq_base =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_irq_d->hwirq_base =3D gpio_to_irq(at91=
_gpio->chip.base);

This is wrong. hwirq_base is the first irq number relative to the
irq_chip and is generally 0.

irq_base should come from the platform if you need it hardcoded.
Otherwise, it should come from irq_alloc_descs.

> + =A0 =A0 =A0 gpio_irq_d->nr_irq =3D at91_gpio->chip.ngpio;
> + =A0 =A0 =A0 gpio_irq_d->ops =3D &irq_domain_simple_ops;
> + =A0 =A0 =A0 irq_domain_add(gpio_irq_d);
> +}
> +
> +/*
> =A0* This lock class tells lockdep that GPIO irqs are in a different
> =A0* category than their parents, so it won't report false recursion.
> =A0*/
> @@ -517,6 +533,9 @@ void __init at91_gpio_irq_setup(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_irq_flags(irq, IRQF_VA=
LID);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* setup irq domain for this GPIO controlle=
r */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 at91_gpio_irqdomain(this);

I would just inline this code.

Can you use the generic irqchip here? I'm working on a patch to add
irqdomain support to that.

Rob
