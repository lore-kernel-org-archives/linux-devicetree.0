From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/4] libfdt: Add max phandle retrieval function
Date: Tue, 31 May 2016 11:02:41 +1000
Message-ID: <20160531010241.GI17226@voom.fritz.box>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464337729-7821-5-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUygiN5FMnIY1JbD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464337729-7821-5-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--SUygiN5FMnIY1JbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 10:28:48AM +0200, Maxime Ripard wrote:
> Add a function to retrieve the highest phandle in a given device tree.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Needs a testcase, plus a couple of smallish problems:

> ---
>  libfdt/fdt_ro.c | 15 +++++++++++++++
>  libfdt/libfdt.h | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 50cce864283c..d5a14178190f 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -88,6 +88,21 @@ static int _fdt_string_eq(const void *fdt, int stroffs=
et,
>  	return (strlen(p) =3D=3D len) && (memcmp(p, s, len) =3D=3D 0);
>  }
> =20
> +uint32_t fdt_get_max_phandle(const void *fdt)
> +{
> +	uint32_t max_phandle =3D 0, phandle;
> +	int offset;
> +
> +	for (offset =3D fdt_next_node(fdt, -1, NULL); offset >=3D 0;
> +	     offset =3D fdt_next_node(fdt, offset, NULL)) {
> +		phandle =3D fdt_get_phandle(fdt, offset);

I think you need to check for the case of an invalid -1 valued phandle
- otherwise if there are any of those, it will come up as the max
(unsigned comparison).

> +		if (phandle > max_phandle)
> +			max_phandle =3D phandle;
> +	}

You need to check for offset !=3D -FDT_ERR_NOTFOUND, which would
indicate some other error from fdt_next_node.

> +
> +	return max_phandle;
> +}
> +
>  int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t =
*size)
>  {
>  	FDT_CHECK_HEADER(fdt);
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 6589e08db7ab..7156b264b1e9 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -284,6 +284,19 @@ int fdt_move(const void *fdt, void *buf, int bufsize=
);
>  const char *fdt_string(const void *fdt, int stroffset);
> =20
>  /**
> + * fdt_get_max_phandle - retrieves the highest phandle in a tree
> + * @fdt: pointer to the device tree blob
> + *
> + * fdt_get_max_phandle retrieves the highest phandlle in the given
> + * device tree
> + *
> + * returns:
> + *      the highest phandle on success
> + *      0, if an error occured
> + */
> +uint32_t fdt_get_max_phandle(const void *fdt);
> +
> +/**
>   * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
>   * @fdt: pointer to the device tree blob
>   *

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SUygiN5FMnIY1JbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXTOKxAAoJEGw4ysog2bOSLX0QAJDjP8C8rZWXaEtYzNBKgnaK
dT2QltSqyynC8ja5e9YLQjSpdemgx29oR/boXBJ3EzHGWS5S1kUQZxZvXl/GKEPt
neMoNHEeDFPIKid1UxYcu8dEtmHumlFjM8DkAQf9sGxQlqLBBbnId2FSbJJ7Oy45
jhHQaHKbbQHjjD5GGn+R3mqA2o+XeQkx0V+7/TQXImNohvr3EOwnvCc1FAmrGlSk
qBdOLjItYNsVM7qA3+WwIanIYFLoeds0ReirU2JJxltEPkAzSX04GCytxZScwOrR
HTUQ+BQ/vyQtSnym/7bXcdYj8aspobjdnm0Ks09rn9r+V7eYgDtK5N7RrsBGY0Q3
Xh5lL1xX2MP4AKXbSSQgiSDF7buKMzz7AajAdCbbmNao0CmDUw53dXmd02dlPlwv
eDN73kdeGjNfbSyNKz2MwvTugOJD9kmykrancQTvxbHwTR63lW+qWurZsMS8YSQP
CPY5NzUTI+8rG/GamdRxZKDSiHJmWJYauL/r40hpbNJwav+tR9ZcPrL8h0tLBOeQ
GLKBmHqoxtN2zIkpBRaCZrwNETxxhirPx6NtnntiC3hysOnqJFHcJIaEQGqrhA+V
CZBTNHxh2aUSECQaW90djFLq9V5BJauLxV9LIFQapi5aeE3XKV5Jpe1w+ITzyTx3
Zh2lFj2jMFagyplWk1Y/
=P7yn
-----END PGP SIGNATURE-----

--SUygiN5FMnIY1JbD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
