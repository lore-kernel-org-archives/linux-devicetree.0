From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Fri, 7 Jul 2017 17:09:15 +1000
Message-ID: <20170707070915.GD24325@umbus.fritz.box>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
 <1499085674.4225.17.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499085674.4225.17.camel@hp800z>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2017 at 03:41:14PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> On Mon, 2017-07-03 at 19:06 +1000, David Gibson wrote:
> > On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
> > > This patch enables an overlay to refer to a previous overlay's
> > > labels by performing a merge of symbol information at application
> > > time.
> >=20
> > This seems to be doing things the hard way.
> >=20
>=20
> It is the minimal implementation to get things to work, with the current
> overlay implementation.

Is it, though?  I'd expect reworking the symbol creation during
compile to be of similar complexity to the symbol merging here.  And
it only needs to be done in one place, not two.  And it doesn't
implicitly extend the overlay spec.

> I do have plans for a version 2 with fixes to
> a number of areas.

Saying you'll fix it in v2 is missing the point.  If v1 is out there,
we have to keep supporting it.  The number of half-arsed overlay
variants out in the wild just seems to keep growing.

> > You're essentially extending the semantics of overlay application to
> > add the symbol merging.  You've implemented these extended semantics
> > in libfdt, which is all very well, but that's not the only overlay
> > application implementation.
>=20
> This is a port of the same patch that's against the linux kernel.
> As far as I know there's no other implementations, or at least none
> that are open source.

So, it's already in the wild and we have to deal with it.  Yay.

The whole history of DT overlays has been this - hacking something up
to grab some desired feature with a complete lack of forethought about
what the long term, or even medium term, consequences will be.  It's
kind of pissing me off.

That's exactly why it took so long to get the overlay patches merged
in the first place.  I was hoping to encourage a bit more thinking
*before* putting an approach in the wild that would predictably cause
us trouble later on.  Didn't work, alas.

> > It seems to me a better approach would be to change dtc's -@
> > implementation, so that in /plugin/ mode instead of making a global
> > __symbols__ node, it puts it into the individual fragments.  That way
> > the existing overlay application semantics will update the __symbols__
> > node.
>=20
> A lot of things can be made better, on the next version. These are
> minimally intrusive patches to address user requests for the current
> implementation.

Except that a) I'm not really convinced of that and b) I don't see any
signs of really trying to approach this methodically, rather than just
moving from one hack to the next.

> Why don't we start by making a list, and work towards that goal?
>=20
> Care to start about what you want addressed and how?

The biggest thing is a question of design culture, not any specific
properties.  Think in terms of specification, rather than just
implementation, and make at least a minimal effort to ensure that that
specification is both sufficient and minimal for the requirements at
hand.  Overlays as they stand are a long way from either.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZXzOXAAoJEGw4ysog2bOS/2cP/i+er4x86fMDfbM6W0oHPajg
Rv1tlQrMvoa0G95YOclj66ZVjebGeaKzl8z0S1AVMDrlRaRV8/BIS5AJLNHjanEb
0BsrsZtnr4+VErrtsr4Qe6NhRgGoZRmiIVe/Sv7CJv/p3NcaBEG2MUs3dz0lURga
tw7ke0KgyYC3pDP3G8yEZI9tBx54wWf34TVXeHlhQaTXrTMOdABql0PrQODAFDNf
cF8ELmTl/BfxZGKNfzF7AiIm6fszTDtut+ucVdVxre4FCAHz2S/SsKKNvzn+Ditx
FBtF7IZ6LoC9iEHM4MSy8u+j+4prE6FrCuxRIk+moJn/7Gb5/JJ4r3fq7fcrWw0R
se0aBjYCp445keQCTSGz02RwwhQlpiU7H2OVtxKjOW+IICDtF7hv6W+gXt/CYWk+
mh0sKpYLdHk6/tgNeI3nKYxCRsSpJP+qbK+OmuD4IWZcJeEg2nUUpaL69jwjC7fh
OXx/eWJ+dMwzRIXHnIeGz4ri9eaUMfP+oIZYZ6hGL8EsCUKpXEhKMCjICg9Vq96t
R4UMc98jvs5CIromMBgrNSy6VjPQBAkew0eZi8Uu5EBZ2dLGlE2UOrOVOrZ0VqbL
qB+UNpqHQEs0Rgc908j5p4sTD34gMVSQPx/A6hCS24ZoEZ7gzbkUcmgPLitK4gHC
9tY76tqtf+vSdSK8QS9d
=j//w
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
