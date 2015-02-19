From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v4 3/5] irqchip: Add DT binding doc for the virtual irq demuxer chip
Date: Thu, 19 Feb 2015 02:16:50 +0100
Message-ID: <2502710.nOuZfdq5QP@vostro.rjw.lan>
References: <1422527620-8308-1-git-send-email-boris.brezillon@free-electrons.com> <20150216092814.GF7119@twins.programming.kicks-ass.net> <20150216122343.GA8994@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150216122343.GA8994@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Monday, February 16, 2015 12:23:43 PM Mark Rutland wrote:
> [...]
> 
> > > The "suspend" part is kind of a distraction to me here, because that really
> > > only is about sharing an IRQ with a timer and the "your interrupt handler
> > > may be called when the device is suspended" part is just a consequence of that.
> > > 
> > > So IMO it's better to have "TIMER" in the names to avoid encouraging people to
> > > abuse this for other purposes not related to timers.
> > 
> > Sorry to be late to the bike-shed party, but what about:
> 
> [...]
> 
> > arch/arm/mach-omap2/mux.c:		omap_hwmod_mux_handle_irq, IRQF_SHARED | IRQF_NO_SUSPEND,
> > arch/arm/mach-omap2/pm34xx.c:		_prcm_int_handle_io, IRQF_SHARED | IRQF_NO_SUSPEND, "pm_io",
> > drivers/pinctrl/pinctrl-single.c:				  IRQF_SHARED | IRQF_NO_SUSPEND,
> 
> These are chained IRQ handlers. If any of these have a chained timer irq
> then the IRQF_NO_SUSPEND may be legitimate. I can't imagine why these
> would be shared, however.
> 
> It also looks like these abuse IRQF_NO_SUSPEND for wakeup interrupts.
> 
> > drivers/rtc/rtc-pl031.c:	.irqflags = IRQF_SHARED | IRQF_NO_SUSPEND,
> 
> This looks to be an abuse and should use {enable,disable}_irq_wake.
> 
> However, we'd then need to handle mismatch with wakeup interrupts (which
> is effectively the same problem as sharing with a timer).

IRQF_NO_SUSPEND and wakeup fundamentally don't match due to the way
wakeup is implemented in the IRQ core now.

Unless drivers with IRQF_NO_SUSPEND do the wakeup behind the core's back
which is just disgusting and should never happen.


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
