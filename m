From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 5/8] ARM: dts: aspeed-palmetto: Add I2C devices
Date: Wed, 04 Oct 2017 15:38:57 +1030
Message-ID: <1507093737.5452.14.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-6-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-X5rNVcaLKHYYfZkfQfha"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928075149.8154-6-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-X5rNVcaLKHYYfZkfQfha
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
> Enable the buses that are in use and the devices that are attached.
> Currently that includes the battery backed RTC, temperature
> measurement
> and EEPROM.
>=20
> Some of these buses are for hotplugged cards, such as PCIe cards.
> Others do not yet have upstream drivers, so there are no devices
> attached.
>=20
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Reviewed-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 48
> +++++++++++++++++++++++++++
> =C2=A01 file changed, 48 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 112551766275..e387c80b7f4f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -61,3 +61,51 @@
> =C2=A0	pinctrl-names =3D "default";
> =C2=A0	pinctrl-0 =3D <&pinctrl_rmii1_default>;
> =C2=A0};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c256";
> +		reg =3D <0x50>;
> +		pagesize =3D <64>;
> +	};
> +
> +	rtc@68 {
> +		compatible =3D "dallas,ds3231";
> +		reg =3D <0x68>;
> +	};
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +
> +	tmp423@4c {
> +		compatible =3D "ti,tmp423";
> +		reg =3D <0x4c>;
> +	};
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&i2c4 {
> +	status =3D "okay";
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +};
> +
> +&i2c6 {
> +	status =3D "okay";
> +};
> +
> +&i2c7 {
> +	status =3D "okay";
> +};
--=-X5rNVcaLKHYYfZkfQfha
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1GzpAAoJEJ0dnzgO5LT5cCgP/Ryi/8M1UCB9fPDYIhB9ExJa
XgSkFKbO4qFd3065wpR5JT6F3bSwjOZQJ5IAheqMTZkzPZKImutXyUOVj99mAPD9
L8nHFPPCy9zgYJNjfsTBinVsCRlUskxrCPekwQA28nJOZbLcX5UVLpYYRVpV6nln
Zg/RgpZH3Ry/b6lYb4+zFizBX46MsgcKET8S9h/H33nmpeFfor4t6l/4SCDye8Sw
Fnzt7GThHKDr+7hZT7kIoRhDyZJAKhwrBN+nqBI1nXb9kdpLdKkObsX6cwL2PZbt
/F6SxQcWOTlQsaFni7VokxKei9HZ8EyC8obKi+0Jl1exabzXK5AUhaWdFIfHxWjC
2FQG8vfresEPBZZAWjnbC2nEg/Des5wpj3Yhz2x+j75shcv9g2KChjg/teGWdVQn
Pxs9VJ5EPtTwj9Z+4b/dygrEwSC3H//0oepZWQj5idV4gy9ciI2T8HGfqxlmq0fe
x4ADsHCDvrRzdbjZNxR6ZQywHwLlTsp3zyMtGtrNjqD9xRZzrlgFNAtDStLDXJwZ
WZStkoFwOswamrKlieWEscRRWWVGU8ECMh5rjzpVTPr5G5yhqX9Ua47g9Js0sGn8
3lcjueY+Cs4B6g/Q2bhZLselQx94aQb1dyjJrDyNCbuRKWrfaxKWL1MBeZL8ioWl
+Jwx9EmScQTS2jOc/KjL
=a1IQ
-----END PGP SIGNATURE-----

--=-X5rNVcaLKHYYfZkfQfha--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
