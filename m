From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3] fdtdump: Prettify output of properties
Date: Wed, 14 Jun 2017 23:06:39 +0800
Message-ID: <20170614150639.GF2614@umbus>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497452030-15588-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497452030-15588-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 05:53:49PM +0300, Pantelis Antoniou wrote:
> Dumping files with large properties results in output with
> arbitrary long lines.
>=20
> Original (manual line breaks inserted; it's a single long line):
>=20
> / {
>     int =3D <0x00000001 0x00000024 0x00000004 0x00000000 \
> 0x000502a4 0x000000df 0x00000003 0x13885783 0x13885783 \
> 0x00000002 0x62797465 0x00000000 0x00000000 0x00000000 \
> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 \
> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000>;
> };
>=20
> After prettification:
>=20
> / {
>     int =3D <0x00000001 0x00000002 0x00000008 0x00000010 0x00000024 0x000=
000ab>,
>           <0x00000001 0x00000017 0x00000004 0x00000038 0x00000007 0x00000=
009>,
>           <0x00000000 0x00000068 0x00000214 0x0000b8d9 0x000502a4 0x00000=
001>,
>           <0x00000004 0x0000002b 0x000000df 0x00000003 0x00000002 0x00000=
001>;
> };
>=20
> There are two new options (-w/--width) and (-S/--shift).
>=20
> Width is the terminal width, shift is the amount of spaces each nest level
> increases by.
>=20
> Width by default is set to 80, and shift to 4.

Nack.

fdtdump is supposed to be a trivial debug tool.   If you want to
decompile dtbs "for real" use dtc -I dtb -O dts.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZQVD+AAoJEGw4ysog2bOSvCkP/iYDKEoqHipg+11iY+3TUxEv
VwFrJIVigK2+hTfLBcraqLb81dzPlMi4Z3+79Xh7NV/vtcpEJt8y8IEe0DLQuCMQ
OMIIk8+VRpx3bonq4oxbXEibZ2vgdJ63hz1MTONw+gr5cyuEaKu9lZ7aG59HdN1r
CyYBL0h2gOUDJeKvaP1FB0TeahGxhEHhG6a/6Exqa/jjDo4MmIimFYE9yJBVOpNC
kbKY1V7Iu+UuYrso3lLz3G62RYBiXTEFE+lBiNI5EP/dW8Anq5bdHUQ/lFTKxeuu
rOBGSWYmuv5uKrYQniHgFbZDZrC4Ue01n6XmfZmcBQ5QemGRnPyn/6bJXx0ALiMD
MRAvTI6ZymF/m/7WzxUtISOdfdUWqQwBob4mBnwZ7kWzBQ2kf4joHIbvKTTTlL9S
27QHdqoJwuLWO4J49rQr4Y5o3SfQxAtV0CtTeEGcQSg3KABA7FdFqj4QLp9Lu3Wu
sKAafbP2P8pIXa7CFZszr+Lj5AbswI4ense94qsKKRVj97vcKpV+EVZPa7uG32gj
JXRyeOeyR2kbpBCnLAyTibJsSW8vz6kfn6sxOK/tUpsJwIQwP0du9N4jdZAJ6nw4
c8NOS0UtW0YhJAtn8Zpv7+A2mXfbu27g/aOxv2Y/gow39EiK1d/wsemQbNWCr8T3
8p/dL3XBPWoSKGTJl1Zb
=QK2e
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
