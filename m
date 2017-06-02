From: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [PATCH v3 0/2] ARM: dts: imx7: add NAND support
Date: Fri, 2 Jun 2017 20:09:38 +0000
Message-ID: <1dd0abe0-81a3-d4ea-69c1-98fe354f91f4@nxp.com>
References: <20170601192044.6548-1-stefan@agner.ch>
 <3c086d95-96e5-71ec-b44f-12ed41903fcf@nxp.com>
 <e57ba49dc2b91b70b5848875e28b17ae@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e57ba49dc2b91b70b5848875e28b17ae-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Content-ID: <04C6D6B187BD5F4AB360BAA5C8138663-jdb/QiT5osKcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org" <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM1dQTEkxZZdg@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06/01/2017 08:48 PM, Stefan Agner wrote:
> Hi Han,
>
> On 2017-06-01 14:14, Han Xu wrote:
>> On 06/01/2017 02:20 PM, Stefan Agner wrote:
>>> This are the missing device tree parts to add NAND support for i.MX 7.
>>> See previous patchset:
>>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flk=
ml.org%2Flkml%2F2017%2F4%2F21%2F832&data=3D01%7C01%7Chan.xu%40nxp.com%7C3b9=
081a68c94476c4a2108d4a9235512%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=
=3DmQ2aq5rW%2B9uADY5mSzFxk8P6bAVq%2BosPJQAi0PL9SQg%3D&reserved=3D0
>>>
>>> The previous version also included driver changes, which are already
>>> merged.
>>>
>>> --
>>> Stefan
>>>
>>> Changes since v2:
>>> - Only specify IMX7D_NAND_USDHC_BUS_ROOT_CLK which seems to be sufficen=
t
>> Hi Stefan, sorry I didn't reply your last patch. I was unable to fully
>> test on i.MX7 since the work bandwidth, but the quick test shows DMA
>> cannot work WITHOUT IMX7D_NAND_ROOT_CLK on my side, I will fully check
>> it tomorrow morning and let you know the result.
> How did you test that?
>
> Since DMA can only use NAND in i.MX 7, testing is somewhat hard.
>
> Fact is, I can access DMA registers using just NAND_USDHC_BUS_CLK_ROOT
>
> mw.l 0x30388980 0x11000000 # Enable NAND_USDHC_BUS_CLK_ROOT
> mw.l 0x3038aa00 0x00000000 # Enable NAND_CLK_ROOT

NAND_ROOT_CLK offset is 0x4140 which control the CCGR20 to gate on/off=20
the rawnand module, including APBH/GPMI/BCH. Without enabling it, the=20
mxs-dma hangs during initialization. I guess this bit was enabled in=20
some early stage.

> md.l 0x33000100 0 # Access APBH_CH0_CURCMDAR
>
> This works for me.
>
> I can *boot* from a UBIFS using this driver and Linux 4.12-rc1 with my
> patchset applied...
>
> Monitoring clocks in /sys/kernel/debug/clk/clk_summary show that
> NAND_ROOT_CLK gets turned off and back on if NAND access happens, the
> system seems stable.
>
> All that said, this patchset v3 actually does not remove the
> NAND_ROOT_CLK as intended to. Will send a v4.
>
> --
> Stefan
>
>>> - Dropped driver changes, alreay merged
>>>
>>> Changes since v1:
>>> - Make clks_count const
>>> - Introduce IS_IMX7D for i.MX 7 SoC's and make it part of GPMI_IS_MX6
>>>
>>> Stefan Agner (2):
>>>     ARM: dts: imx7: add GPMI NAND
>>>     ARM: dts: imx7-colibri: add NAND support
>>>
>>>    arch/arm/boot/dts/imx7-colibri.dtsi |  9 +++++++++
>>>    arch/arm/boot/dts/imx7s.dtsi        | 31 +++++++++++++++++++++++++++=
++++
>>>    2 files changed, 40 insertions(+)
>>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
