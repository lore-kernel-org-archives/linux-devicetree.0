From: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: imx7: add GPMI NAND
Date: Thu, 4 May 2017 19:13:16 +0000
Message-ID: <c66ca9c8-2a9f-8938-7a70-7f9dfe763457@nxp.com>
References: <20170422012338.4635-1-stefan@agner.ch>
 <20170422012338.4635-5-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170422012338.4635-5-stefan-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Content-ID: <4865F377CEBB87448E2D391CA8CA02FE-jdb/QiT5osKcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org" <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 04/21/2017 08:23 PM, Stefan Agner wrote:
> Add i.MX 7 GPMI NAND module.
>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>   arch/arm/boot/dts/imx7s.dtsi | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 843eb379e1ea..9645257638d4 100644
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
> +			clocks =3D <&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
> +				<&clks IMX7D_NAND_ROOT_CLK>;
> +			clock-names =3D "dma_apbh_bch", "dma_apbh_io";
> +		};
Do you need some patches to enable all clks for APBH DMA? Refer to=20
https://patchwork.ozlabs.org/patch/551967/

> +
> +		gpmi: gpmi-nand@33002000{
> +			compatible =3D "fsl,imx7d-gpmi-nand";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x33002000 0x2000>, <0x33004000 0x4000>;
> +			reg-names =3D "gpmi-nand", "bch";
> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "bch";
> +			clocks =3D <&clks IMX7D_NAND_ROOT_CLK>,
> +				<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>;
> +			clock-names =3D "gpmi_io", "gpmi_bch_apb";
> +			dmas =3D <&dma_apbh 0>;
> +			dma-names =3D "rx-tx";
> +			status =3D "disabled";
> +		};
>   	};
>   };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
