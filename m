From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH] arm64: allwinner: h6: restore the usage of
 CCU slice macros
Date: Mon, 23 Apr 2018 14:58:48 +0800
Message-ID: <1524466728.25095.0.camel@aosc.io>
References: <20180403134024.43156-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBOEI63LAKGQE6IU3VBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180403134024.43156-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018-04-03=E4=BA=8C=E7=9A=84 21:40 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> As the definition of CCU slice macros are already merged into the
> source
> tree, restore the usage of the macros now.

Maxime, could you check this patch and pick it?

Thanks!

>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 20 +++++++++++-------
> --
>  1 file changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index 56563150d61a..4debc3962830 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -4,6 +4,8 @@
>   */
> =20
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun50i-h6-ccu.h>
> +#include <dt-bindings/reset/sun50i-h6-ccu.h>
> =20
>  / {
>  	interrupt-parent =3D <&gic>;
> @@ -115,7 +117,7 @@
>  				     <GIC_SPI 53
> IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 54
> IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 59
> IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&ccu 26>, <&osc24M>, <&osc32k>;
> +			clocks =3D <&ccu CLK_APB1>, <&osc24M>,
> <&osc32k>;
>  			clock-names =3D "apb", "hosc", "losc";
>  			gpio-controller;
>  			#gpio-cells =3D <3>;
> @@ -134,8 +136,8 @@
>  			interrupts =3D <GIC_SPI 0
> IRQ_TYPE_LEVEL_HIGH>;
>  			reg-shift =3D <2>;
>  			reg-io-width =3D <4>;
> -			clocks =3D <&ccu 70>;
> -			resets =3D <&ccu 21>;
> +			clocks =3D <&ccu CLK_BUS_UART0>;
> +			resets =3D <&ccu RST_BUS_UART0>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -145,8 +147,8 @@
>  			interrupts =3D <GIC_SPI 1
> IRQ_TYPE_LEVEL_HIGH>;
>  			reg-shift =3D <2>;
>  			reg-io-width =3D <4>;
> -			clocks =3D <&ccu 71>;
> -			resets =3D <&ccu 22>;
> +			clocks =3D <&ccu CLK_BUS_UART1>;
> +			resets =3D <&ccu RST_BUS_UART1>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -156,8 +158,8 @@
>  			interrupts =3D <GIC_SPI 2
> IRQ_TYPE_LEVEL_HIGH>;
>  			reg-shift =3D <2>;
>  			reg-io-width =3D <4>;
> -			clocks =3D <&ccu 72>;
> -			resets =3D <&ccu 23>;
> +			clocks =3D <&ccu CLK_BUS_UART2>;
> +			resets =3D <&ccu RST_BUS_UART2>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -167,8 +169,8 @@
>  			interrupts =3D <GIC_SPI 3
> IRQ_TYPE_LEVEL_HIGH>;
>  			reg-shift =3D <2>;
>  			reg-io-width =3D <4>;
> -			clocks =3D <&ccu 73>;
> -			resets =3D <&ccu 24>;
> +			clocks =3D <&ccu CLK_BUS_UART3>;
> +			resets =3D <&ccu RST_BUS_UART3>;
>  			status =3D "disabled";
>  		};
>  	};

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
