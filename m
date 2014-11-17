From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 04/16] clocksource: time-armada-370-xp: add suspend/resume
 support
Date: Mon, 17 Nov 2014 22:12:04 +0100
Message-ID: <546A64A4.7060705@linaro.org>
References: <1415978496-9334-1-git-send-email-thomas.petazzoni@free-electrons.com> <1415978496-9334-5-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415978496-9334-5-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/14/2014 04:21 PM, Thomas Petazzoni wrote:
> This commit adds a set of suspend/resume syscore_ops to respectively
> save and restore a number of timer registers, in order to make sure
> the clockevent and clocksource devices continue to work properly
> across a suspend/resume cycle.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


> ---
>   drivers/clocksource/time-armada-370-xp.c | 25 +++++++++++++++++++++=
++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/drivers/clocksource/time-armada-370-xp.c b/drivers/clock=
source/time-armada-370-xp.c
> index 0451e62..ff37d3a 100644
> --- a/drivers/clocksource/time-armada-370-xp.c
> +++ b/drivers/clocksource/time-armada-370-xp.c
> @@ -43,6 +43,7 @@
>   #include <linux/module.h>
>   #include <linux/sched_clock.h>
>   #include <linux/percpu.h>
> +#include <linux/syscore_ops.h>
>
>   /*
>    * Timer block registers.
> @@ -223,6 +224,28 @@ static struct notifier_block armada_370_xp_timer=
_cpu_nb =3D {
>   	.notifier_call =3D armada_370_xp_timer_cpu_notify,
>   };
>
> +static u32 timer0_ctrl_reg, timer0_local_ctrl_reg;
> +
> +static int armada_370_xp_timer_suspend(void)
> +{
> +	timer0_ctrl_reg =3D readl(timer_base + TIMER_CTRL_OFF);
> +	timer0_local_ctrl_reg =3D readl(local_base + TIMER_CTRL_OFF);
> +	return 0;
> +}
> +
> +static void armada_370_xp_timer_resume(void)
> +{
> +	writel(0xffffffff, timer_base + TIMER0_VAL_OFF);
> +	writel(0xffffffff, timer_base + TIMER0_RELOAD_OFF);
> +	writel(timer0_ctrl_reg, timer_base + TIMER_CTRL_OFF);
> +	writel(timer0_local_ctrl_reg, local_base + TIMER_CTRL_OFF);
> +}
> +
> +struct syscore_ops armada_370_xp_timer_syscore_ops =3D {
> +	.suspend	=3D armada_370_xp_timer_suspend,
> +	.resume		=3D armada_370_xp_timer_resume,
> +};
> +
>   static void __init armada_370_xp_timer_common_init(struct device_no=
de *np)
>   {
>   	u32 clr =3D 0, set =3D 0;
> @@ -285,6 +308,8 @@ static void __init armada_370_xp_timer_common_ini=
t(struct device_node *np)
>   	/* Immediately configure the timer on the boot CPU */
>   	if (!res)
>   		armada_370_xp_timer_setup(this_cpu_ptr(armada_370_xp_evt));
> +
> +	register_syscore_ops(&armada_370_xp_timer_syscore_ops);
>   }
>
>   static void __init armada_xp_timer_init(struct device_node *np)
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
