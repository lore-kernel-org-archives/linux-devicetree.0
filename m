From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-wandboard: enable USB OTG
Date: Fri, 16 Jun 2017 00:41:48 -0300
Message-ID: <CAOMZO5ASN-TGfWKaL=4mZBAeyg8PmH-rnrTXN4ZtQaEkZRVxAA@mail.gmail.com>
References: <1497508870-4028-1-git-send-email-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497508870-4028-1-git-send-email-akurz-3EoFODjbY6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On Thu, Jun 15, 2017 at 3:41 AM, Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org> wrote:

> +
> +               reg_usb_otg_vbus: usb_otg_vbus {
> +                       compatible = "regulator-fixed";
> +                       regulator-name = "usb_otg_vbus";
> +                       regulator-min-microvolt = <5000000>;
> +                       regulator-max-microvolt = <5000000>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_usbotgvbus>;
> +                       gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;

There is some inconsistency here:

If this regulator is driven by an active high GPIO then it needs the
'enable-active-high' property.

If 'enable-active-high' property is not passed and this VBUS is being
activated, then you should pass:
gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;

Please double check.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
