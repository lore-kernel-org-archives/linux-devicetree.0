From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] dts: mediatek: Enable clock support for Mediatek MT8135.
Date: Wed, 7 Jan 2015 17:25:41 +0100
Message-ID: <CABuKBeL34hV63t+zDy3Nbz_V4qAvCF87+=hV=eUUCTrKybBFjA@mail.gmail.com>
References: <1420601123-25859-1-git-send-email-jamesjj.liao@mediatek.com>
	<1420601123-25859-5-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420601123-25859-5-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-01-07 4:25 GMT+01:00 James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> This patch adds MT8135 clock controllers into device tree.
>
> Change-Id: I9c5bab9289bbd6eb444aad97d015b8f26ca88a8a
> Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt8135.dtsi | 47 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
> index ec83e69..09fcf0d 100644
> --- a/arch/arm/boot/dts/mt8135.dtsi
> +++ b/arch/arm/boot/dts/mt8135.dtsi
> @@ -12,6 +12,7 @@
>   * GNU General Public License for more details.
>   */
>
> +#include <dt-bindings/clock/mt8135-clk.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include "skeleton64.dtsi"
> @@ -92,6 +93,24 @@
>                         clock-frequency = <26000000>;
>                         #clock-cells = <0>;
>                 };
> +
> +               clk_null: clk_null {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <0>;
> +               };
> +
> +               clk26m: clk26m {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <26000000>;
> +               };
> +
> +               rtc32k: rtc32k {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <32000>;
> +               };

Why do you add this clocks here?
This clocks are not represented by the clock tree? If so, what are the
consumers of this clocks?

>         };
>
>         soc {
> @@ -100,6 +119,28 @@
>                 compatible = "simple-bus";
>                 ranges;
>
> +               topckgen: topckgen@10000000 {
> +                       compatible = "mediatek,mt8135-topckgen";
> +                       reg = <0 0x10000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               infracfg: syscon@10001000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "mediatek,mt8135-infracfg", "syscon";
> +                       reg = <0 0x10001000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               pericfg: syscon@10003000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "mediatek,mt8135-pericfg", "syscon";
> +                       reg = <0 0x10003000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
>                 timer: timer@10008000 {
>                         compatible = "mediatek,mt8135-timer",
>                                         "mediatek,mt6577-timer";
> @@ -128,6 +169,12 @@
>                               <0 0x10216000 0 0x2000>;
>                 };
>
> +               apmixedsys: apmixedsys@10209000 {
> +                       compatible = "mediatek,mt8135-apmixedsys";
> +                       reg = <0 0x10209000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
>                 uart0: serial@11006000 {
>                         compatible = "mediatek,mt8135-uart","mediatek,mt6577-uart";
>                         reg = <0 0x11006000 0 0x400>;
> --
> 1.8.1.1.dirty
>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
