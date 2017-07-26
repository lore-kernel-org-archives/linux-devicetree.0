From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Wed, 26 Jul 2017 14:18:16 +1000
Message-ID: <20170726041816.GY8978@umbus.fritz.box>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
 <1499085674.4225.17.camel@hp800z>
 <20170707070915.GD24325@umbus.fritz.box>
 <5967CCA8.6030406@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ubca5Sl/zyRO+Ah+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5967CCA8.6030406-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Ubca5Sl/zyRO+Ah+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 12:40:24PM -0700, Frank Rowand wrote:
> On 07/07/17 00:09, David Gibson wrote:
> > On Mon, Jul 03, 2017 at 03:41:14PM +0300, Pantelis Antoniou wrote:
> >> Hi David,
> >>
> >> On Mon, 2017-07-03 at 19:06 +1000, David Gibson wrote:
> >>> On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
> >>>> This patch enables an overlay to refer to a previous overlay's
> >>>> labels by performing a merge of symbol information at application
> >>>> time.
> >>>
> >>> This seems to be doing things the hard way.
> >>>
> >>
> >> It is the minimal implementation to get things to work, with the curre=
nt
> >> overlay implementation.
> >=20
> > Is it, though?  I'd expect reworking the symbol creation during
> > compile to be of similar complexity to the symbol merging here.  And
> > it only needs to be done in one place, not two.  And it doesn't
> > implicitly extend the overlay spec.
> >=20
> >> I do have plans for a version 2 with fixes to
> >> a number of areas.
> >=20
> > Saying you'll fix it in v2 is missing the point.  If v1 is out there,
> > we have to keep supporting it.  The number of half-arsed overlay
> > variants out in the wild just seems to keep growing.
> >=20
> >>> You're essentially extending the semantics of overlay application to
> >>> add the symbol merging.  You've implemented these extended semantics
> >>> in libfdt, which is all very well, but that's not the only overlay
> >>> application implementation.
> >>
> >> This is a port of the same patch that's against the linux kernel.
> >> As far as I know there's no other implementations, or at least none
> >> that are open source.
> >=20
> > So, it's already in the wild and we have to deal with it.  Yay.
>=20
> It was only a proposed patch.  It is not in the kernel.  We don't
> have to deal with it.

Ah, I misread.  Well, that's something.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ubca5Sl/zyRO+Ah+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll4GAgACgkQbDjKyiDZ
s5IW4RAA3KdMLxCDZRgF/woE0hp6PMHuqbAfMRFTP8GeACuAWW0vS7O9QSWAV3XN
bMo73bQizBLcD9K2eRaOD3qVVZa4Z+BuwhLL/PPedeBcJjVALK138Krz8KwWviPd
9zmy/tOIotpV9EUKisc3+rKVlH2xANonnD338xXMSjWWMP3tLh7yjcF3p9ZARAPJ
O1tcY4fFd73K8TrIKNsJx8AparawbDcNd/QBSe1/XLGXQwqBusWEcBw417FngxtX
WvciHjWFAJ16ItO3baNhn048SjJurroHb0XrN6Op5ia6pDgk0qpgaUpWgVbBXC6F
Jr1FQqTl0c3YH5TF80HTPlebYwVsGvjOrRFUNPu5idWBlnhmpr65aehpv7ZBjB8U
TYDKlS2n0wO/Qo+P5dxa2cYllAKXGmTZvfDrhO8Gc/yQrtY0aXp8ByVXl94J965L
fQkUxg/DsPvfhr6Dl1KlcACJDvX8nYPrc9ci0CpQRO0mcPCa4X0l1KrSJmLAPoq6
FU08uNaMpEfc0WNYvIdzIrt8HPw0kybOXYsNwW/vuKS+9OQYZ8qrqbC0SrT9k1uV
hG0h3vaZItIBTR4RcyOaIhEXyB/Zdi7vR5xzGXm3uYvMOp7HWEwD/SSQ/Hvv8BEQ
WK823/VW/MiuvOWjTMts/wM0O9gC/Uuleo7jh6Rh5xu9OZhC8uw=
=KTq9
-----END PGP SIGNATURE-----

--Ubca5Sl/zyRO+Ah+--
