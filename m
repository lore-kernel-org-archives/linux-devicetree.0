From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Introduce fdt_get_path_len() method
Date: Mon, 17 Jul 2017 20:43:30 +1000
Message-ID: <20170717104330.GB4535@umbus>
References: <1499894612-25643-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499894612-25643-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 12:23:32AM +0300, Pantelis Antoniou wrote:
> This method returns the length of the full path of the node so that
> it may be used without having to call fdt_get_path() using a worst
> case sized buffer.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Hm, I can see why you want this, but the implementation is a bit
horrifyingly slow - even by the standards of the slow functions in
libfdt.

I originally intended for the get_path() function to return the path
length, even if it wouldn't all fit in the buffer.  However, I wasn't
able - the buffer into which it builds the path doubles as a sort of
stack keeping track of where we are.  It could be replaced by an
explicit stack, which might be smaller than the buffer, but it's still
a data structure of indeterminite size, which is pretty awkward here.

In most cases I'd suggest a user just use get_path(), then retry with
a larger buffer if it fails, but obviously that doesn't really work
=66rom within the overlay application code either.  I have some ideas on
how to avoid the need for a get_path_len() which I'll expand on in
that thread.

> ---
>  libfdt/fdt_ro.c | 28 ++++++++++++++++++++++++++++
>  libfdt/libfdt.h | 22 ++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 08de2cc..8b67f2f 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -438,6 +438,34 @@ int fdt_get_path(const void *fdt, int nodeoffset, ch=
ar *buf, int buflen)
>  	return offset; /* error from fdt_next_node() */
>  }
> =20
> +int fdt_get_path_len(const void *fdt, int nodeoffset)
> +{
> +	int len =3D 0, namelen;
> +	const char *name;
> +
> +	FDT_CHECK_HEADER(fdt);
> +
> +	for (;;) {
> +		name =3D fdt_get_name(fdt, nodeoffset, &namelen);
> +		if (!name)
> +			return namelen;
> +
> +		/* root? we're done */
> +		if (namelen =3D=3D 0)
> +			break;
> +
> +		nodeoffset =3D fdt_parent_offset(fdt, nodeoffset);

The basic problem is that fdt_parent_offset() is already a slow
function requiring a full scan of the blob, and it's called here
repeatedly.

> +		if (nodeoffset < 0)
> +			return nodeoffset;
> +		len +=3D namelen + 1;
> +	}
> +
> +	/* in case of root pretend it's "/" */
> +	if (len =3D=3D 0)
> +		len++;
> +	return len;
> +}
> +
>  int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
>  				 int supernodedepth, int *nodedepth)
>  {
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index e01c645..2c0b570 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -765,6 +765,28 @@ const char *fdt_get_alias(const void *fdt, const cha=
r *name);
>  int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
> =20
>  /**
> + * fdt_get_path_len - determine the length of the full path of a node
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose path to find
> + *
> + * fdt_get_path_len() computes the size of the full path of the node at
> + * offset nodeoffset.
> + *
> + * NOTE: This function is expensive, as it must scan the device tree
> + * structure from the start to nodeoffset.
> + *
> + * returns:
> + *	> 0, on success
> + *		length of the full path of the node
> + *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_BADSTRUCTURE, standard meanings
> + */
> +int fdt_get_path_len(const void *fdt, int nodeoffset);
> +
> +/**
>   * fdt_supernode_atdepth_offset - find a specific ancestor of a node
>   * @fdt: pointer to the device tree blob
>   * @nodeoffset: offset of the node whose parent to find

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAllslMwACgkQbDjKyiDZ
s5LEVhAAwnJPPW/ytB5i56WBso1vsT4VaiKijj6aYLEB6PZfosD/Uw9TMNcqjzWu
3jTAffu8a0xQuxagqosNR7Gr7vnwAPfcCR25areMLWdfctmhu9wmxnadQcrexWr0
bE0SnpNNRWNMuklHF0qNq/SAM3l8aXrWuBmmH3Wj3Li4j15AeTWgSBcvxd8jNz8t
HGynAq8EJbKfNMI5wyJBqcQjGWvq1eZu4tFk0hFinWayu3KkRfOmDhG41qDh1GPv
Z+VQdL6NSGAUeb1cHZ4+qEiJJb4QpX9DkajDFd3XQZPHplChq5LDB64S22gkQkTL
/vcpYALkdBfiIt2z+dIr+TRYY29gP0CEFu3TzXiuNZ5xQyPDaAc1M/jB9V5VNZm8
YP7p1kmXMxNlFaKxbewzS+o3UjXXAQVyeOZ7yszIIXNo1Yxg8xmInFpXxZ+Okydi
zo/d+4RFTAF2axa8yBdtcrHGBnrXWJEae8ujEPcb8mlwUOTA8DnCRqW1QsnBbirq
AFBWI2l0500zKCnLytIYBD64x70SLxBddTUoBV7D0H1WGYgbQO/mNdIAqmksfs/f
KSTPwXr7qnZNOsuDJQBDx419QDsUDA32ARr8PfSqpF5Fw1CZGV7AV2GSTEk1lKGf
JwHLAHvdLl2byr26wPRYA6oieAutCNaafHCBMzidNaNOd2czVpM=
=WrZf
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
