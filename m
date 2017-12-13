From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v6 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Wed, 13 Dec 2017 16:22:39 +0200
Message-ID: <1513174959.2879.32.camel@nxp.com>
References: <20171206072402.11694-1-o.rempel@pengutronix.de>
         <20171206072402.11694-4-o.rempel@pengutronix.de>
         <20171206231130.GA6235@infradead.org>
         <b39d3ae2-5a93-854f-a0ff-aefd405da78b@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <b39d3ae2-5a93-854f-a0ff-aefd405da78b@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, Christoph Hellwig <hch@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-12-07 at 06:36 +0100, Oleksij Rempel wrote:
> 
> On 07.12.2017 00:11, Christoph Hellwig wrote:
> > 
> > > 
> > >  void (*pm_power_off_prepare)(void);
> > > +EXPORT_SYMBOL(pm_power_off_prepare);
> > EXPORT_SYMBOL_GPL for something this deeply internal, please.
> Ok,
> probably all other symbols should be converted in this file in to
> EXPORT_SYMBOL_GPL as well?
> 
> grep EXPORT_SYMBOL kernel/reboot.c
> EXPORT_SYMBOL(cad_pid);
> EXPORT_SYMBOL(pm_power_off_prepare);
> EXPORT_SYMBOL_GPL(emergency_restart);
> EXPORT_SYMBOL(register_reboot_notifier);
> EXPORT_SYMBOL(unregister_reboot_notifier);
> EXPORT_SYMBOL(devm_register_reboot_notifier);
> EXPORT_SYMBOL(register_restart_handler);
> EXPORT_SYMBOL(unregister_restart_handler);
> EXPORT_SYMBOL_GPL(kernel_restart);
> EXPORT_SYMBOL_GPL(kernel_halt);
> EXPORT_SYMBOL_GPL(kernel_power_off);
> EXPORT_SYMBOL_GPL(orderly_poweroff);
> EXPORT_SYMBOL_GPL(orderly_reboot);

This call looks much more deeply internal than those other functions,
it's not like reboot_notifier and restart_handler.

It seems that the only user of pm_power_off_prepare right now is the
ACPI core and your patch uses it in a regulator driver. This looks
extremely strange. Maybe this is why imx maintainers are stalling on
this patch?

It might help if the ACPI/PM maintainers ack/review this part
explicitly, and the usage in part 5:

https://patchwork.kernel.org/patch/9799615/

--
Regards,
Leonard
