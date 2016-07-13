From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Wed, 13 Jul 2016 10:38:03 +0200
Message-ID: <20160713083803.GD4761@lukather>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0@gmail.com>
 <20160712143404.GD16355@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160712143404.GD16355-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Jul 13, 2016 at 12:34:04AM +1000, David Gibson wrote:
> On Mon, Jul 11, 2016 at 09:20:44PM +0100, Phil Elwell wrote:
> > On 11/07/2016 20:56, Maxime Ripard wrote:
> [snip]
>=20
> > > +static int overlay_merge(void *fdt, void *fdto)
> > > +{
> > > +	int fragment;
> > > +
> > > +	fdt_for_each_subnode(fragment, fdto, 0) {
> > > +		int overlay;
> > > +		int target;
> > > +		int ret;
> > > +
> > > +		target =3D overlay_get_target(fdt, fdto, fragment);
> > > +		if (target < 0)
> > > +			continue;
> > > +
> > > +		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> > > +		if (overlay < 0)
> > > +			return overlay;
>=20
> > Why does the absence of a target cause a fragment to be ignored but
> > the absence of an "__overlay__" property cause the merging to be
> > abandoned with an error? Can't we just ignore fragments that aren't
> > recognised?
>=20
> So, I had the same question.  But fragments we can't make sense MUST
> cause failures, and not be silently ignored.
>=20
> An incompletely applied overlay is almost certainly going to cause you
> horrible grief at some point, so you absolutely want to know early if
> your overlay is in a format your tool doesn't understand.

I'm not sure how we can achieve that without applying it once, and see
if it fails. The obvious things are easy to detect (like a missing
__overlay__ node), but some others really aren't (like a poorly
formatted phandle, or one that overflows) without applying it
entirely. And that seems difficult without malloc.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhf3rAAoJEBx+YmzsjxAgTDMP/jj/GtiP0lfy1wz7KxBHG9Fp
Yw536HN7UTJz1gps/8i99rgJWLwwHOYipoppiuFKOsUF3ioyz/9tThMfMFZC/8Jq
wJFkzK6mEfozt+dzgvukTUcS0CCDYo7vMj1EiA7pvscZoKX2z0YJ5JRz4BL9JaVS
IMsH8ggYI8Fs9krj/3Q+clj8OZlqYuvBl1Iq72nuMe2GgGJji0+nslW/+S2WCGo9
Ymgg+NT9gsZe5eRG4m3K8AEWgb8pqSk4ln79xPppSc1eoPMhtUzHzffNn+Znsd4P
C1HP/eNmRBe0eNWRJ4kAWC+TYphmdxCX4lpGp5h3wvf3SD86TrNgOYHJ4pVQtU4t
IkMP4IUazPmHB0c/epeAeM+3rLRHU9lZslwV1ZK7KfAVlRnVr0A7QU+hPvNyh3ql
6JcWjqGpXNmoib3aziiMgctWY+nmr1PZNyiprbodYqNsM46yBJ2X1uvF8YbRlcmw
2aVzhIdzs6NMbLuqDqu3aOQi0+VQT3e2eWGqsJ4MMauinfELVv9upQN+341k7yJ7
oFPvqX70hOZLKQChPdGF1EnIB1/47JMyHJfiBFJT7nMBPIq6vw0OYtPjNm8eLRPA
YUS01Ky8+K/qTYcvmooS41oRSKjZbzmR021yt5TkrwIjLtt8otDap/AWWE9ySV56
DYCw7jzD2PTwID7MyUPJ
=BBcP
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--
