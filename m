From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/5] rtc: sunxi: Depend on platforms sun4i/sun7i that
 actually have the rtc
Date: Fri, 18 Jul 2014 10:11:34 +0200
Message-ID: <20140718081134.GJ20328@lukather>
References: <1405323137-24287-1-git-send-email-wens@csie.org>
 <1405323137-24287-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fU0UwhtRbpo05rnG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405323137-24287-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fU0UwhtRbpo05rnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 03:32:14PM +0800, Chen-Yu Tsai wrote:
> Now that we have Kconfig options for individual sunxi platforms, let
> the rtc-sunxi driver depend on the platforms that actually have this
> hardware, sun4i and sun7i.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--fU0UwhtRbpo05rnG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTyNa2AAoJEBx+YmzsjxAgIPwQALpyqzABFvvoCC9f212Jo5GP
sT3zVEdQMK2vqFvdDTXBW9UZ0TvW+6M7vObQRHHbHo9GHnYo8lI9ZPaYxx0IGY2U
CRgc52bpyjv09+16npJqF0+TrMPuSxnv8fy+M24OCBD4svx2MK/lDGsFYSF+v1yB
1uXpZOtjJIcG2Ebhd07ZjONyfulhzbfYqfieYHb+CtAa9X3rTq2BDDAKJA5OIrdi
QFMlOifUBGZBtspg8jGy5QSdrA+3PgyQlPWKx6cOrn5ZSdb0uPF5sUQGAZEZcFdM
p64coZRVLJkVKeR/SwR1NmLgTaEVfihhZXF9Z83tknYmz9z5NjYGVed28oHO2xCA
s2xjASwLIyLnKeX+0nxQzVHQuDv0hXeojuSPAhe6AYQHZJDN8Xw9Kwwt/AiHjxuW
3DntLapEwMsjbtK2b0j+LDlk1UyMSl9XsdsXYRFtUg0Uj1FSaZXUo9NfvgUi8cNh
lwlcc+pQCBDy/j6JkBttKjQVZwAADIa+r17NdLhWH439CXsMD0YHTLmNUV1aoGL9
Df892qd9rh2yJXqiveqlojkiQ9056JJLJeachd5v4B3cZ2YANZTxLNtwfDyj3g6l
U+pcU/jl90vR1yheu6ApaOpANcQVuPSYk21z8VRIw5fiub4oqY/cxJYQWdUapwaN
eidYId0k6xDcGHH4Hbgi
=S0YM
-----END PGP SIGNATURE-----

--fU0UwhtRbpo05rnG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
