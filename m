From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] arm64: dts: imx8qxp: Add lpuart1/lpuart2/lpuart3 nodes
Date: Sun, 31 Mar 2019 11:20:47 +0000
Message-ID: <AM0PR04MB42113D53B7B178BED58B6AB180540@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190330170725.24360-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190330170725.24360-1-daniel.baluta@nxp.com>
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
To: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, Teo Hall <teo.hall@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: Daniel Baluta
> Sent: Sunday, March 31, 2019 1:08 AM
> 
> lpuart nodes are part of the ADMA subsystem. See Audio DMA memory map in
> iMX8 QXP RM [1]
> 
> This patch is based on the dtsi file initially submitted by Teo Hall in i.MX NXP
> internal tree.
> 
> [1] https://www.nxp.com/docs/en/reference-manual/IMX8DQXPRM.pdf
> 
> Signed-off-by: Teo Hall <teo.hall@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 33
> ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
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
> +
>  		adma_i2c0: i2c@5a800000 {
>  			compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
>  			reg = <0x5a800000 0x4000>;
> --
> 2.17.1
