From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv2 1/3] drivers/perf: arm_pmu: Add platform hardware setup
 hooks.
Date: Tue, 6 Feb 2018 14:53:16 +0000
Message-ID: <7920f8f4-8f25-4633-7a17-bdda5351a9e9@arm.com>
References: <20180206142629.534-1-sebastian.reichel@collabora.co.uk>
 <20180206142629.534-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180206142629.534-2-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On 06/02/18 14:26, Sebastian Reichel wrote:
> Allow platform specific code to be called when enabling or
> disabling the hardware.

Since arm_pmu_platdata wants to go away[1], does i.MX53 actually need 
all this machinery, or would it suffice to set DBG_EN from platform code 
at boot time and simply leave it that way?

Robin.

[1] 
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-February/557838.html

> Signed-off-by: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> [rebased to v4.12]
> Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
> [Simplify and cleanup for upstreaming]
> Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
>   drivers/perf/arm_pmu.c       | 12 ++++++++++++
>   include/linux/perf/arm_pmu.h |  5 +++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 7bc5eee96b31..9c282914ee67 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -452,8 +452,10 @@ static int armpmu_event_init(struct perf_event *event)
>   static void armpmu_enable(struct pmu *pmu)
>   {
>   	struct arm_pmu *armpmu = to_arm_pmu(pmu);
> +	struct arm_pmu_platdata *platdata = armpmu_get_platdata(armpmu);
>   	struct pmu_hw_events *hw_events = this_cpu_ptr(armpmu->hw_events);
>   	int enabled = bitmap_weight(hw_events->used_mask, armpmu->num_events);
> +	int err;
>   
>   	/* For task-bound events we may be called on other CPUs */
>   	if (!cpumask_test_cpu(smp_processor_id(), &armpmu->supported_cpus))
> @@ -461,17 +463,27 @@ static void armpmu_enable(struct pmu *pmu)
>   
>   	if (enabled)
>   		armpmu->start(armpmu);
> +
> +	if (platdata && platdata->reserve_hardware) {
> +		err = platdata->reserve_hardware(armpmu);
> +		if (err)
> +			dev_warn(&armpmu->plat_device->dev, "Could not reserve PMU hardware!\n");
> +	}
>   }
>   
>   static void armpmu_disable(struct pmu *pmu)
>   {
>   	struct arm_pmu *armpmu = to_arm_pmu(pmu);
> +	struct arm_pmu_platdata *platdata = armpmu_get_platdata(armpmu);
>   
>   	/* For task-bound events we may be called on other CPUs */
>   	if (!cpumask_test_cpu(smp_processor_id(), &armpmu->supported_cpus))
>   		return;
>   
>   	armpmu->stop(armpmu);
> +
> +	if (platdata && platdata->release_hardware)
> +		platdata->release_hardware(armpmu);
>   }
>   
>   /*
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index af0f44effd44..942ae9bfe971 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -17,6 +17,8 @@
>   #include <linux/sysfs.h>
>   #include <asm/cputype.h>
>   
> +struct arm_pmu;
> +
>   /*
>    * struct arm_pmu_platdata - ARM PMU platform data
>    *
> @@ -31,6 +33,8 @@
>   struct arm_pmu_platdata {
>   	irqreturn_t (*handle_irq)(int irq, void *dev,
>   				  irq_handler_t pmu_handler);
> +	int (*reserve_hardware)(struct arm_pmu *arm_pmu);
> +	void (*release_hardware)(struct arm_pmu *arm_pmu);
>   	unsigned long irq_flags;
>   };
>   
> @@ -112,6 +116,7 @@ struct arm_pmu {
>   	int		(*map_event)(struct perf_event *event);
>   	int		num_events;
>   	u64		max_period;
> +	bool		reserved_hardware;
>   	bool		secure_access; /* 32-bit ARM only */
>   #define ARMV8_PMUV3_MAX_COMMON_EVENTS 0x40
>   	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
