From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8qxp: Add lpuart1/lpuart2/lpuart3 nodes
Date: Thu, 11 Apr 2019 14:49:08 +0800
Message-ID: <20190411064907.GZ26817@dragon>
References: <20190330170725.24360-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190330170725.24360-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, Teo Hall <teo.hall@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 30, 2019 at 05:07:44PM +0000, Daniel Baluta wrote:
> lpuart nodes are part of the ADMA subsystem. See Audio DMA
> memory map in iMX8 QXP RM [1]
> 
> This patch is based on the dtsi file initially submitted by
> Teo Hall in i.MX NXP internal tree.
> 
> [1] https://www.nxp.com/docs/en/reference-manual/IMX8DQXPRM.pdf
> 
> Signed-off-by: Teo Hall <teo.hall@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 0cb939861a60..1adfe15c2ea5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -193,6 +193,39 @@
>  			status = "disabled";
>  		};
>  
> +		adma_lpuart1: serial@5a070000 {
> +			compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
> +			reg = <0x5a070000 0x1000>;
> +			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&gic>;
> +			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART1_BAUD_CLK>;
> +			clock-names = "ipg";
> +			power-domains = <&pd IMX_SC_R_UART_1>;
> +			status = "disabled";
> +		};
> +
> +		adma_lpuart2: serial@5a080000 {
> +			compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
> +			reg = <0x5a080000 0x1000>;
> +			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&gic>;
> +			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART2_BAUD_CLK>;
> +			clock-names = "ipg";
> +			power-domains = <&pd IMX_SC_R_UART_2>;
> +			status = "disabled";
> +		}

Missing semicolon.

> +
> +		adma_lpuart3: serial@5a090000 {
> +			compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
> +			reg = <0x5a090000 0x1000>;
> +			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&gic>;
> +			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART3_BAUD_CLK>;
> +			clock-names = "ipg";
> +			power-domains = <&pd IMX_SC_R_UART_3>;
> +			status = "disabled";
> +		}

Ditto.

I fixed them up when applying.

Shawn

> +
>  		adma_i2c0: i2c@5a800000 {
>  			compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
>  			reg = <0x5a800000 0x4000>;
> -- 
> 2.17.1
> 
