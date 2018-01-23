From: James Hogan <jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mips: dts: Remove leading 0x and 0s from bindings
 notation
Date: Tue, 23 Jan 2018 11:44:05 +0000
Message-ID: <20180123114404.GD22211@saruman>
References: <20171214165358.28058-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171214165358.28058-1-malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 05:53:56PM +0100, Mathieu Malaterre wrote:
> Improve the DTS files by removing all the leading "0x" and zeros to fix t=
he
> following dtc warnings:
>=20
> Warning (unit_address_format): Node /XXX unit name should not have leadin=
g "0x"
>=20
> and
>=20
> Warning (unit_address_format): Node /XXX unit name should not have leadin=
g 0s
>=20
> Converted using the following command:
>=20
> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/=
@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)\s?\{/@\L\1 \=
{/g" {} +
>=20
> For simplicity, two sed expressions were used to solve each warnings sepa=
rately.
>=20
> To make the regex expression more robust a few other issues were resolved,
> namely setting unit-address to lower case, and adding a whitespace before=
 the
> the opening curly brace:
>=20
> https://elinux.org/Device_Tree_Linux#Linux_conventions
>=20
> This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading =
0x from bindings notation")
>=20
> Reported-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
>  arch/mips/boot/dts/img/boston.dts   | 2 +-
>  arch/mips/boot/dts/ingenic/ci20.dts | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/b=
oston.dts
> index 2cd49b60e030..1bd105428f61 100644
> --- a/arch/mips/boot/dts/img/boston.dts
> +++ b/arch/mips/boot/dts/img/boston.dts
> @@ -157,7 +157,7 @@
>  					#address-cells =3D <1>;
>  					#size-cells =3D <0>;
> =20
> -					rtc@0x68 {
> +					rtc@68 {
>  						compatible =3D "st,m41t81s";
>  						reg =3D <0x68>;
>  					};
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ing=
enic/ci20.dts
> index a4cc52214dbd..7d5e49e40b0d 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -110,22 +110,22 @@
>  					reg =3D <0x0 0x0 0x0 0x800000>;
>  				};
> =20
> -				partition@0x800000 {
> +				partition@800000 {
>  					label =3D "u-boot";
>  					reg =3D <0x0 0x800000 0x0 0x200000>;
>  				};
> =20
> -				partition@0xa00000 {
> +				partition@a00000 {
>  					label =3D "u-boot-env";
>  					reg =3D <0x0 0xa00000 0x0 0x200000>;
>  				};
> =20
> -				partition@0xc00000 {
> +				partition@c00000 {
>  					label =3D "boot";
>  					reg =3D <0x0 0xc00000 0x0 0x4000000>;
>  				};
> =20
> -				partition@0x8c00000 {
> +				partition@8c00000 {
>  					label =3D "system";
>  					reg =3D <0x0 0x4c00000 0x1 0xfb400000>;

should that one actually be called partition@4c00000?

Cheers
James

>  				};
> --=20
> 2.11.0
>=20
>=20

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlpnH/4ACgkQbAtpk944
dnp5zg//RBwYHjIEPh5OFW/n304VSNYBvd9YkALJq45rMHgmHuAPuCsp2W5j1suB
4N6V5tBTKczu/ZgvjmTP2epiysBbDd7b3cLXmubzEkOTUNPZrvy04NSuL3u/+i0q
Ph8iuxgvdwRTOGnmcCwB5A4ySSZbLrdY4R47fshHxXlyTXGTkLlgGGPdcDOMhM2O
C7GKl2WwBD39MbiR1Y3bWw717UxP7KGAuCF3i7LpCcJwUZdV7X1lupg5RYEF3BZ5
V8CQfFVNnBPf1A363Dh8fPHKkJsxoSJ/qwSeqcP1zJ9YbK9osNYZHUkwi6fcm1kv
pSKSZnvTpf5LraP6p7EpIoRvMQGyuy6KLq1HQeuG0/NLwbM6oKPXKFuun57bwS3/
3CmZ+7xMJ/VDeck9GbqscFs7mn6xRtB+U1yaYUq784OnujX+h46Wm5214qWHW3DS
ffJ5uLi9/0zs9vjiGqYXiPpJV0S96MY9Rd9328Lpi0CnKZAj3p3gJDLe3zM1t+Ss
b09EbnQ5d7EtJDJV5mF+5/9a8ZoYCfKmfsWJhCgtzPznWb5JgNyWm2WcP/ERJLRo
w4Fh0ef0kKaGJL6U5fr3h5c8khfvGwHApbLtj+C85xeWh3yPYbRfxucJc1tYOo/T
4powwVm1CZTXB/g5EO7IruDJjHoIEIp72hPaZuCAuxK1T0d/8q4=
=1QxK
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
