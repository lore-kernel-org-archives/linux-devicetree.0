From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] ARM: dts: vfxxx: Add OCOTP and OCROM nodes
Date: Sat, 6 Jun 2015 13:58:33 +0200
Message-ID: <20150606115833.GP23777@lukather>
References: <cover.1433494491.git.maitysanchayan@gmail.com>
 <fd4fcd83d901b2563ddbce84b339f42778c71260.1433494491.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Iuot8e5drzPqTM+3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fd4fcd83d901b2563ddbce84b339f42778c71260.1433494491.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Iuot8e5drzPqTM+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 05, 2015 at 02:52:37PM +0530, Sanchayan Maity wrote:
> Add a device tree node for the On-Chip One Time Programmable
> Controller (OCOTP) and the On-Chip ROM.
>=20
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 2f4b04d..ed9b6b8 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -56,6 +56,13 @@
>  		compatible =3D "simple-bus";
>  		interrupt-parent =3D <&mscm_ir>;
>  		ranges;
> +		ocotp-cfg =3D <&ocotp 0x410 0x420>;
> +		rom-revision =3D <&ocrom 0x80>;
> +
> +		ocrom: ocrom {
> +			compatible =3D "fsl,vf610-ocrom", "syscon";
> +			reg =3D <0x00000000 0x18000>;
> +		};

Shouldn't that use the new nvmem framework currently being discussed,
instead of defining custom bindings?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Iuot8e5drzPqTM+3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVcuBpAAoJEBx+YmzsjxAgIX4QALmzL8VtkAPXat7qUv9BXGPg
aFBp5/itVZzY6U1qhxpD9KdW4CMeFb5hYV9zZflRlvjS5+Lies94gJti965TAzJ5
KG2BHaexGklkzVBfqRJsq1gm6jaCseat9dBOIvPgMuXjmG8PifSczW8Rn2lpDXUs
d7Y4ITnGgsMacX587CX3+Vlop4Xf2cmD4HcQ+QuVkPzmO8RXAKnW35lmPcO003PP
y7H18st+fp67m7S8zCIWLvheIWKEo/DTj5v2YKLcop8n3wlTtA0/KWjATrm2m72m
Nkb0jhuRfBw9PFcAIKZ/QFxxZbitukEVpsMKqEnwwZvtxdJ3bX843AufNkY3Ajh4
DA2v/4WYLtMIj3uvZUAM9M3UBncV6MebMJn6W4urN07gvzTjsSKs5c+85aRN/mKN
A+ubtNleCWTW2Y9yTwJfjeXOA1DM2m5lEuKgcrA7Ok6/csIOaBBd3mRuoBoBnBha
MA9dD5o8m2ELpNbnoa6zOvE+J/ooY4up5735bIfOAjra0FZ2LusKBGWK9kBQ0Eh3
n5HUdd9YVWP55I4k+5xwChIJbpJQRBvsHLf5BxqD4lbMEODsPSKK9H4w/PyfXqxw
piYFPdCgEc0X51Y4eARA+KpAaiVqq59Nle9YBcgxih6UUAzCZv0NqF1+u01QG+nG
55VxD4Rcn6i1/iKdTv/9
=6Yxe
-----END PGP SIGNATURE-----

--Iuot8e5drzPqTM+3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
