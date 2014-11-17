From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 4/4] clocksource: mips-gic: Add device-tree support
Date: Mon, 17 Nov 2014 22:21:46 +0100
Message-ID: <546A66EA.3090107@linaro.org>
References: <1415821419-26974-1-git-send-email-abrestic@chromium.org> <1415821419-26974-5-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415821419-26974-5-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/12/2014 08:43 PM, Andrew Bresticker wrote:
> Parse the GIC timer frequency and interrupt from the device-tree.
>
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Hi Andrew,

through which tree is this patch supposed to go ?

Is there any dependency ?

> ---
> Changes from v4:
>   - don't probe from irqchip; just warn if DT is wrong
> Changes from v3:
>   - probe from GIC irqchip
> New for v3.
> ---
>   drivers/clocksource/Kconfig          |  1 +
>   drivers/clocksource/mips-gic-timer.c | 41 +++++++++++++++++++++++++=
+++++------
>   2 files changed, 35 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index cb7e7f4..89836dc 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -226,5 +226,6 @@ config CLKSRC_VERSATILE
>   config CLKSRC_MIPS_GIC
>   	bool
>   	depends on MIPS_GIC
> +	select CLKSRC_OF
>
>   endmenu
> diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksour=
ce/mips-gic-timer.c
> index a749c81..3bd31b1 100644
> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -11,6 +11,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/irqchip/mips-gic.h>
>   #include <linux/notifier.h>
> +#include <linux/of_irq.h>
>   #include <linux/percpu.h>
>   #include <linux/smp.h>
>   #include <linux/time.h>
> @@ -101,8 +102,6 @@ static int gic_clockevent_init(void)
>   	if (!cpu_has_counter || !gic_frequency)
>   		return -ENXIO;
>
> -	gic_timer_irq =3D MIPS_GIC_IRQ_BASE +
> -		GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_COMPARE);
>   	setup_percpu_irq(gic_timer_irq, &gic_compare_irqaction);
>
>   	register_cpu_notifier(&gic_cpu_nb);
> @@ -123,17 +122,45 @@ static struct clocksource gic_clocksource =3D {
>   	.flags	=3D CLOCK_SOURCE_IS_CONTINUOUS,
>   };
>
> -void __init gic_clocksource_init(unsigned int frequency)
> +static void __init __gic_clocksource_init(void)
>   {
> -	gic_frequency =3D frequency;
> -
>   	/* Set clocksource mask. */
>   	gic_clocksource.mask =3D CLOCKSOURCE_MASK(gic_get_count_width());
>
>   	/* Calculate a somewhat reasonable rating value. */
> -	gic_clocksource.rating =3D 200 + frequency / 10000000;
> +	gic_clocksource.rating =3D 200 + gic_frequency / 10000000;
>
> -	clocksource_register_hz(&gic_clocksource, frequency);
> +	clocksource_register_hz(&gic_clocksource, gic_frequency);
>
>   	gic_clockevent_init();
>   }
> +
> +void __init gic_clocksource_init(unsigned int frequency)
> +{
> +	gic_frequency =3D frequency;
> +	gic_timer_irq =3D MIPS_GIC_IRQ_BASE +
> +		GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_COMPARE);
> +
> +	__gic_clocksource_init();
> +}
> +
> +static void __init gic_clocksource_of_init(struct device_node *node)
> +{
> +	if (WARN_ON(!gic_present || !node->parent ||
> +		    !of_device_is_compatible(node->parent, "mti,gic")))
> +		return;
> +
> +	if (of_property_read_u32(node, "clock-frequency", &gic_frequency)) =
{
> +		pr_err("GIC frequency not specified.\n");
> +		return;
> +	}
> +	gic_timer_irq =3D irq_of_parse_and_map(node, 0);
> +	if (!gic_timer_irq) {
> +		pr_err("GIC timer IRQ not specified.\n");
> +		return;
> +	}
> +
> +	__gic_clocksource_init();
> +}
> +CLOCKSOURCE_OF_DECLARE(mips_gic_timer, "mti,gic-timer",
> +		       gic_clocksource_of_init);
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
