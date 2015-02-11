From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 3/5] irqchip: Add DT binding doc for the virtual irq
 demuxer chip
Date: Wed, 11 Feb 2015 11:15:17 +0000
Message-ID: <20150211111516.GB9154@leverpostej>
References: <1422527620-8308-1-git-send-email-boris.brezillon@free-electrons.com>
 <1422527620-8308-4-git-send-email-boris.brezillon@free-electrons.com>
 <20150210153628.GF9432@leverpostej>
 <20150210165201.634bc04b@bbrezillon>
 <20150210204835.GL9432@leverpostej>
 <20150211091159.GE7119@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150211091159.GE7119@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 11, 2015 at 09:11:59AM +0000, Peter Zijlstra wrote:
> On Tue, Feb 10, 2015 at 08:48:36PM +0000, Mark Rutland wrote:
> > From f390ccbb31f06efee49b4469943c8d85d963bfb5 Mon Sep 17 00:00:00 2001
> > From: Mark Rutland <mark.rutland@arm.com>
> > Date: Tue, 10 Feb 2015 20:14:33 +0000
> > Subject: [PATCH] genirq: allow mixed IRQF_NO_SUSPEND requests
> > 
> > In some cases a physical IRQ line may be shared between devices from
> > which we expect interrupts during suspend (e.g. timers) and those we do
> > not (e.g. anything we cut the power to). Where a driver did not request
> > the interrupt with IRQF_NO_SUSPEND, it's unlikely that it can handle
> > being called during suspend, and it may bring down the system.
> > 
> > This patch adds logic to automatically mark the irqactions for these
> > potentially unsafe handlers as disabled during suspend, leaving actions
> > with IRQF_NO_SUSPEND enabled. If an interrupt is raised on a shared line
> > during suspend, only the handlers requested with IRQF_NO_SUSPEND will be
> > called. The handlers requested without IRQF_NO_SUSPEND will be skipped
> > as if they had immediately returned IRQF_NONE.
> > 
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: Jason Cooper <jason@lakedaemon.net>
> > Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> 
> Aw gawd.. not that again.

I agree this isn't pretty, but at least it doesn't require the HW
description to know about Linux internals, and it can work for !DT
systems.

I'm really not happy with placing Linux implementation details into
DTBs.

> So Rafael and tglx went over this a few months ago I think:
> 
>   lkml.kernel.org/r/26580319.OZP7jvJnA9@vostro.rjw.lan
> 
> is the last series I could find. Maybe Rafael can summarize?

I can't get at any commentary from that link, unfortunately.

Rafael?

Thanks,
Mark.
