From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/6] libfdt: Add fdt_getprop_namelen_w
Date: Tue, 12 Jul 2016 12:03:33 +1000
Message-ID: <20160712020333.GQ16355@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-5-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pes7OZCOzfZhFQfq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160711195623.12840-5-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Pes7OZCOzfZhFQfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 09:56:21PM +0200, Maxime Ripard wrote:
> Add a function to retrieve a writeable property only by the first
> characters of its name.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
>  libfdt/libfdt.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 812937fede44..1da2c540b607 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -622,6 +622,13 @@ const void *fdt_getprop_by_offset(const void *fdt, i=
nt offset,
>   */
>  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>  				const char *name, int namelen, int *lenp);
> +static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
> +					  const char *name, int namelen,
> +					  int *lenp)
> +{
> +	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
> +						      namelen, lenp);
> +}
> =20
>  /**
>   * fdt_getprop - retrieve the value of a given property

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pes7OZCOzfZhFQfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhE/1AAoJEGw4ysog2bOSyTEQAJlvojLP5Y1sdREencj1yRtJ
m5AYlwCdnjGEaHG2tNuv70Vbvv2zXsa+jVpjz+HzzIJ/+xeB85jI8uLqYE3ZIwy9
KD6Fc8OUGfG66klglO3bAzqs1/K/dWpVxQ0kZfIMl9Qej0uMlRFyU4euCRWUqxny
CmrlDZynhwmWE7KlpFd/QfYK1wn7rhQQ6GE1oKKgwClEYig/K3CTBxZZHnOh1FDQ
7n2Gn3IyijA3Y3Cqd3FOGfZv4gRHaGlAnp7CZyj63/DeIufVPi7wyQkrq9K8SK+1
68UMGcuHUkhD7q24egt7I97L+dLEyPJPOEGFOPR9Euct/0PIQA7AcT/iA0p749Or
s1/AbFhTAH4C31SE5IIGIZgruFh90m6yN6QUjUXwctbVzTFlrlAA6pHYb/uustNf
APHiSTatUBEGRgMeXUkQulMnIqibqgpDRgkFLDBZdcy41bk9LRzRFW32YTiTXV0t
W+IYF41E5FsNGa2GU4QUBahbkmz50ZkaWnVbeQcQt1ewsHJKfDV1LyokRHIHtocT
iKO9PPngxANXoJoiyLEVYM6hTat6KLpKhBrT8vsiA4blrNpLXwWSmuU00VBAt/Fi
J4f5JqA4R34YsIOKqvJHqAXIXA5xeEBzWwxtn6MFupC7s2ImIZblyBs65FGo4fzm
I6G4NYu5LmUaMQaRNEIk
=ibJe
-----END PGP SIGNATURE-----

--Pes7OZCOzfZhFQfq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
