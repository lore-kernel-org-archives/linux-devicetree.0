From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: STi: STiH407: Add reset controller support.
Date: Wed, 2 Jul 2014 09:51:02 +0100
Message-ID: <20140702085102.GF10311@lee--X1>
References: <1404225047-9495-1-git-send-email-peter.griffin@linaro.org>
 <1404225047-9495-4-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404225047-9495-4-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 01 Jul 2014, Peter Griffin wrote:

> This patch adds the reset controller DT nodes for the powerdown,
>  softreset and picophy controllers.
>=20
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407.dtsi b/arch/arm/boot/dts/stih4=
07.dtsi
> index 4f9024f..e8fbb88 100644
> --- a/arch/arm/boot/dts/stih407.dtsi
> +++ b/arch/arm/boot/dts/stih407.dtsi
> @@ -8,6 +8,7 @@
>   */
>  #include "stih407-clock.dtsi"
>  #include "stih407-pinctrl.dtsi"
> +#include <dt-bindings/reset-controller/stih407-resets.h>
>  / {
>  	#address-cells =3D <1>;
>  	#size-cells =3D <1>;
> @@ -63,6 +64,21 @@
>  		ranges;
>  		compatible =3D "simple-bus";
> =20
> +		powerdown: powerdown-controller {
> +			#reset-cells =3D <1>;
> +			compatible =3D "st,stih407-powerdown";
> +		};
> +
> +		softreset: softreset-controller {
> +			#reset-cells =3D <1>;
> +			compatible =3D "st,stih407-softreset";
> +		};
> +
> +		picophyreset: picophyreset-controller {
> +			#reset-cells =3D <1>;
> +			compatible =3D "st,stih407-picophyreset";
> +		};
> +

I'd always put the compatible string at the very top of the node.

>  		syscfg_sbc: sbc-syscfg@9620000 {
>  			compatible =3D "st,stih407-sbc-syscfg", "syscon";
>  			reg =3D <0x9620000 0x1000>;

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
