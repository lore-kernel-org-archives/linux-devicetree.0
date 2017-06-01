From: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [PATCH v3 0/2] ARM: dts: imx7: add NAND support
Date: Thu, 1 Jun 2017 21:14:57 +0000
Message-ID: <3c086d95-96e5-71ec-b44f-12ed41903fcf@nxp.com>
References: <20170601192044.6548-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170601192044.6548-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Content-ID: <747476295435174AA58ABE6DCBF21B41-jdb/QiT5osKcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org" <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel@vg>
List-Id: devicetree@vger.kernel.org



On 06/01/2017 02:20 PM, Stefan Agner wrote:
> This are the missing device tree parts to add NAND support for i.MX 7.
> See previous patchset:
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkml=
.org%2Flkml%2F2017%2F4%2F21%2F832&data=3D01%7C01%7Chan.xu%40nxp.com%7C3b908=
1a68c94476c4a2108d4a9235512%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=3D=
mQ2aq5rW%2B9uADY5mSzFxk8P6bAVq%2BosPJQAi0PL9SQg%3D&reserved=3D0
>
> The previous version also included driver changes, which are already
> merged.
>
> --
> Stefan
>
> Changes since v2:
> - Only specify IMX7D_NAND_USDHC_BUS_ROOT_CLK which seems to be sufficent
Hi Stefan, sorry I didn't reply your last patch. I was unable to fully=20
test on i.MX7 since the work bandwidth, but the quick test shows DMA=20
cannot work WITHOUT IMX7D_NAND_ROOT_CLK on my side, I will fully check=20
it tomorrow morning and let you know the result.
> - Dropped driver changes, alreay merged
>
> Changes since v1:
> - Make clks_count const
> - Introduce IS_IMX7D for i.MX 7 SoC's and make it part of GPMI_IS_MX6
>
> Stefan Agner (2):
>    ARM: dts: imx7: add GPMI NAND
>    ARM: dts: imx7-colibri: add NAND support
>
>   arch/arm/boot/dts/imx7-colibri.dtsi |  9 +++++++++
>   arch/arm/boot/dts/imx7s.dtsi        | 31 ++++++++++++++++++++++++++++++=
+
>   2 files changed, 40 insertions(+)
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
