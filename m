From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] watchdog: orion_wdt: use timer1 as a pretimeout
Date: Tue, 5 Mar 2019 09:27:17 -0800
Message-ID: <20190305172716.GB32623@roeck-us.net>
References: <20190227230707.GA28635@roeck-us.net>
 <20190304225152.26831-1-chris.packham@alliedtelesis.co.nz>
 <20190304225152.26831-3-chris.packham@alliedtelesis.co.nz>
 <20190305005710.GL26378@lunn.ch>
 <5605e7b7a0f540a7908a1eb5191bbe5e@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5605e7b7a0f540a7908a1eb5191bbe5e@svr-chch-ex1.atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Andrew Lunn <andrew@lunn.ch>, "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 05, 2019 at 01:26:08AM +0000, Chris Packham wrote:
> On 5/03/19 1:57 PM, Andrew Lunn wrote:
> > On Tue, Mar 05, 2019 at 11:51:52AM +1300, Chris Packham wrote:
> >> The orion watchdog can either reset the CPU or generate an interrupt.
> >> The interrupt would be useful for debugging as it provides panic()
> >> output about the watchdog expiry, however if the interrupt is used the
> >> watchdog can't reset the CPU in the event of being stuck in a loop with
> >> interrupts disabled or if the CPU is prevented from accessing memory
> >> (e.g. an unterminated DMA).
> >>
> >> All of the orion based CPU cores (at least back as far as Kirkwood) have
> >> spare timers that aren't currently used by the Linux kernel.
> 
> Actually this appears to be incorrect Kirkwood does configure timer1 as 
> a clockevent timer. So I can't just grab timer1 for all platforms.
> 
If you can't use it unconditionally, can you specify it (and use it)
as clock ?

> >> We can use
> >> timer1 to provide a pre-timeout ahead of the watchdog timer and provide
> >> the possibility of gathering debug before the reset triggers.
> > 
> > Hi Chris
> > 
> > I had a quick look at other drivers implementing pre-timeout. They
> > seem to call watchdog_notify_pretimeout(). I don't see that here? What
> > happens when timer1 fires?
> > 
> 
> It invokes the regular orion_wdt_irq(). On Armada-385 prior to this 
> change the irq was not specified because the reset always kicked in so 
> there was no point.
> 

I would suggest to update that function to actually call
watchdog_notify_pretimeout() if a pretimeout is configured configured.
After all, we do want to support the infrastructure, and that includes
support for the various pretimeout governors (if enabled).

> For correctness I could make the devicetree binding specify 2 
> interrupts. One for the regular watchdog interrupt (which would never 
> usually get hit because the reset would kick in) and one for the 
> pretimeout/timer1.
> 
Yes, if they are different interrupts and orion_wdt_irq() is only supposed
to handle the real timeout.

Thanks,
Guenter

> >> @@ -169,38 +174,46 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
> >>   	}
> >>   
> >>   	/* Enable the fixed watchdog clock input */
> >> -	atomic_io_modify(dev->reg + TIMER_CTRL,
> >> -			 WDT_AXP_FIXED_ENABLE_BIT,
> >> -			 WDT_AXP_FIXED_ENABLE_BIT);
> >> +	val = WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
> >> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
> >>   
> >>   	dev->clk_rate = clk_get_rate(dev->clk);
> >> +
> >> +
> > 
> > One blank line is sufficient,
> > 
> > 
> >>   	return 0;
> >>   }
> > 
> >     Andrew
> > 
> 
