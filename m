From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH] ARM: dts: sun4i: A1000: add axp209
 regulator nodes
Date: Tue, 20 Dec 2016 15:16:13 +0100
Message-ID: <20161220141613.czhs54laqpovidej@lukather>
References: <20161220102242.2423-1-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mqdc2n5w6bvox3eq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161220102242.2423-1-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mqdc2n5w6bvox3eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 11:22:42AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> This patch adds the regulator nodes for the axp209 by including
> the axp209 dtsi.
>=20
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10-a1000.dts | 34 +++++++++++++++++++++++++++++=
+++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/su=
n4i-a10-a1000.dts
> index 68c6bdb2cf7c..e7394d701856 100644
> --- a/arch/arm/boot/dts/sun4i-a10-a1000.dts
> +++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
> @@ -196,6 +196,40 @@
>  	};
>  };
> =20
> +#include "axp209.dtsi"
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1250000>;
> +	regulator-name =3D "vdd-int-dll";
> +};
> +
> +&reg_ldo1 {
> +	regulator-name =3D "vdd-rtc";
> +};
> +
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "avcc";
> +};
> +
> +&reg_ldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <2800000>;
> +	regulator-max-microvolt =3D <2800000>;
> +	regulator-name =3D "vcc-wifi";

If this is used only for the wifi, there's no point in keeping it
enabled.

Also, taking the chance to enable cpufreq by setting the cpu-suplly
property would be a good idea.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mqdc2n5w6bvox3eq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYWT0oAAoJEBx+YmzsjxAgQGQQAMDzIeKom972I3BDCEdvOlZm
iThbb+zhvwXt5JWHLsjHcageP2yMRmnSyfh84eJts2KenE3jr5+nm25s15q46+YS
PYw6nEkzwto+hmtUiKvwd3+Ew+hZkiYRKVsFfF8YPIdo+Nl5MbZg0SJvmy7gECaX
57Y5AUehoOL+kAVskKLZB3suxc0SHq/EKLvKozqgh3BmsTookP1LEFn/kagrhrp1
Mq3i+zBSwN432qjzmzcYES7e5ltdkUvX3VSsvry74SMmCpKWiVJ2gH8xvPdGkU2q
8c5XR/Z5XlOgOVPxM/oJ8xT0PRcPEe2LPe9QXNYHziqym4ycGB+DNnV/Xqf7jaSm
mTod1IGJohmnxh12JoDK2giiv8ddLDoWlMDdPEqRuLLk/3/w2A8uT5F/Ihnw8/qV
JYArnMaspjkE8F9Ban/ZbOE1w6Mr4bv3ipR6SlYAXzjyPWqMRnVsiyo8Y8+OPF89
oay7OQAlwZeZXdF7pQQsVJnEERyO7uFg7v8z/HgOvceQeE0yPB8KT5IifNRad1vh
WaEWOTx/2SohvE4KcWl+xwI+C403CEdn6LkmvAo7LszfkuuwGGBot32gfJbIiMec
usVd6soi2utWeOCKQM6RFkfDl6bs16CDIJ+UKMueg2n7qfwyoog/lCmzQYudwlF7
KyNTfEoRGwHpPNXVqQrO
=uSJp
-----END PGP SIGNATURE-----

--mqdc2n5w6bvox3eq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
