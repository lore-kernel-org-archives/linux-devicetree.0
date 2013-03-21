From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 03/11] ARM: timer-sp: convert to use CLKSRC_OF init
Date: Thu, 21 Mar 2013 19:35:49 +0000
Message-ID: <20130321193549.GS4977@n2100.arm.linux.org.uk>
References: <1363820051-24428-1-git-send-email-robherring2@gmail.com>
 <1363820051-24428-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1363820051-24428-4-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: pawel.moll@arm.com, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, john.stultz@linaro.org, haojian.zhuang@linaro.org, tglx@linutronix.de, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2013 at 05:54:03PM -0500, Rob Herring wrote:
> +	clk0 = of_clk_get(np, 0);
> +	if (IS_ERR(clk0))
> +		clk0 = NULL;
> +
> +	/* Get the 2nd clock if the timer has 2 timer clocks */
> +	if (of_count_phandle_with_args(np, "clocks", "#clock-cells") == 3) {
> +		clk1 = of_clk_get(np, 1);
> +		if (IS_ERR(clk1)) {
> +			pr_err("sp804: %s clock not found: %d\n", np->name,
> +				(int)PTR_ERR(clk1));
> +			return;
> +		}
> +	} else
> +		clk1 = clk0;
> +
> +	irq = irq_of_parse_and_map(np, 0);
> +	if (irq <= 0)
> +		return;
> +
> +	of_property_read_u32(np, "arm,sp804-has-irq", &irq_num);
> +	if (irq_num == 2)
> +		tmr2_evt = true;
> +
> +	__sp804_clockevents_init(base + (tmr2_evt ? TIMER_2_BASE : 0),
> +				 irq, tmr2_evt ? clk1 : clk0, name);
> +	__sp804_clocksource_and_sched_clock_init(base + (tmr2_evt ? 0 : TIMER_2_BASE),
> +						 name, tmr2_evt ? clk0 : clk1, 1);

This just looks totally screwed to me.

A SP804 cell has two timers, and has one clock input and two clock
enable inputs.  The clock input is common to both timers.  The timers
only count on the rising edge of the clock input when the enable
input is high.  (the APB PCLK also matters too...)

Now, the clock enable inputs are controlled by the SP810 system
controller to achieve different clock rates for each.  So, we *can*
view an SP804 as having two clock inputs.

However, the two clock inputs do not depend on whether one or the
other has an IRQ or not.  Timer 1 is always clocked by TIMCLK &
TIMCLKEN1.  Timer 2 is always clocked by TIMCLK & TIMCLKEN2.

Using the logic above, the clocks depend on how the IRQs are wired
up... really?  Can you see from my description above why that is
screwed?  What bearing does the IRQ have on the wiring of the
clock inputs?

And, by doing this aren't you embedding into the DT description
something specific to the Linux implementation for this device -
namely the decision by you that the IRQs determine how the clocks
get used?

So... NAK.
