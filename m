From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 2/2] clocksource/drivers/imx-tpm: add different counter
 width support
Date: Mon, 26 Mar 2018 16:10:52 +0200
Message-ID: <e6e6026c-37bb-35ff-bf1b-a00d47e0aa2e@linaro.org>
References: <1522050461-19043-1-git-send-email-Anson.Huang@nxp.com>
 <1522050461-19043-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522050461-19043-2-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, aisheng.dong@nxp.com
Cc: Linux-imx@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26/03/2018 09:47, Anson Huang wrote:
> Different TPM modules have different width counters which
> is 16-bit or 32-bit, the counter width can be read from
> TPM_PARAM register bit[23:16], this patch adds dynamic
> check for counter width to support both 16-bit and 32-bit
> TPM modules.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Are you sure you shouldn't use a prescalar with 16b and reduce its
rating? What will be the duration of the clocksource before wrapping up?

Also, can you do the change to prevent computing the mask at each
'read_count' call ?

> ---
>  drivers/clocksource/timer-imx-tpm.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
> index 7403e49..5063b77 100644
> --- a/drivers/clocksource/timer-imx-tpm.c
> +++ b/drivers/clocksource/timer-imx-tpm.c
> @@ -17,6 +17,9 @@
>  #include <linux/of_irq.h>
>  #include <linux/sched_clock.h>
>  
> +#define TPM_PARAM			0x4
> +#define TPM_PARAM_WIDTH_SHIFT		16
> +#define TPM_PARAM_WIDTH_MASK		(0xff << 16)
>  #define TPM_SC				0x10
>  #define TPM_SC_CMOD_INC_PER_CNT		(0x1 << 3)
>  #define TPM_SC_CMOD_DIV_DEFAULT		0x3
> @@ -33,6 +36,7 @@
>  #define TPM_C0SC_CHF_MASK		(0x1 << 7)
>  #define TPM_C0V				0x24
>  
> +static int counter_width;
>  static void __iomem *timer_base;
>  static struct clock_event_device clockevent_tpm;
>  
> @@ -66,7 +70,7 @@ static struct delay_timer tpm_delay_timer;
>  
>  static inline unsigned long tpm_read_counter(void)
>  {
> -	return readl(timer_base + TPM_CNT);
> +	return readl(timer_base + TPM_CNT) & GENMASK(counter_width - 1, 0);
>  }
>  
>  static unsigned long tpm_read_current_timer(void)
> @@ -85,10 +89,11 @@ static int __init tpm_clocksource_init(unsigned long rate)
>  	tpm_delay_timer.freq = rate;
>  	register_current_timer_delay(&tpm_delay_timer);
>  
> -	sched_clock_register(tpm_read_sched_clock, 32, rate);
> +	sched_clock_register(tpm_read_sched_clock, counter_width, rate);
>  
>  	return clocksource_mmio_init(timer_base + TPM_CNT, "imx-tpm",
> -				     rate, 200, 32, clocksource_mmio_readl_up);
> +				     rate, 200, counter_width,
> +				     clocksource_mmio_readl_up);
>  }
>  
>  static int tpm_set_next_event(unsigned long delta,
> @@ -153,8 +158,8 @@ static int __init tpm_clockevent_init(unsigned long rate, int irq)
>  
>  	clockevent_tpm.cpumask = cpumask_of(0);
>  	clockevent_tpm.irq = irq;
> -	clockevents_config_and_register(&clockevent_tpm,
> -					rate, 300, 0xfffffffe);
> +	clockevents_config_and_register(&clockevent_tpm, rate, 300,
> +					GENMASK(counter_width - 1, 1));
>  
>  	return ret;
>  }
> @@ -199,6 +204,8 @@ static int __init tpm_timer_init(struct device_node *np)
>  		goto err_per_clk_enable;
>  	}
>  
> +	counter_width = (readl(timer_base + TPM_PARAM) & TPM_PARAM_WIDTH_MASK)
> +		>> TPM_PARAM_WIDTH_SHIFT;
>  	/*
>  	 * Initialize tpm module to a known state
>  	 * 1) Counter disabled
> @@ -220,7 +227,7 @@ static int __init tpm_timer_init(struct device_node *np)
>  		     timer_base + TPM_SC);
>  
>  	/* set MOD register to maximum for free running mode */
> -	writel(0xffffffff, timer_base + TPM_MOD);
> +	writel(GENMASK(counter_width - 1, 0), timer_base + TPM_MOD);
>  
>  	rate = clk_get_rate(per) >> 3;
>  	ret = tpm_clocksource_init(rate);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
