From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/5] Partitioning per-cpu interrupts
Date: Thu, 28 Apr 2016 15:48:16 +0100
Message-ID: <572222B0.8010608@arm.com>
References: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460365075-7316-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/04/16 09:57, Marc Zyngier wrote:
> We've unfortunately started seeing a situation where percpu interrupts
> are partitioned in the system: one arbitrary set of CPUs has an
> interrupt connected to a type of device, while another disjoint set of
> CPUs has the same interrupt connected to another type of device.
>     
> This makes it impossible to have a device driver requesting this
> interrupt using the current percpu-interrupt abstraction, as the same
> interrupt number is now potentially claimed by at least two drivers,
> and we forbid interrupt sharing on per-cpu interrupt.
> 
> A potential solution to this has been proposed by Will Deacon,
> expanding the handling in the core code:
> 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/388800.html
> 
> followed by a counter-proposal from Thomas Gleixner, which Will tried
> to implement, but ran into issues where the probing code was running
> in preemptible context, making the percpu-ness of interrupts difficult
> to guarantee.
>     
> Another approach to this is to turn things upside down. Let's assume
> that our system describes all the possible partitions for a given
> interrupt, and give each of them a unique identifier. It is then
> possible to create a namespace where the affinity identifier itself is
> a form of interrupt number. At this point, it becomes easy to
> implement a set of partitions as a cascaded irqchip, each affinity
> identifier being the secondary HW irq, as outlined in the following
> example:
> 
> 	Aff-0: { cpu0 cpu3 }
> 	Aff-1: { cpu1 cpu2 }
> 	Aff-2: { cpu4 cpu5 cpu6 cpu7 }
> 
> Let's assume that HW interrupt 1 is partitioned over these 3
> affinities. When HW interrupt 1 fires on a given CPU, all it takes is
> to find out which affinity this CPU belongs to, which gives us a new
> HW interrupt number. Bingo. Of course, this only works as long as you
> don't have overlapping affinities (but if you do your system is broken
> anyway).
>     
> This allows us to keep a number of nice properties:
> 
> - Each partition results in a separate percpu-interrupt (with a
>   restricted affinity), which keeps drivers happy. This alone
>   garantees that we do not have to change the programming model for
>   per-cpu interrupts.
> 
> - Because the underlying interrupt is still per-cpu, the overhead of
>   the indirection can be kept pretty minimal.
> 
> - The core code can ignore most of that crap.
>     
> For that purpose, we implement a small library that deals with some of
> the boilerplate code, relying on platform-specific drivers to provide
> a description of the affinity sets and a set of callbacks. This also
> relies on a small change in the irqdomain layer, and now offers a way
> for the affinity of a percpu interrupt to be retrieved by a driver.
> 
> As an example, the GICv3 driver has been adapted to use this new
> feature. Patches on top of v4.6-r3, tested on an arm64 FVP model.

Any comment on this? The Rockchip dudes have confirmed that this solves
their problems (big-little system with PMUs using the same PPI).

I've also posted a proof of concept patch for the ARM PMU over there:

https://lkml.org/lkml/2016/4/25/227

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
