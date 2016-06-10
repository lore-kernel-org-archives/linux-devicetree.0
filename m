From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH] [V2] ARM: dts: sun7i: Add dts file for
 Bananapi M1 Plus board
Date: Fri, 10 Jun 2016 11:39:22 +0200
Message-ID: <20160610093922.GR5242@lukather>
References: <574FF94B.3020309@web.de>
 <20160603061336.16263-1-luoyi.ly@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uX7BrQs69PbBafpd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160603061336.16263-1-luoyi.ly@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: luoyi.ly@gmail.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--uX7BrQs69PbBafpd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 03, 2016 at 02:13:36PM +0800, luoyi.ly@gmail.com wrote:
> From: Luo Yi <luoyi.ly@gmail.com>
>=20
> Remove the extra empty line and add signed off.=20
>=20
> Signed-off-by: Luo Yi <luoyi.ly@gmail.com>

Please send a new patch.

> ---
>  arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/=
boot/dts/sun7i-a20-bananapi-m1-plus.dts
> index 6fd55d7..f9063ba 100644
> --- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
> @@ -47,7 +47,6 @@
>  	compatible =3D "sinovoip,bpi-m1-plus", "allwinner,sun7i-a20";
>  };
> =20
> -
>  &codec {
>  	status =3D "okay";
>  };
> @@ -62,11 +61,8 @@
>  		interrupts =3D <7 15 IRQ_TYPE_LEVEL_LOW>;=20
>  		interrupt-names =3D "host-wake";
>  	};
> -
>  };
> =20
>  &mmc3_pins_a {
> -    /* AP6210 requires pull-up */

And that comment was fine, why did you remove it?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--uX7BrQs69PbBafpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWorKAAoJEBx+YmzsjxAgaJEP/1DKKYT6meFXPIogH3tQAVik
bURtlOPUZMG65NDuVeTWy7xky3sgJ5njl0my1NTri41L3xfgVd+DolvxaACULOwM
vRwR/JI1uE+crIk5PKXY0uYjm8AD/+rHGjMuvUBhDWpCJtKZUAoAt7N5G7KmpmIu
Jo5J/dDTGLTVDgJKgFaMXttX3NuoP1XgQ800gK5B+dJA3vr8lTtutKmDQA05Eewk
dES5411PgvjmuWSt84+AZJANfUUVcjyQtka155lMA6hBmKawxR2EBoK7hLsktBsr
9YVrEAsoamFjpjI2oDzHSr/6rXkosDqxyiHQ3HL2kmhi+U0T5bYogvQ4WnZDVmhU
MkxiKgPbPntFTnOeQSuGvUqrS4GXTP4w7aZLWPpnpDNbI57ugapNT8/rFQj9uukz
IR4a9GO8nLh6e5R46y4JpVtPO7S12ygOr5f8WHCcSqsBUOTFu2agKB8rjY58zNHs
A/aP+dl32tiLENaW9ZL3LqSFQN7NU7H/mzOA1005mBDHIWRD2pDzCQbvSBuEdZgi
1rL3WzS6LeDjdrUAk8aDKk7UM0YnZtUt81TXuCyDH/nzQo4qa4E+ofTw0cNfAVHm
YF560Vq0v1danuv9e/xAYo4+PGa+0iE34XPMmZbgG6HCEJm/UEurcxL+9mwyadrT
ATQaVHAsuhbvL2hYRQ9M
=K4O/
-----END PGP SIGNATURE-----

--uX7BrQs69PbBafpd--
