From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Thu, 14 Jul 2016 01:07:45 +1000
Message-ID: <20160713150745.GG14615@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0@gmail.com>
 <20160712143404.GD16355@voom.fritz.box>
 <20160713083803.GD4761@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160713083803.GD4761@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 10:38:03AM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> On Wed, Jul 13, 2016 at 12:34:04AM +1000, David Gibson wrote:
> > On Mon, Jul 11, 2016 at 09:20:44PM +0100, Phil Elwell wrote:
> > > On 11/07/2016 20:56, Maxime Ripard wrote:
> > [snip]
> >=20
> > > > +static int overlay_merge(void *fdt, void *fdto)
> > > > +{
> > > > +	int fragment;
> > > > +
> > > > +	fdt_for_each_subnode(fragment, fdto, 0) {
> > > > +		int overlay;
> > > > +		int target;
> > > > +		int ret;
> > > > +
> > > > +		target =3D overlay_get_target(fdt, fdto, fragment);
> > > > +		if (target < 0)
> > > > +			continue;
> > > > +
> > > > +		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> > > > +		if (overlay < 0)
> > > > +			return overlay;
> >=20
> > > Why does the absence of a target cause a fragment to be ignored but
> > > the absence of an "__overlay__" property cause the merging to be
> > > abandoned with an error? Can't we just ignore fragments that aren't
> > > recognised?
> >=20
> > So, I had the same question.  But fragments we can't make sense MUST
> > cause failures, and not be silently ignored.
> >=20
> > An incompletely applied overlay is almost certainly going to cause you
> > horrible grief at some point, so you absolutely want to know early if
> > your overlay is in a format your tool doesn't understand.
>=20
> I'm not sure how we can achieve that without applying it once, and see
> if it fails. The obvious things are easy to detect (like a missing
> __overlay__ node), but some others really aren't (like a poorly
> formatted phandle, or one that overflows) without applying it
> entirely. And that seems difficult without malloc.

So, atomically applying either the whole overlay or nothing would be a
nice property, but it is indeed infeasibly difficult to achieve
without malloc().  Well.. we sort of could by making apply_overlay()
take an output buffer separate from the base tree, but that's not what
I'm suggesting.

I'm fine with the base tree being trashed with an incomplete
application when apply_overlay() reports failure.  WHat I'm not ok
with is *silent* failure.  If you ignore fragments you don't
understand, then - if the overlay uses features that aren't supported
by this version of the code - you'll end up with an incompletely
applied overlay while the apply_overlay() function *reports success*.
That is a recipe for disaster.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhllBAAoJEGw4ysog2bOSLVwQAIxG969OLU91HLItVbSeM8mw
kKDuJbQZfE0fVW5ZcCc0tPNCS3LM5hqSJ9ZJurtnfXL9xqVKd6oB/NYq4N3bNR+m
iL5Nq0agCfkkb65sJebJJUW8hA3UAZ2hvvA5JJ9IronfCrt17NIVkz1hoBD4ZkUG
x2di2wTJPusXV2uSmptiTfLNynrsbg0srtXmLy2+fS662VjDFeqedvecpo74ydxL
8X0/y7IZZ1mY04hYc5SXlFQD7zhKV7+IMlf4O7BUcumtPL9q4EgaLUbCb2DnLjyU
AdlgxcAHwWV5wMyFRzEh6Iiq73oxqbTwplBGY17GoagBP6tUME1ThXutiM8gJtod
I7wi+cyexsCGVcTBRQNba91JijqcERICrwJCDUeBFh+PnHIJT33hhg2/RfowS+t7
yNfcXhaWs164jytaAYct3cG3DgCurccsKKI5ZymP9BhdHjfgbDIH9QwYA7yNYmgr
RigI5E+xIBmIJjs/uzftnTOSap46Ijjevkl2SMwY69pN2LupLtpJBNrKjEG1SVbq
a1jybJdPt/5Xz0hrfog7SNGCEFeApCNs567fQUEdQ1kt4B053F1ZV1L+64aoqWN1
RWuGXn2BG11bDL0jPfIV1W6aZLB+gRg512YuFosAIM79FCMPIQimFGWDKif2BDw+
RxHVEwlMLZodNzyyc0sB
=L62b
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
