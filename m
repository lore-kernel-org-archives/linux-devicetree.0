From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 6/8] ARM: dts: aspeed-ast2500: Add I2C devices
Date: Wed, 04 Oct 2017 15:42:08 +1030
Message-ID: <1507093928.5452.15.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-7-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-TTWSZwwPiUzWBYNSs96W"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928075149.8154-7-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-TTWSZwwPiUzWBYNSs96W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
> Enable the buses that are in use and the devices that are attached.
> Currently that includes temperature measurement and EEPROM.
>=C2=A0
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Reviewed-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-ast2500-evb.dts | 19 +++++++++++++++++++
> =C2=A01 file changed, 19 insertions(+)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
> index 7c90dac99822..dc7d73b02b76 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -59,3 +59,22 @@
> =C2=A0	pinctrl-names =3D "default";
> =C2=A0	pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> =C2=A0};
> +
> +&i2c3 {
> +	status =3D "okay";
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c08";
> +		reg =3D <0x50>;
> +		pagesize =3D <16>;
> +	};
> +};
> +
> +&i2c7 {
> +	status =3D "okay";
> +
> +	lm75@4d {
> +		compatible =3D "national,lm75";
> +		reg =3D <0x4d>;
> +	};
> +};
--=-TTWSZwwPiUzWBYNSs96W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1G2oAAoJEJ0dnzgO5LT5p3oP/RQbs56cSKiEnBNxy1TJHcUj
W/g3CFhw8I6AWs+kRIC4GwZPCivFLJQH98iOVQt5AUI+ARdGxkd8+kcpINY0fQqv
LUzpZOYP+RiLZShlYh46jxLnWkiq8NCpMRmq8Wc5rIY3tUtR4HbGaee/t7XVyrbI
2BFWWKFG72gj9UVVRWE+JZZPVvSVXxIsvGzmcjegUkR6WLNECtPOd8cxMJ9YG+FO
2gezN0Q9d9MGiFFmJtJ16/25RV3WKFf+mW+9iEpk6zjMzOmq4w+72AydU32qz5KH
DYuiLX54Wh4J37E4SHx2dBK7wQS04J0UThFJj2MENCM63smypt3Dds/i7esuJMny
+ODUGn1zeeD/o2ADfvY43su5LsAmk8kU+jIPCWfwVf7O0vK4PV3ZDiFPax5z6XHg
MJwB06p/yks1LfJgk1qBanM+wwyNLg0O6Qq2QaS73vWwb3SI1cxnvsfblraGWLrg
q4wAbWb692gkt2uSADt/oAggZAdSVqBC7uapGY1bCw5P8j4aK62k0I1ce61XiBpU
CF/Fzh9rpbQO6x7XbZ/8NHGEDB2OmPOuSQS33qnvn/TMbT8Ry38BnE53k8u5xILf
W990Jf0ogD4KlhwOl6kuUWJ4ig/3X5uE/qIoKun+GVFBtne9/T8EVQE2tly03LKy
qAsEhPSR+lSYxwxMEl5r
=sVdT
-----END PGP SIGNATURE-----

--=-TTWSZwwPiUzWBYNSs96W--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
