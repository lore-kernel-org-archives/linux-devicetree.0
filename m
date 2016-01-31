From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 11/14] ARM: dts: sun8i-a83t: Add R_PIO
 controller node to the dtsi
Date: Sun, 31 Jan 2016 11:46:25 +0800
Message-ID: <CAGb2v65=2VvyiUUHQ_yM_99tEF4pHuvQWWM0q7wTZ0nhVY7+xg@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com> <1454203266-4450-12-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKEHW22QKGQEMJECCJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454203266-4450-12-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-cl
List-Id: devicetree@vger.kernel.org

On Sun, Jan 31, 2016 at 9:21 AM, Vishnu Patekar
<vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Now that we have a driver for the R_PIO controller,
> add the corresponding device node to the dtsi.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index 5ea20ff..11be9e1 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -478,5 +478,26 @@
>                         compatible = "allwinner,sun6i-a31-clock-reset";
>                         #reset-cells = <1>;
>                 };
> +
> +               r_pio: pinctrl@01f02c00 {
> +                       compatible = "allwinner,sun8i-a83t-r-pinctrl";
> +                       reg = <0x01f02c00 0x400>;
> +                       interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&apb0_gates 0>;
> +                       resets = <&apb0_reset 0>;
> +                       gpio-controller;
> +                       interrupt-controller;
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;

#address-cells and #size-cells aren't needed. They were incorrectly included
in the first place. They were removed from &pio but not &r_pio.

> +                       #gpio-cells = <3>;
> +
> +                       r_rsb_pins: r_rsb {
> +                               allwinner,pins = "PL0", "PL1";
> +                               allwinner,function = "s_rsb";
> +                               allwinner,drive = <SUN4I_PINCTRL_20_MA>;
> +                               allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +                       };

This setting should be part of the next patch, the RSB node patch.
The rest looks fine.

ChenYu

> +               };
>         };
>  };
> --
> 1.9.1
>
