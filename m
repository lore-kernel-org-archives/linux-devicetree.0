From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5] clk: bcm: Add driver for BCM53573 ILP clock
Date: Tue, 23 Aug 2016 14:55:28 -0500
Message-ID: <20160823195528.GA17844@rob-hp-laptop>
References: <20160823061745.8162-1-zajec5@gmail.com>
 <20160823062613.13865-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160823062613.13865-1-zajec5@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 23, 2016 at 08:25:59AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This clock is present on BCM53573 devices (including BCM47189) that use
> Cortex-A7. ILP is a part of PMU (Power Management Unit) and so it should
> be defined as one of its subnodes (subdevices). For more details see
> Documentation entry.
> 
> Unfortunately there isn't a set of registers related to ILP clock only.
> We use registers 0x66c, 0x674 and 0x6dc and between them there are e.g.
> "retention*" and "control_ext" regs. This is why this driver maps all
> 0x1000 B of space.

Then describe the block as a syscon which has several functions of 
which clocks are one.

> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Rebase on top of clk-next
>     Use ALP as parent clock
>     Improve comments
>     Switch from ioremap_nocache to ioremap
>     Check of_clk_add_provide result for error
> V3: Drop #include <linux/moduleh>
>     Make ILP DT entry part of PMU
>     Describe ILP as subdevice of PMU in Documentation
> V4: Use BCM53573 name as suggested by Jon and Ray. It seems "Northstar"
>     (even if used in some resources) should be used in relation to
>     Cortex-A9 devices only.
> V5: Rename remaining "ns" references to "bcm53573", sorry, I sent V4 too
>     early.
> ---
>  .../bindings/clock/brcm,bcm53573-ilp.txt           |  40 ++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-bcm53573-ilp.c                 | 146 +++++++++++++++++++++
>  3 files changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
>  create mode 100644 drivers/clk/bcm/clk-bcm53573-ilp.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
> new file mode 100644
> index 0000000..5ab3107
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
> @@ -0,0 +1,40 @@
> +Broadcom BCM53573 ILP clock
> +===========================
> +
> +This binding uses the common clock binding:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +This binding is used for ILP clock (sometimes referred as "slow clock")
> +on Broadcom BCM53573 devices using Cortex-A7 CPU.
> +
> +This clock is part of PMU (Power Management Unit), a Broadcom's device
> +handing power-related aspects. Please note PMU contains more subdevices,
> +ILP is only one of them.
> +
> +ILP's rate has to be calculated on runtime and it depends on ALP clock
> +which has to be referenced.
> +
> +Required properties:
> +- compatible: "brcm,bcm53573-ilp"
> +- reg: iomem address range of PMU (Power Management Unit)
> +- reg-names: "pmu", the only needed & supported reg right now

right now? Please describe all of the h/w. You don't get to change it 
later.

Rob
