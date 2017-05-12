From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: using labels for stdout-path
Date: Fri, 12 May 2017 13:48:16 +1000
Message-ID: <20170512034816.GA12908@umbus.fritz.box>
References: <20170511130545.co6pyyvlwuitbyne@pengutronix.de>
 <CAL_JsqL66sWFovGhYGaA_sB_pnvTrjyaQ7MW3=5pkD5Qwb6y_w@mail.gmail.com>
 <20170511184023.oi4bwwrutllexjen@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170511184023.oi4bwwrutllexjen-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2017 at 08:40:23PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Thu, May 11, 2017 at 10:49:15AM -0500, Rob Herring wrote:
> > +dtc list because labels are purely dts syntax.
>=20
> Ah, I wasn't aware that there is a separate list for that. Thanks.
>=20
> > On Thu, May 11, 2017 at 8:05 AM, Uwe Kleine-K=F6nig
> > <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > Hello,
> > >
> > > on an i.MX28 based machine I want to have the console on &duart with
> > > 115200 Bd, 8 Bit, no parity.
> > >
> > > The options for that are AFAICT:
> > >
> > >  - use an alias, like:
> > >
> > >         stdout-path =3D "serialX:115200n8";
> > >
> > >    the problem here is, that the duart doesn't have an alias. I guess=
 I
> > >    shouldn't introduce a new one for my setup?
> > >
> > >  - use a label, like:
> > >
> > >         stdout-path =3D &duart, ":115200n8";
> > >
> > >    This would be the prettiest, but that doesn't work, because there =
is
> > >    a '\0' separating the path and the options.
> >=20
> > You could make that work changing the kernel parsing, but that's
> > probably not a good option if we ever want to support more than 1 out
> > path.
>=20
> Good point. That's a good reason to not use this syntax.

Yes, changing the actual property format is a bad idea.

> > >  - use the full path, like:
> > >
> > >         stdout-path =3D "/apb@80000000/apbx@80040000/serial@80074000:=
115200n8";
> > >
> > >    This is ugly.
> > >
> > > Do I miss something? Is that worth to introduce new syntax, maybe
> > >
> > >         stdout-path =3D &duart . ":115200n8";
> > >
> > > or similar?
> >=20
> > Seems like we should make a comma be significant in splitting strings.
> > I'm not sure if there's anything relying on "foo" "bar" and "foo",
> > "bar" being the same. At least for numbers, a comma has no meaning, so
> > it would complicate the parsing I'd imagine. Not really an area I'm
> > familiar with.
>=20
> "foo" "bar" is a syntax error now (and another obvious candidate for
> string concatination). So writing in the dts

Right.  "foo" "bar" would be my preferred syntax for string
concatenation (the main guiding principle for dts syntax is "be like C
where possible").

>=20
> 	stdout-path =3D &duart ":115200n8";
>=20
> and getting the same result as
>=20
> 	stdout-path =3D "/apb@80000000/apbx@80040000/serial@80074000:115200n8";
>=20
> looks nicely and consistent with
>=20
> 	stdout-path =3D &duart;
>=20
> being equivalent to
>=20
> 	stdout-path =3D "/apb@80000000/apbx@80040000/serial@80074000";
>=20
> After a quick look into the dtc sources I imagine that wouldn't be too
> hard to implement for someone being fluent in lex and yacc.

Unfortunately, there are two complications with this.  The more minor
one is that an "implicit" operation like this (no actual operator
symbol) can make things get a bit curly in the grammar - mostly by
allowing potential ambiguity in situations which are obviously
different to a human, but not to the parser.

The bigger problem is that during the parse which is when we're (for
example) evaluating integer expressions, we haven't yet resolved
labels.  So, we can't expand the reference, we just insert a "marker"
in the property bytestring which says to insert the node path later.
That means we can't just have simple code to do a string concatenation
here.  That marker gets expanded later on, once we've resolved all
references.

Note that this is the same reason you can do:
	prop =3D < (1+2+3) &foo >;
But you can't do
	prop =3D < (&foo + 1) >;

There are two ways we could deal with this:

   1) The quick and dirty way: special case string append with a
   reference, so that we insert a new type of marker which will be
   expaned to the node path without the final \0.

   2) The complicated but powerful way: rather than (mostly)
   constructing the property values as bytestrings at parse time, we
   just construct the property values as expression trees at parse
   time, then evaluate those expression trees later on, once we're
   able to resolve references.

Approach (2) has been suggested before.  As well as this case it would
be a necessary step for allowing defined "functions" (for integers or
otherwise) in dtc.  It has some nice properties, but it's a rather a
lot of work.

> And probably
> it would be cheap to add the other obvious extensions like:
>=20
> 	property =3D < 0x12 0x43 > "a string" &label /incbin/(filename);

Um.. what?  That's not an obvious extension at all.  The proposed
change is to have (a b) be a string concatenation, but several of the
things above aren't strings, so it's not clear what it should do.  If
you want _bytestring_ concatenation, we already have syntax for that -
that's exactly what ',' does in dtc.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZFTB+AAoJEGw4ysog2bOSZ+gQAJN+88pertlqX+CREH5XcOXn
2BCLE4gGK8JDq5uzm8yHM3HrkbfSkI7XEJ8fK0th7DRDHPRZEBygXLcx8KdV2UxK
muqbViPotcvsdaL0+t0Pwt/Q/xq7DX09fbJB+c+Tx0ZAgE3NEehkVykzjcNLCftc
MIOZ4YLq5JlN91nX/jMkk/xVitGQmtVXM+RKksVWV5fPDwXeTcXuc8NThzkIeC0/
T7oT6H1ta6WL+UF29RkYibZrZxEzYbXTBfUAYE3IWc/Gv0PQgSXkD1fXNj7JYdVq
1q8jNThF6cVeKjjbN7XfkXvCoHXNX/dzXX999B4wWT88r9k4BEqDc6EZAF6jy6x9
//CZl4OWqDYh8O4vUyxt8Eh5TdTiaL5QV7tO3eZhuYcbJpXzE7+hn1wX0x/s/t9e
HpBhHiOU1flHR4U2XdOWKx/YoqluRArUQdZ0jTILLK48J/zlVAmIWl5VanYF6Ncb
m9DHCASeuirK2vp5kQgUnmjQPFFswrwSnUgA4hUzb17LpNlB3zW3UnvSn6LY8bCm
8LzFpW9B8ThHXu3XYwGIzaf/d9eGwDY+Dek83kpXEq4QP7E/P+liLCzbzXkIqEgp
WkFkPElGSsgKQAh7CcAyCAVwJxG0HR8JRFqkSyEYvVaB1OQ/SYEFEgvcjAq0OEJO
6d32KzVYezlVu9nfLXeh
=HSjn
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
