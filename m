From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 1/4] libfdt: Add new errors for the overlay code
Date: Fri, 30 Sep 2016 14:24:46 +0200
Message-ID: <20160930122446.GT4189@lukather>
References: <20160929112908.4468-1-maxime.ripard@free-electrons.com>
 <20160929112908.4468-2-maxime.ripard@free-electrons.com>
 <20160930014349.GU30519@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Q/AGl/UrDvkbRExF"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160930014349.GU30519-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Q/AGl/UrDvkbRExF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Sep 30, 2016 at 11:43:49AM +1000, David Gibson wrote:
> On Thu, Sep 29, 2016 at 01:29:05PM +0200, Maxime Ripard wrote:
> > Add a few new error codes to report the failure conditions we might
> > encounter in the overlay application code:
> >    - FDT_ERR_BADFIXUP, when an overlay fixup property is not properly
> >      formatted.
> >    - FDT_ERR_BADOVERLAY, when an overlay cannot be parsed, even though =
its
> >      structure is correct
>=20
> So, my thought had been to combine all problems with the overlay for
> fixup formatting into a single error code BADOVERLAY.

Ok, that works for me. I'll merge the two.

Thanks!
Maxime


--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Q/AGl/UrDvkbRExF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX7lmOAAoJEBx+YmzsjxAg/usP/2N/WG8hcNKint4riyCk71M/
REw0hTUqGuCiSvwJdBLG2q//2321SoQR3DdhAwSiIv1i1EV7rCkCBBdYY8suSkth
/9dK0FmhR/2D1FXZRzmuGXm0dWurXYeio62KYQG5oAmc1GLzJWnNmeHvxH8k5qJj
YpzxkyEYpLvm4wCu2Dchz4pLbSmovpOxitDi2HSjVSUKqo4cGmrdl++2To6MB4sH
NuP0kDaSgpoyunkYIfPovgZhvVO2sqeQEafGfMKWo5DUtWC5hOXIDDLHdWCXnKEn
L21A2rm8hAhPIBFmA/1PAJJMtBJQB1AZLU+hUZW7DB4DYGz5fW7iayjsVPpqOI8d
1RRP5svIx7j8TUzb/rEJ8+ImMEL8tbMY9LLFgd9ItRmThVb7ZaHefz/x1rqhdlHU
WKJEQvTB2LIv4sl/7vYfhE33ETSP5jq9cPSOVsjAEUb1jzjrEKiB+J4nPTUIJEhZ
sM5gFiq+piUJ7PI88CoG6ySRYucWt2RDLzkCavzUSq/AI88rIvwCnQZs7hq7vsFw
7tVmBSJrl52xjolZXSLIXRuDULBWxlO7fuWqEh5WOVwLmzMTYf+O69Lb5IOtRb1g
+FLNjeDq83Kha/qCCJiNRzx9fTCv8oNxicrQ5wQlg5FE8VZ+lQF1YWUdUdLtFIwU
G0DorCdi3US5JH8AWDkO
=gldu
-----END PGP SIGNATURE-----

--Q/AGl/UrDvkbRExF--
