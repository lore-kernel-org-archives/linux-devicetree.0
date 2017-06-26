From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC support for A83T
Date: Mon, 26 Jun 2017 19:15:24 +0200
Message-ID: <20170626171524.cqfyasetpsfr6xfg@flea.lan>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-3-techping.chan@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ntcxmtfx3hmrdmuz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170624024515.4669-3-techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ntcxmtfx3hmrdmuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 24, 2017 at 10:45:14AM +0800, Ziping Chen wrote:
> From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Allwinner A83T SoC has a low res adc like the one
> in Allwinner A10 SoC.
>=20
> Add binding for it.
>=20
> Signed-off-by: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt=
 b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> index 4357e498ef04..525d85e3043f 100644
> --- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> +++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> @@ -2,12 +2,14 @@ Allwinner sun4i low res adc attached tablet keys
>  ------------------------------------------------
> =20
>  Required properties:
> - - compatible: "allwinner,sun4i-a10-lradc-keys"
> + - compatible: should be one of the following string:
> +		"allwinner,sun4i-a10-lradc-keys"
> +		"allwinner,sun8i-a83t-r-lradc-keys"

This doesn't really have anything related to keys, and can be used
purely as an ADC.

I know this is the compatible that was used for the A10, but I'd
rather drop the keys for the the new compatible.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ntcxmtfx3hmrdmuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZUUEsAAoJEBx+YmzsjxAgNoIP/2RE0M1RveOQxP6mPdbSIbPH
VZPLy8lO3zIYBXwtCZGcMD3eOiVUSBUYgvhnGQpkRxngA7DfSzDHinBZd5OuQFm4
r0Hc57gP8Y1jpjQokj9XJk1HB3j3cn8dlzqbh7D+c1NOOaYVIbVMUtWJ7akxlDMW
R2AD2jF2nZHARdijA2LMJ1a2tC5MORq/MSSEYW+czI8niVsz7boaGNzpjBJQ8phY
+xmYI9fwguLOG/0jOfCV8ABHP1dhesI0fKkcelP9JVb6M9FyPN33N/a3IJVVrdqJ
+QOui9QwPmVxgKSDCGrCWK/yW22hG8kzA2XwYGMCN8iPUBIpXKyENkC+5+BffnBp
pu5vuLLi+kx1YHAL1lXayj5fI6sX3DUdi4s/93i1971aQllIhDexlVU00zW9fvJt
6me7A4DD2IP9scWV6cNPmdE1ik50FJ+DPvC83Mn1n31Vo2cbzyeM7eCWybg8ebNO
Q8aZU/iNzPRqP4g3IxOR5LRR85C0AT3lV66b55IFP3LKMuHlq4iZnXPhdJ/B5khW
E2zbv/53pR2wsHgjm8iQ9jx3gNkFB5z2dahkluIskn1Ovn7xlMrZIbboWoSihnuK
Gh+eCcaSFsMZxtWH8W18C/zPf/9PzqWqEnG4bAY5+GeGoCAES3p/5GFBUsrqAsaP
QHd4aPTIa3u6VgYtEg+r
=Pu70
-----END PGP SIGNATURE-----

--ntcxmtfx3hmrdmuz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
