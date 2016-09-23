From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 5/8] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Fri, 23 Sep 2016 15:31:20 +1000
Message-ID: <20160923053120.GY2085@umbus.fritz.box>
References: <20160729095551.13592-1-maxime.ripard@free-electrons.com>
 <20160729095551.13592-6-maxime.ripard@free-electrons.com>
 <20160801033642.GV2588@voom.fritz.box>
 <20160822100721.GI7104@lukather>
 <20160822130156.GA20266@littlecatz>
 <20160922063922.GJ8719@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6Jy4/gb9ZgnsEOX8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160922063922.GJ8719@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6Jy4/gb9ZgnsEOX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:39:22AM +0300, Maxime Ripard wrote:
> Hi David,
>=20
> On Mon, Aug 22, 2016 at 09:01:56AM -0400, David Gibson wrote:
> > On Mon, Aug 22, 2016 at 12:07:21PM +0200, Maxime Ripard wrote:
> > > Hi David,
> > >=20
> > > On Mon, Aug 01, 2016 at 01:36:42PM +1000, David Gibson wrote:
> > > > On Fri, Jul 29, 2016 at 11:55:48AM +0200, Maxime Ripard wrote:
> > > > > Add a function to modify inplace only a portion of a property..
> > > > >=20
> > > > > This is especially useful when the property is an array of values=
, and you
> > > > > want to update one of them without changing the DT size.
> > > > >=20
> > > > > Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > > > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > >=20
> > > > Applied, though I made a couple of tiny tweaks, see below.
> > >=20
> > > Awesome, thanks!
> > >=20
> > > Do you still have comments on the last 3 patches?
> >=20
> > Sorry, I got sidetracked by other things.
> >=20
> > The only remaining thing I'd like some changes in is the error
> > reporting.
> >=20
> > The biggset problem is that in some places you are returning
> > BADSTRUCTURE for badly formatter fixup or other overlay properties.
> > BADSTRUCTURE should only be used when there is a problem in the
> > encoding of the tree structure itself, not a problem in the encoding
> > within a specific property or properties.
> >=20
> > I don't think your code should ever generate BADSTRUCTURE directly
> > (but it could return it when it gets that value returned from a lower
> > level function).
> >=20
> > What I was hoping to have a closer look at was to see if I'd prefer
> > just a single 'BADOVERLAY' error for any problem in te overlay
> > encoding, or if I'd prefer sveral: BADFIXUP, BADTARGET, or something
> > like that.  I'll try to get a closer look, but it probably won't
> > happen this week (I'm at KVM Forum).
>=20
> Did you have time to think about this?

Finally, yes.  Just sent the detailed reply.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6Jy4/gb9ZgnsEOX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX5L4oAAoJEGw4ysog2bOSWE0P/iCRoSW7QqjqOiPewB0vKZ6X
hV24bS2UccB0W1ipGNZwC/kkmu18sHC+sIqCVpUruLZIbKkpdyK4uvfmDQd03bJi
QQD1qIzumbiIER4dqTSNKE+8ZWfNoImNCgdAEWoBniwnzbE+IqMZYnezzSPeNStt
nXPP6T0XbUMxv4gx+NkOgBt6GMA/V6gJ81TgMVrGApycqYE9/wSQN88s8T4F0K2N
nh4nNbI+HI7qesO/CUkta4v0Q/bnb6qamSWaRqUgZtNC68H33ex+QjhQA4lclQPh
DTHA5kSyylaqYiajDvvkYENFpP7phqcBxGYzPlr4RiZK6hvvlGWpHTA14LBCvUnR
uiwfFnT8pa6diIQq9ZQLk+zQx3la7qAT1svIKcde2v0luJrOl21gzd3Di/BGjauI
ILgXU1FegKSU2tJOI6XmDo4u8mmwea0W3V72yoX68IDJYrETsd82WEGJBIHft8Wk
YW+oOHQepJMQRxvvum7GFWqorBB48NLqJSLM9Zdf2e0Twtup/MjpDxQDIDMhJ6TK
3qnSz1f8QiOixDmgvXg8VS4xr1SnW39Zirt+etXT4YKODA9Q0BjMVNTk0QmYL1XL
+BO41FrKf55bV3ROwlO66y7I5J9Nf7mI+d/QrPXUJ88qIHlQFhQ6UlnhDP+Yfnhm
sqPngv9c/eS5gduZIGT4
=Ttly
-----END PGP SIGNATURE-----

--6Jy4/gb9ZgnsEOX8--
