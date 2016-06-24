From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 13/14] ARM: dts: sun8i: Add gpio-regulator
 used on Orange Pi One
Date: Fri, 24 Jun 2016 12:51:35 +1000
Message-ID: <CAGRGNgWzfuA+ik25GvvoksGaxyp36_eMhaYm0x3XVkZks5gFfg@mail.gmail.com>
References: <20160623192104.18720-1-megous@megous.com> <20160623192104.18720-14-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623192104.18720-14-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: Linux Sunxi <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ondrej,

On Fri, Jun 24, 2016 at 5:21 AM,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> Xulong Orange Pi One uses GPIO based regulator that
> switches between two voltages: 1.1V and 1.3V. The
> regulator is controlled from the PL6 pin.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> index 0adf932..ce4ba91 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> @@ -88,6 +88,25 @@
>                         gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       vdd_soc: gpio-regulator {
> +               compatible = "regulator-gpio";
> +
> +               regulator-name = "soc-vdd-supply";
> +               regulator-min-microvolt = <1100000>;
> +               regulator-max-microvolt = <1300000>;
> +               regulator-boot-on;
> +               regulator-type = "voltage";
> +
> +               gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
> +               states = <1100000 0x0
> +                         1300000 0x1>;
> +
> +               startup-delay-us = <100000>;
> +               enable-active-high;

Don't you need to reference the new pinctl node in this one?

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
