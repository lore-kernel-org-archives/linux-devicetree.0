From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/13] ARM: dts: imx6qdl: SolidRun: remove redundant
 regulators node
Date: Mon, 27 Nov 2017 18:15:25 -0200
Message-ID: <CAOMZO5B9GW26+3EfutnH4meUec3qq09Q6OBYHTtdvWG+DavJwg@mail.gmail.com>
References: <20171127165134.GH31757@n2100.armlinux.org.uk> <E1eJMdd-0002qR-Or@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1eJMdd-0002qR-Or-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Nettleton <jon.nettleton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 27, 2017 at 2:52 PM, Russell King
<rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:

> -               };
> +       reg_usbh1_vbus: usb-h1-vbus {
> +               compatible = "regulator-fixed";
> +               enable-active-high;
> +               gpio = <&gpio1 0 0>;

gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>; would be easier to read.

> +       reg_usbotg_vbus: usb-otg-vbus {
> +               compatible = "regulator-fixed";
> +               enable-active-high;
> +               gpio = <&gpio3 22 0>;

Ditto.

> +       reg_brcm: brcm-reg {
> +               compatible = "regulator-fixed";
> +               enable-active-high;
> +               gpio = <&gpio3 19 0>;

Ditto.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
