From: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [PATCH v5 2/3] ARM: dts: imx7: add GPMI NAND and APBH DMA
Date: Wed, 7 Jun 2017 15:33:26 +0000
Message-ID: <9d66efda-d7c1-89a2-e163-c86056e08fb1@nxp.com>
References: <cover.b62c3a17bd60de48d8fb2ade6dde4f2bc60aaf3c.1496730576.git-series.stefan@agner.ch>
 <151ddece1e1427d0b69c4ff11b86a69b6a035d0d.1496730576.git-series.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <151ddece1e1427d0b69c4ff11b86a69b6a035d0d.1496730576.git-series.stefan-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Content-ID: <F00862B47729364989D44108CF5F95EC-jdb/QiT5osKcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org" <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>li
List-Id: devicetree@vger.kernel.org



On 06/06/2017 01:30 AM, Stefan Agner wrote:
> Add i.MX 7 APBH DMA and GPMI NAND modules.
>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>   arch/arm/boot/dts/imx7s.dtsi | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index c4f12fd..d71acd8 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -995,5 +995,37 @@
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
> +			clock-names =3D "dma_apbh_bch", "dma_apbh_io";

please remove the clock names, I am good with all other changes.

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
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
