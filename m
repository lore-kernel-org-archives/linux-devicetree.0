From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 5/8] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Mon, 22 Aug 2016 09:01:56 -0400
Message-ID: <20160822130156.GA20266@littlecatz>
References: <20160729095551.13592-1-maxime.ripard@free-electrons.com>
 <20160729095551.13592-6-maxime.ripard@free-electrons.com>
 <20160801033642.GV2588@voom.fritz.box>
 <20160822100721.GI7104@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160822100721.GI7104@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 12:07:21PM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> On Mon, Aug 01, 2016 at 01:36:42PM +1000, David Gibson wrote:
> > On Fri, Jul 29, 2016 at 11:55:48AM +0200, Maxime Ripard wrote:
> > > Add a function to modify inplace only a portion of a property..
> > >=20
> > > This is especially useful when the property is an array of values, an=
d you
> > > want to update one of them without changing the DT size.
> > >=20
> > > Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >=20
> > Applied, though I made a couple of tiny tweaks, see below.
>=20
> Awesome, thanks!
>=20
> Do you still have comments on the last 3 patches?

Sorry, I got sidetracked by other things.

The only remaining thing I'd like some changes in is the error
reporting.

The biggset problem is that in some places you are returning
BADSTRUCTURE for badly formatter fixup or other overlay properties.
BADSTRUCTURE should only be used when there is a problem in the
encoding of the tree structure itself, not a problem in the encoding
within a specific property or properties.

I don't think your code should ever generate BADSTRUCTURE directly
(but it could return it when it gets that value returned from a lower
level function).

What I was hoping to have a closer look at was to see if I'd prefer
just a single 'BADOVERLAY' error for any problem in te overlay
encoding, or if I'd prefer sveral: BADFIXUP, BADTARGET, or something
like that.  I'll try to get a closer look, but it probably won't
happen this week (I'm at KVM Forum).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXuvfEAAoJEGw4ysog2bOSOdEP/1xdHl/9YWLjf/j9ue/2dL5Q
c2wW8RgD0WN/jCnBetQanI+YaTW99D0YZiHv1BEcUmFbrRrmw23tP1/oweoTqGRS
EF9GTx/vZK7LUReidpZBSbSY1DXneXpQTWX6Gyq4Vu9XorfyiIINyt/lYiMQ7YR5
IbGrcU/CzwdWxJt1jvZxGSsZOtr+P/7wmDK3uLqo8ViFykHfvdi/KPEgAZrHJh0o
ViMP5Hvop28BTHJ/FWqYNg/Siy6TfsOWU0ehnLcF4qFiF4ErCLtuq0yMlLbNPO8I
1oFpqES9yaGZ7WNWsLPQo/NBT7yOKivQfatbQaitdB+0KE0wZIIZhe/+k6EEyhlC
DQv+xDD+M7v5xG/mcw4i5UiEzimjQDFAM6eAss1ioLXUCBaXwDIINN+YoZAM6IJ3
I62QOCmPVYXnscMdgFbcuoMAEUrj2Xf499oCnoF14j0kt0/l3VK16miSebZ0zRUW
CljTh4BZF0Ao/6btFSky/N5nNBDBP56NKevBkqrJoi0RP2hVOW5XMLg2WvDtRZYx
kz3dWpdOXU/btgiREcP8ZRyiJJW2Ze0BQimm7d+/Q8NkYWC655V+3o3SSqLUhEjU
t87udOTXdJZGUeIb6zYJecnkkASHrK5MvuK/VQeiINN+f25MBiZVeWxeTpUhWCtO
U0ctcYsMg3GgZd+moTg8
=xlCo
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
