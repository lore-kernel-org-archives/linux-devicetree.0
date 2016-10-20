From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/8] drm/sun4i: tcon: Move SoC specific quirks to a DT
 matched data structure
Date: Thu, 20 Oct 2016 17:58:46 +0200
Message-ID: <20161020155846.5nxgxy2xfgmagxtn@lukather>
References: <20161020034344.14154-1-wens@csie.org>
 <20161020034344.14154-4-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dfydbf4wafduadgy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161020034344.14154-4-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dfydbf4wafduadgy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 11:43:39AM +0800, Chen-Yu Tsai wrote:
> We already have some differences between the 2 supported SoCs.
> More will be added as we support other SoCs. To avoid bloating
> the probe function with even more conditionals, move the quirks
> to a separate data structure that's tied to the compatible string.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dfydbf4wafduadgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCOm1AAoJEBx+YmzsjxAgkmcP/ipx2LKRNTcJrkx13nwwCWAD
3ShS4V/osEALZ4eweuRuQBJbPKMg2f4SmtuKUMn4zCcpRQz+oOeajLDI+axi+Q41
pmV9+J3YVxXosVZDqHLDrTOR+Yy8O6d3Wxj9aH6PnLTmMlwF3JTKCRHrr5kldcsI
jXr36FoqUQ9r5t4ZlVSpwEHJ+d2zj1OG2CGvTNgBSGXvtXMd4dQNKPw8TNwCuVWS
K9nVzT5siehUP0oB7Vwg08KsEx130gBoCsDrpynAQ2jPWiuvPirEje+1B3xtdCsH
jojGhmHP+p3kPYlYnLj2a/DX4RKpUVcx/MDEPimK2XacBgLM5XLjWjp/NkyzwlQL
3y35q3YZq2w7l2s5QJwr+ly65S19gWqj/qtYQV4bJNrp5OD8oBOWaOlbCyeOjRA5
v+6+IcLATRA7aiD6JJZCxaOG64zkuZxUqKdSt5ehJMyjigNQA4IuPYWbPh8e6Rdz
kNftiAQ+3jg+IQ0IwhAA1cHLh6MwNH97OO+8HTHRM4e744Zv3XcrtALmbga+07MW
XSS3cG/9Da18ots3Al/H8SCDEv8/2NyAusUDykKv206352KFc0m1mGC500eru1oo
bA/qACBVpzCxzjLaesQ6Idz+1e+vThxARGc0k7RPJVf9HEdnTY6YdjmuMLwzQVEY
FUQCgXmXec9GKABE7nYf
=CaIW
-----END PGP SIGNATURE-----

--dfydbf4wafduadgy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
