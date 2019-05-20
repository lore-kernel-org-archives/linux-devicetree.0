From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH V2 2/2] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Date: Mon, 20 May 2019 11:45:29 +0000
Message-ID: <AM0PR04MB64342D68FBE19FFE3A5BC618EE060@AM0PR04MB6434.eurprd04.prod.outlook.com>
References: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
 <1556645270-20648-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>, "sboyd@kernel.org" <sboyd@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 30.04.2019 20:35, Aisheng Dong wrote:
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> in different subsystems across CPUs and also vary a bit on the availability.
> 
> Same as SCU clock, we want to move the clock definition into device tree
> which can fully decouple the dependency of Clock ID definition from device
> tree and make us be able to write a fully generic lpcg clock driver.
> 
> And we can also use the existence of clock nodes in device tree to address
> the device and clock availability differences across different SoCs.
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
>   
>   Required properties:
> +- compatible:		Should be one of:
> +			  "fsl,imx8qxp-lpcg"
> +			  "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg".
> +- reg:			Address and length of the register set.
> +- #clock-cells:		Should be 1. One LPCG supports multiple clocks.
> +- clocks:		Input parent clocks phandle array for each clock.
> +- bit-offset:		An integer array indicating the bit offset for each clock.
> +- hw-autogate:		Boolean array indicating whether supports HW autogate for
> +			each clock.
> +- clock-output-names:	Shall be the corresponding names of the outputs.
> +			NOTE this property must be specified in the same order
> +			as the clock bit-offset and hw-autogate property.

Splitting the LPCG areas is good but describing "bit-offset" and similar 
inside devicetree seems excessively generic.

Perhaps we could have many smaller imx8qxp-lpcg-sdhc, imx8qxp-lpcg-enet 
etc where the actual clks inside each node are still defined in driver code.

>   usdhc1: mmc@5b010000 {
> @@ -44,8 +66,8 @@ usdhc1: mmc@5b010000 {
>   	interrupt-parent = <&gic>;
>   	interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
>   	reg = <0x5b010000 0x10000>;
> -	clocks = <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK>,
> -		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_PER_CLK>,
> -		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_HCLK>;
> +	clocks = <&sdhc0_lpcg 1>,
> +		 <&sdhc0_lpcg 0>,
> +		 <&sdhc0_lpcg 2>;

This is less readable, can't we keep symbolic constants?
