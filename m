From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: using labels for stdout-path
Date: Sat, 13 May 2017 18:29:13 +1000
Message-ID: <20170513082913.GC13183@umbus.fritz.box>
References: <20170511130545.co6pyyvlwuitbyne@pengutronix.de>
 <CAL_JsqL66sWFovGhYGaA_sB_pnvTrjyaQ7MW3=5pkD5Qwb6y_w@mail.gmail.com>
 <20170511184023.oi4bwwrutllexjen@pengutronix.de>
 <20170512034816.GA12908@umbus.fritz.box>
 <20170512074155.oshpdio2hb7cz377@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170512074155.oshpdio2hb7cz377-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2017 at 09:41:55AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Fri, May 12, 2017 at 01:48:16PM +1000, David Gibson wrote:
> > On Thu, May 11, 2017 at 08:40:23PM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Thu, May 11, 2017 at 10:49:15AM -0500, Rob Herring wrote:
> > > > On Thu, May 11, 2017 at 8:05 AM, Uwe Kleine-K=F6nig
> > > > <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > > > Hello,
> > > > >
> > > > > on an i.MX28 based machine I want to have the console on &duart w=
ith
> > > > > 115200 Bd, 8 Bit, no parity.
> > > > >
> > > > > The options for that are AFAICT:
> > > > >
> > > > >  - use an alias, like:
> > > > >
> > > > >         stdout-path =3D "serialX:115200n8";
> > > > >
> > > > >    the problem here is, that the duart doesn't have an alias. I g=
uess I
> > > > >    shouldn't introduce a new one for my setup?
> > > > >
> > > > >  - use a label, like:
> > > > >
> > > > >         stdout-path =3D &duart, ":115200n8";
> > > > >
> > > > >    This would be the prettiest, but that doesn't work, because th=
ere is
> > > > >    a '\0' separating the path and the options.
> > > >=20
> > > > You could make that work changing the kernel parsing, but that's
> > > > probably not a good option if we ever want to support more than 1 o=
ut
> > > > path.
> > >=20
> > > Good point. That's a good reason to not use this syntax.
> >=20
> > Yes, changing the actual property format is a bad idea.
> >=20
> > > > >  - use the full path, like:
> > > > >
> > > > >         stdout-path =3D "/apb@80000000/apbx@80040000/serial@80074=
000:115200n8";
> > > > >
> > > > >    This is ugly.
> > > > >
> > > > > Do I miss something? Is that worth to introduce new syntax, maybe
> > > > >
> > > > >         stdout-path =3D &duart . ":115200n8";
> > > > >
> > > > > or similar?
> > > >=20
> > > > Seems like we should make a comma be significant in splitting strin=
gs.
> > > > I'm not sure if there's anything relying on "foo" "bar" and "foo",
> > > > "bar" being the same. At least for numbers, a comma has no meaning,=
 so
> > > > it would complicate the parsing I'd imagine. Not really an area I'm
> > > > familiar with.
> > >=20
> > > "foo" "bar" is a syntax error now (and another obvious candidate for
> > > string concatination). So writing in the dts
> >=20
> > Right.  "foo" "bar" would be my preferred syntax for string
> > concatenation (the main guiding principle for dts syntax is "be like C
> > where possible").
> >=20
> > >=20
> > > 	stdout-path =3D &duart ":115200n8";
> > >=20
> > > and getting the same result as
> > >=20
> > > 	stdout-path =3D "/apb@80000000/apbx@80040000/serial@80074000:115200n=
8";
> > >=20
> > > looks nicely and consistent with
> > >=20
> > > 	stdout-path =3D &duart;
> > >=20
> > > being equivalent to
> > >=20
> > > 	stdout-path =3D "/apb@80000000/apbx@80040000/serial@80074000";
> > >=20
> > > After a quick look into the dtc sources I imagine that wouldn't be too
> > > hard to implement for someone being fluent in lex and yacc.
> >=20
> > Unfortunately, there are two complications with this.  The more minor
> > one is that an "implicit" operation like this (no actual operator
> > symbol) can make things get a bit curly in the grammar - mostly by
> > allowing potential ambiguity in situations which are obviously
> > different to a human, but not to the parser.
>=20
> /me remembers his algorithms courses about ambiguous grammars and
> mumbles something about left and right recursion.

I'm being fairly sloppy with my terminology here.  But the point is
that I've done some experimenting here, and having an implicit
operator like this can make things awkward.

> > The bigger problem is that during the parse which is when we're (for
> > example) evaluating integer expressions, we haven't yet resolved
> > labels.  So, we can't expand the reference, we just insert a "marker"
> > in the property bytestring which says to insert the node path later.
> > That means we can't just have simple code to do a string concatenation
> > here.  That marker gets expanded later on, once we've resolved all
> > references.
> >=20
> > Note that this is the same reason you can do:
> > 	prop =3D < (1+2+3) &foo >;
> > But you can't do
> > 	prop =3D < (&foo + 1) >;
> >=20
> > There are two ways we could deal with this:
> >=20
> >    1) The quick and dirty way: special case string append with a
> >    reference, so that we insert a new type of marker which will be
> >    expaned to the node path without the final \0.
> >=20
> >    2) The complicated but powerful way: rather than (mostly)
> >    constructing the property values as bytestrings at parse time, we
> >    just construct the property values as expression trees at parse
> >    time, then evaluate those expression trees later on, once we're
> >    able to resolve references.
> >=20
> > Approach (2) has been suggested before.  As well as this case it would
> > be a necessary step for allowing defined "functions" (for integers or
> > otherwise) in dtc.  It has some nice properties, but it's a rather a
> > lot of work.
>=20
> lex and yacc are great, but I'm not into them to be of help here :-|

