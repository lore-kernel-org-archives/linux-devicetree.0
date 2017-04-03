From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun7i: Cubietruck: enable ACIN und USB power supply
 subnode
Date: Mon, 3 Apr 2017 13:48:19 +0200
Message-ID: <20170403114819.sb7pablxrb3qpsar@lukather>
References: <20170403091245.9766-1-alex@asyring.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fq2qgvvvh7dkfwas"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170403091245.9766-1-alex-a4LgQbPKaXiELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Syring <alex-a4LgQbPKaXiELgA04lAiVw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fq2qgvvvh7dkfwas
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 03, 2017 at 11:12:45AM +0200, Alexander Syring wrote:
> The Cubietruck has an AXP209 PMIC and can be power-supplied by ACIN via
>  the CHG-IN pin or by USB.
>=20
> This enables the ACIN and the USB power supply subnode in the DT.
>=20
> Signed-off-by: Alexander Syring <alex-a4LgQbPKaXiELgA04lAiVw@public.gmane.org>
> ---
>=20
> Send again to all relevant people
>=20
> ---
>  arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/d=
ts/sun7i-a20-cubietruck.dts
> index feb995d29799..98431ef15bc9 100644
> --- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> @@ -267,6 +267,10 @@
>=20
>  #include "axp209.dtsi"
>=20
> +&ac_power_supply {
> +	status =3D "okay";
> +};
> +
>  &reg_dcdc2 {
>  	regulator-always-on;
>  	regulator-min-microvolt =3D <1000000>;
> @@ -323,6 +327,10 @@
>  	status =3D "okay";
>  };
>=20
> +&usb_power_supply {
> +	status =3D "okay";
> +};
> +
>  &usbphy {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
> @@ -333,3 +341,4 @@
>  	usb2_vbus-supply =3D <&reg_usb2_vbus>;
>  	status =3D "okay";
>  };
> +

You had a whitespace error here. I fixed it, and applied.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fq2qgvvvh7dkfwas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY4jaCAAoJEBx+YmzsjxAgVuIQAL2BZtEfPtu2RA9QgBVa45m1
0fHs0pnxPoZ+3+DsB+cXsHY0kwabDlMWenmuuOkAJHCS81DYCHrRhI+n5CiCP0/2
dwc/i4jNLNUT2/fVzXNLpTJnVb5KL/d8WiaDNmpZQTMsu49HHgCx/aUyS0dZgTlW
B2vOOHRivmEXzV/g4Nk6tcPypehILzAL1teBYOB/9wZK0ABcksgiTvwxkG0xY6SX
C2r0/hBr80fe/6V8YGkH39qR7Bc3qesS1xWT1KMlROhUXqMD0/cWwC1j24fsoBWy
zinAE1+bdDkWs5EltsKsUmuUpR2+hkugXOb5VuVMZvpwcVF7/NRmKhmD/FjtfpWp
ZEZ/0QQ6rkDBr2EgY5Kln51sw6v0zHfVG4dusFP7LkqXdDZ5ZIRffAviQVCiEUi5
4E+Q8oRnF53uuUkKM8Js/qHFNLsw7vFKsChMq9LUapuBhI0zJFiiAIRbL5s97+7r
B1TD5cH2Ib0v2cVfRzuL0lUENdEAQDIma/ykAtPbu4tlU5FfCQ8R86oMz9ZHAJ0f
WAyvrxAQ1vscQEi9/n4SKpa1jcIY5GxxumGg87IqDrSWAIIvRUOrtI0lNgdSW0h4
GTBQjU1G5S7YB6u+IFXMwGuu/JMGpRALABbZH2UAzfPOz4g5Bl7CYqp95IhPI4/g
nB7eNhlRyUf+BfCij4es
=lMC/
-----END PGP SIGNATURE-----

--fq2qgvvvh7dkfwas--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
