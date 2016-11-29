From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v11 3/7] tests: Add check_path test
Date: Tue, 29 Nov 2016 13:40:15 +1100
Message-ID: <20161129024015.GF13307@umbus.fritz.box>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480349141-14145-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SnV5plBeK2Ge1I9g"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480349141-14145-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--SnV5plBeK2Ge1I9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 06:05:37PM +0200, Pantelis Antoniou wrote:
> Add a test that checks for existence or not of a node.
> It is useful for testing the various cases when generating
> symbols and fixups for dynamic device tree objects.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Can you please add a test-for-the-test by putting a couple of
invocations of this on test_tree1 into the runner script (one 'exists'
and one 'not-exists' should suffice).

> ---
>  tests/.gitignore     |  1 +
>  tests/Makefile.tests |  3 +-
>  tests/check_path.c   | 82 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 85 insertions(+), 1 deletion(-)
>  create mode 100644 tests/check_path.c
>=20
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 354b565..9e209d5 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -8,6 +8,7 @@ tmp.*
>  /asm_tree_dump
>  /boot-cpuid
>  /char_literal
> +/check_path
>  /del_node
>  /del_property
>  /dtbs_equal_ordered
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index eb039c5..3d7a4f8 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -25,7 +25,8 @@ LIB_TESTS_L =3D get_mem_rsv \
>  	integer-expressions \
>  	property_iterate \
>  	subnode_iterate \
> -	overlay overlay_bad_fixup
> +	overlay overlay_bad_fixup \
> +	check_path
>  LIB_TESTS =3D $(LIB_TESTS_L:%=3D$(TESTS_PREFIX)%)
> =20
>  LIBTREE_TESTS_L =3D truncated_property
> diff --git a/tests/check_path.c b/tests/check_path.c
> new file mode 100644
> index 0000000..0d6a73b
> --- /dev/null
> +++ b/tests/check_path.c
> @@ -0,0 +1,82 @@
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Testcase for node existence
> + * Copyright (C) 2016 Konsulko Inc.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public License
> + * as published by the Free Software Foundation; either version 2.1 of
> + * the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 =
USA
> + */
> +
> +#include <stdio.h>
> +
> +#include <libfdt.h>
> +
> +#include "tests.h"
> +
> +#define CHECK(code) \
> +	{ \
> +		if (code) \
> +			FAIL(#code ": %s", fdt_strerror(code)); \
> +	}
> +
> +/* 4k ought to be enough for anybody */
> +#define FDT_COPY_SIZE	(4 * 1024)
> +
> +static void *open_dt(char *path)
> +{
> +	void *dt, *copy;
> +
> +	dt =3D load_blob(path);
> +	copy =3D xmalloc(FDT_COPY_SIZE);
> +
> +	/*
> +	 * Resize our DTs to 4k so that we have room to operate on
> +	 */
> +	CHECK(fdt_open_into(dt, copy, FDT_COPY_SIZE));
> +
> +	return copy;
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	void *fdt_base;
> +	int fail_config, exists, check_exists;
> +
> +	test_init(argc, argv);
> +	fail_config =3D 0;
> +
> +	if (argc !=3D 4)
> +		fail_config =3D 1;
> +
> +	if (!fail_config) {
> +		if (!strcmp(argv[2], "exists"))
> +			check_exists =3D 1;
> +		else if (!strcmp(argv[2], "not-exists"))
> +			check_exists =3D 0;
> +		else
> +			fail_config =3D 1;
> +	}
> +
> +	if (fail_config)
> +		CONFIG("Usage: %s <base dtb> <[exists|not-exists]> <node-path>", argv[=
0]);
> +
> +	fdt_base =3D open_dt(argv[1]);
> +
> +	exists =3D fdt_path_offset(fdt_base, argv[3]) >=3D 0;
> +
> +	if (exists =3D=3D check_exists)
> +		PASS();
> +	else
> +		FAIL();
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SnV5plBeK2Ge1I9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPOqPAAoJEGw4ysog2bOSb5AP/32zmCJ0gaw8HXV8S0WV226c
40Ux5+Dx6yLUfc6l+26thHDPwQsBfKjf2Y47nKo5OWiHu/nHW+KKPUs5ZzuZViga
2+Kmh7PA7Ep4m5fO4GKocdny6mvLBFSNZ0JzRkW39dsIcTJQ9X/7GFMEOK3chSsG
j3jPtCX2ZwLUXq5eqVPaXMZMLSNcg70hUb1Y74IQfPc8lUKbA+4ydFGLsLwbTCdq
MB+AaGNfxC3Estrb9ITtkSTXxrWfZfkLFoPVYWHVLOb2jQS4t8dQwGyxVsJp18pD
BErzpCElMPFFh5m7FJ6qWXgEY6FlPYUo5q0RtTuQ3bpVvqL8b7mJXNB3DeopFWOE
xoDl3QMWFcC+1lilC+5+TQVEUj9rT5C0kmItj027n+qUj3jH0q/MddEPqcHVo2y5
MIZWmUB1XOXeJfVdopIrEwztTSAK/ED0lKLMDRysLsaZBq//OFIRcjWzYUjt/uCp
Bp1BN1Xbjv+uAhjTb0F4AnyMcQvGtCkIZ+6Dg1wYBxPZj0PeExSz6zoWwDKgRxzg
fJdrGERvt6qbU+mtaHTPWYbvtAkKRin+oWOBaTZtYsRbIJa5bOgrBBicIs0s+2Zt
ntmDLRhRph6G+/994ednVbIrKoWYEiGxmaUVoOMa99c6juMSEC8Byb6+vfxZQzsg
u3g7bxA+bsEeTq99uMyv
=e0+g
-----END PGP SIGNATURE-----

--SnV5plBeK2Ge1I9g--
