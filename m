From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC v2 6/9] arm/dt: add devicetree support to sp804 timer support
Date: Mon, 12 Dec 2011 17:54:46 -0600
Message-ID: <4EE69446.2060009@gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca> <1323727329-4989-6-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323727329-4989-6-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Mike Turquette <mturquette@ti.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Grant,

On 12/12/2011 04:02 PM, Grant Likely wrote:
> This patch adds support to the sp804 code for retrieving timer
> configuration from the device tree.  sp804 channels can be used as
> a clock event device or a clock source.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> Cc: Russell King <linux@arm.linux.org.uk>
> ---

[snip]

> +
> +	/*
> +	 * Figure out how to use this clock
> +	 *
> +	 * Note: This is kind of ugly since it requires linux-specific
> +	 * properties in the device tree so that Linux knows which sp804
> +	 * channels can be used as the clock source and the clock events
> +	 * trigger.  Something OS agnostic would be nicer, but it isn't
> +	 * obvious what that should look like.
> +	 */
> +	if (of_get_property(node, "linux,clock-source", NULL)) {
> +		__sp804_clocksource_init(base, node->full_name, clk);
> +	} else if (of_get_property(node, "linux,clockevents-device", NULL)) {
> +		irq = irq_of_parse_and_map(node, 0);
> +		__sp804_clockevents_init(base, irq, node->full_name, clk);

At least in the case of highbank, there is no interrupt connected for
2nd timer in the h/w. So we could use that fact and presence of a clock
for each timer to determine which to use. Some of the ARM boards have 2
sp804's (4 timers) though and you could use any combination I think.
Does it really matter which one is selected as long as it meets the
needs of the OS? Yes, we could think of possible scenarios that don't
work, but it's not likely to see a slew of new platforms with sp804's as
new ARM core integrate the timers in. Although, bcmring is a bit strange
setting up 2 clksrc's, but that doesn't really present a problem.

The fact that you split the timer to 2 nodes is a bit of Linux's needs
defining the binding. The h/w block is a block with 2 timers. It's not
really split. The block does have a single set of primecell ID registers
at 0xfe0 for example.

Rob
