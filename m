From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: dts: sun8i: a83t: cubietruck-plus: Add AXP818
 regulator nodes
Date: Mon, 2 Oct 2017 18:24:05 +0200
Message-ID: <20171002162405.jndvig3fxuj6d3ce@flea>
References: <20170929032514.31727-1-wens@csie.org>
 <20170929032514.31727-6-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vuqobhb44zje7puz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170929032514.31727-6-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--vuqobhb44zje7puz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 29, 2017 at 03:25:12AM +0000, Chen-Yu Tsai wrote:
> +#include "axp81x.dtsi"
> +
> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1800000>;
> +	regulator-max-microvolt =3D <1800000>;
> +	regulator-name =3D "vcc18-csi2-dsi-efuse-hdmi-d4dp";
> +};

I'm not really fond of these names. It's easy to miss some components
(especially since we most of the time don't have the schematics), and
if it's not complete, the obscure name isn't worth it either.

What about vcc-1.8 for this one ?

> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1800000>;
> +	regulator-max-microvolt =3D <1800000>;
> +	regulator-name =3D "vdd-drampll-vcc18-pll-adc-cpvdd-ldoin";
> +};

dram-pll?

> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "vcc-pl-avcc";
> +};

avcc?

etc..

>  	status =3D "disabled";
>  };
> =20
> +&reg_vcc3v3 {
> +	status =3D "disabled";
> +};
> +
>  &reg_vcc5v0 {
>  	status =3D "disabled";
>  };

Why not simply remove the DTSI then?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vuqobhb44zje7puz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ0mglAAoJEBx+YmzsjxAgX7gQALPm1HSkqxE3dZbziH48L1Om
nBNBGSoXHgy+++W0E6jNBFnlXgrmKK8zewN1g8xlqAzAkMrTRDyag4WUOxK6I/tn
EYGT5HGblJO9cSz5wmh7728sE2t48iNdF5FtPNy13jEkxAAAq9ePFn0zuADrpc1x
cqTFZxcgpuFgSGWckgVHuLtswaUFXBR77/INf/Fs87q7N9vNgoQTsv9SuGPmXrkT
qxgrbkzeYXVDi9IKA+nQHRmnGuph2ymukF65UTedYF8b++n7Gnh1baaOZH7hUlZs
oP2qeAimzRDdwpsYotstrYYeWoLVh1aJ2n8ftjojYwQHKRp2HyHC6YCJpI3nI3Te
nF4DRzdi+bQfOeH23MfI4XgH43LRapUfj+F28CuFxjKD/5bZZ5VtlTA2YiQZYhgS
voq0Edg9Bkk89kjOtFFxZ5pqmObbMqEf2l5xNxLjkhZGchTMVtlHv9oWkfU90nJT
dpqen89JT2K281CnArkFzNnbSbzUWtkGBFwNg8HoDUMLEYONk1u9vowUiRxxjQFu
O8LJHWqhChAhpbFcEPGnZ5AlKYqQ+iI7xhAwteT+RD/POkruyszU7b6EM4LdpnQ5
UT8grPCkE4UvDhL3cMi/fGbCuEJ2vRcPbbaznp1+q3d9XuDQvMPXRBYb6NefDzS8
6cYYkYVZx/ueuBd2Z6R9
=g6dE
-----END PGP SIGNATURE-----

--vuqobhb44zje7puz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
