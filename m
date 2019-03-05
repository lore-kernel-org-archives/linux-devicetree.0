From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] watchdog: orion_wdt: use timer1 as a pretimeout
Date: Tue, 5 Mar 2019 01:57:10 +0100
Message-ID: <20190305005710.GL26378@lunn.ch>
References: <20190227230707.GA28635@roeck-us.net>
 <20190304225152.26831-1-chris.packham@alliedtelesis.co.nz>
 <20190304225152.26831-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190304225152.26831-3-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux@roeck-us.net, gregory.clement@bootlin.com, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 05, 2019 at 11:51:52AM +1300, Chris Packham wrote:
> The orion watchdog can either reset the CPU or generate an interrupt.
> The interrupt would be useful for debugging as it provides panic()
> output about the watchdog expiry, however if the interrupt is used the
> watchdog can't reset the CPU in the event of being stuck in a loop with
> interrupts disabled or if the CPU is prevented from accessing memory
> (e.g. an unterminated DMA).
> 
> All of the orion based CPU cores (at least back as far as Kirkwood) have
> spare timers that aren't currently used by the Linux kernel. We can use
> timer1 to provide a pre-timeout ahead of the watchdog timer and provide
> the possibility of gathering debug before the reset triggers.

Hi Chris

I had a quick look at other drivers implementing pre-timeout. They
seem to call watchdog_notify_pretimeout(). I don't see that here? What
happens when timer1 fires?

> @@ -169,38 +174,46 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>  	}
>  
>  	/* Enable the fixed watchdog clock input */
> -	atomic_io_modify(dev->reg + TIMER_CTRL,
> -			 WDT_AXP_FIXED_ENABLE_BIT,
> -			 WDT_AXP_FIXED_ENABLE_BIT);
> +	val = WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
>  
>  	dev->clk_rate = clk_get_rate(dev->clk);
> +
> +

One blank line is sufficient,


>  	return 0;
>  }

   Andrew
