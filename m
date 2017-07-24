From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6qdl-sabrelite: fix USB PHY reset
Date: Mon, 24 Jul 2017 09:49:56 -0300
Message-ID: <CAOMZO5C2kzvT7UYw8Zw8ztr1w6_C=MjcFPgU1Wfgjrag=dVwbQ@mail.gmail.com>
References: <20170724085005.22101-1-gary.bisson@boundarydevices.com> <20170724085005.22101-2-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170724085005.22101-2-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gary,

On Mon, Jul 24, 2017 at 5:50 AM, Gary Bisson
<gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:

> +
> +               reg_usb_h1_vbus: regulator@7 {
> +                       compatible = "regulator-fixed";
> +                       reg = <7>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_usbh1>;
> +                       regulator-name = "usb_h1_vbus";
> +                       regulator-min-microvolt = <3300000>;
> +                       regulator-max-microvolt = <3300000>;
> +                       gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
> +                       enable-active-high;
> +                       regulator-always-on;

As this regulator is controlled via GPIO I believe you should remove
the ' regulator-always-on' property.

Same applies to 2/2/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
