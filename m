From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6q-cm-fx6: add analog audio support
Date: Tue, 7 Feb 2017 20:39:46 -0200
Message-ID: <CAOMZO5BqkEQ5=rJpufuiqethOtRFqnm7pyoBR7hkS=e6iUsQAw@mail.gmail.com>
References: <b6776a0aa8484faf816a238705ed6d22@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b6776a0aa8484faf816a238705ed6d22-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 7, 2017 at 6:31 PM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:

> +&audmux {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_audmux>;
> +       status = "okay";
> +
> +       ssi2 {
> +               fsl,audmux-port = <1>;
> +               fsl,port-config = <
> +                       (IMX_AUDMUX_V2_PTCR_RCLKDIR |
> +                       IMX_AUDMUX_V2_PTCR_RCSEL(3 | 0x8) |
> +                       IMX_AUDMUX_V2_PTCR_TCLKDIR |
> +                       IMX_AUDMUX_V2_PTCR_TCSEL(3))
> +                       IMX_AUDMUX_V2_PDCR_RXDSEL(3)
> +               >;
> +       };
> +
> +       pins5 {

Just one minor nit: maybe pins4 since you are using AUD4 pins. Or
maybe 'audmux4' as pins4 is too vague ?

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
