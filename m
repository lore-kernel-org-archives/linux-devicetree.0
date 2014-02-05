From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] Phytec phyFLEX-i.MX6 : Added USB_HOST Support
Date: Wed, 5 Feb 2014 11:14:00 -0200
Message-ID: <CAOMZO5DKx1uWT568t9TAy48Uf6ufpa1sSznaifDG_=+hLh8mqg@mail.gmail.com>
References: <1391488493-30662-1-git-send-email-ashutosh.s@phytec.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391488493-30662-1-git-send-email-ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 4, 2014 at 2:34 AM, Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org> wrote:

> +
> +       reg_usb_h1_vbus: regulator@1 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb_h1_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               gpio = <&gpio1 0 0>;
> +               enable-active-low;

You should remove this 'enable-active-low' as this is not a valid property.

By default the gpio is active low according to
Documentation/devicetree/bindings/regulator/gpio-regulator.txt

Regards,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
