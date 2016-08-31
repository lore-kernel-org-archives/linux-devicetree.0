From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: wheat: add SDHI0 support
Date: Wed, 31 Aug 2016 09:06:34 +0200
Message-ID: <CAMuHMdXbVPigVM=ObWY724B6Yf1TFWBn2j9q2RVWse=Z57ovvA@mail.gmail.com>
References: <34968644.DhifNderY8@wasted.cogentembedded.com> <1659137.gEKJxNrmrk@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1659137.gEKJxNrmrk-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Aug 31, 2016 at 12:24 AM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Define the Wheat board dependent  part of  the SDHI0 (connected to the
> micro-SD slot)  device node along with the necessary voltage regulator.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> ---
> This patch is against the 'renesas-devel-20160830-v4.8-rc4' of Simon Horman's
> 'renesas.git' repo plus the CAN patch posted yesterday.
> Starting with this patch, SMSC LAN89218 Ethernet chip starts to misbehave on my
> board...

Are GP11_11 or GP11_12 connected to the Ethernet chip?
Does the misbehaving go away if you drop
  - cd-gpios?
  - The regulator?
  - sdhi0-pins (there may be a bug in the pfc register bit definitions)?

>  arch/arm/boot/dts/r8a7792-wheat.dts |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7792-wheat.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7792-wheat.dts
> +++ renesas/arch/arm/boot/dts/r8a7792-wheat.dts
> @@ -11,6 +11,7 @@
>
>  /dts-v1/;
>  #include "r8a7792.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         model = "Wheat";
> @@ -54,6 +55,17 @@
>                 pinctrl-0 = <&lan89218_pins>;
>                 pinctrl-names = "default";
>         };
> +
> +       vcc_sdhi0: regulator-vcc-sdhi0 {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "SDHI0 Vcc";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&gpio11 12 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
>  };
>
>  &extal_clk {
> @@ -86,6 +98,11 @@
>                 groups = "can1_data";
>                 function = "can1";
>         };
> +
> +       sdhi0_pins: sdhi0 {
> +               groups = "sdhi0_data4", "sdhi0_ctrl";
> +               function = "sdhi0";
> +       };
>  };
>
>  &scif0 {
> @@ -108,3 +125,12 @@
>
>         status = "okay";
>  };
> +
> +&sdhi0 {
> +       pinctrl-0 = <&sdhi0_pins>;
> +       pinctrl-names = "default";
> +
> +       vmmc-supply = <&vcc_sdhi0>;
> +       cd-gpios = <&gpio11 11 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
