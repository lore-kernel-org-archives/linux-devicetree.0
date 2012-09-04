From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH v3 1/3] ARM: add cpufreq transiton notifier to adjust loops_per_jiffy for smp
Date: Wed, 5 Sep 2012 01:27:10 +0200
Message-ID: <201209050127.10292.rjw@sisk.pl>
References: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org> <1344577046-14847-2-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1344577046-14847-2-git-send-email-shawn.guo@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Richard Zhao <richard.zhao@linaro.org>
List-Id: devicetree@vger.kernel.org

On Friday, August 10, 2012, Shawn Guo wrote:
> From: Richard Zhao <richard.zhao@linaro.org>
> 
> If CONFIG_SMP, cpufreq skips loops_per_jiffy update, because different
> arch has different per-cpu loops_per_jiffy definition.
> 
> Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Applied to the linux-next branch of the linux-pm.git tree as v3.7 material.

Thanks,
Rafael


> ---
>  arch/arm/kernel/smp.c |   54 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 54 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
> index ebd8ad2..8e03567 100644
> --- a/arch/arm/kernel/smp.c
> +++ b/arch/arm/kernel/smp.c
> @@ -25,6 +25,7 @@
>  #include <linux/percpu.h>
>  #include <linux/clockchips.h>
>  #include <linux/completion.h>
> +#include <linux/cpufreq.h>
>  
>  #include <linux/atomic.h>
>  #include <asm/cacheflush.h>
> @@ -584,3 +585,56 @@ int setup_profiling_timer(unsigned int multiplier)
>  {
>  	return -EINVAL;
>  }
> +
> +#ifdef CONFIG_CPU_FREQ
> +
> +static DEFINE_PER_CPU(unsigned long, l_p_j_ref);
> +static DEFINE_PER_CPU(unsigned long, l_p_j_ref_freq);
> +static unsigned long global_l_p_j_ref;
> +static unsigned long global_l_p_j_ref_freq;
> +
> +static int cpufreq_callback(struct notifier_block *nb,
> +					unsigned long val, void *data)
> +{
> +	struct cpufreq_freqs *freq = data;
> +	int cpu = freq->cpu;
> +
> +	if (freq->flags & CPUFREQ_CONST_LOOPS)
> +		return NOTIFY_OK;
> +
> +	if (!per_cpu(l_p_j_ref, cpu)) {
> +		per_cpu(l_p_j_ref, cpu) =
> +			per_cpu(cpu_data, cpu).loops_per_jiffy;
> +		per_cpu(l_p_j_ref_freq, cpu) = freq->old;
> +		if (!global_l_p_j_ref) {
> +			global_l_p_j_ref = loops_per_jiffy;
> +			global_l_p_j_ref_freq = freq->old;
> +		}
> +	}
> +
> +	if ((val == CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
> +	    (val == CPUFREQ_POSTCHANGE && freq->old > freq->new) ||
> +	    (val == CPUFREQ_RESUMECHANGE || val == CPUFREQ_SUSPENDCHANGE)) {
> +		loops_per_jiffy = cpufreq_scale(global_l_p_j_ref,
> +						global_l_p_j_ref_freq,
> +						freq->new);
> +		per_cpu(cpu_data, cpu).loops_per_jiffy =
> +			cpufreq_scale(per_cpu(l_p_j_ref, cpu),
> +					per_cpu(l_p_j_ref_freq, cpu),
> +					freq->new);
> +	}
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block cpufreq_notifier = {
> +	.notifier_call  = cpufreq_callback,
> +};
> +
> +static int __init register_cpufreq_notifier(void)
> +{
> +	return cpufreq_register_notifier(&cpufreq_notifier,
> +						CPUFREQ_TRANSITION_NOTIFIER);
> +}
> +core_initcall(register_cpufreq_notifier);
> +
> +#endif
> 

