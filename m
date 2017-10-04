From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 7/8] ARM: dts: aspeed: Add aliases for UARTs
Date: Wed, 04 Oct 2017 15:43:19 +1030
Message-ID: <1507093999.5452.16.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-8-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-oZEm4benk0uYV4kEaiSn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928075149.8154-8-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-oZEm4benk0uYV4kEaiSn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
> Existing userspace expects the console (UART5) to be at /dev/ttyS4.=C2=A0=
=C2=A0To
> ensure the UARTs show up where users expect them, we give them fixed
> aliases starting at 0.
>=C2=A0
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Reviewed-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 4 ----
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 5 +++++
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 5 +++++
> =C2=A03 files changed, 10 insertions(+), 4 deletions(-)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index e387c80b7f4f..be51be5a5f39 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -6,10 +6,6 @@
> =C2=A0	model =3D "Palmetto BMC";
> =C2=A0	compatible =3D "tyan,palmetto-bmc", "aspeed,ast2400";
> =C2=A0
> -	aliases {
> -		serial4 =3D &uart5;
> -	};
> -
> =C2=A0	chosen {
> =C2=A0		stdout-path =3D &uart5;
> =C2=A0		bootargs =3D "console=3DttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index f8611d5a6465..191c33d18122 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -22,6 +22,11 @@
> =C2=A0		i2c11 =3D &i2c11;
> =C2=A0		i2c12 =3D &i2c12;
> =C2=A0		i2c13 =3D &i2c13;
> +		serial0 =3D &uart1;
> +		serial1 =3D &uart2;
> +		serial2 =3D &uart3;
> +		serial3 =3D &uart4;
> +		serial4 =3D &uart5;
> =C2=A0	};
> =C2=A0
> =C2=A0	cpus {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index de127370131d..251fc9f4637e 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -22,6 +22,11 @@
> =C2=A0		i2c11 =3D &i2c11;
> =C2=A0		i2c12 =3D &i2c12;
> =C2=A0		i2c13 =3D &i2c13;
> +		serial0 =3D &uart1;
> +		serial1 =3D &uart2;
> +		serial2 =3D &uart3;
> +		serial3 =3D &uart4;
> +		serial4 =3D &uart5;
> =C2=A0	};
> =C2=A0
> =C2=A0	cpus {
--=-oZEm4benk0uYV4kEaiSn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1G3vAAoJEJ0dnzgO5LT5Bh4P/RFuKVoLFXB+A3nrtGsc29R3
GVxrFMCcMYp3G+4cWzi4MVjA+Vngdjq6NupmWeWrHqm6aTYMga3Xx5F3oGXXCneH
7bpkH915HbA7oyVSKx3cTEZcGiK+8pK9W5ntmzbxgbY4AE5m1pO790hexXTC6Jj1
mNaRlZrQrA0AAsJoqNrJFbNwn3saD8xHqhuJ+VIHg3DNW/e4nkDeIbNWIqmoqMxT
oQwrNC2+xBnL91W4TbY2vP5RaC6ORVPvn7iRsE/x7hsei/QzxEzlM6Ypvx+mKLfE
cSRS98QmhdzS+SKV2MSHqo/H0joXng4VDgqIPrL/VolSgaBdfsAfFd7lQG9i+Wxr
ZsDEhGQACuphvlxu6JoPkRycJjhdbLYMduYasvjinzgrWZFHhc4o7OuaxOoUJ4P9
go7Zm22gUpTIvHRrT0MH5agsUmJLTF5Umd1+TyhCxDbOYX7ETLqnw4K4M+GLjkbU
6Qtf5Rmv5rr/tqJ20toNhfNo/d7+FNC1zUxfhIFjygD8pwSRwTjYA6I56x+5Z6by
KTtRVQK1ccDFfevXKlzA0hQWiIn1xP45GUgj5FoGhGJUiWL5xqsYUZz9e8047Vo8
37vLQDIsHfae0bXLWT0Q45eKR/jLgpJeIZarpWmbHCv5w35Vb8uj4bsVdpZe7ZLU
SzEXJskn3W6DiRP5ypl5
=muor
-----END PGP SIGNATURE-----

--=-oZEm4benk0uYV4kEaiSn--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
