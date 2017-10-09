From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Mon, 9 Oct 2017 11:00:53 +1100
Message-ID: <20171009000053.GQ10050@umbus.fritz.box>
References: <1506628736.28192.9.camel@hp800z>
 <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
 <1506973580.17981.5.camel@hp800z>
 <CAL_Jsq+vrAXQbfSGdANhqM3QJ2fHTQXDT1J6qGnTJkZ4egepNw@mail.gmail.com>
 <1507039989.17981.25.camel@hp800z>
 <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
 <1507052352.17981.48.camel@hp800z>
 <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
 <4D25319A-34A8-4FE6-8B14-616686D2192A@konsulko.com>
 <59DAAFD3.9070900@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dO6Thh8T/cwyDjv9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <59DAAFD3.9070900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dO6Thh8T/cwyDjv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 08, 2017 at 04:08:03PM -0700, Frank Rowand wrote:
> On 10/07/17 03:23, Pantelis Antoniou wrote:
> > Hi Rob,
> >=20
> >> On Oct 6, 2017, at 16:55 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >> On Tue, Oct 3, 2017 at 12:39 PM, Pantelis Antoniou
> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >>> Hi Rob,
>=20
> < snip >
>=20
> >>> eBPF is portable, can be serialized after compiling in the schema file
> >>> and can be executed in the kernel.
> >>
> >> Executing in the kernel is a non-goal for me.
>=20
> Executing in the kernel is an anti-goal for me.
>=20
> We are trying to reduce the device tree footprint inside the kernel,
> not increase it.
>=20
> 99.99% of the validation should be possible statically, in the compile
> phase.
>=20
>=20
> >>> By stripping out all documentation related properties and nodes keepi=
ng
> >>> only the compiled filters you can generate a dtb blob that passed to
> >>> kernel can be used for verification of all runtime changes in the
> >>> kernel's live tree. eBPF is enforcing an execution model that is 'saf=
e'
> >>> so we can be sure that no foul play is possible.
>=20
> Run time changes can be assumed correct (short of bugs in the overlay
> application code), if the base tree is validated, the overlay is validate=
d,
> and the interface between the live tree and the overlay is a
> connector.

In addition, no amount of schema validation can really protect the
kernel from a bad DT.  Even if the schemas can 100% verify that the DT
is "syntactically" correct, which is ambitious, it can't protect
against a DT which is in the right form, but contains information that
is simply wrong for the hardware in question.  That can stuff the
kernel at least as easily as an incorrectly formatted DT.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dO6Thh8T/cwyDjv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnavDIACgkQbDjKyiDZ
s5LRCRAAu1NpmHsm+mcRSyiYt8kKzqWeqqNL+fvL+AvKzhfQU4fVcJxCO+H+67UY
QQNswNZRBYmQlmnvuE/pZAKaSiWgcgJx33xUqV2U/OAG1vETx5U29HaQ2gfhwIy5
ld7C/H6wopR2Pj+BHUDshIBTvvTy3waz62BdS+Id+buyNT2uJ+s/GRsa7lwZM+6n
aYT2rfjqYIZfiKUkDk3aoE6AdKg1MrQvxH/4jNPIzvtHO3Z4ARXZtlAji299xHbd
sYw/eDkpUjwGRy9a/HbpT+VNk03fUzCy4wmEcU6oe7tZOApjwhbY4yrqpKVYCd5h
Nv49El0ynkJ+nSUeN9QRQclFQWlfLA+X2JBT9/hq3jYmcDTT3JWMZnBjQjZsHpWf
1y0vZc1szoV9sBsnM9er1QUOtGwAJiKY3RXXsYiMx08+AUUuo6VnaHGc5D+tJYHh
Yv1ePM6CqMAJDXQnskLYTlrEKRQUEwIap7gJW3INFDAsK3Ef31n03N0XJDgiepZF
/nGnT9QYEbZ4VYXGjTu3JtVvbCISQ+AJYkUFATHFg3FJ2Gs++xBgPlSF01u2JIja
dcIBxNctPeo6L6J9KFJEQ7oTPCciNon+3aGVLZFH2imoqFbrx0U20UPLzqHpARHV
Nw218/akFAPCu+zBJ5CeQGeMD9xFElq5EVLnBdRs3n6mpJYOG4k=
=iIVC
-----END PGP SIGNATURE-----

--dO6Thh8T/cwyDjv9--
