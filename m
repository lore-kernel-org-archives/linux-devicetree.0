From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clksrc: delete nomadik MTU non-DT boot path
Date: Tue, 19 Nov 2013 23:44:17 +0100
Message-ID: <528BE9C1.8000409@linaro.org>
References: <1384896499-9428-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384896499-9428-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/19/2013 10:28 PM, Linus Walleij wrote:
> Both platforms using the MTU (Nomadik and Ux500) have now been
> converted to use device tree exclusively, thus let us delete
> this platform data header and make this driver a fully
> self-contained DT-only driver.
>
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

A sidenote: there is a comment in arch/arm/mach-ux500/timer.c
"/* TODO: Once MTU has been DT:ed place code above into else. */"
but I did not see any changes related to this TODO.

> ---
> Daniel/tglx: seeking an ACK from either of you guys to take this
> in the ux500-devicetree branch where the last user is deleted.
> ---
>   drivers/clocksource/nomadik-mtu.c                  | 23 +++++------=
-----------
>   .../linux/platform_data/clocksource-nomadik-mtu.h  |  9 ---------
>   2 files changed, 5 insertions(+), 27 deletions(-)
>   delete mode 100644 include/linux/platform_data/clocksource-nomadik-=
mtu.h
>
> diff --git a/drivers/clocksource/nomadik-mtu.c b/drivers/clocksource/=
nomadik-mtu.c
> index ed7b73b508e0..f00b5c9ce8b6 100644
> --- a/drivers/clocksource/nomadik-mtu.c
> +++ b/drivers/clocksource/nomadik-mtu.c
> @@ -20,7 +20,6 @@
>   #include <linux/jiffies.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
> -#include <linux/platform_data/clocksource-nomadik-mtu.h>
>   #include <linux/sched_clock.h>
>   #include <asm/mach/time.h>
>
> @@ -103,7 +102,7 @@ static int nmdk_clkevt_next(unsigned long evt, st=
ruct clock_event_device *ev)
>   	return 0;
>   }
>
> -void nmdk_clkevt_reset(void)
> +static void nmdk_clkevt_reset(void)
>   {
>   	if (clkevt_periodic) {
>   		/* Timer: configure load and background-load, and fire it up */
> @@ -144,7 +143,7 @@ static void nmdk_clkevt_mode(enum clock_event_mod=
e mode,
>   	}
>   }
>
> -void nmdk_clksrc_reset(void)
> +static void nmdk_clksrc_reset(void)
>   {
>   	/* Disable */
>   	writel(0, mtu_base + MTU_CR(0));
> @@ -192,8 +191,8 @@ static struct irqaction nmdk_timer_irq =3D {
>   	.dev_id		=3D &nmdk_clkevt,
>   };
>
> -static void __init __nmdk_timer_init(void __iomem *base, int irq,
> -				     struct clk *pclk, struct clk *clk)
> +static void __init nmdk_timer_init(void __iomem *base, int irq,
> +				   struct clk *pclk, struct clk *clk)
>   {
>   	unsigned long rate;
>
> @@ -245,18 +244,6 @@ static void __init __nmdk_timer_init(void __iome=
m *base, int irq,
>   	register_current_timer_delay(&mtu_delay_timer);
>   }
>
> -void __init nmdk_timer_init(void __iomem *base, int irq)
> -{
> -	struct clk *clk0, *pclk0;
> -
> -	pclk0 =3D clk_get_sys("mtu0", "apb_pclk");
> -	BUG_ON(IS_ERR(pclk0));
> -	clk0 =3D clk_get_sys("mtu0", NULL);
> -	BUG_ON(IS_ERR(clk0));
> -
> -	__nmdk_timer_init(base, irq, pclk0, clk0);
> -}
> -
>   static void __init nmdk_timer_of_init(struct device_node *node)
>   {
>   	struct clk *pclk;
> @@ -280,7 +267,7 @@ static void __init nmdk_timer_of_init(struct devi=
ce_node *node)
>   	if (irq <=3D 0)
>   		panic("Can't parse IRQ");
>
> -	__nmdk_timer_init(base, irq, pclk, clk);
> +	nmdk_timer_init(base, irq, pclk, clk);
>   }
>   CLOCKSOURCE_OF_DECLARE(nomadik_mtu, "st,nomadik-mtu",
>   		       nmdk_timer_of_init);
> diff --git a/include/linux/platform_data/clocksource-nomadik-mtu.h b/=
include/linux/platform_data/clocksource-nomadik-mtu.h
> deleted file mode 100644
> index 80088973b734..000000000000
> --- a/include/linux/platform_data/clocksource-nomadik-mtu.h
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#ifndef __PLAT_MTU_H
> -#define __PLAT_MTU_H
> -
> -void nmdk_timer_init(void __iomem *base, int irq);
> -void nmdk_clkevt_reset(void);
> -void nmdk_clksrc_reset(void);
> -
> -#endif /* __PLAT_MTU_H */
> -
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
