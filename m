From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/11] ARM: STi: DT: STiH407: Add a cec0 pin definition
Date: Fri, 11 Sep 2015 19:03:06 +0100
Message-ID: <20150911180306.GQ18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Erwan Le Ray <erwan.leray-qxv4g6HH51o@public.gmane.org>, Nicolas Vanhaelewyn <nicolas.vanhaelewyn-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This pin setup provides the correct configuration in order to
> interact with the CEC HW.
>=20
> Signed-off-by: Erwan Le Ray <erwan.leray-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Nicolas Vanhaelewyn <nicolas.vanhaelewyn-qxv4g6HH51o@public.gmane.org>
> Acked-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

Duplicate.

> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

=46or the patch: Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index 0a754f2..d86ccc8 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -107,6 +107,14 @@
>  				st,retime-pin-mask =3D <0x3f>;
>  			};
> =20
> +			cec0 {
> +				pinctrl_cec0_default: cec0-default {
> +					st,pins {
> +						hdmi_cec =3D <&pio2 4 ALT1 BIDIR>;
> +					};
> +				};
> +			};
> +
>  			rc {
>  				pinctrl_ir: ir0 {
>  					st,pins {

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
