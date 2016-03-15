From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: dts: imx: add Boundary Devices Nitrogen6_SoloX board
Date: Tue, 15 Mar 2016 11:58:18 +0100
Message-ID: <CAAMH-yv28x=XxFVNyrqmP8YuRmd2R6RRhrNL+TSPykjkED5czw@mail.gmail.com>
References: <1458037826-19375-1-git-send-email-gary.bisson@boundarydevices.com>
	<1458037826-19375-7-git-send-email-gary.bisson@boundarydevices.com>
	<56E7E98F.5030902@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E7E98F.5030902-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Troy Kisky <troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Vladimir, All,

On Tue, Mar 15, 2016 at 11:53 AM, Vladimir Zapolskiy
<vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
> On 15.03.2016 12:30, Gary Bisson wrote:
>> Based on i.MX6 SoloX with 1GB of RAM.
>>
>> https://boundarydevices.com/product/nit6_solox-imx6/
>>
>> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/Makefile               |   1 +
>>  arch/arm/boot/dts/imx6sx-nitrogen6sx.dts | 745 +++++++++++++++++++++++++++++++
>>  2 files changed, 746 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 279ec61..6a2bbc4 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -363,6 +363,7 @@ dtb-$(CONFIG_SOC_IMX6SL) += \
>>       imx6sl-evk.dtb \
>>       imx6sl-warp.dtb
>>  dtb-$(CONFIG_SOC_IMX6SX) += \
>> +     imx6sx-nitrogen6sx.dtb \
>>       imx6sx-sabreauto.dtb \
>>       imx6sx-sdb-reva.dtb \
>>       imx6sx-sdb.dtb
>> diff --git a/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
>> new file mode 100644
>> index 0000000..8440890
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
>> @@ -0,0 +1,745 @@
>
> [snip]
>
>> +
>> +//&clks {
>> +//   assigned-clocks = <&clks IMX6SX_PLL4_BYPASS_SRC>,
>> +//                     <&clks IMX6SX_PLL4_BYPASS>,
>> +//                     <&clks IMX6SX_CLK_CKO>,
>> +//                     <&clks IMX6SX_CLK_CKO1_SEL>,
>> +//                     <&clks IMX6SX_CLK_PLL4_POST_DIV>;
>> +//   assigned-clock-parents = <&clks IMX6SX_CLK_LVDS2_IN>,
>> +//                            <&clks IMX6SX_PLL4_BYPASS_SRC>,
>> +//                            <&clks IMX6SX_CLK_CKO1>,
>> +//                            <&clks IMX6SX_CLK_CKIL>;
>> +//   assigned-clock-rates = <0>, <0>, <0>, <0>, <24576000>;
>> +//};
>
> What does // do above?

Oops, sorry it is some left over of my debugging.

I also realized my 6qp device tree is missing the disabled pcie. I'll
submit a v2 shortly.

Regards,
Gary
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
