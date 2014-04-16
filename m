From: "Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [RFC][PATCH 1/3] ARM: dts: vf610: Add Freescale FlexTimer
 Module timer node.
Date: Wed, 16 Apr 2014 04:00:59 +0000
Message-ID: <a7aeb70fae2c480198b413f581f76846@BN1PR03MB188.namprd03.prod.outlook.com>
References: <1397614787-8300-1-git-send-email-Li.Xiubo@freescale.com>
 <1397614787-8300-2-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397614787-8300-2-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Xiubo Li [mailto:Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> Sent: Wednesday, April 16, 2014 10:20 AM
> To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org; shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Lu
> Jingchang-B35083; Jin Zhengxiong-R64188; Wang Dongsheng-B40534
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xiubo Li-B47053
> Subject: [RFC][PATCH 1/3] ARM: dts: vf610: Add Freescale FlexTimer Module timer
> node.
> 
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/vf610.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
> index 107e2c0..c3a276f 100644
> --- a/arch/arm/boot/dts/vf610.dtsi
> +++ b/arch/arm/boot/dts/vf610.dtsi
> @@ -153,6 +153,19 @@
>  				clock-names = "pit";
>  			};
> 
> +			ftm0: ftm@40038000 {
> +				compatible = "fsl,vf610-ftm-timer";
> +				reg = <0x40038000 0x2000>;
> +				interrupts = <0 42 IRQ_TYPE_LEVEL_HIGH>;
> +				clock-names = "ftm0", "ftm1",
> +					"ftm0_counter_en", "ftm1_counter_en";
> +				clocks = <&clks VF610_CLK_FTM0>,
> +					<&clks VF610_CLK_FTM1>,
> +					<&clks VF610_CLK_FTM0_EXT_FIX_EN>,
> +					<&clks VF610_CLK_FTM1_EXT_FIX_EN>;
> +				status = "disabled";
> +			};
> +

They need to be separated. ftm0, ftm1.

>  			wdog@4003e000 {
>  				compatible = "fsl,vf610-wdt", "fsl,imx21-wdt";
>  				reg = <0x4003e000 0x1000>;
> --
> 1.8.4
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
