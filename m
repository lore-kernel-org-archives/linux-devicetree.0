From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 5/8] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Mon, 22 Aug 2016 12:07:21 +0200
Message-ID: <20160822100721.GI7104@lukather>
References: <20160729095551.13592-1-maxime.ripard@free-electrons.com>
 <20160729095551.13592-6-maxime.ripard@free-electrons.com>
 <20160801033642.GV2588@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mXDO3udm/xYWQeMQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160801033642.GV2588-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mXDO3udm/xYWQeMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Aug 01, 2016 at 01:36:42PM +1000, David Gibson wrote:
> On Fri, Jul 29, 2016 at 11:55:48AM +0200, Maxime Ripard wrote:
> > Add a function to modify inplace only a portion of a property..
> >=20
> > This is especially useful when the property is an array of values, and =
you
> > want to update one of them without changing the DT size.
> >=20
> > Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Applied, though I made a couple of tiny tweaks, see below.

Awesome, thanks!

Do you still have comments on the last 3 patches?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mXDO3udm/xYWQeMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXus7ZAAoJEBx+YmzsjxAgY5AP/3LcpwHu5/G/iSSULwzwlxeE
/9ZmUNWnrMM8NAL3WdrksAgt3OXryzr1U/exPfBdfkSk88UOpIhTox7WgV8GKdXj
QL0kUBpHtm+x9bQLrDHny45Cl9iPzy/2HBBxR5gjs0QxNLYZ18HR1x2oEsuAsx8P
+719xqEyM4dCxFwWBEjOqhzwJnR+dqkU/zKiO31FcOrTu2RiLeymov6yyS0eMAtq
OGtv8aVIcL1DgtTt/lHt2VMcCqO9f5LS7MfXp+ps30K3dR3vLf1w4oSFABVJazAu
RQ/NRIClis0nIrYlRY9mcR/Hcc++ZDY0Ooxkuf4NiCJsfPaO1NJTM8+iTUzOOzjX
h9YUPJTWMtXjAOmGj50WiJrCqyes9nink2XLFHFZeVsRk2NaKjYTOhLGhvYTFC99
eB2YFsdqXnnwq8iP4bSiQKUXDOZ3H0PVd+KjcpVWKTnadY+0CjWFN6FFBkhY3SAE
CU7OsueR1EGTncwQyxDKFfN+1lTF0zoX2cqP+U+DKfkQrK8IJ0tDEw9Ja9MGdys/
BPS5PmsUi/L5X7rW6B4sRe2bL790kHEF0SrgoCtim9jUlYRfbiOYOt/ipTAQpBHb
uifO0QM/ytx6wdpJNtLorvBYaqgC0/7/tR6Wutv1c0rvthIeKsEt2t6TruhhqVWL
NTnhZPv5vOJwT3Cr/M31
=3HQR
-----END PGP SIGNATURE-----

--mXDO3udm/xYWQeMQ--
