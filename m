From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/6] libfdt: Add max phandle retrieval function
Date: Tue, 12 Jul 2016 12:02:01 +1000
Message-ID: <20160712020201.GP16355@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-4-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U0B5otXy6WXfork9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160711195623.12840-4-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--U0B5otXy6WXfork9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 09:56:20PM +0200, Maxime Ripard wrote:
> Add a function to retrieve the highest phandle in a given device tree.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Although one little nit in the comment that might be worth addressing
if you respin the series.

> ---
>  libfdt/fdt_ro.c     | 26 ++++++++++++++++++++++++++
>  libfdt/libfdt.h     | 14 ++++++++++++++
>  tests/get_phandle.c |  6 ++++++
>  3 files changed, 46 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 50cce864283c..04590984bd51 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -88,6 +88,32 @@ static int _fdt_string_eq(const void *fdt, int stroffs=
et,
>  	return (strlen(p) =3D=3D len) && (memcmp(p, s, len) =3D=3D 0);
>  }
> =20
> +uint32_t fdt_get_max_phandle(const void *fdt)
> +{
> +	uint32_t max_phandle =3D 0;
> +	int offset;
> +
> +	for (offset =3D fdt_next_node(fdt, -1, NULL);;
> +	     offset =3D fdt_next_node(fdt, offset, NULL)) {
> +		uint32_t phandle;
> +
> +		if (offset =3D=3D -FDT_ERR_NOTFOUND)
> +			return max_phandle;
> +
> +		if (offset < 0)
> +			return (uint32_t)-1;
> +
> +		phandle =3D fdt_get_phandle(fdt, offset);
> +		if (phandle =3D=3D (uint32_t)-1)
> +			continue;
> +
> +		if (phandle > max_phandle)
> +			max_phandle =3D phandle;
> +	}
> +
> +	return 0;
> +}
> +
>  int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t =
*size)
>  {
>  	FDT_CHECK_HEADER(fdt);
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 9d3c9b234274..812937fede44 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -283,6 +283,20 @@ int fdt_move(const void *fdt, void *buf, int bufsize=
);
>   */
>  const char *fdt_string(const void *fdt, int stroffset);
> =20
> +/**
> + * fdt_get_max_phandle - retrieves the highest phandle in a tree
> + * @fdt: pointer to the device tree blob
> + *
> + * fdt_get_max_phandle retrieves the highest phandle in the given
> + * device tree

Perhaps worth mentioning here that this will effectively ignore badly
formatted phandle properties, or phandles with value 0 or -1.

> + * returns:
> + *      the highest phandle on success
> + *      0, if no phandle was found in the device tree
> + *      -1, if an error occurred
> + */
> +uint32_t fdt_get_max_phandle(const void *fdt);
> +
>  /**
>   * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
>   * @fdt: pointer to the device tree blob
> diff --git a/tests/get_phandle.c b/tests/get_phandle.c
> index 2079591d4c49..22bd7b81b3f0 100644
> --- a/tests/get_phandle.c
> +++ b/tests/get_phandle.c
> @@ -44,6 +44,7 @@ static void check_phandle(void *fdt, const char *path, =
uint32_t checkhandle)
> =20
>  int main(int argc, char *argv[])
>  {
> +	uint32_t max;
>  	void *fdt;
> =20
>  	test_init(argc, argv);
> @@ -53,5 +54,10 @@ int main(int argc, char *argv[])
>  	check_phandle(fdt, "/subnode@2", PHANDLE_1);
>  	check_phandle(fdt, "/subnode@2/subsubnode@0", PHANDLE_2);
> =20
> +	max =3D fdt_get_max_phandle(fdt);
> +	if (max !=3D PHANDLE_2)
> +		FAIL("fdt_get_max_phandle returned 0x%x instead of 0x%x\n",
> +		     max, PHANDLE_2);
> +
>  	PASS();
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U0B5otXy6WXfork9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhE+ZAAoJEGw4ysog2bOSjNkP+wZkd1U4AL1WWFhcVTvr7wd/
vBLrwngIvgKnR0Fr4Ns3uLYUkDLNyIAERWYI3KM4ylMbvYmCJNCCK4x577mkpw6d
USl9w7WvSdmLIeXAqfqBbPrAyfMmz2UJCuSu31s1jql4RwZME+SFKKm8lJUMUidg
sAxVVw/LbWMb/9HOk/8vbMLtf1NTzb114ZBIB+4M0WAgbOq4mEwkblnRUShwyAbI
Jn5CrMO+tdFATHFHn9S5v3PXbrzZgQk8D4Ofm9GimYbGy/w2SbxqwQ2MDi4SZKKz
75kGScUuAD8FDQTpRqTREoKu7L0UA2pzRJ9eeNFF6e9mbgl+O9FQDAOyZa/fc+GH
sO3TUhjXjXZOKwy6JLrjgCiLKeKzNNNFSX3kF7IsQuDYqJX4UjqyWjrVkd5IAv5b
9x15vpHqznrLP0ns0M+Gb20QIyDbg7IYk13yOxG9pcCfMK0mAxWQyf5GEnZFo5oy
XTsMcbNQ5U51LPGGtR110JUzeoV6kYX9+XiIx0ynUwhQdrFuxeTNpkeKlw24hW/R
kemyMT//83SjxdzoTR5LD4fGU6v7lXoixtu1FN72dpdTdy65uCGiYDi7zx1wKlpy
wBJ4a2nMkUP0Q4iv5H/YWDlH9ONivX/zyABt++P1VtzOuQCfC5YHV61/1A2as5p4
KuJ9LxWk11laHTvSWLic
=VcyQ
-----END PGP SIGNATURE-----

--U0B5otXy6WXfork9--
