From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v4 5/5] clk: mvebu: new driver for Armada CP110 system
 controller
Date: Wed, 13 Apr 2016 17:30:04 +0200
Message-ID: <20160413173004.026e587e@free-electrons.com>
References: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1459070777-18049-6-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160402012541.GB18567@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160402012541.GB18567@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, 1 Apr 2016 18:25:41 -0700, Stephen Boyd wrote:

> > +#include <linux/kernel.h>
> > +#include <linux/clk.h>
> 
> What's this for?
> 
> > +#include <linux/clk-provider.h>
> > +#include <linux/io.h>
> 
> What's this for?

Both removed.

> > +static int cp110_gate_enable(struct clk_hw *hw)
> > +{
> > +	struct cp110_gate_clk *gate =
> > +		container_of(hw, struct cp110_gate_clk, hw);
> 
> Consider a macro to make this fit on one line.

Done!

> > +	init.name = name;
> > +	init.ops = &cp110_gate_ops;
> > +	init.flags = CLK_IS_BASIC;
> 
> No basic please.

Fixed!


> > +static void __init cp110_syscon_clk_init(struct device_node *np)
> 
> Any reason this can't be a platform driver?

Changed to be a platform driver.

> > +{
> > +	struct regmap *regmap;
> > +	const char *name, *apll_name, *core_name, *eip_name, *nand_name;
> > +	u32 nand_clk_ctrl;
> > +	int clkidx = 0, i;
> > +
> > +	regmap = syscon_node_to_regmap(np);
> 
> Isn't this the only driver for the node? Why not just make the
> regmap ourselves in the driver here?

It is for now. However, I expect that we will probably have sub-nodes
for various other devices whose registers belong to this system
controller. More specifically, there are some pin-muxing registers in
there. Using the syscon facility entirely automates the creation of the
regmap, and makes it easily accessible to other devices who might want
to poke into some of the system controller registers.

> > +	/*
> > +	 * Register core clocks
> > +	 */
> 
> Ok. Not really useful comment.

Removed!


> > +        /* NAND can be either APLL/2.5 or core clock */
> > +	of_property_read_string_index(np, "core-clock-output-names",
> > +				      4, &nand_name);
> > +        if (nand_clk_ctrl & NF_CLOCK_SEL_400_MASK)
> > +                cp110_clks[4] =
> 
> Weird indentation here. Please use tabs throughout.

Yeah, seems like I copy/pasted or something. Fixed to use tabs.

> > +	of_clk_add_provider(np, cp110_of_clk_get, &cp110_clk_data);
> 
> What if this fails?

Error checking added everywhere. There are numerous other clk drivers
that don't do error checking, so I did the same, especially since a
failure to register a clock is most likely going to be fatal to the
system booting. No clock -> no UART, no UART -> the system doesn't boot
up to userspace.

But fair enough, I've added error checking in the ->probe() function
(of both the AP806 and CP110 clk drivers).

Thanks again for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
