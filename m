From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 13/14] ARM: dts: sun8i: enable mmc for
 H8Homlet Board.
Date: Tue, 2 Feb 2016 15:31:35 +0800
Message-ID: <CAGb2v66hgkxNVywB9n8UEcnhVB_=_rWUv4G8bw6k50hAUucZ4w@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com> <1454203266-4450-14-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3VWYG2QKGQEGINWYVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454203266-4450-14-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Hi,

On Sun, Jan 31, 2016 at 9:21 AM, Vishnu Patekar
<vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This enables mmc0.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts    | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
> index 342e1d3..6c1f598 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
> @@ -43,6 +43,7 @@
>
>  /dts-v1/;
>  #include "sun8i-a83t.dtsi"
> +#include "sunxi-common-regulators.dtsi"
>
>  / {
>         model = "Allwinner A83T H8Homlet Proto Dev Board v2.0";
> @@ -57,6 +58,25 @@
>         };
>  };
>
> +&pio {
> +       mmc0_cd_pin_h8homlet: mmc0_cd_pin@0 {
> +               allwinner,pins = "PF6";
> +               allwinner,function = "gpio_in";
> +               allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +               allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +       };
> +};
> +

Please keep them alphabetically sorted.

> +&mmc0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_h8homlet>;
> +       vmmc-supply = <&reg_vcc3v0>;

The board design says 3.3V, but stock firmware uses 3.0V. I guess both work.

> +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +       bus-width = <4>;
> +       cd-inverted;
> +       status = "okay";
> +};
> +

There's also eMMC onboard. Have you tried that?


Thanks!
ChenYu


>  &uart0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&uart0_pins_b>;
> --
> 1.9.1
>
