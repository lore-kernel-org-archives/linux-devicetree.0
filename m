From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/2] fdtoverlay, an overlay application tool
Date: Thu, 15 Jun 2017 15:40:15 +0800
Message-ID: <20170615074015.GA30484@umbus>
References: <1497451872-15289-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497451872-15289-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 05:51:10PM +0300, Pantelis Antoniou wrote:
> libfdt supports overlays, so it's trivial to create a tool
> that applies them on a host using binary blobs.
>=20
> fdtoverlay is that tool which given a base tree and a number
> of overlays generates a target blob as the result.

Applied, thanks.

>=20
> Pantelis Antoniou (2):
>   fdtoverlay: A tool that applies overlays
>   tests: fdtoverlay unit test
>=20
>  Documentation/manual.txt    |  14 ++++
>  Makefile                    |   5 ++
>  Makefile.utils              |   6 ++
>  fdtoverlay.c                | 168 ++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/fdtoverlay-runtest.sh |  40 +++++++++++
>  tests/run_tests.sh          |  27 ++++++-
>  tests/tests.sh              |   1 +
>  7 files changed, 260 insertions(+), 1 deletion(-)
>  create mode 100644 fdtoverlay.c
>  create mode 100644 tests/fdtoverlay-runtest.sh
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZQjncAAoJEGw4ysog2bOSTYAP/jOKKAnAmIXFCaxo6bRDwtxd
tFTJaNHatavQ5hLB6ljQAann6H1FxsoI35DvV4ehZs9104rXPCBETEWRUjxQzTrC
YVT0WO3eZ7e+i6Wjn/9Thz4x7KR6azWA9gIpQrsrqpyNnb6ovDUaTpoaj+MH9rxt
n3uueAK4rcO28ezVafdskTqY8FMjDz8Trp2YLoj92fKHjTPmibn/ed2AXCyL+hqx
D7uT0tQaSKGZMH8+8K9vdaUZZ0yApbkPSKXAlsEgGXQwH0SSHzVfSIK8adwKEzTP
pPKpF3ud68mVxi4n0BG6aKbhRj7VPkcQpesyCH2gVmLrs0Au3AZzIunOKQBUDrKf
su/Z5wQE3sQqUiFo0toeRKf8cAdr1T8ZcJcVn+DMfX8Drf5pn7qSd0497ZxC4IHc
20APEp7pM3XZhCEqui93YUWKFWXUTGLEiWEF6Jj11PD3c86WKp1GncCBpu+ZHUPK
mc8M4RtuuTHlHVQ4YchkJtT2sjTRDiSt6JULOH20XUNeAKvTdCuw0EKK/NtUm8TR
8ulQwKapp0E2USyc7dUpi1mjuMqLgbKu7oJhrBzsPYDgQ160ZPsuf52kQ2XdMLP/
Pb/HdtqDsljoJ691Q/fuKli0zbWc8fiEBuq0GpEMK94QsWfoUMgbqgyUgKc0mULN
vP+fJfOYVGPnNlRIy9F4
=wO4P
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
