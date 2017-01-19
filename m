From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: imx7d-sdp: Fix watchdog and pwm pinmux
Date: Thu, 19 Jan 2017 10:02:00 -0200
Message-ID: <CAOMZO5B+EnTnhNKeuO9rs8t6o-1gSw3SztC9KQtFPui8D+CPBQ@mail.gmail.com>
References: <20170119090924.19636-1-s.hauer@pengutronix.de> <20170119090924.19636-3-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170119090924.19636-3-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 7:09 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> The watchdog pin and the pwm output pin are controlled by the
> iomuxc_lpsr, not the regular iomux, so move the pins there.
>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Just two minor nits that probably Shawn can take care while applying it"

in Subject there is a typo "sdb".

> ---
>  arch/arm/boot/dts/imx7d-sdb.dts | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
> index 2f33c463cbce..84f35a6cbb30 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -502,12 +502,6 @@
>                         >;
>                 };
>
> -               pinctrl_pwm1: pwm1grp {
> -                       fsl,pins = <
> -                               MX7D_PAD_GPIO1_IO01__PWM1_OUT           0x110b0
> -                       >;
> -               };
> -
>                 pinctrl_tsc2046_pendown: tsc2046_pendown {
>                         fsl,pins = <
>                                 MX7D_PAD_EPDC_BDR1__GPIO2_IO29          0x59
> @@ -635,11 +629,19 @@
>                                 MX7D_PAD_SD3_STROBE__SD3_STROBE         0x1b
>                         >;
>                 };
> -
> -               pinctrl_wdog: wdoggrp {
> -                       fsl,pins = <
> -                               MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B       0x74
> -                       >;
> -               };
>         };
>  };
> +
> +&iomuxc_lpsr {
> +       pinctrl_wdog: wdoggrp {
> +               fsl,pins = <
> +                       MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B       0x74
> +               >;
> +       };
> +
> +       pinctrl_pwm1: pwm1grp {
> +               fsl,pins = <
> +                       MX7D_PAD_GPIO1_IO01__PWM1_OUT           0x110b0
> +               >;
> +       };
> +};
> \ No newline at end of file

This could be fixed as well.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
