From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 5/7] clocksource/cadence_ttc: Overhaul clocksource frequency
 adjustment
Date: Tue, 12 Nov 2013 20:01:37 +0100
Message-ID: <52827B11.5040308@linaro.org>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com> <1383945677-29674-6-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383945677-29674-6-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

On 11/08/2013 10:21 PM, Soren Brinkmann wrote:
> The currently used method adjusting the clocksource to a changing inp=
ut
> frequency does not work on kernels from 3.11 on.
> The new approach is to keep the timer frequency as constant as possib=
le.
> I.e.
>   - due to the TTC's prescaler limitations, allow frequency changes
>     only if the frequency scales by a power of 2
>   - adjust the counter's divider on the fly when a frequency change
>     occurs
>
> When suspending though, the driver should not prevent rate changes in
> order to allow the system to enter its low power state. For that
> reason a PM notifier is added so rate changes can be ignored during
> suspend/resume.

It sounds very weird you have to add a PM notifier in this driver.

Have you been facing an issue or do you assume it could happen ?

> This limits cpufreq to scale by certain factors only.
> But we may keep the time base somewhat constant, so that sleep() & co
> keep working as expected, while supporting cpufreq and suspend.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>   drivers/clocksource/cadence_ttc_timer.c | 142 +++++++++++++++++++++=
++++++-----
>   1 file changed, 122 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocks=
ource/cadence_ttc_timer.c
> index 68a336038d8f..421b942dd707 100644
> --- a/drivers/clocksource/cadence_ttc_timer.c
> +++ b/drivers/clocksource/cadence_ttc_timer.c
> @@ -16,12 +16,14 @@
>    */
>
>   #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>   #include <linux/interrupt.h>
>   #include <linux/clockchips.h>
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
>   #include <linux/slab.h>
>   #include <linux/sched_clock.h>
> +#include <linux/suspend.h>
>
>   /*
>    * This driver configures the 2 16-bit count-up timers as follows:
> @@ -52,6 +54,8 @@
>   #define TTC_CNT_CNTRL_DISABLE_MASK	0x1
>
>   #define TTC_CLK_CNTRL_CSRC_MASK		(1 << 5)	/* clock source */
> +#define TTC_CLK_CNTRL_PSV_MASK		0x1e
> +#define TTC_CLK_CNTRL_PSV_SHIFT		1
>
>   /*
>    * Setup the timers to use pre-scaling, using a fixed value for now=
 that will
> @@ -63,6 +67,8 @@
>   #define CLK_CNTRL_PRESCALE_EN	1
>   #define CNT_CNTRL_RESET		(1 << 4)
>
> +#define MAX_F_ERR 50
> +
>   /**
>    * struct ttc_timer - This definition defines local timer structure
>    *
> @@ -82,8 +88,13 @@ struct ttc_timer {
>   		container_of(x, struct ttc_timer, clk_rate_change_nb)
>
>   struct ttc_timer_clocksource {
> +	int			scale_dir;
> +	u32			scale_clk_ctrl_reg_old;
> +	u32			scale_clk_ctrl_reg_new;
> +	int			suspending;
>   	struct ttc_timer	ttc;
>   	struct clocksource	cs;
> +	struct notifier_block	suspend_nb;
>   };
>
>   #define to_ttc_timer_clksrc(x) \
> @@ -228,33 +239,120 @@ static int ttc_rate_change_clocksource_cb(stru=
ct notifier_block *nb,
>   	struct ttc_timer_clocksource *ttccs =3D container_of(ttc,
>   			struct ttc_timer_clocksource, ttc);
>
> +	if (ttccs->suspending)
> +		return NOTIFY_OK;

I don't see how it couldn't be racy. What prevents suspend to occur=20
right after this check ?

> +
>   	switch (event) {
> -	case POST_RATE_CHANGE:
> +	case PRE_RATE_CHANGE:
> +	{
> +		u32 psv;
> +		unsigned long factor, rate_low, rate_high;
> +
> +		if (ndata->new_rate =3D=3D ndata->old_rate) {
> +			ttccs->scale_dir =3D 0;
> +			return NOTIFY_OK;
> +		}
> +
> +		if (ndata->new_rate > ndata->old_rate) {
> +			factor =3D DIV_ROUND_CLOSEST(ndata->new_rate,
> +					ndata->old_rate);
> +			ttccs->scale_dir =3D 1;
> +			rate_low =3D ndata->old_rate;
> +			rate_high =3D ndata->new_rate;
> +		} else {
> +			factor =3D DIV_ROUND_CLOSEST(ndata->old_rate,
> +					ndata->new_rate);
> +			ttccs->scale_dir =3D -1;
> +			rate_low =3D ndata->new_rate;
> +			rate_high =3D ndata->old_rate;
> +		}

Hmm, it could be interesting if Viresh can give its opinion on this=20
patch [cc'ed].

> +
> +		if (!is_power_of_2(factor))
> +				return NOTIFY_BAD;
> +
> +		if (abs(rate_high - (factor * rate_low)) > MAX_F_ERR)
> +			return NOTIFY_BAD;
> +
> +		factor =3D __ilog2_u32(factor);
> +
>   		/*
> -		 * Do whatever is necessary to maintain a proper time base
> -		 *
> -		 * I cannot find a way to adjust the currently used clocksource
> -		 * to the new frequency. __clocksource_updatefreq_hz() sounds
> -		 * good, but does not work. Not sure what's that missing.
> -		 *
> -		 * This approach works, but triggers two clocksource switches.
> -		 * The first after unregister to clocksource jiffies. And
> -		 * another one after the register to the newly registered timer.
> -		 *
> -		 * Alternatively we could 'waste' another HW timer to ping pong
> -		 * between clock sources. That would also use one register and
> -		 * one unregister call, but only trigger one clocksource switch
> -		 * for the cost of another HW timer used by the OS.
> +		 * store timer clock ctrl register so we can restore it in case
> +		 * of an abort.
>   		 */
> -		clocksource_unregister(&ttccs->cs);
> -		clocksource_register_hz(&ttccs->cs,
> -				ndata->new_rate / PRESCALE);
> -		/* fall through */
> -	case PRE_RATE_CHANGE:
> +		ttccs->scale_clk_ctrl_reg_old =3D
> +			__raw_readl(ttccs->ttc.base_addr +
> +					TTC_CLK_CNTRL_OFFSET);
> +
> +		psv =3D (ttccs->scale_clk_ctrl_reg_old &
> +				TTC_CLK_CNTRL_PSV_MASK) >>
> +				TTC_CLK_CNTRL_PSV_SHIFT;
> +		if (ttccs->scale_dir < 0)
> +			psv -=3D factor;
> +		else
> +			psv +=3D factor;
> +
> +		/* prescaler within legal range? */
> +		if (psv & ~(TTC_CLK_CNTRL_PSV_MASK >> TTC_CLK_CNTRL_PSV_SHIFT))
> +			return NOTIFY_BAD;
> +
> +		ttccs->scale_clk_ctrl_reg_new =3D ttccs->scale_clk_ctrl_reg_old &
> +			~TTC_CLK_CNTRL_PSV_MASK;
> +		ttccs->scale_clk_ctrl_reg_new |=3D psv << TTC_CLK_CNTRL_PSV_SHIFT;
> +
> +
> +		/* scale down: adjust divider in post-change notification */
> +		if (ttccs->scale_dir < 0)
> +			return NOTIFY_DONE;
> +
> +		/* scale up: adjust divider now - before frequency change */
> +		__raw_writel(ttccs->scale_clk_ctrl_reg_new,
> +				ttccs->ttc.base_addr + TTC_CLK_CNTRL_OFFSET);
> +		break;
> +	}
> +	case POST_RATE_CHANGE:
> +		/* scale up: pre-change notification did the adjustment */
> +		if (ttccs->scale_dir >=3D 0)
> +			return NOTIFY_OK;
> +
> +		/* scale down: adjust divider now - after frequency change */
> +		__raw_writel(ttccs->scale_clk_ctrl_reg_new,
> +				ttccs->ttc.base_addr + TTC_CLK_CNTRL_OFFSET);
> +		break;
> +
>   	case ABORT_RATE_CHANGE:
> +		/* we have to undo the adjustment in case we scale up */
> +		if (ttccs->scale_dir <=3D 0)
> +			return NOTIFY_OK;
> +
> +		/* restore original register value */
> +		__raw_writel(ttccs->scale_clk_ctrl_reg_old,
> +				ttccs->ttc.base_addr + TTC_CLK_CNTRL_OFFSET);
> +		/* fall through */
>   	default:
>   		return NOTIFY_DONE;
>   	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int ttc_suspend_notifier_cb(struct notifier_block *nb,
> +		unsigned long event, void *data)
> +{
> +	struct ttc_timer_clocksource *ttccs =3D container_of(nb,
> +			struct ttc_timer_clocksource, suspend_nb);
> +
> +	switch (event) {
> +	case PM_SUSPEND_PREPARE:
> +		ttccs->suspending =3D 1;
> +		break;
> +	case PM_POST_SUSPEND:
> +		ttccs->suspending =3D 0;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
>   }
>
>   static void __init ttc_setup_clocksource(struct clk *clk, void __io=
mem *base)
> @@ -283,6 +381,10 @@ static void __init ttc_setup_clocksource(struct =
clk *clk, void __iomem *base)
>   				&ttccs->ttc.clk_rate_change_nb))
>   		pr_warn("Unable to register clock notifier.\n");
>
> +	ttccs->suspend_nb.notifier_call =3D ttc_suspend_notifier_cb;
> +	if (register_pm_notifier(&ttccs->suspend_nb))
> +		pr_warn("Unable to register PM notifier.\n");
> +
>   	ttccs->ttc.base_addr =3D base;
>   	ttccs->cs.name =3D "ttc_clocksource";
>   	ttccs->cs.rating =3D 200;
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
