From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ARM: dts: imx51-apf51dev: Fix 'backlight@bl1' node
 with unit name and no reg property
Date: Wed, 18 Oct 2017 15:12:33 -0500
Message-ID: <CAL_JsqJZD+DTe9-sAX+MbHr2ZZz3riXQ7nFcy5OmADK+a2F9SQ@mail.gmail.com>
References: <1508354991-18016-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508354991-18016-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marco Antonio Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 18, 2017 at 2:29 PM, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org> wrote:
> The following build warning is seen with W=1:
>
> Warning (unit_address_vs_reg): Node /backlight@bl1 has a unit name, but no
> reg property
>
> Fix this warning by changing '@' to '-'.
>
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes since v1:
> -none
>  arch/arm/boot/dts/imx51-apf51dev.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/imx51-apf51dev.dts b/arch/arm/boot/dts/imx51-apf51dev.dts
> index 2f1a9d2..a6c2c11 100644
> --- a/arch/arm/boot/dts/imx51-apf51dev.dts
> +++ b/arch/arm/boot/dts/imx51-apf51dev.dts
> @@ -16,7 +16,7 @@
>         model = "Armadeus Systems APF51Dev docking/development board";
>         compatible = "armadeus,imx51-apf51dev", "armadeus,imx51-apf51", "fsl,imx51";
>
> -       backlight@bl1{
> +       backlight-bl1{

Is there more that one? If not, just "backlight".

You also should have a space before the {.

>                 pinctrl-names = "default";
>                 pinctrl-0 = <&pinctrl_backlight>;
>                 compatible = "gpio-backlight";
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
