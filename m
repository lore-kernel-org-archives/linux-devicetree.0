From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 10/11] arm64: dts: mt8173-evb: Add pinctrl/GPIO node
 for mt6397.
Date: Thu, 21 May 2015 10:03:28 +0200
Message-ID: <CABuKBeJ-rW8Z7JhJtgqGw+Nt=16+LdGugTZf407w=-MD5WnL2w@mail.gmail.com>
References: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
	<1432015882-8646-11-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432015882-8646-11-git-send-email-hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream <srv_heupstream@media>
List-Id: devicetree@vger.kernel.org

2015-05-19 8:11 GMT+02:00 Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> Add pinctrl and GPIO node to mt8173-evb.dts.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts |    8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index c9bc71b..bd473c8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -14,6 +14,7 @@
>
>  /dts-v1/;
>  #include "mt8173.dtsi"
> +#include <dt-bindings/pinctrl/mt6397-pinfunc.h>
>
>  / {
>         model = "mediatek,mt8173-evb";
> @@ -43,6 +44,13 @@
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>
> +               pio6397: pinctrl@c000 {
> +                       compatible = "mediatek,mt6397-pinctrl";
> +                       pins-are-numbered;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +               };
> +
>                 rtc: rtc@e000 {
>                         compatible = "mediatek,mt6397-rtc";
>                 };
> --
> 1.7.9.5
>

Acked-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Linus, please take it through your tree.
Thanks.


-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
