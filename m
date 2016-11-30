From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Wed, 30 Nov 2016 12:42:57 +1100
Message-ID: <20161130014257.GE19891@umbus>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
 <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
 <20161129021131.GD13307@umbus.fritz.box>
 <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org>
 <D3BFA6AB-21C1-451B-ACF5-32EA5E615275@konsulko.com>
 <66c7f8c5-94e9-a6ca-4402-fa0ccf2a6ac0@raspberrypi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <66c7f8c5-94e9-a6ca-4402-fa0ccf2a6ac0-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 10:50:53AM +0000, Phil Elwell wrote:
> On 29/11/2016 10:39, Pantelis Antoniou wrote:
> > Hi Phil,
> >
> >> On Nov 29, 2016, at 12:32 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> wrote:
> >>
> >> On 29/11/2016 02:11, David Gibson wrote:
> >>> On Mon, Nov 28, 2016 at 12:24:20PM +0000, Phil Elwell wrote:
> >>>> On 28/11/2016 12:10, Pantelis Antoniou wrote:
> >>>>> For plugins we need the __symbols__ node to support stacked overlay=
s, i.e.
> >>>>> overlays referring label that were introduced by a previous overlay.
> >>>> Although it is arguably useful to be able to refer to symbols create=
d by
> >>>> one overlay from within another, do we really want all symbols to be
> >>>> global? Isn't there a call for a new syntax or usage pattern to indi=
cate
> >>>> either that a symbol should be local to the overlay or, my preferred
> >>>> option, global?
> >>> So, this is back to a design question about the overlay format.  As
> >>> noted in the initial discussions about possible "connector" formats, I
> >>> think we will want some sort of local symbols.  But the current
> >>> overlay format with all global symbols is out there and we need to
> >>> support it.
> >> The overlay format we have does not dictate the scope of the symbols.
> >>
> >> In all implementations I know of - the Raspberry Pi loader, the current
> >> Linux kernel, the latest dtc patch set - there is a completely
> >> asymmetric relationship between the base DTB and an overlay:
> >> * the base DTB exports __symbols__ to resolve the overlays unresolved
> >> label references, as recorded by the __fixups__ node
> >> * the overlay's phandles are renumbered so as not to clash with the ba=
se
> >> tree using the __local_fixups__
> >> * the contents of the __overlay__ nodes are applied to the base tree, =
as
> >> directed by the "target" or "target-path=E2=80=9D properties
> >>
> > Yes
> >
> >> The __symbols__ node of the overlay is ignored and discarded. The
> >> __fixups__ and __local_fixups__ in the base DTB (if present - the RPi
> >> dtc only generates them for /plugins/) are ignored.
> >>
> > That was a limitation that no-longer applies. Overlay symbols can be ad=
ded
> > to the base tree symbol list with a small patch I have already posted.
> The fact that they can doesn't mean they necessarily should.

They should - at least as long as we're using this simple overlay
format.  What else would you do with them?  If they're not merged,
they're useless in the overlay.

> >
> >> In the set of RPi overlays only one exports a global symbol, which it
> >> achieves with an overlay aimed at target-path =3D "/__symbols__" that =
adds
> >> a new symbol (in this case "i2c_gpio").
> >>
> >> If the __symbols__ in an overlay are automatically merged with the base
> >> symbols, that is a significant change in semantics which needs to be
> >> discussed.
> >>
> > You no longer need to do this anymore. Hope this helps :)
>=20
> Not really, no. With the current scheme we have control over the scope,
> but now there is none.

You really don't, symbols were always global.

>=20
> How does your patch handle duplicate symbols?
>=20
> Phil

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPi6hAAoJEGw4ysog2bOSZYYP/R7PAf4GxB18ofpkmrFB0UGy
8KzaXp7ZTv5NJPNQ+xR7czTva/EbaG2GUTkeozDD3mq8iUHHRHE96pUHomyyWvYf
4HuLDBtlnP6ixy3mUyDvXv/nJCrvoGkvvkJsuiOAvhhxRYDX30iVEe5uJphfUrsw
uy1iED9upa3PfIQ4jFcXT0A+PpRhVkRE5I8VCUBOG8JqwLvLDjKzNUa80kIbN6o+
Obl050JoVzuNjGyjdCnj30a6clfcJ6t4H9VsCLVFiA6diwp/BI3kFUuE9ZhGonzj
dWS9RcYMeDtIFT/l4MsggqY2bcIIB/aJcvwgO1HE7TzZO1HlQBTPJwOClZCKEswL
dsnDb+PrJiHGc8pRPB90usWpmKVOBIpofOYb2S7eHgHZVZD5fSexBPMRvYm12VYu
2PBmHobISEsPzvXCuD0UTPWujtPteLBpjk3gEYcj6SFuUffq+1pcuqEScTTB549n
vLF0NKDfaOQd6JRnLlCVQDyse+eS4NnhV9GLA/iv6oU4BD3Z01M4sNbnE7nDGxlx
nkdvupvMhxHv0m3TROttupw2DlgbZas6N+gRJGsy33cgFsF/5m97LkXRzfoVrC+K
TQfD9T0inAmquEB/PwZf4U+3EYZKi8SJY4MilAiMwv6USo9F1+lK3yeanHyKjmaW
rQWiyiCn9tyYPv0K0TSm
=2yfA
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
