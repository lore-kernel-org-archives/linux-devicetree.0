From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Date: Mon, 19 Aug 2019 12:42:57 +0000
Message-ID: <e5214ff9ae6d431052bc871d4b7c22dc0c2c2829.camel@nxp.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Content-ID: <FAC9B6185F4BA148960D556F73713281@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel.baluta@gmail.com" <daniel.baluta@gmail.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-07-16 at 23:00 +0800, Dong Aisheng wrote:
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may
> reside
> in different subsystems across CPUs and also vary a bit on the
> availability.
> 
> Same as SCU clock, we want to move the clock definition into device
> tree
> which can fully decouple the dependency of Clock ID definition from
> device
> tree and make us be able to write a fully generic lpcg clock driver.
> 
> And we can also use the existence of clock nodes in device tree to
> address
> the device and clock availability differences across different SoCs.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v2->v3:
>  * no changes
> v1->v2:
>  * Update example
>  * Add power domain property
> ---
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     | 34
> ++++++++++++++++++----
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt 
> b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> index 965cfa4..6fc2fd8 100644
> --- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> +++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> @@ -11,6 +11,21 @@ enabled by these control bits, it might still not
> be running based
>  on the base resource.
>  
>  Required properties:
> +- compatible:		Should be one of:
> +			  "fsl,imx8qxp-lpcg"
> +			  "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-
> lpcg".
> +- reg:			Address and length of the register set.
> +- #clock-cells:		Should be 1. One LPCG supports multiple
> clocks.
> +- clocks:		Input parent clocks phandle array for each
> clock.
> +- bit-offset:		An integer array indicating the bit
> offset for each clock.
> +- hw-autogate:		Boolean array indicating whether
> supports HW autogate for
> +			each clock.
> +- clock-output-names:	Shall be the corresponding names of the
> outputs.
> +			NOTE this property must be specified in the
> same order
> +			as the clock bit-offset and hw-autogate
> property.
> +- power-domains:	Should contain the power domain used by this
> clock.
> +
> +Legacy binding (DEPRECATED):
>  - compatible:	Should be one of:
>  		  "fsl,imx8qxp-lpcg-adma",
>  		  "fsl,imx8qxp-lpcg-conn",
> @@ -33,10 +48,17 @@ Examples:
>  
>  #include <dt-bindings/clock/imx8qxp-clock.h>
>  
> -conn_lpcg: clock-controller@5b200000 {
> -	compatible = "fsl,imx8qxp-lpcg-conn";
> -	reg = <0x5b200000 0xb0000>;
> +sdhc0_lpcg: clock-controller@5b200000 {
> +	compatible = "fsl,imx8qxp-lpcg";
> +	reg = <0x5b200000 0x10000>;
>  	#clock-cells = <1>;
> +	clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
> +		 <&conn_ipg_clk>, <&conn_axi_clk>;
> +	bit-offset = <0 16 20>;
> +	clock-output-names = "sdhc0_lpcg_per_clk",
> +			     "sdhc0_lpcg_ipg_clk",
> +			     "sdhc0_lpcg_ahb_clk";
> +	power-domains = <&pd IMX_SC_R_SDHC_0>;
>  };
>  
>  usdhc1: mmc@5b010000 {
> @@ -44,8 +66,8 @@ usdhc1: mmc@5b010000 {
>  	interrupt-parent = <&gic>;
>  	interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
>  	reg = <0x5b010000 0x10000>;
> -	clocks = <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK>,
> -		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_PER_CLK>,
> -		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_HCLK>;
> +	clocks = <&sdhc0_lpcg 1>,
> +		 <&sdhc0_lpcg 0>,
> +		 <&sdhc0_lpcg 2>;

Is it possible to replace magic constants 1, 0, 2 with some meaningful
constants?

Are they the same with: IMX_SC_PM_CLK_PER, etc?

>  	clock-names = "ipg", "per", "ahb";
>  };
