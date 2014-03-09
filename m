From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH RFC 0/5] Hybrid approach for DT schema checking
Date: Sun, 9 Mar 2014 23:22:03 +1100
Message-ID: <20140309122203.GI20356@voom.redhat.com>
References: <1392919611-10746-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7SAgGoIHugoKhRwh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392919611-10746-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7SAgGoIHugoKhRwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 07:06:46PM +0100, Tomasz Figa wrote:
> This series adds a proof of concept framework to implement schema checker
> using a combined C and DTSS based approach. Several example bindings are
> also implemented using C and DTSS[1].
>=20
> Complex and generic bindings can be implemented directly in C and then
> instantiated from simple device-specific bindings using DTS-like DTSS
> language.
>=20
> A quick description of C part:
>=20
> A new check is registered in dtc checks framework to perform schema check=
ing
> of each node. Checking is done by searching specified schema set for matc=
hing
> schemas (by compatible, device_type or absolute path) and applying matched
> schemas to the node.

We already have an infrastructure for handling C schemas - the checks
infrastructure itself.  By all means extend/fix it where it needs it,
but implementing another layer for "schemas" as a special kind of
checks is silly.

[snip]
> A quick description of DTSS part:
>=20
> * DTSS is a DTS-like language for specification of simple bindings, e.g.
>   bindings of particular devices. The basic syntax is very similar to DTS,
>   with main elements being nodes and properties. At root level a series of
>   nodes should be specified representing particular bindings:
>=20
> 	/dtss-v1/;
>=20
> 	binding1 {
> 		/* Definition of binding 1 */
> 	};
>=20
> 	binding2 {
> 		/* Definition of binding 2 */
> 	};
>=20
> * Matching key for each binding can be specified using /match/ keyword:
>=20
> 	root-node {
> 		/match/ path =3D "/";
> 	};
>=20
> 	wlf,wm8903 {
> 		/match/ compatible =3D "wlf,wm8903";
> 	};
>=20
> 	pci-bus {
> 		/match/ device_type =3D "memory";
> 	};
>=20
>   Currently supported matches: path, compatible, device_type.
>=20
> * Bindings can be specified either by listing properties they require
>   (or can use) directly or by instantiating generic C-based bindings.
>=20
> 	binding {
> 		required-property;
>=20
> 		/optional/ optional-property;
>=20
> 		/require/ required-generic-schema;
>=20
> 		/use/ optional-generic-schema {
> 			schema-argument =3D <1>;
> 		};
> 	};
>=20
>   Generic schemas are implemented in C, as described above, and can use
>   arguments specified in DTSS as properties. /require/ calls the schema w=
ith
>   required=3Dtrue, while /use/ with required=3Dfalse.
>=20
> This is based on Stephen Warren's C based DT schema checker proof of
> concept patch adding C-based validation[2].
>=20
> TODO:
>  - specification of subnodes directly from DTSS,
>  - specification of simple property values from DTSS (cells, strings,
>    phandles),
>  - reporting of unrecognized properties,
>  - probably many more...
>=20
> [1] Device Tree Schema Source
> [2] http://thread.gmane.org/gmane.linux.ports.arm.kernel/275896
>=20
> Tomasz Figa (5):
>   dtc: Add helpers for various message levels
>   dtc: livetree: Add more tree parsing helpers
>   Another try of DT schema checker using hybrid C and DTSS based
>     approach
>   Add sample C-based generic bindings
>   Add sample DTS and DTSS schema
>=20
>  Makefile                                  |   2 +-
>  Makefile.dtc                              |  10 +-
>  checks.c                                  |  15 +
>  dtc.c                                     |  17 +-
>  dtc.h                                     |  57 ++++
>  dtss-lexer.l                              | 291 +++++++++++++++++++
>  dtss-parser.y                             | 341 ++++++++++++++++++++++
>  livetree.c                                | 230 +++++++++++++++
>  sample.dts                                |  70 +++++
>  schema.dtss                               |  86 ++++++
>  schemas/clock/clock.c                     |  77 +++++
>  schemas/gpio/gpio.c                       |  93 ++++++
>  schemas/i2c/i2c.c                         |  42 +++
>  schemas/interrupt-controller/interrupts.c | 452 ++++++++++++++++++++++++=
++++++
>  schemas/mmio-bus.c                        |  97 +++++++
>  schemas/schema.c                          | 311 ++++++++++++++++++++
>  schemas/schema.h                          |  89 ++++++
>  srcpos.h                                  |   2 +
>  treesource.c                              |  22 ++
>  19 files changed, 2300 insertions(+), 4 deletions(-)
>  create mode 100644 dtss-lexer.l
>  create mode 100644 dtss-parser.y
>  create mode 100644 sample.dts
>  create mode 100644 schema.dtss
>  create mode 100644 schemas/clock/clock.c
>  create mode 100644 schemas/gpio/gpio.c
>  create mode 100644 schemas/i2c/i2c.c
>  create mode 100644 schemas/interrupt-controller/interrupts.c
>  create mode 100644 schemas/mmio-bus.c
>  create mode 100644 schemas/schema.c
>  create mode 100644 schemas/schema.h
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7SAgGoIHugoKhRwh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTHFzrAAoJEGw4ysog2bOSd6EQALNIa4ncj8O9dbc3PIwybRJM
WgMXDQe+i+KqoIPtzxNGrW1wUAB+3h71zQohaWwDrG7sTt1rhAWYv3566ORLm9v1
ss1K2ckUWAPikV/dNkWPhy2s2mUCYwWat4m7OMqijSyQk3F4MUG3sYqLkSnLgtG4
8bdLDNWUDucvvaBcV+ZDfvP9AL7+K2lr9ZwaSdxJJDCKNc9lX16Xih4gXfunOrXz
AQjOEa1cTdvatqxOxg9qJW+mBwq3UiJaIA/5qZRguX0C4IUjucd4b2aHPFtxwB6S
H9GhBxUpHRFscajG5t6yw/lNwMgvtHkmhyt/pqDhAi5emat0/UFeY8hUcVYsbzur
ym6QqEGpgMx62GhtnzC21eDD+TSwQsqxwTbkUlycM+iq09c4pY43dOgiVGzuNnCZ
cT3jMMaYYRRPyxGRLdIBQZC3RA84qno3yC5Mx5pH6fX7+T9DUJxu6/QWlOz4oReX
aUPPLxfBz3uAAhJiyn6hv5ClzFpL8SirSrDhHryeMT7toj1MBpUBCm+btzj2gs0L
zlLr1MegJDh6guS1vMg1Jxjk//GQzwclZ3bDbKnNW3rsoZs2am9Zw38K1RGLp4bG
Be37Y0wT+NRME64txqrUquXvy3gdsZ3qS3unlfDX4D7IYYng9NzPa5gRwi+I/R5B
aXXUJ0qBGpi5hWfx2J62
=7hZ2
-----END PGP SIGNATURE-----

--7SAgGoIHugoKhRwh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
