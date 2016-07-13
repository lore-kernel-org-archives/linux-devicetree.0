From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Wed, 13 Jul 2016 21:37:57 +0200
Message-ID: <20160713193757.GL4761@lukather>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0@gmail.com>
 <20160712143404.GD16355@voom.fritz.box>
 <20160713083803.GD4761@lukather>
 <20160713150745.GG14615@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1hKfHPzOXWu1rh0v"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160713150745.GG14615-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--1hKfHPzOXWu1rh0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2016 at 01:07:45AM +1000, David Gibson wrote:
> On Wed, Jul 13, 2016 at 10:38:03AM +0200, Maxime Ripard wrote:
> > Hi David,
> >=20
> > On Wed, Jul 13, 2016 at 12:34:04AM +1000, David Gibson wrote:
> > > On Mon, Jul 11, 2016 at 09:20:44PM +0100, Phil Elwell wrote:
> > > > On 11/07/2016 20:56, Maxime Ripard wrote:
> > > [snip]
> > >=20
> > > > > +static int overlay_merge(void *fdt, void *fdto)
> > > > > +{
> > > > > +	int fragment;
> > > > > +
> > > > > +	fdt_for_each_subnode(fragment, fdto, 0) {
> > > > > +		int overlay;
> > > > > +		int target;
> > > > > +		int ret;
> > > > > +
> > > > > +		target =3D overlay_get_target(fdt, fdto, fragment);
> > > > > +		if (target < 0)
> > > > > +			continue;
> > > > > +
> > > > > +		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> > > > > +		if (overlay < 0)
> > > > > +			return overlay;
> > >=20
> > > > Why does the absence of a target cause a fragment to be ignored but
> > > > the absence of an "__overlay__" property cause the merging to be
> > > > abandoned with an error? Can't we just ignore fragments that aren't
> > > > recognised?
> > >=20
> > > So, I had the same question.  But fragments we can't make sense MUST
> > > cause failures, and not be silently ignored.
> > >=20
> > > An incompletely applied overlay is almost certainly going to cause you
> > > horrible grief at some point, so you absolutely want to know early if
> > > your overlay is in a format your tool doesn't understand.
> >=20
> > I'm not sure how we can achieve that without applying it once, and see
> > if it fails. The obvious things are easy to detect (like a missing
> > __overlay__ node), but some others really aren't (like a poorly
> > formatted phandle, or one that overflows) without applying it
> > entirely. And that seems difficult without malloc.
>=20
> So, atomically applying either the whole overlay or nothing would be a
> nice property, but it is indeed infeasibly difficult to achieve
> without malloc().  Well.. we sort of could by making apply_overlay()
> take an output buffer separate from the base tree, but that's not what
> I'm suggesting.
>=20
> I'm fine with the base tree being trashed with an incomplete
> application when apply_overlay() reports failure.  WHat I'm not ok
> with is *silent* failure.  If you ignore fragments you don't
> understand, then - if the overlay uses features that aren't supported
> by this version of the code - you'll end up with an incompletely
> applied overlay while the apply_overlay() function *reports success*.
> That is a recipe for disaster.

Ok, that makes sense. I'll return an error if the target is missing as
well then.

But then, I think we fall back to the discussion you had with
Pantelis: how do you identify an overlay node (that must have a
target) and some other "metadata" node that shouldn't be applied (and
will not have a target). In the first case, we need to report an error
if it's missing. In the second, we should just ignore the node
entirely.

Would turning that code the other way around, and if it has an
__overlay__ subnode, target or target-path is mandatory, and if not
just ignore the node entirely, work for you?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--1hKfHPzOXWu1rh0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhpiVAAoJEBx+YmzsjxAgkrUP/3b2EgSvEFxVO9vhpAFM0akS
d4U9ezLzxmu9JlSHjjIBoEHtPZ/H/Y6/TxoQNEzLZjeySQBi7al1vP5wVE31Ccoo
OKY2Cj9JAy60x4wuwzgxmz8dEBxUao6fxSGZ4FEtdnj+1REXac029/qcW9l18Hzy
twim5g34ld2Gw2c2OA/cRUyExlIitbZkCUQz+ERG4zwIm2vGx3/Uz/2RKns9Yczc
xGvwjn9KJ/8vxL4WjnjDtcp4PAZmsisyWXhTqLiGdjPnKy+33S50ESWXi4WJwSJ3
abpBM2KPo3T3I0L3dsgDFDxc4tUOv5NcLPPmJd6BKU3vJkDIKfXNvC01AyTk7aPz
OsH/qnd+2j1Qufyc2B8zvdLd1TswhTIMDG4smBtKvAgczbS/gxaOpDFKRF6lIThr
z0V+UiNMquG5P6cr+SfFCuVOu78WKY0ru5+WqYvNhcXwkwWxhbPdJvmPN0r9sWj8
zVgsdEKOqeS8Ol+ovHJ9i+JZ6yDF0nWfu4gWCo5CcDQ1mzr45O6fJknlscT2Ed6G
ZtcbyEdKj8uJh960P4OBVkUMP+7wQZFjINsfNGq38YgDpjW5f+TY+Q3KJ5I9q6j4
SpmStwW5XCtVnfSPxM7svMX2N/vQPftAbMyf8euLxsQ2cQh95+k/wEBpp1J9Uw+W
DWOsqXMS9lPbcqi0Zam+
=hzY4
-----END PGP SIGNATURE-----

--1hKfHPzOXWu1rh0v--