Most of the work here is not lex and yacc at all.  In fact for
converting the existing integer expression stuff, all the grammar is
there already - it's a matter of making the data structure to
represent the expression tree and the code to evaluate it.

> > > And probably
> > > it would be cheap to add the other obvious extensions like:
> > >=20
> > > 	property =3D < 0x12 0x43 > "a string" &label /incbin/(filename);
> >=20
> > Um.. what?  That's not an obvious extension at all.  The proposed
> > change is to have (a b) be a string concatenation, but several of the
> > things above aren't strings, so it's not clear what it should do.  If
> > you want _bytestring_ concatenation, we already have syntax for that -
> > that's exactly what ',' does in dtc.
>=20
> When compiling and then decompiling a node that contains
>=20
> 	property =3D < 0x41424344 0x45464700 >;
>=20
> I get
>=20
> 	property =3D "ABCDEFG";
>=20
> in the dts output. So I assumed that strings and arrays are just
> different syntactic ways to define a value and so concatenation would
> work for both the same way.

So, in a sense, yes - all properties are bytestrings in the end.  But
you're *not* asking for them to work the same way.  Above we have
strict bytewise concatenation, but for strings you want string-aware
concatenation (removing the \0 from the first string).  ',' already
does bytestring concatenation for arrays, strings, bytestrings,
whatever.  e.g.
	prop =3D "ab", <0x41424344>, [00];
is equivalent to
	prop =3D <0x61620041 0x42434400>;
is equivalent to
	prop =3D "ab\0ABCD";
is equivalent to
	prop =3D [6162004142434400];

In terms of reading, the stuff that appears within < ... > is a
different grammatical context to what's outside it - the rules may be
different.  Indeed, integers aren't valid at all outside < ... >.  I
usually think of < ... > as a special operator which takes a bunch of
integers and returns a bytestring.  In a similar way "..." takes a
string and produces a bytestring (by de-escaping and adding \0) and
[...] takes a bunch of hex digits and produces a bytestring.

> Now thinking a bit more there are some
> problems that are likely solved best by not allowing concatenation for
> arrays and binary data.

Inside the array, you have integers.  Outside the array, it *is*
binary data, just like everything else.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZFsPWAAoJEGw4ysog2bOSvpcQAN7XT7Q4GY698NRLyYGD0Ren
lIKj+ciEV9hWOPWHfFY3i9mWVqRutlBVgJ4PZvBD3lI55eR+XtYPSxyhuORCRcai
OM/SSIm7D1zlkmQOxSM7H+BxnZkSyS3IxZZR4g28riZuXdXwQUfVA6aOjEV+3VF7
llQXD/P48XuyBsFiO+fSBz0c6rLGlcrwEXSXimF8hvqHeVPxUp482UW0Hdb1hgEF
dUFG4eaXqX2zwpNof/b9L9x0yCrWUsxLwfSyL5gJewvF7VWOffLXkHopxG8imv3W
AykKfnnIIWvIlCaj3c7ubiwPzlEmxNDPzDCyd927s/Nb6I83Om2gIgyfEGSaor9t
qSbVA+Jy2Suy4OegmT6atlsNWxMJXdYAWngyDtN4+KhRLCfE8DBQjewG2Hqx7k4l
Hcw3I1tDZIDZxCu70vyZ6dTZCUJ3tEs5IFJIiWxKF8L1Lmur5ifZl6k4n6kICzp7
HTRxlrPBl3WXkfM4TNktlpOm7xKkE9PVUReHWftndF8Vk5qh4IhHOK7cSHkKJut+
0r2qozxAJ2aydVw5XreSwZN+Sdf/QUrVdPBikYg+M5RKKEsdQ5MuvGqrT7YpyAdp
kr1OLzJznE13JoYaW7687TlrPA3m71zGEXLZeuwbtMXx1wb+JT97nl6sRPU0aPO9
eO1rMVRN3VjVl4cq09kP
=qgCx
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
