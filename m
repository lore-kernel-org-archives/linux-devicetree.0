From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 07/13] ARM: STi: DT: STiH407: Add usb2 picophy dt nodes
Date: Mon, 10 Nov 2014 10:11:31 +0000
Message-ID: <20141110101131.GP21424@x1>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-8-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415361475-6218-8-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Nov 2014, Peter Griffin wrote:

> This patch adds the dt nodes for the usb2 picophy found on the stih40=
7
> family of devices. It is used on stih410 and later devices with the e=
hci/ohci usb
> controller, and is also used as the usb2 phy with the dwc3 usb3 contr=
oller.
>=20
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407.dtsi | 46 ++++++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 46 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407.dtsi b/arch/arm/boot/dts/stih4=
07.dtsi
> index 50637f5..967ec39 100644
> --- a/arch/arm/boot/dts/stih407.dtsi
> +++ b/arch/arm/boot/dts/stih407.dtsi
> @@ -275,5 +275,51 @@
> =20
>  			status =3D "disabled";
>  		};
> +
> +		/* Generic picoPHY */
> +		usb2_picophy0: usbpicophy@0 {
> +			compatible =3D "st,stih407-usb2-phy";
> +			reg =3D	<0xf8 0x04>,	/* syscfg 5062 */
> +				<0xf4 0x04>;    /* syscfg 5061 */

Are there really only 2 32bit registers to control this h/w?

> +			reg-names =3D	"param",
> +					"ctrl";

Superflous indentation after 'reg =3D ' and 'reg-names =3D '.

> +			#phy-cells =3D <0>;
> +
> +			st,syscfg =3D <&syscfg_core>;
> +			resets =3D <&softreset STIH407_PICOPHY_SOFTRESET>,
> +				 <&picophyreset STIH407_PICOPHY0_RESET>;
> +			reset-names =3D "global",
> +				      "port";

May as well put these on the same line.

> +		};
> +
> +		usb2_picophy1: usbpicophy@1 {
> +			compatible =3D "st,stih407-usb2-phy";
> +			#phy-cells =3D <0>;
> +			reg =3D	<0xfc 0x04>,	/* syscfg 5063 */
> +				<0xf4 0x04>;    /* syscfg 5061 */
> +			reg-names =3D	"param",
> +					"ctrl";
> +
> +			st,syscfg =3D <&syscfg_core>;
> +			resets =3D <&softreset STIH407_PICOPHY_SOFTRESET>,
> +				 <&picophyreset STIH407_PICOPHY1_RESET>;
> +			reset-names =3D "global",
> +				      "port";
> +		};
> +
> +		usb2_picophy2: usbpicophy@2 {
> +			compatible =3D "st,stih407-usb2-phy";
> +			#phy-cells =3D <0>;
> +			reg =3D	<0x100 0x04>,	/* syscfg 5064 */
> +				<0xf4 0x04>;    /* syscfg 5061 */
> +			reg-names =3D	"param",
> +					"ctrl";
> +
> +			st,syscfg =3D <&syscfg_core>;
> +			resets =3D <&softreset STIH407_PICOPHY_SOFTRESET>,
> +				 <&picophyreset STIH407_PICOPHY2_RESET>;
> +			reset-names =3D "global",
> +				      "port";
> +		};
>  	};
>  };

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
