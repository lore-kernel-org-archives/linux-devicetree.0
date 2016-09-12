From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V7] clk: bcm: Add driver for BCM53573 ILP clock
Date: Mon, 12 Sep 2016 11:56:37 -0500
Message-ID: <20160912165637.GA4462@rob-hp-laptop>
References: <20160826122511.19047-1-zajec5@gmail.com>
 <20160905142935.4550-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160905142935.4550-1-zajec5@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Mark Rutland <mark.rutland@arm.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 05, 2016 at 04:29:27PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This clock is present on BCM53573 devices (including BCM47189) that use
> Cortex-A7. ILP is a part of PMU (Power Management Unit) multi-function
> device so we use syscon (and regmap) for it.
> 
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
> V6: Drop #include <linux/clk.h>
>     Use "int" as type where it matches usage
>     Add cpu_relax() in the loop
>     Add disable callback
>     Use _hw_ functions for registering struct clk_hw (new API)
> 
>     Thanks a lot Stephen!
> V7: Use syscon and regmap (thanks Rob!)
> ---
>  .../bindings/clock/brcm,bcm53573-ilp.txt           |  36 +++++
>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-bcm53573-ilp.c                 | 148 +++++++++++++++++++++
>  3 files changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
>  create mode 100644 drivers/clk/bcm/clk-bcm53573-ilp.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
> new file mode 100644
> index 0000000..4554f70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
> @@ -0,0 +1,36 @@
> +Broadcom BCM53573 ILP clock
> +===========================
> +
> +This binding uses the common clock binding:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +This binding is used for ILP clock (sometimes referred as "slow clock")
> +on Broadcom BCM53573 devices using Cortex-A7 CPU.
> +
> +ILP's rate has to be calculated on runtime and it depends on ALP clock
> +which has to be referenced.
> +
> +This clock is part of PMU (Power Management Unit), a Broadcom's device
> +handing power-related aspects. Its node must be sub-node of the PMU
> +device.
> +
> +Required properties:
> +- compatible: "brcm,bcm53573-ilp"
> +- reg: iomem address range of PMU (Power Management Unit)
> +- reg-names: "pmu", the only needed & supported reg right now

There's no reg prop in the example.

> +- clocks: has to reference an ALP clock
> +- #clock-cells: should be <0>
> +
> +Example:
> +
> +pmu@18012000 {
> +	compatible = "simple-mfd", "syscon";
> +	reg = <0x18012000 0x00001000>;
> +
> +	ilp: ilp@0 {

Drop the unit address if there is in fact no reg prop.

> +		compatible = "brcm,bcm53573-ilp";
> +		clocks = <&alp>;
> +		#clock-cells = <0>;
> +		clock-output-names = "ilp";
> +	};
> +};
