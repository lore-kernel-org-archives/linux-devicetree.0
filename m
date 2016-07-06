From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] drivers/perf: arm-pmu: Handle per-interrupt affinity mask
Date: Wed, 6 Jul 2016 11:39:52 +0100
Message-ID: <20160706103951.GC17925@arm.com>
References: <1467379291-18413-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467379291-18413-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 01, 2016 at 02:21:31PM +0100, Marc Zyngier wrote:
> On a big-little system, PMUs can be wired to CPUs using per CPU
> interrups (PPI). In this case, it is important to make sure that
> the enable/disable do happen on the right set of CPUs.
> 
> So instead of relying on the interrupt-affinity property, we can
> use the actual percpu affinity that DT exposes as part of the
> interrupt specifier. The DT binding is also updated to reflect
> the fact that the interrupt-affinity property shouldn't be used
> in that case.

[...]

> -	/* If we didn't manage to parse anything, claim to support all CPUs */
> -	if (cpumask_weight(&pmu->supported_cpus) == 0)
> -		cpumask_setall(&pmu->supported_cpus);
> +	/* If we didn't manage to parse anything, try the interrupt affinity */
> +	if (cpumask_weight(&pmu->supported_cpus) == 0) {
> +		if (!using_spi) {
> +			/* If using PPIs, check the affinity of the partition */
> +			int irq = platform_get_irq(pdev, 0);
> +			irq_get_percpu_devid_partition(irq,
> +						       &pmu->supported_cpus);

Should we not at least propagate the failure if this returns -EINVAL?

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
