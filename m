From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i: h3: enable USB OTG for NanoPi Neo
 board
Date: Thu, 7 Dec 2017 10:03:11 +0100
Message-ID: <20171207090311.deat4rvbthye4b52@flea.lan>
References: <20171205090706.et5a7dizkhn6auje@flea.lan>
 <20171205220358.GA28161@t440.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zzy7exskxkif6zyx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171205220358.GA28161-JrLRIG1mnG582hYKe6nXyg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Adamski <k@japko.eu>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zzy7exskxkif6zyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2017 at 11:03:58PM +0100, Krzysztof Adamski wrote:
> Similarly to Orange Pi Zero, NanoPi Neo board has an USB OTG port with
> an ID pin but with unpowered VBUS. This patch enables this port in
> forced peripheral mode.
>=20
> ohci/ehci nodes are still enabled since the host mode may work if
> external power source is used. In that case, the mode can be switched
> for example via sysfs. The same strategy is used for Orange Pi Zero
> board DTS.
>=20
> Signed-off-by: Krzysztof Adamski <k@japko.eu>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zzy7exskxkif6zyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlopA8sACgkQ0rTAlCFN
r3Qr2g//etrzUAtkKI2tgL9Geqf8h7jFVkG8ByQbXylzNKiNHH4ucsZ4AY+Zi+hx
ZZaIqFAoFXtSM3VMA4un/I4mVUN3rlAMBONieaRKAKu1BGehjY5m2Tht5Y/zGIQK
vjsYwUJpS4m5GCkpPm5Bwuvs1q17Dfw8KrNE+IErQ6/+0dbda6YPZ7y5aps3SpxU
aAu0co8+JcYQImy9GRKoN9NAMCtmx7EtRS/QFf7GDIW4i5pOu1luBt5Ruusm48AS
mwdhHU1C2QcyPmvwm5lmMK5h/p5zkQMKvDuaJFE7ws+lFTphfllUhN2pthNMjump
xEc7GnbBWiv5QEZwlJhB+di/HfzU6xH6gQ4hHDa5II7YOVn6dzZ2iObZoWzZG9H/
JC22CiBUgJPFX/HnvyKCwjgwwYxCSTzYMfizANv0mkVTYyt/5jF8pjG3R7xdb4TF
uPx+hZnv0mMgbOgnmgQxxWiPdFPWMERLV1fLKr2zNo8aew3HmG05gZjnwVIYxZmG
XagWcau+sDdrXjJ9oW5o8wcfELaRk+YBxx33//Hy2RteYl+0esYrm82S5N+9orM7
CZu0qqk2//BlB/IsFpyXMnEEqGR+uD28ie0KhLLpMOOllJ7Xzg3/Pclnhb9M1wjX
psHSGldYx3QhKGXiOC7Km4BiSlOC9CDm1atT/M+1aA4gDPtEmhY=
=0n4w
-----END PGP SIGNATURE-----

--zzy7exskxkif6zyx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
