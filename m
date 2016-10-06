From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 4/4] tests: Add tests cases for the overlay code
Date: Thu, 6 Oct 2016 20:28:59 +1100
Message-ID: <20161006092859.GQ18733@umbus.fritz.box>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com>
 <20160930135717.16511-5-maxime.ripard@free-electrons.com>
 <20161006083348.GN18733@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rUztinBX/EQDJOOk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161006083348.GN18733-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rUztinBX/EQDJOOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2016 at 07:33:48PM +1100, David Gibson wrote:
> On Fri, Sep 30, 2016 at 03:57:17PM +0200, Maxime Ripard wrote:
> > Add some test infrastructure to test that the overlay can be merged, but
> > also that poorly formatted fixups would fail as expected.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Hrm.  All the overlay_bad_fixup testcases fail for me.

Ah, that's because they should be under the the conditional for
overlay-aware dtc.  I've adjusted that and applied the series to
master.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rUztinBX/EQDJOOk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9hlRAAoJEGw4ysog2bOSYYgP/2l3+lNkfwJb/AscO2QuhiMe
vXMlhPUom2BpkwW9VMlZOTSjuxru38zJaDcszw1lnjIFjz9RTTIsnNXYskqTKJPS
nbiTY5nmxZKFjx5SRmwU+XRLFf6edDFfcdoSxP9XSWdKmL0LuaKNFnfhVgvleAuo
6z3BGRD4ILs3xtd0ujO7yE3DFKsc8V6TkTzWC2WHqtj7EZJkiW16oeWYhkWNNkIm
/uQ15iqzRd151JSNbqYWVbzfMWPMpQzfbID6gXzjHONkJgpyl5pVhgy5QhNn2pgM
rIGulzIDaAWZeBqEJtVTdn3xFF+T3dVwQQflm6Wd88Q93yZCUSdcEw5L2o0iCFeA
szAd8ZiWqV+OfqtYYV9rEqcv3ZwNmy2VNLS4ONni9UniMfeMqN/tymy/0RlTKYFK
b87nKeV0E2qPVaTw1JpAhyXvv6RDZ5WbmjvXDKXT8eryvYVSilbRZj8ELIsBhWr2
Bcpdro2q2cGAdAXunYX14VPjIuQ4+k01ffEeQGheiZAKY5uJ6n4by5LQjCRl3XJ4
p0uecyagopEB0jKxzDZddDFpelT02FNyJK5VoHtThnpjS8RND8EYCc/45akVFVdb
8XkccPLY3oR0WGr5PPn6DqekCqcN6VxmzhMvq5ulgGTZUEPBI0FOFuiL+2WwncEr
FZLksdt8R2Qy4qIQsZ1b
=5FLj
-----END PGP SIGNATURE-----

--rUztinBX/EQDJOOk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
