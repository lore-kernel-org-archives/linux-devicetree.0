From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] clk: bcm: Add driver for Northstar ILP clock
Date: Mon, 1 Aug 2016 11:33:33 -0500
Message-ID: <20160801163332.GA23920@rob-hp-laptop>
References: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
 <1469832362-13947-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469832362-13947-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 30, 2016 at 12:45:40AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This clock is present on cheaper Northstar devices like BCM53573 or
> BCM47189 using Corex-A7. This driver uses PMU (Power Management Unit)
> to calculate clock rate and allows using it in a generic (clk_*) way.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Rebase on top of clk-next
>     Use ALP as parent clock
>     Improve comments
>     Switch from ioremap_nocache to ioremap
>     Check of_clk_add_provide result for error
> ---
>  .../devicetree/bindings/clock/brcm,ns-ilp.txt      |  26 ++++
>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-ns-ilp.c                       | 147 +++++++++++++++++++++
>  3 files changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
>  create mode 100644 drivers/clk/bcm/clk-ns-ilp.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> new file mode 100644
> index 0000000..2c862a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> @@ -0,0 +1,26 @@
> +Broadcom Northstar ILP clock
> +============================
> +
> +This binding uses the common clock binding:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +This binding is used for ILP clock on Broadcom Northstar devices using
> +Corex-A7 CPU. ILP clock depends on ALP one and has to be calculated on
> +runtime.
> +
> +Required properties:
> +- compatible: "brcm,ns-ilp"
> +- reg: iomem address range of PMU (Power Management Unit)

PMU would imply to me there is more than just 1 clock the block 
controls and the compatible should reflect that if so.

> +- reg-names: "pmu", the only needed & supported reg right now
> +- clocks: has to reference an ALP clock
> +- #clock-cells: should be <0>
> +
> +Example:
> +
> +ilp: ilp {

ilp@18012000

> +	compatible = "brcm,ns-ilp";
> +	reg = <0x18012000 0x1000>;
> +	reg-names = "pmu";
> +	clocks = <&alp>;
> +	#clock-cells = <0>;
> +};
