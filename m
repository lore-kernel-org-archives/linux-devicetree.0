From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx6sl-evk: Rearrange the regulators node
Date: Wed, 6 Dec 2017 09:20:04 -0200
Message-ID: <CAOMZO5DcOeGG6KaHptMD0fO1K9RE9jHXBirUdRXG-SHd1ZFfmw@mail.gmail.com>
References: <1512528784-29288-1-git-send-email-marcofrk@gmail.com> <1512528784-29288-2-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512528784-29288-2-git-send-email-marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marco,

You missed to pass the v2 notation for this patch in the Subject.

On Wed, Dec 6, 2017 at 12:53 AM, Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> +       reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb_otg1_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               gpio = <&gpio4 0 0>;

gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;

would easier to read.

> +       reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb_otg2_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               gpio = <&gpio4 2 0>;

Ditto.

> -               };
> +       reg_lcd_3v3: regulator-lcd-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "lcd-3v3";
> +               gpio = <&gpio4 3 0>;

Ditto.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
