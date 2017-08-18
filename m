From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 6/6] perf: ARM DynamIQ Shared Unit PMU support
Date: Fri, 18 Aug 2017 11:49:32 +0100
Message-ID: <20170818104932.GC31326@leverpostej>
References: <1502192246-5623-1-git-send-email-suzuki.poulose@arm.com>
 <1502192246-5623-7-git-send-email-suzuki.poulose@arm.com>
 <20170816141056.GB11934@leverpostej>
 <bb4b8a9c-1a4a-4ead-255b-9f0e43dcf73b@arm.com>
 <20170817155742.GA21203@leverpostej>
 <e73da217-a3fb-4e49-3bb2-c2d2215f7aa8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e73da217-a3fb-4e49-3bb2-c2d2215f7aa8-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suzuki K Poulose <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 11:43:32AM +0100, Suzuki K Poulose wrote:
> On 17/08/17 16:57, Mark Rutland wrote:
> >On Thu, Aug 17, 2017 at 03:52:24PM +0100, Suzuki K Poulose wrote:
> >>On 16/08/17 15:10, Mark Rutland wrote:
> >>>On Tue, Aug 08, 2017 at 12:37:26PM +0100, Suzuki K Poulose wrote:

> >>>>+static struct attribute *dsu_pmu_cpumask_attrs[] = {
> >>>>+	DSU_CPUMASK_ATTR(cpumask, DSU_ACTIVE_CPU_MASK),
> >>>>+	DSU_CPUMASK_ATTR(supported_cpus, DSU_SUPPORTED_CPU_MASK),
> >>>>+	NULL,
> >>>>+};
> >>>
> >>>Normally we only expose one mask.
> >>>
> >>>Why do we need the supported cpu mask? What is the intended use-case?
> >>
> >>Thats just to let the user know the CPUs bound to this PMU instance.
> >
> >I guess that can be useful, though the cpumasks we expose today are
> >confusing as-is, and this is another point of confusion.
> >
> >We could drop this for now, and add it when requested, or we should try
> >to make the naming clearer somehow -- "supported" can be read in a
> >number of ways.
> 
> How about dsu_cpus or connected_cpus ?

I think "connected_cpus" or "associated_cpus" might be ok.

Thinking a little further, this is something other PMUs might want to
expose (and perhaps some x86 PMUs already do?), so it would be good to
align naming-wise. 

[...]

> >>>>+	/*
> >>>>+	 * Find one CPU in the DSU to handle the IRQs.
> >>>>+	 * It is highly unlikely that we would fail
> >>>>+	 * to find one, given the probing has succeeded.
> >>>>+	 */
> >>>>+	cpu = dsu_pmu_get_online_cpu(dsu_pmu);
> >>>>+	if (cpu >= nr_cpu_ids)
> >>>>+		return -ENODEV;
> >>>>+	cpumask_set_cpu(cpu, &dsu_pmu->active_cpu);
> >>>>+	rc = irq_set_affinity_hint(irq, &dsu_pmu->active_cpu);
> >>>
> >>>Is setting the affinity hint strong enough?
> >>>
> >>>Can the affinity be changed behind the back of this driver?
> >>
> >>Did you mean to use "force"d affinity settings ? If so, modules
> >>don't have the luxury of doing that.
> >
> >Perhaps. We absolutely need to ensure that the driver makes the IRQ
> >affine to the active CPU, and no other SW will change the affinitiy of
> >the IRQ.
> >
> >Otherwise, the IRQ handler is dangerous, violating locking requirements,
> >potentially corrupting memory, etc.
> >
> >>Hence this one. I think that also brings up the problem where we could
> >>be reading the counters from a different CPU than we requested. So, I
> >>think it would be good to keep the CPU check, wherever we could access
> >>the PMU.
> >
> >While I'm happy to have that as a paranoid sanity check, we cannot rely
> >upon that for correctness. We must ensure that we amange the interupt
> >affinity correctly.
> >
> >If that means we need the forced affinity helpers, we must ensure that
> >we have access to those.
> 
> As per our offline discussion, I will go ahead with set_affinity_hint and
> IRQ_NO_BALANCING flag, so that the IRQ affinity is not disturbed by the
> userspace.

Sounds good.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
