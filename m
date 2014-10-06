From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt: bindings: tps65217: add compatible property
 for  subnodes
Date: Mon, 6 Oct 2014 22:22:32 +0100
Message-ID: <20141006212232.GF18035@lee--X1>
References: <1660410.j399mvljTo@lenovobook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1660410.j399mvljTo@lenovobook>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Pointner <johannes.pointner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 25 Sep 2014, Johannes Pointner wrote:

> Add documentation for compatible property of subnodes.
>=20
> Signed-off-by: Johannes Pointner <johannes.pointner-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org=
>
> ---
>  Documentation/devicetree/bindings/regulator/tps65217.txt         | 7=
 ++++++-
>  .../devicetree/bindings/video/backlight/tps65217-backlight.txt   | 9=
 ++++++---
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/tps65217.txt=
 b/Documentation/devicetree/bindings/regulator/tps65217.txt
> index 4f05d20..8ae3a3b 100644
> --- a/Documentation/devicetree/bindings/regulator/tps65217.txt
> +++ b/Documentation/devicetree/bindings/regulator/tps65217.txt
> @@ -14,6 +14,9 @@ Required properties:
>  Optional properties:
>  - ti,pmic-shutdown-controller: Telling the PMIC to shutdown on PWR_E=
N toggle.
> =20
> +Required subnode properties:
> +- compatible: "ti,tps65217-pmic"
> +
>    The valid names for regulators are:
>    tps65217: dcdc1, dcdc2, dcdc3, ldo1, ldo2, ldo3 and ldo4
> =20
> @@ -23,9 +26,11 @@ Example:
> =20
>  	tps: tps@24 {
>  		compatible =3D "ti,tps65217";
> +		reg =3D <0x24>;
>  		ti,pmic-shutdown-controller;
> =20
> -		regulators {
> +		tps_pmic: regulators {

How is the tps_pmic label used?

> +			compatible =3D "ti,tps65217-pmic";

I'd like to see a '\n' here.

>  			dcdc1_reg: dcdc1 {
>  				regulator-min-microvolt =3D <900000>;
>  				regulator-max-microvolt =3D <1800000>;
> diff --git a/Documentation/devicetree/bindings/video/backlight/tps652=
17-backlight.txt b/Documentation/devicetree/bindings/video/backlight/tp=
s65217-backlight.txt
> index 5fb9279..f92f154 100644
> --- a/Documentation/devicetree/bindings/video/backlight/tps65217-back=
light.txt
> +++ b/Documentation/devicetree/bindings/video/backlight/tps65217-back=
light.txt
> @@ -6,19 +6,22 @@ used to drive LEDs for use as backlights.
>  Required properties:
>  - compatible: "ti,tps65217"
>  - reg: I2C slave address
> -- backlight: node for specifying WLED1 and WLED2 lines in TPS65217
> +- backlight: subnode for specifying WLED1 and WLED2 lines in TPS6521=
7
> +
> +Required subnode properties:
> +- compatible: "ti,tps65217-bl"
>  - isel: selection bit, valid values: 1 for ISEL1 (low-level) and 2 f=
or ISEL2 (high-level)
>  - fdim: PWM dimming frequency, valid values: 100, 200, 500, 1000
>  - default-brightness: valid values: 0-100
> =20
> -Each regulator is defined using the standard binding for regulators.
> =20
>  Example:
> =20
>  	tps: tps@24 {
>  		reg =3D <0x24>;
>  		compatible =3D "ti,tps65217";

I'd like to see a '\n' here.

> -		backlight {
> +		tps_bl: backlight {

Same here.  Is this label used?

> +			compatible =3D "ti,tps65217-bl";
>  			isel =3D <1>;  /* 1 - ISET1, 2 ISET2 */
>  			fdim =3D <100>; /* TPS65217_BL_FDIM_100HZ */
>  			default-brightness =3D <50>;

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
