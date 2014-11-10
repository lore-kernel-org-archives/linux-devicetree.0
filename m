From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 09/13] ARM: STi: DT: STiH410:  Add pinctl config for usb
 controllers.
Date: Mon, 10 Nov 2014 10:06:58 +0000
Message-ID: <20141110100658.GN21424@x1>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-10-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415361475-6218-10-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Nov 2014, Peter Griffin wrote:

> This patch adds the required pin configiguration for the extra usb
> controllers found on the stih410 device.
>=20
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index 402844c..fdaad5d 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -539,6 +539,24 @@
>  				};
>  			};
> =20
> +			usb0 {
> +				pinctrl_usb0: usb2-0 {
> +					st,pins {
> +						usb-oc-detect =3D <&pio35 0 ALT1 IN>;
> +						usb-pwr-enable =3D <&pio35 1 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
> +			usb1 {
> +				pinctrl_usb1: usb2-1 {
> +					st,pins {
> +						usb-oc-detect =3D <&pio35 2 ALT1 IN>;
> +						usb-pwr-enable =3D <&pio35 3 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
>  			usb3 {
>  				pinctrl_usb3: usb3-2 {
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
