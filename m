From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt.h: Define FDT_PATH_MAX
Date: Wed, 14 Jun 2017 23:05:22 +0800
Message-ID: <20170614150522.GE2614@umbus>
References: <1497451908-15367-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497451908-15367-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 05:51:48PM +0300, Pantelis Antoniou wrote:
> Declare the maximum path size of an FDT node.
> It is useful for manipulation methods that need to know a maximum value.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Why do you need this.  I've really tried to avoid adding arbitrary
size limits on things.

> ---
>  libfdt/libfdt.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index a248b1b..a5c93f6 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -139,6 +139,9 @@
> =20
>  #define FDT_ERR_MAX		17
> =20
> +/* Maximum path size of a node (similar to PATH_MAX in *nix) */
> +#define FDT_PATH_MAX	4096
> +
>  /**********************************************************************/
>  /* Low-level functions (you probably don't need these)                */
>  /**********************************************************************/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZQVCyAAoJEGw4ysog2bOSO4wQALZEhmIlMmxcNPA/SCVRgrLJ
DPakQm317QAnqHD9tBpjnvbKyBTDsE25xTZngVFm8+fKK4Y7i3MqdCrBAR8wzCpz
W7nFg/3qW3Q3CW6KsUrxf69TKI3HTgCppbi2modJkx8R6/s0WqQVa+wgjIgEWOjD
UvXfixs/NaVDQcFaJvmPJpgDdMQjFhWYCMZ6SW7x2jPGFbQPl+K0ftJ7DUruVLjP
mmL5X4KztJ1YckN5iHJjl7RQVaxp0fe0lTmXsNI2KSPgGTJgix39CyuSBEuU7WK0
sC4gL97x2TansUSzZbpU92o4N/r+wlwTb9Ll4izl7cvPf0Z20RrSF/c1tuc1KWMd
B11VjQjJPJWyJ0795SVU7/nmtwPH5jh+jHhWNTL+Vca5OG3+dcJGDcqmBIn+yeYS
7g+767Rp6RIgCLam6ycZA8yjMe+r2WTW8RzDvqb2NJvp7LoLalyfuIX6uJjFrJJU
sijptxvUyMBeBsFrDeiWaDlozDk71V+cBfxTf6g2e3TbWjGVraYa00dqAPjcPQW4
YWmtoFHfEKZXdeqBeW03ms+n1wCJeHT82Eh3FpsffrmB4Od66w3uxIWWyakhMath
KeFdMrmkwK4E1K/6MuKOV7MsHjQ98d6axESh76UF0leSJSW2SG5/rrPxuh5nfwS2
o6DGavEHB0I9De2AWiPO
=Cy4q
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
