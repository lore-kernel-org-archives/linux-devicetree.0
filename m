From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/11] ARM: STi: DT: STiH407: Add i2c3 alternate pin
 configs
Date: Fri, 11 Sep 2015 19:02:38 +0100
Message-ID: <20150911180238.GP18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-3-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Seraphin Bonnaffe <seraphin.bonnaffe-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> i2c3 controller can use several sets of pins depending
> on board design. This patch adds the missing alternate
> pinconfigs.
>=20
> Signed-off-by: Seraphin Bonnaffe <seraphin.bonnaffe-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index d86ccc8..ce219a1 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -430,12 +430,24 @@
>  			};
> =20
>  			i2c3 {
> -				pinctrl_i2c3_default: i2c3-default {
> +				pinctrl_i2c3_default: i2c3-alt1-0 {
>  					st,pins {
>  						sda =3D <&pio18 6 ALT1 BIDIR>;
>  						scl =3D <&pio18 5 ALT1 BIDIR>;
>  					};
>  				};
> +				pinctrl_i2c3_alt1_1: i2c3-alt1-1 {
> +					st,pins {
> +						sda =3D <&pio17 7 ALT1 BIDIR>;
> +						scl =3D <&pio17 6 ALT1 BIDIR>;
> +					};
> +				};
> +				pinctrl_i2c3_alt3_0: i2c3-alt3-0 {
> +					st,pins {
> +						sda =3D <&pio13 6 ALT3 BIDIR>;
> +						scl =3D <&pio13 5 ALT3 BIDIR>;
> +					};
> +				};
>  			};
> =20
>  			spi0 {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
