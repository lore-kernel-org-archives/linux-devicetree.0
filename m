From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt.h: Define FDT_PATH_MAX
Date: Mon, 10 Jul 2017 14:43:58 +1000
Message-ID: <20170710044358.GA4083@umbus.fritz.box>
References: <1497451908-15367-1-git-send-email-pantelis.antoniou@konsulko.com>
 <20170614150522.GE2614@umbus>
 <1497468241.28265.22.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497468241.28265.22.camel@hp800z>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 10:24:01PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> On Wed, 2017-06-14 at 23:05 +0800, David Gibson wrote:
> > On Wed, Jun 14, 2017 at 05:51:48PM +0300, Pantelis Antoniou wrote:
> > > Declare the maximum path size of an FDT node.
> > > It is useful for manipulation methods that need to know a maximum val=
ue.
> > >=20
> > > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >=20
> > Why do you need this.  I've really tried to avoid adding arbitrary
> > size limits on things.
> >=20
>=20
> The stacked overlay patch needs it; has to 'read' in a path into a
> buffer and manipulate it. Otherwise it I would have to add a new method
> that walks the path and returns the size of it so that I can allocate
> the exact amount. This seems excessive IMO compared to a hard max limit.
>=20
> It is similar to the way PATH_MAX works in *nix which makes things
> somewhat familiar.

This is not necessary.  As noted elsewhere, I'm not really convinced
of the need of the stacked overlay application patch at all.  But even
if we took that approach I can see fairly straightforward ways to
eliminate the need for a PATH_MAX (removing the arbitrary limit with
it).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZYwYMAAoJEGw4ysog2bOSi1IQAMIvK2eRn0/t9LPCLAe5wgnd
KQ3b/KOx8cZkgrcazCd9ZrFJuaAkY+Xxv9SY0yrOQygfNZKonqgFcrB5D/Kmb0oy
w3CsQ6T5UH4Ji3+NkQ5f7YQm8Yrhjc/krmLDI+/sUzYrGUPRLtXNRZLme6oHyK7P
WqPVXunlrCsr1nVUGDuSa2774ebJetfBUErED6f9QOCgg9nr1A7lrjMdear2nvud
r3/+B2HJPKW5jHKAcf217lbV0OFzB1RsYMXjNt7IwA5+0HUgpaUsrullUHSb6qhN
GF2UxJ8bdRV307giQh5kaSQ5vsb+f5rV7dVjMJJnnq+MLVdzUG7xJbn/qzidqaT9
UegqINCoJ/ZYBvJDTo2ZOXpb4f2SAwvqgfIOlW3XWfHXNf1XInxsmGRimdJdm1MN
qDseTUCXpZvDQHZahfI+0NRG9ocdx4/+cuPvWacNTVV4XR7gGhCvXxtX498J4kyE
12VtRUrVDu1Zlq9OZZa2RRKrY05rYH2jTjMELh9wmB5CrTZq9Xyia/a6dk283wEU
y6A2zASIySQ3ZBaDU/VtY3dkW54D0OtW5bNF6pNtXDOBk0/LYnjpALLOOPUG9UhF
TNhjEFFztsBcnkI1LQmq7p5R4B3sqocA/K74uEPtXYIXXk//qgdGIzq9wgocEshF
f1Dqj7d+BA5QLhtQAVn0
=MAl+
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
