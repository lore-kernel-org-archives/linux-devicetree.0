From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Thu, 14 Jul 2016 18:30:58 +1000
Message-ID: <20160714083058.GN14615@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0@gmail.com>
 <20160712143404.GD16355@voom.fritz.box>
 <20160713083803.GD4761@lukather>
 <20160713150745.GG14615@voom.fritz.box>
 <20160713193757.GL4761@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="um2V5WpqCyd73IVb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160713193757.GL4761@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--um2V5WpqCyd73IVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 09:37:57PM +0200, Maxime Ripard wrote:
> On Thu, Jul 14, 2016 at 01:07:45AM +1000, David Gibson wrote:
> > On Wed, Jul 13, 2016 at 10:38:03AM +0200, Maxime Ripard wrote:
> > > Hi David,
> > >=20
> > > On Wed, Jul 13, 2016 at 12:34:04AM +1000, David Gibson wrote:
> > > > On Mon, Jul 11, 2016 at 09:20:44PM +0100, Phil Elwell wrote:
> > > > > On 11/07/2016 20:56, Maxime Ripard wrote:
> > > > [snip]
> > > >=20
> > > > > > +static int overlay_merge(void *fdt, void *fdto)
> > > > > > +{
> > > > > > +	int fragment;
> > > > > > +
> > > > > > +	fdt_for_each_subnode(fragment, fdto, 0) {
> > > > > > +		int overlay;
> > > > > > +		int target;
> > > > > > +		int ret;
> > > > > > +
> > > > > > +		target =3D overlay_get_target(fdt, fdto, fragment);
> > > > > > +		if (target < 0)
> > > > > > +			continue;
> > > > > > +
> > > > > > +		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__"=
);
> > > > > > +		if (overlay < 0)
> > > > > > +			return overlay;
> > > >=20
> > > > > Why does the absence of a target cause a fragment to be ignored b=
ut
> > > > > the absence of an "__overlay__" property cause the merging to be
> > > > > abandoned with an error? Can't we just ignore fragments that aren=
't
> > > > > recognised?
> > > >=20
> > > > So, I had the same question.  But fragments we can't make sense MUST
> > > > cause failures, and not be silently ignored.
> > > >=20
> > > > An incompletely applied overlay is almost certainly going to cause =
you
> > > > horrible grief at some point, so you absolutely want to know early =
if
> > > > your overlay is in a format your tool doesn't understand.
> > >=20
> > > I'm not sure how we can achieve that without applying it once, and see
> > > if it fails. The obvious things are easy to detect (like a missing
> > > __overlay__ node), but some others really aren't (like a poorly
> > > formatted phandle, or one that overflows) without applying it
> > > entirely. And that seems difficult without malloc.
> >=20
> > So, atomically applying either the whole overlay or nothing would be a
> > nice property, but it is indeed infeasibly difficult to achieve
> > without malloc().  Well.. we sort of could by making apply_overlay()
> > take an output buffer separate from the base tree, but that's not what
> > I'm suggesting.
> >=20
> > I'm fine with the base tree being trashed with an incomplete
> > application when apply_overlay() reports failure.  WHat I'm not ok
> > with is *silent* failure.  If you ignore fragments you don't
> > understand, then - if the overlay uses features that aren't supported
> > by this version of the code - you'll end up with an incompletely
> > applied overlay while the apply_overlay() function *reports success*.
> > That is a recipe for disaster.
>=20
> Ok, that makes sense. I'll return an error if the target is missing as
> well then.
>=20
> But then, I think we fall back to the discussion you had with
> Pantelis: how do you identify an overlay node (that must have a
> target) and some other "metadata" node that shouldn't be applied (and
> will not have a target). In the first case, we need to report an error
> if it's missing. In the second, we should just ignore the node
> entirely.

Right.  I can see two obvious approaches:

     1. All (top-level) nodes named fragment@* are assumed to be
        overlay fragments.

     2. All top-evel nodes with a subnode named '__overlay__' are
        assumed to be overlay fragments

(2) differs from looking for target properties because whatever
target variants we add in future, they're still likely to want an
__overlay__ node.  Or at worst, we can add a dummy __overlay__ node to
them.    =20

> Would turning that code the other way around, and if it has an
> __overlay__ subnode, target or target-path is mandatory, and if not
> just ignore the node entirely, work for you?

I'd prefer to pick a single defining factor for the overlay fragments,
rather than a grab bag of options.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--um2V5WpqCyd73IVb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXh03CAAoJEGw4ysog2bOSGgUP/1tNTJxIr4veBTIRdL7hN8Af
WO5yJD9RzfyB+3dXtjfzUyRasbSGcXWkf1MVA+o1BCtFdDmxqyIuZx+6b3tW4Ufh
BS5SDmkPakMDDEA8jQh5JzqLlscNm6fqRcYjxGimSorDwgt3hpOGWXwitIhPulq/
JdU/nVoVYG7bwqoAXbr2TlPV6fmd++kxcaESPTu9H9iOYdT9Cwf38e67vS/Fza1j
ylPxpWkSyKzDAZsrYP6GkIwbF9BoGbSn0q72UgJgNNKBDrxPqoBN7DMyj0GQRrcy
oPwbrEoaBuFfiyT6Jix+kEEnUYRdfho5njK8KtI/ijgzngjaGTbHvEQ/vA51K182
5/EIynD0MxV2IxkGZ7CwpqVHqcviUDpUbSaRBE2lVaJbNnSe8jXriHbnjPzg38iF
atqcKIdEO56xcAW22vgMc/mV/xl4s1JvzgZ88AsKs1cRX3ncnCa2RAIer4FHw5wH
3TYvtnpn8PcMkufEmkO/PomxBXLlS+a1vl2D6LEC6Z0M5szsVcHSNqtgISuh8HyC
M0BtIuQEglZC7AN35WRm7cvLgXxvwoCNHTDVJr4/Z1gnMHzVgsq+RP/k05/XA8gM
TQD1GxsgekcN1uXLGrB8AME9OEJA8mn9LNZPmDSvu/dWq32qpuqhjaaOj+FR816P
YaycrBkFUIZGvMBeNDzX
=e4hP
-----END PGP SIGNATURE-----

--um2V5WpqCyd73IVb--
