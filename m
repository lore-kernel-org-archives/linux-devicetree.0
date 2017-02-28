From: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: sun7i: Convert to CCU
Date: Tue, 28 Feb 2017 14:01:48 -0300
Message-ID: <bca96944-bd58-5011-5eb9-01c4a1440fe2@elopez.com.ar>
References: <20170227210914.18954-1-plaes@plaes.org>
 <20170227210914.18954-4-plaes@plaes.org>
Reply-To: emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD73XIMS3EHBBBW223CQKGQE3A6H7BA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170227210914.18954-4-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I spotted a couple of things here on a quick look, see below

El 27/02/17 a las 18:09, Priit Laes escribi=C3=B3:
> Convert sun7i-a20.dtsi to new CCU driver.
>=20
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 719 +++++----------------------------=
------
>  1 file changed, 86 insertions(+), 633 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a=
20.dtsi
> index 04c9977..6f80cb8 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -47,7 +47,8 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
> =20
> -#include <dt-bindings/clock/sun4i-a10-pll2.h>
> +#include <dt-bindings/clock/sun7i-ccu.h>
> +#include <dt-bindings/reset/sun7i-ccu.h>
>  #include <dt-bindings/dma/sun4i-a10.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> =20
> @@ -67,19 +68,19 @@
>  			compatible =3D "allwinner,simple-framebuffer",
>  				     "simple-framebuffer";
>  			allwinner,pipeline =3D "de_be0-lcd0-hdmi";
> -			clocks =3D <&ahb_gates 36>, <&ahb_gates 43>,
> -				 <&ahb_gates 44>, <&de_be0_clk>,
> -				 <&tcon0_ch1_clk>, <&dram_gates 26>;
> +			clocks =3D <&ccu CLK_AHB_LCD0>, <&ccu CLK_AHB_HDMI1>,
> +				 <&ccu CLK_AHB_DE_BE0>, <&ccu CLK_DE_BE0>,
> +				 <&ccu CLK_TCON0_CH1>, <&ccu CLK_DRAM_DE_BE0>;
>  			status =3D "disabled";
>  		};
> =20
> -		framebuffer@1 {
> +		framebuffer@0 {

This looks like an unrelated change

> @@ -184,21 +185,11 @@
> =20
>  		osc24M: clk@01c20050 {
>  			#clock-cells =3D <0>;
> -			compatible =3D "allwinner,sun4i-a10-osc-clk";
> -			reg =3D <0x01c20050 0x4>;
> +			compatible =3D "fixed-clock";
>  			clock-frequency =3D <24000000>;
>  			clock-output-names =3D "osc24M";
>  		};

allwinner,sun4i-a10-osc-clk implements a gate apart from a fixed clock,
is the feature loss intended?

Cheers,
Emilio

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
