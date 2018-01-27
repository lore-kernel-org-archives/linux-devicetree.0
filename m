From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Sat, 27 Jan 2018 19:56:56 +1100
Message-ID: <20180127085656.GA12900@umbus>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A@mail.gmail.com>
 <e1bec77d-4dac-200b-34be-23573bf738f0@gmail.com>
 <e986435b-481b-2629-7600-10d9e21ac58e@gmail.com>
 <20180125122912.GB2099@umbus>
 <CAMuHMdV0jdj90uzqMx_wtvz=-KaagJG2_UQTm1DW3gzt6cNG6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV0jdj90uzqMx_wtvz=-KaagJG2_UQTm1DW3gzt6cNG6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marek =?utf-8?B?VmHFoXV0?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2018 at 09:56:21AM +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 25, 2018 at 1:29 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Jan 24, 2018 at 04:22:15PM -0800, Frank Rowand wrote:
> >> On 01/24/18 13:16, Frank Rowand wrote:
> >> > What you say makes sense.  So I'll reverse myself and say that for
> >> > Linux, we should update the FDT read code to scan all chained
> >> > overlay FDT(s) as well as the base FDT.
> >>
> >> < snip >
> >>
> >> What I wrote was somewhat ambiguous.  What I meant by "FDT read
> >> code" was functions that check for existence of nodes in the
> >> FDT or read property values from the FDT.
> >
> > Oh.. not just FDT unflattening code.
> >
> > The trouble with this is that scanning for a specific node or property
> > in a set of chained overlays is highly nontrivial.  Even if you set
> > aside the arguably self-imposed design constraints in libfdt, you
> > can't just do the same lookup in each fragment: along the way you need
> > to resolve the path at which each fragment applies.  That in itself is
> > non-trivial.  If you have overlays applying on top of other overlays,
> > that could involve recursive lookups of things from previous overlays.
> > It's spectacularly complicated and we have to do it on *every single*
> > read operation.
> >
> > Either fully applying the overlay in flattened form, or (even
>=20
> Applying the overlays in flattened form sounds like a good idea to me.
> It still adds complexity, but handling multiple overlays can be done by a
> simple iteration, not recursion.
> The end result will always consume less memory, and will thus fit in the
> original block of memory allocated for base FDT and overlay FDTs, unless
> the base FDT and overlay FDTs are in FLASH (this assumes chaining really
> means appending, not using an external chaining mechanism).

You will require some temporary stprage though, because you'll need to
expand the base tree enough to apply each overlay before you can
discard it.

> > temporarily) unflattening the tree are better solutions.
>=20
> Temporary unflattening sounds like a waste to me:

A waste of what, exactly?  Neither flattening nor unflattening is
terribly difficult or expensive.

> it must be redone again
> later anyway. Applying the FDT overlays early on will make that later step
> simpler (no more overlays to handle).
> So if you need information from an FDT, you can help later steps by
> applying the FDT overlays right away.
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpsPtgACgkQbDjKyiDZ
s5KmSxAAk2TiRrvRH1cKYdKU9KLcXKky+QoUJ41s6TDOILVJJ5Qc0pDcMjh5tOYx
bmHebBf4Eq/mLMl7NvC7a4nKQtXnFtVZ7XdzmzSHxYCvbNYYer/vLKXf8i4k6enE
N/XSdi4vpNKLosIyMdmlY/B2FWu8F8/bvCyGqXcYMxTZvLYa7bu8R6yhLj7kLL6T
amY+UtAg+V3MaMBXs6g5Q4EPGOl9KO6FzpRXGG0yWxp2VLX9O4GoIO8y7EKTOAxy
ITnxhmPogL/91OBPqQLBib66GgOqfnSKST5IrAK1psWYQPaWbEB4g2Y+Ilpisir7
oUyxpoD2/N7plfOamCePI/C/UjY1gAWDYS/uixgk8q8Xh2RFSAuZQu1vy+g/ztpJ
Kzxe7jlpHBMBzsXAzkN0UrHSlpPsxMzssD/Yw4DEk4Rq5UWdyqeHAkZr57U5VpCc
A+AdIW41IA+lXcHTylnaYCTPOg17Xn4MnavCqy47Mjc0W7tU3B+/TDNqr6GjCQ18
9PTzWwz4TETr2bN9qmSUjq2fzrE9GSSYna3FKqN+XnKBySdv4i7Pxd/Jgq11Lgr8
bHp669B8tkUj/cJwXPmXddPv1FPXD44YjUqatUUY8q9QL2Sn+CxCVHUjghv/Fk1Z
AHPHziMiYh7kXT5z/J82FbpWWV2lSwMY1IeRc36Erg8sVWcxHgU=
=rGJN
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
