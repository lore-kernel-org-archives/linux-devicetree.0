From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 3 Aug 2017 01:09:33 +1000
Message-ID: <20170802150933.GG394@umbus.fritz.box>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z>
 <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170728005140.GF26163@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 08:51:40PM -0400, Tom Rini wrote:
> On Thu, Jul 27, 2017 at 06:00:00PM -0500, Rob Herring wrote:
> > On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
> > <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > Hi Frank,
> > >
> > > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
> > >> Hi Pantelis,
> > >>
> > >> Keep in mind one of the reasons Linus says he is very direct is to
> > >> avoid leading a developer on, so that they don't waste a lot of time
> > >> trying to resolve the maintainer's issues instead of realizing that
> > >> the maintainer is saying "no". Please read my current answer as being
> > >> "no, not likely to ever be accepted", not "no, not in the current fo=
rm".
> > >>
> > >> My first reaction is: no, this is not a good idea for the Linux kern=
el.
> > >>
> > >
> > > This has nothing to do with the kernel. It spits out valid DTBs that =
the
> > > kernel (or anything else) may use.
> >=20
> > Let me rephrase Frank's statement: this is not a good idea for the
> > main repository of dts files.
> >=20
> > But sure, DTS is already not the only source of DTBs. It comes from
> > firmware on Power systems.
>=20
> Yes, but unless they're generated from something other than a (at the
> time) normal DTS, that's not a good example, IMHO.
>=20
>=20
> > If you want to create and maintain your own
> > source format, then that is perfectly fine. But based on the current
> > understanding, I'm not seeing a reason we'd convert DTS files to YAML.
>=20
> Can I propose one?  To borrow a phrase, Validation, Validation,
> Validation.  Let me point to fe496e23b748 in the kernel for a moment.  I
> found that as part of helping a new engineer come up to speed on doing
> device tree work.  What I found was a case where:
> - The binding doc gives one value for compatible as the required value.
> - The code accepts only a single, different value.
> - A few in-kernel dts files have different still values.
>=20
> If the common dts source file was in yaml, binding docs would be written
> so that we could use them as validation and hey, the above wouldn't ever
> have happened.  And I'm sure this is not the only example that's in-tree
> right now.  These kind of problems create an artificially high barrier
> to entry in a rather important area of the kernel (you can't trust the
> docs, you have to check around the code too, and of course the code
> might have moved since the docs were written).

Yeah, problems like that suck.  But I don't see that going to YAML
helps avoid them.  It may have a number of neat things it can do, but
yaml won't magically give you a way to match against bindings.  You'd
still need to define a way of describing bindings (on top of yaml or
otherwise) and implement the matching of DTs against bindings.

> > Maybe you're not proposing that now, but if that is not the end goal I
> > don't see the point of a new format. If YAML solves a bunch of
> > problems, then of course we'd want to convert DTS files at some point.
>=20
> To borrow that same phrase again, Tooling, Tooling, Tooling.  The
> current dts format is a niche format.  That's great, our community
> is basically responsible for all tooling, we can do what we want.
> That's also awful, we're the only people that care about tooling and we
> all have lots of other itches to scratch.  There are so so so many
> editors that just know YAML and will work it into the rest of the
> development environment someone is using.

Up to a point.  YAML isn't so much a format as a framework for making
formats based on the JSON data model.  Some yaml tools will be usable,
but only if they're flexible enough to cope with the particular way
that DTs use yaml.

> None of that exists for our
> dts format.  Who cares about that?  Engineers that aren't primarily
> writing dts files.  I'm pretty sure every engineer that's written /
> extended a dts file has made an "invisible" mistake that would have been
> caught with a different source format that had validation already.
>=20
> And we've been talking about validation for ages now.  We'll probably
> still be talking about it for ages more (as it's hard
> thanked-at-conferences-and-such work!), until it reaches the point where
> anyone can pick up a current binding and re-format it into yaml for
> validation.
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmB6yoACgkQbDjKyiDZ
s5L4iBAAmz06Mx2FWy9q+wjKGUcneU0puBgtQ0f8BAwHIexQdVtyDyK1RHXH5XSZ
S6Yq28UvOqQMgJZ0B1nlh5P8w18GuMkm7+G4Ens0aZPnPBB2D+3DxRGwy8gN1u1L
qt1zUctrWxstVeXBHQLJFaUYLyX3qMpQDSt/PLAfpNYxSfEfS7Ddt+jcTvNfjBDq
K0melrIsuCi2L02Rf91IXumQOkaPoN1yGHlg7B/RPos2j3linVW5RMg5iDtDyoLa
7JKAju9CPXtQIj7vqwgefMDZs6vJQe5+kqNhXd54RtLAFtEA02TCPtyDZQSwEH9B
b3p49K1gE3uNfPf1VnivQat7eGCf462qTdJmCHV+RDSWAsRpI+CLkNhH8q5K/YVQ
13Vy6qrjOeDhF+1shxD2nNxqSsHprr7qk/znKP5zwD+fQXvSenaC+0h0G8DnMOLe
mKcy1MAWExNvWF80Uz9+joZcA6+1VJmvx2nLCL2AnCTLxa9qWRorF6U9DjCXa/zT
j6B/eEL8G8YFojgccCNY4qlykTHW69bHitCqOUPXzibG7bqQmXfI0+V9bPBaSHLe
PO5gxWTxMN4EtSYEhSnSCCAlrH6xav9wsSJpvizMZ0HErQhXcsqgi/9mBJk5gSVr
pyBVHgFla8xDnmHKQ0BSvj9h39ha4E8HBYsvcEiU0pKk1j6deW8=
=qsJ1
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--
