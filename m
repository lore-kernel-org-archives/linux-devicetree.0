From: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: imx7: add GPMI NAND
Date: Thu, 4 May 2017 22:59:52 +0000
Message-ID: <8f039bb6-9bc3-349a-cfe8-727e4caf41de@nxp.com>
References: <20170422012338.4635-1-stefan@agner.ch>
 <20170422012338.4635-5-stefan@agner.ch>
 <c66ca9c8-2a9f-8938-7a70-7f9dfe763457@nxp.com>
 <48b5c543e713f9597b67a39a51ffd521@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48b5c543e713f9597b67a39a51ffd521-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Content-ID: <7FDEF8E0A9E31246B4C0971E3F6F7D6B-jdb/QiT5osKcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org" <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM1dQTEkxZZdg@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/04/2017 04:50 PM, Stefan Agner wrote:
> On 2017-05-04 12:13, Han Xu wrote:
>> On 04/21/2017 08:23 PM, Stefan Agner wrote:
>>> Add i.MX 7 GPMI NAND module.
>>>
>>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>>> ---
>>>    arch/arm/boot/dts/imx7s.dtsi | 31 +++++++++++++++++++++++++++++++
>>>    1 file changed, 31 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dts=
i
>>> index 843eb379e1ea..9645257638d4 100644
>>> --- a/arch/arm/boot/dts/imx7s.dtsi
>>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>>> @@ -995,5 +995,36 @@
>>>    				status =3D "disabled";
>>>    			};
>>>    		};
>>> +
>>> +		dma_apbh: dma-apbh@33000000 {
>>> +			compatible =3D "fsl,imx7d-dma-apbh", "fsl,imx28-dma-apbh";
>>> +			reg =3D <0x33000000 0x2000>;
>>> +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-names =3D "gpmi0", "gpmi1", "gpmi2", "gpmi3";
>>> +			#dma-cells =3D <1>;
>>> +			dma-channels =3D <4>;
>>> +			clocks =3D <&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
>>> +				<&clks IMX7D_NAND_ROOT_CLK>;
>>> +			clock-names =3D "dma_apbh_bch", "dma_apbh_io";
>>> +		};
>> Do you need some patches to enable all clks for APBH DMA? Refer to
>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
chwork.ozlabs.org%2Fpatch%2F551967%2F&data=3D01%7C01%7Chan.xu%40nxp.com%7C9=
8493f7e475341dbf67008d49337b441%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdat=
a=3DFH9k%2FC4VcVCeyidkRgUJ5Ahu4%2B%2FlDAjXVwO0DY7XMhA%3D&reserved=3D0
>>
> Oh I see, with the current code and this device tree we actually only
> enable the first clock... But it seems to work in practice...
>
> What is interesting, the chapter 5.2.5 System Clocks only describes
> APBHDMA, and no GPMI module.
>
> Chapter 9.4 about APBH-Bridge-DMA bridge only specifies "hclk" as clock
> sources.
>
> When looking at the table in chapter 5.2.5, hclk is
> NAND_USDHC_BUS_CLK_ROOT
>
> Module    Syste Module Clock   Clock Root
> APBHDMA   apbhdma.hclk         NAND_USDHC_BUS_CLK_ROOT
>  =20
> So my guess is that the actual DMA controller should work fine with
> IMX7D_NAND_USDHC_BUS_ROOT_CLK only. It is only the GPMI module which
> needs the NAND_ROOT_CLK. My guess is since the APBHDMA controller is
> only used for GPMI these days, it has been combined in one module in the
> table in chapter 5.2.5.
>
> So we could actually only specify:
>
> clocks =3D <&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>;
>
> Tested with this and NAND seems to work fine.
>
> Also tested accessing APBHDMA register in U-Boot with
> IMX7D_NAND_ROOT_CLK disabled, it worked fine.
>
> What do you think? Should we go with this?
>
> This probably even saves power since GPMI's runtime clock management
> disables IMX7D_NAND_ROOT_CLK when NAND is idle (according to the
> nand_root_clk counter in clk_summary and the root clock register at
> 0x3038AA00).

It also surprised me how it can work on your side, I remember we made=20
the code change for some purpose, please give me some time I can check=20
if the doc is wrong.

> --
> Stefan
>
>>> +
>>> +		gpmi: gpmi-nand@33002000{
>>> +			compatible =3D "fsl,imx7d-gpmi-nand";
>>> +			#address-cells =3D <1>;
>>> +			#size-cells =3D <1>;
>>> +			reg =3D <0x33002000 0x2000>, <0x33004000 0x4000>;
>>> +			reg-names =3D "gpmi-nand", "bch";
>>> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-names =3D "bch";
>>> +			clocks =3D <&clks IMX7D_NAND_ROOT_CLK>,
>>> +				<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>;
>>> +			clock-names =3D "gpmi_io", "gpmi_bch_apb";
>>> +			dmas =3D <&dma_apbh 0>;
>>> +			dma-names =3D "rx-tx";
>>> +			status =3D "disabled";
>>> +		};
>>>    	};
>>>    };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
