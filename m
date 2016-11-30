From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Overlays and boolean properties
Date: Wed, 30 Nov 2016 14:47:33 +1100
Message-ID: <20161130034733.GH19891@umbus>
References: <a02487bb-6f79-fe4d-8180-86375b9413b9@raspberrypi.org>
 <BDABA9C0-FDBE-4B2E-97AE-D3684D2A68BA@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SUk9VBj82R8Xhb8H"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BDABA9C0-FDBE-4B2E-97AE-D3684D2A68BA-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--SUk9VBj82R8Xhb8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 03:10:40PM +0200, Pantelis Antoniou wrote:
> Hi Phil,
>=20
> > On Nov 29, 2016, at 15:06 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> wrote:
> >=20
> > Boolean properties are defined as being properties with no content, that
> > are true if present and false if absent. They pose a problem for DT
> > overlays, since the proposed (and widely used) overlay mechanism does
> > not allow for properties (or nodes) to be deleted; overlays can only
> > make a false property true, so boolean properties are effectively
> > monostable - once true they become immutable.
> >=20
> > The standard DT syntax includes /delete-property/ and /delete-node/
> > directives that do what you would expect from their names, but that
> > facility is not available to overlays. There is no FDT node that
> > represents the deletion - the directives are acted on immediately

Uh.. only partially true.  They're acted on during the compile run,
but not during the parse.  dtc does have an internal representation of
node or property deletions that gets resolved when we combine the
fragments in the source file.
> > - so
> > we would need some extra markup - say __delete_property__ and
> > __delete_node__ - to hold the names of items to be deleted.

So, in principle this wouldn't be that hard - we'd just need to
translate dtc's internal representation into a representation in the
dtb.  That could be done with special properties, or with new opcodes
at the dtb encoding level.

> > Before I take this further, does anybody have any thoughts on the idea?

So.. the first question, is do we have a pressing use case for this?
dtbos can (apart from this) alter anything in a base tree, but doing
so isn't often a good idea.  Usually they'll just add new nodes and
properties.

> The original patchset did support removing properties (by prefixing them =
with -).
>=20
> I can revive that if we have consensus about the format/method.

On the whole, I'd prefer not to see extensions of the existing overlay
format - instead I'd like to see focus on a new and better thought out
connector format.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SUk9VBj82R8Xhb8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPkvSAAoJEGw4ysog2bOS2t4QAKUxWJm0dlNeaYkmNF/+POfg
MCPPSVhn5y1xSE0lHOzyt4U0T0coauhkShtzm6McBY/u5cSiEVQiRIKWispc5ywc
UKB7bG21yYvnSRBiS15+QDmd9kYp5AzbZczAX/tnqqXBuSucOc+YAwB8b/DFV1tq
mjwA/ncP6lgF5grFx1RUPfv4/8Nkb9UQWBGx2NLZJ/DcY6AyXr4ibMZxuDJ68603
vq3KofvdA6n3RTl9DfSjT5kOfH19PjX0RL9P9xD2fB+wRReH4tFULn07i0CGZDvJ
0/hq2+7v1lbK2QvMbCzttfjTPXxGjTEnmQ6ZWYeGQ8T1ATqIXEFfNsMyY03J2a4k
tvdtAcsO/Lugv+TYEinAfmaugBF2s/E/mFhtuQnVZDIdh5sIdFsJWuo1Wk5asSUh
ax44EWg+34K/TxIhb+/khVMeRv6IsOlF1RkthdpxG9+irvOQbLy9mXTaMeRNcNQB
RVadgnLk0WH2HTk36LMISNtlH/QajBqsogkzf3TwuZCBkPGtN6k6+hos/uNeC2YA
XyTPKa/JTiyCmDRwi2Y0o7ys9znZ6ytibmAfo1bNCrI3lJa7YRCAXBFPAOgebGg4
x2KgxDCetI8XZUWEIwlxC82Y48XXr0OSPK8gw17zLhnyLNDhP1neh1g0Xf4FyD+O
KGGajXXWbl9MtG+kY8pn
=HT6g
-----END PGP SIGNATURE-----

--SUk9VBj82R8Xhb8H--
