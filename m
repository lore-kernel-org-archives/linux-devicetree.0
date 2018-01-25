From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Thu, 25 Jan 2018 23:37:34 +1100
Message-ID: <20180125123734.GC2099@umbus>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <90983180-ae3b-5a31-9dc0-b62b978a0fba@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <90983180-ae3b-5a31-9dc0-b62b978a0fba-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2018 at 10:14:38AM +0100, Marek Vasut wrote:
> On 01/23/2018 10:17 PM, Frank Rowand wrote:
> [...]
> > My knowledge of bootloader use of the FDT is nearly non-existent, so
> > I'm on thin ice here.  But I am guessing that a lot of bootloader
> > processing of FDT data could be removed if the kernel would unflatten
> > a chained FDT and overlay FDT(s).
> >=20
> > Comments from the bootloader folks on this topic would be much
> > appreciated.
>=20
> U-Boot, when using DT as a hardware-description (rather than just
> passing it to Linux) usually operates on the FDT, unless explicitly
> configured to unflatten the tree. That later option is not enabled by
> default.
>=20
> The reason for that is so that the DT can be accessed very early on, at
> which point there may not be any other memory available than a very
> limited stack and the FDT blob can still be located in some read-only
> memory.

Right, this is exactly the reason that the fdt format is designed so
you can read thing from it directly.  If you're doing more than very
minor modifications, however, it does become worth unflattening.

Note that while unflatenning requires an allocator of sorts, it can be
a trivial one.  A bump allocator in a fixed buffer of reasonable size
would do fine.  You don't realy need a free(), since the bootloader
has limited lifetime you can just leak nodes until you throw the lot
away.  You can also use pointers into the flattened tree blob to avoid
allocating space for the actual property values (except for ones you
add later, obviously).  And if you make extensive enough changes that
leaked pieces really do become a problem, you could do a
flatten/unflatten pass to recompact everything.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlppz40ACgkQbDjKyiDZ
s5J0lw/+PrmPWLo0uhl1GixYtyQIflkUU7ZzMMc9sCWFdvzXIS2wqR5rk283poR4
17usLPnZeK4/ph6zPNjqTXtx/GdWTiEtTd9UdWxUxmsPzpuyNXK/QocOhSFQ6AVL
oUcwMJ80MK1Rf3YJnKYh7DDlSIJOU6ptLPrHHVdF7VzbAU9A53Bzniu/lBwLNOXP
+RYmPAZujLcZ/Pfrtjp7E1GSPc1v1LJQDZA6Qy5ntuk6BgxEd/fYNVl4xqcULbei
uxJ20R9iY4YNRiU5t1XM/YSFHXlOyEug1c4440U4bxLRIIqh7SoRK4fhws7XMCYV
avlsS7rcmy3hmQg9F/vvBzj/vkBe9nKcOsR/0Peb+0dNCIhxMrUAGkG7P5dYU1OT
z+1WO7t25BQbzFdVdg4FmlXC0IhkBCCzUR61BVWrJFB0OkZMBXZO7SfwXfZCn8Cq
7EayvLrs+gdmHt4SmyIXaeNMT9KkfzCnxemLj0PsJtNFq+nWKTji3JGefxKOvqsk
T0P4esBko3whMa55JFptocl+tbURhED716q8E3lEG0nJWNTR6JeIuoOcoCvPIaV4
8m1yFqhA6qTZ8TLdY+3wDIj2ArGrYNAMH5b9K19jGgqf6eo2KSH524qJgmnhD4o+
piFQA8VMbb7C3a/4E+xfumdaWmhFjJseCXbigUXOTfusayYrdjQ=
=68ss
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
