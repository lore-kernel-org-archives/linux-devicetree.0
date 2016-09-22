From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 5/8] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Thu, 22 Sep 2016 09:39:22 +0300
Message-ID: <20160922063922.GJ8719@lukather>
References: <20160729095551.13592-1-maxime.ripard@free-electrons.com>
 <20160729095551.13592-6-maxime.ripard@free-electrons.com>
 <20160801033642.GV2588@voom.fritz.box>
 <20160822100721.GI7104@lukather>
 <20160822130156.GA20266@littlecatz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YZElM7ipGqdpYifc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160822130156.GA20266@littlecatz>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--YZElM7ipGqdpYifc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Aug 22, 2016 at 09:01:56AM -0400, David Gibson wrote:
> On Mon, Aug 22, 2016 at 12:07:21PM +0200, Maxime Ripard wrote:
> > Hi David,
> >=20
> > On Mon, Aug 01, 2016 at 01:36:42PM +1000, David Gibson wrote:
> > > On Fri, Jul 29, 2016 at 11:55:48AM +0200, Maxime Ripard wrote:
> > > > Add a function to modify inplace only a portion of a property..
> > > >=20
> > > > This is especially useful when the property is an array of values, =
and you
> > > > want to update one of them without changing the DT size.
> > > >=20
> > > > Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > >=20
> > > Applied, though I made a couple of tiny tweaks, see below.
> >=20
> > Awesome, thanks!
> >=20
> > Do you still have comments on the last 3 patches?
>=20
> Sorry, I got sidetracked by other things.
>=20
> The only remaining thing I'd like some changes in is the error
> reporting.
>=20
> The biggset problem is that in some places you are returning
> BADSTRUCTURE for badly formatter fixup or other overlay properties.
> BADSTRUCTURE should only be used when there is a problem in the
> encoding of the tree structure itself, not a problem in the encoding
> within a specific property or properties.
>=20
> I don't think your code should ever generate BADSTRUCTURE directly
> (but it could return it when it gets that value returned from a lower
> level function).
>=20
> What I was hoping to have a closer look at was to see if I'd prefer
> just a single 'BADOVERLAY' error for any problem in te overlay
> encoding, or if I'd prefer sveral: BADFIXUP, BADTARGET, or something
> like that.  I'll try to get a closer look, but it probably won't
> happen this week (I'm at KVM Forum).

Did you have time to think about this?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--YZElM7ipGqdpYifc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX43yaAAoJEBx+YmzsjxAgDKIP/0blytUYvrxV/VyLEpEcT90/
MTKWO1cJDIdMuOHhEdlRfKs3nJgMnWWmyungO9as08p6IW68FIqr2IYR+YnhisFo
jiW/VQFluWymEL2ZAA7jqb+2lRKFvqf9FlebE6XDOSJqXezPnFDP1w5k7Xxr7lV1
OosiCOqwMV2tmNfZ2ycHjhV6mJROb6P1qmcsOZYOzqCdWm1hAaHafhB7rTpoNY+o
0IekkmQ2TIZPaXJb3d/hx3dCjP6CXR+J6THNsmQpc3xBbVk0nT3HYUGmt8UaVl8u
AVY2czHAFLHRe3DnpyykblAKFYo/DUX/bKN5mvDmaF9iCboNAVQDqpma14sZ9qJJ
zxsZsjpHY5EO58flsTxC6HIA112kNj/tsCnU8ViXizhznKd9LBUO/wISSgZs2R2H
Vz267kaf1YEVIumfG7o9RHdpee82weA602jDxQLppwA3jKkhx/YMETptqPXjbTyK
Svt+7u+1Ny3wbv4POtbr9XcqRoAWWn3cb2kVv+Ly9eQSBswtq5TBd0McvFgmtelT
8AHSU2x72BBo/My5tQsxokK2kOFNSkOWgEQOlXDRlSbLiusl0MRO4ifDYaTa2Q7V
NVIOHdxrPlG+Fxp372d1BJwH5qn4A4YPfkkA8LKc2UrcmGilCc4gs1IBuOsAAc2t
KcnoJSyMHsCBD/0LWbJK
=8GHE
-----END PGP SIGNATURE-----

--YZElM7ipGqdpYifc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
