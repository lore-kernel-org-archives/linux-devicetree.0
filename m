From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/6] libfdt: Add iterator over properties
Date: Tue, 12 Jul 2016 12:29:02 +1000
Message-ID: <20160712022902.GR16355@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-3-maxime.ripard@free-electrons.com>
 <20160712015335.GO16355@voom.fritz.box>
 <alpine.LFD.2.20.1607111856210.14522@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uLzYCuFow5JXEQYy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1607111856210.14522-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uLzYCuFow5JXEQYy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 06:57:46PM -0700, Robert P. J. Day wrote:
> On Tue, 12 Jul 2016, David Gibson wrote:
>=20
> > On Mon, Jul 11, 2016 at 09:56:19PM +0200, Maxime Ripard wrote:
> > > +/**
> > > + * fdt_for_each_property - iterate over all properties of a node
> > > + * @property_offset:	property offset (int)
> > > + * @fdt:		FDT blob (const void *)
> > > + * @node:		node offset (int)
> > > + *
> > > + * This is actually a wrapper around a for loop and would be used li=
ke so:
> > > + *
> > > + *	fdt_for_each_property(fdt, node, property) {
> >
> > Again, parameter order is out of date.
>=20
>   also, when did kerneldoc content start specifying data types in the
> comment? (int, const void*, ...). i don't think that's standard.

It's not, but because this is a macro, not a function, I think it's a
good idea to include.  The data types are constrained by the functions
the macro invokes, but unlike a function comment those aren't obvious
=66rom the function signature immediately below.

Actually.. rather than the somewhat longwinded comment about @node, it
might be worth just noting that it's an lvalue in the parameter
description here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uLzYCuFow5JXEQYy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhFXuAAoJEGw4ysog2bOSaZEQAMN1jmKFCR31WvVmsTasTu0d
3aa9zIX1HR8SRLKtT+WTVmAAHKjBL2z5bdUMUrS8sQE6tnLEf0Pi34VPTcPt3e3b
nxhLJoeA765KqymcU/rEpvH0mgtoSa7SvZiqe1qiaNJbuaP+S9rK9NnCwipDaC8P
UYxLfrKt+TR9pkEf2nzyVMo/LX3LvJhbv9Dtj7SEJP4FkPrNefSvvvacZ4qXZWEd
4DjrEwggIyDQQ23eaw0zkpc6eTFdNipSko+8wjplu1FS3pbfGB7qDs7C0Depd/SS
JJxUExp3CF3tLY+j4bODproieC3OT/nhoSgZi+ODPK9YcbcnfaSoPPoo+rVvqX6T
a0dPcGgHUkH3BKcd/AWc6PHyeCVU5VU7Va/Ybun1c9Sogc7klOXzzc1yAbH1sOKP
kM6BA8Ua4bYhuRP7LQ+Sqibm1qr3TkqtLrX3k5X7BcGuUnDKeFzAHMDkd1uIZfbH
AobHCwJwG2I5H+coPSI3zOrtG/RuR4JFX95Dt/PSg7p28P9g/Yz2LulhVqHfmyUu
MV0xJuJPAdosEO5cREhYsEP+WYB+GrAtwaiNDeY2ENqT2a3J5Mnncc1HO70QUpxH
0uG8xecejEbxiI9NPOfRJ1Cv01fs/zsQXy4VUTjgZDNLDOFc/RMjvDz/UZE4glug
gK30xxbTixpxfw1xndoW
=J3Xm
-----END PGP SIGNATURE-----

--uLzYCuFow5JXEQYy--
