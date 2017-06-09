From: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v6 2/3] ARM: dts: imx7: add GPMI NAND and APBH DMA
Date: Fri, 9 Jun 2017 19:17:03 +0000
Message-ID: <5699f899-32f8-4c8d-fb47-aa257a51863a@nxp.com>
References: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
 <d4aaef68978524bb46eee79d639dde2b83e8bb5f.1496961128.git-series.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d4aaef68978524bb46eee79d639dde2b83e8bb5f.1496961128.git-series.stefan@agner.ch>
Content-Language: en-US
Content-ID: <1012803F3DD8F74AA18FD2A64A750FC9@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>
Cc: "A.S. Dong" <aisheng.dong@nxp.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>li
List-Id: devicetree@vger.kernel.org



On 06/08/2017 05:34 PM, Stefan Agner wrote:
> Add i.MX 7 APBH DMA and GPMI NAND modules.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
Acked-by: Han Xu <han.xu@nxp.com>
> ---
>   arch/arm/boot/dts/imx7s.dtsi | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index c4f12fd..4902f62 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -995,5 +995,36 @@
>   				status =3D "disabled";
>   			};
>   		};
> +
> +		dma_apbh: dma-apbh@33000000 {
> +			compatible =3D "fsl,imx7d-dma-apbh", "fsl,imx28-dma-apbh";
> +			reg =3D <0x33000000 0x2000>;
> +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "gpmi0", "gpmi1", "gpmi2", "gpmi3";
> +			#dma-cells =3D <1>;
> +			dma-channels =3D <4>;
> +			clocks =3D <&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
> +		};
> +
> +		gpmi: gpmi-nand@33002000{
> +			compatible =3D "fsl,imx7d-gpmi-nand";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x33002000 0x2000>, <0x33004000 0x4000>;
> +			reg-names =3D "gpmi-nand", "bch";
> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "bch";
> +			clocks =3D <&clks IMX7D_NAND_RAWNAND_CLK>,
> +				<&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
> +			clock-names =3D "gpmi_io", "gpmi_bch_apb";
> +			dmas =3D <&dma_apbh 0>;
> +			dma-names =3D "rx-tx";
> +			status =3D "disabled";
> +			assigned-clocks =3D <&clks IMX7D_NAND_ROOT_SRC>;
> +			assigned-clock-parents =3D <&clks IMX7D_PLL_ENET_MAIN_500M_CLK>;
> +		};
>   	};
>   };
