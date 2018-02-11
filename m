From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: dts: sun6i: a31s: bpi-m2: update
 mmc supply nodes
Date: Sun, 11 Feb 2018 23:15:02 +0100
Message-ID: <1518387302.1342.3.camel@gmail.com>
References: <20180209175236.21215-1-embed3d@gmail.com>
	 <20180209175236.21215-2-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD257DPK24NRB2MAQPKAKGQETWNZJNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180209175236.21215-2-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 09.02.2018, 18:52 +0100 schrieb Philipp Rossak:
> This patch updates the vmmc-supply properties on the mmc0 and mmc2
> node to use the allready existent regulators.
> We can now remove the sunxi-common-regulators.dtsi include since we
> don't need it anymore.
>=20
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =C2=A0arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 5 ++---
> =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
> b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
> index 51e6f1d21c32..a8d86211c8f3 100644
> --- a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
> +++ b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
> @@ -42,7 +42,6 @@
> =C2=A0
> =C2=A0/dts-v1/;
> =C2=A0#include "sun6i-a31s.dtsi"
> -#include "sunxi-common-regulators.dtsi"
> =C2=A0#include <dt-bindings/gpio/gpio.h>
> =C2=A0
> =C2=A0/ {
> @@ -118,7 +117,7 @@
> =C2=A0&mmc0 {
> =C2=A0	pinctrl-names =3D "default";
> =C2=A0	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_bpi_m2>;
> -	vmmc-supply =3D <&reg_vcc3v0>;
> +	vmmc-supply =3D <&reg_dcdc1>;
> =C2=A0	bus-width =3D <4>;
> =C2=A0	cd-gpios =3D <&pio 0 4 GPIO_ACTIVE_HIGH>; /* PA4 */
> =C2=A0	cd-inverted;
> @@ -132,7 +131,7 @@
> =C2=A0&mmc2 {
> =C2=A0	pinctrl-names =3D "default";
> =C2=A0	pinctrl-0 =3D <&mmc2_pins_a>;
> -	vmmc-supply =3D <&reg_vcc3v0>;
> +	vmmc-supply =3D <&reg_dcdc1>;
			^^
		this here is wrong! this should be &reg_aldo1
> =C2=A0	mmc-pwrseq =3D <&mmc2_pwrseq>;
> =C2=A0	bus-width =3D <4>;
> =C2=A0	non-removable;

Philipp

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
