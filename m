From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] Overlay syntax sugar using <&label>
Date: Thu, 28 Sep 2017 17:01:45 +1000
Message-ID: <20170928070145.GB6445@umbus.fritz.box>
References: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497451986-15515-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 05:53:03PM +0300, Pantelis Antoniou wrote:
> This patchset makes overlays simpler to write by utilizing
> the standard &label { }; syntax instead of the manual
> method which is more error prone.
>=20
> Pantelis Antoniou (3):
>   overlay: Documentation for the overlay sugar syntax
>   overlay: Add syntactic sugar version of overlays
>   tests: Add a test for overlays syntactic sugar
>=20
>  Documentation/dt-object-internal.txt | 17 +++++++++++++++++
>  dtc-parser.y                         | 20 +++++++++++++++++---
>  dtc.h                                |  1 +
>  livetree.c                           | 22 ++++++++++++++++++++++
>  tests/run_tests.sh                   |  6 ++++++
>  5 files changed, 63 insertions(+), 3 deletions(-)

Sorry I took so long to look at patches 2 & 3.  I've had travel and
sickness, and business at day job and, and, and...

Long term I'd still prefer to handle overlay construction as a
separate processing pass, rather than during parse.  However, that
won't change the interface / syntax, so it can be fixed up later
without breaking things.  Therefore, I've merged patches 2 & 3.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnMnlcACgkQbDjKyiDZ
s5LNxhAAiSK0g2WVWgYooJNtLP5cNCuS/4iZ3dBWYzteN3fsYdLWgtBlLmXGGzaU
9ow6XK5zbj6v0218q2PVB+6UPaQWnm+IN872+3n4S1u7IerZI3EnZLN2KhTG8dED
TJI017E6vdoYgHjJTdgOaFXZavDWwiRkNAlRh/xWQcRF56F0gWVC1MtnZBoaRMg5
GgvAh5XywlBuJoJ+LoS5SwpxcLthPLz+HdOrtf0SHmKrI0lYdi7CbNeH/Cy8jGFW
eHWbaWVACAhQNK38kdimv7lTptFERRVhirLbdN0wY7I4hEMwTEs4Evy2dmFNJ0QB
sCOOePyWBQ2oyPHnFK340PT7BZXF5FpNIK0FVTluy867+DiHj8z/DcPgJV5nbijj
dgmqqsH2BGoOLXXk3m0h5tPx3ubIuBN3sN/6xANX0O1SmW5v3AiF3iYlGEYFqmGS
WXwkJsOjeLY4EbjG4SORcHyx2wulnJxZNz5gUuZbmiTZbN2RVF/CafXMRYKTBfe0
edAiyOObK8Kopq0wQ191AyknFE8cELdzY8R2qUa4PMt7fKjlUQjfjA6OOX/PfWld
52GYwRb9xLfrNddeHZhos1O/oY7B1Nu7sSKRuU89PSpcr5L2kiphGkBb9rqGaLhd
xWzT4elU2bTmUE7bCw9YWlWyPqO/4ErtXKsUB03qQEAx5s6UvUo=
=rheo
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
