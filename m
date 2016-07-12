From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Wed, 13 Jul 2016 00:34:04 +1000
Message-ID: <20160712143404.GD16355@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5tP+uu4DqNOLJklJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5tP+uu4DqNOLJklJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 09:20:44PM +0100, Phil Elwell wrote:
> On 11/07/2016 20:56, Maxime Ripard wrote:
[snip]

> > +static int overlay_merge(void *fdt, void *fdto)
> > +{
> > +	int fragment;
> > +
> > +	fdt_for_each_subnode(fragment, fdto, 0) {
> > +		int overlay;
> > +		int target;
> > +		int ret;
> > +
> > +		target =3D overlay_get_target(fdt, fdto, fragment);
> > +		if (target < 0)
> > +			continue;
> > +
> > +		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> > +		if (overlay < 0)
> > +			return overlay;

> Why does the absence of a target cause a fragment to be ignored but
> the absence of an "__overlay__" property cause the merging to be
> abandoned with an error? Can't we just ignore fragments that aren't
> recognised?

So, I had the same question.  But fragments we can't make sense MUST
cause failures, and not be silently ignored.

An incompletely applied overlay is almost certainly going to cause you
horrible grief at some point, so you absolutely want to know early if
your overlay is in a format your tool doesn't understand.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5tP+uu4DqNOLJklJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhP/cAAoJEGw4ysog2bOSiUwP/iUq4nY3Vk0SPsN3TzEA6NC0
6gOkCAVJfcxE3PmPTGVnJeZVrlYsD4I9HWEeNlh5xzCcRXRxN/Z/6QXfDckgpngs
RbmDMHJjSCwGhu/hsxiy3IHyJY7w0mCzF5CQcKZMGOM6H1BzjN9XZxhF1/s2zp47
+jlYKOE/c5yQ0NOf5hBIkzpHPKWOXYRvfE+r++sFpZJ3EGFZmjpzvkdFTJDg7Mix
ozJ1a6SiK+OD+VfJE+KZshbzXoqt9frFbET/IYbN/5syKIP+ibZtXZJosbySLBzj
0D/Vg7LUgfpdwo/4AN6wais0q+Ia9vyNvqVqQ0UK20xt9dJ3548KCqwvtBEP652Z
bsfpB3Kwg/gjyt0ZKa7D6Rk2t1oJRgcW2+uOIYXTP4xEyRvOF8myv78XKilnbECk
9dvk0pOH3vDGWfA/lzJK6Jlw/DcjGG53JVD+KH721C08jdEbTvDH/QjkE1DwXCNg
uQHDVwmmC0vm3e45dGk7NUvvif2if/PWxzq3MhjwUAeeMSXQ4knjV638MmfimywO
cFoSsQfWJ2bKPI2JoK5yyH0HroegwKEZddY/N8vRazjpUjI+SJs1i298kNEq+rhJ
NzoYpMqTiJcpFzlQQ1tRyU2ZMQmIYgTR9uqT1uQiVl1gesxYRnEy1NjG5jn0L8U7
q96gdLYmXpV9kFU9oO+9
=QVZM
-----END PGP SIGNATURE-----

--5tP+uu4DqNOLJklJ--
