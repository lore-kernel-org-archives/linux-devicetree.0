From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Wed, 30 Nov 2016 12:41:34 +1100
Message-ID: <20161130014134.GD19891@umbus>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
 <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
 <20161129021131.GD13307@umbus.fritz.box>
 <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 10:32:28AM +0000, Phil Elwell wrote:
> On 29/11/2016 02:11, David Gibson wrote:
> > On Mon, Nov 28, 2016 at 12:24:20PM +0000, Phil Elwell wrote:
> >> On 28/11/2016 12:10, Pantelis Antoniou wrote:
> >>> For plugins we need the __symbols__ node to support stacked overlays,=
 i.e.
> >>> overlays referring label that were introduced by a previous overlay.
> >> Although it is arguably useful to be able to refer to symbols created =
by
> >> one overlay from within another, do we really want all symbols to be
> >> global? Isn't there a call for a new syntax or usage pattern to indica=
te
> >> either that a symbol should be local to the overlay or, my preferred
> >> option, global?
> > So, this is back to a design question about the overlay format.  As
> > noted in the initial discussions about possible "connector" formats, I
> > think we will want some sort of local symbols.  But the current
> > overlay format with all global symbols is out there and we need to
> > support it.
> The overlay format we have does not dictate the scope of the symbols.
>=20
> In all implementations I know of - the Raspberry Pi loader, the current
> Linux kernel, the latest dtc patch set - there is a completely
> asymmetric relationship between the base DTB and an overlay:
> * the base DTB exports __symbols__ to resolve the overlays unresolved
> label references, as recorded by the __fixups__ node
> * the overlay's phandles are renumbered so as not to clash with the base
> tree using the __local_fixups__
> * the contents of the __overlay__ nodes are applied to the base tree, as
> directed by the "target" or "target-path" properties
>=20
> The __symbols__ node of the overlay is ignored and discarded. The
> __fixups__ and __local_fixups__ in the base DTB (if present - the RPi
> dtc only generates them for /plugins/) are ignored.
>=20
> In the set of RPi overlays only one exports a global symbol, which it
> achieves with an overlay aimed at target-path =3D "/__symbols__" that adds
> a new symbol (in this case "i2c_gpio").
>=20
> If the __symbols__ in an overlay are automatically merged with the base
> symbols, that is a significant change in semantics which needs to be
> discussed.

Symbols are global, they really can't be anything else in this format.

This is why I think the connector approach - though substantially more
complex - is a better idea in the wrong run.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPi5LAAoJEGw4ysog2bOSLQsQAMUSE34j1iNVi71MCTYmRR7f
gtlPgdmRouzylTp6yVOkMJSjlXq4kbvMKqkCCtUcXJnl33QIWIST4/bBmxo6iids
fvgGiFK9VEMB4hu0WFcKCqXtQ0niDZnRCXjjkvGh+2pFtDl3Jt5ViLrFmf+rPU4s
Kwc9+oSd2vzW2Anh8BYG/WJaRLOG/rqY16h3y7JPmQfWIO3GoYq4OE2ydrXX7x/D
qn1EjtWqIbC9nvJri0dkfO6302FbcnM8HdH46MTQSlf+kjY5ias1N9DHiJWdoOgf
hbIXFDtRIOPM55eorYMSiS8uOquvYwXFemk95tBAZm/tlx1ypf/N06ORLCspUyxO
ibGCwoyPFBE2ksdWe/rncXZCjZuoCjq0s613U/OawGdb5rhG5zdmUQPNOvKUiKKv
JRWiexLe11IYiNdh9nv9eLVHpZ7PX96YgN1lhnaPrpYt9fMbDYENnCshJx5xJsmc
i7JbsbpTWxFBmIg0P5y6ppr8bJEkn2fGKDSpy2k85LANLxUFMpvlvE1K8ndy1l0A
FVyPkJRJkrH+Y9oddoJw6A8UnWxVw6I7nmbqybpK/lWCN2lhYi7ov2oOCucS2RnC
ePigUFoOh4gj6kwq1Ibg18Zq7+kGHZlab4B0g9o8rGQu+Ieh1WKmM9PASqy4sLqk
ThLRi7Plz79sZI33rutR
=TwHu
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
