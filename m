From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 4/8] drm/sun4i: Add compatible string for A31/A31s
 TCON (timing controller)
Date: Thu, 20 Oct 2016 17:59:41 +0200
Message-ID: <20161020155941.n2f34kamxkei3n5t@lukather>
References: <20161020034344.14154-1-wens@csie.org>
 <20161020034344.14154-5-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wjxyu4qegvbtqzqb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161020034344.14154-5-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wjxyu4qegvbtqzqb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 11:43:40AM +0800, Chen-Yu Tsai wrote:
> The A31 TCON has mux controls for how TCON outputs are routed to the
> HDMI and MIPI DSI blocks.
>=20
> Since the A31s does not have MIPI DSI, it only has a mux for the HDMI
> controller input.
>=20
> This patch only adds support for the compatible strings. Actual support
> for the mux controls should be added with HDMI and MIPI DSI support.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wjxyu4qegvbtqzqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCOntAAoJEBx+YmzsjxAgF9kP/jhfJnnxztwvkwEQA+5yS84m
VFBl2IRWrPqMDmNgJtsCyaC68hvmO0c4tAy3HJsbzhPfJIso+Cng9SUiYx7vYSqH
YByT/CXyopyR2VEL/d9NgrodPJpQa3rMzm+qVdr9ygJSKczMz/0ON4bEih9RT2Ow
0IraZbBl4exAMRtDYeCcVKnJ1ITAiZYACndPRPFXzXmmNnkYfOaogVsEn2Mu+N3J
GjpIEL38NfrE7Bh0HszC5bLe6TZFIQEaPFSVXD8RYdyg1wCBSN5k+UbTKMVofPXs
wNB0I0as+LpRRQEBhq/y/zo2Tz+JtSVcf7AjYbiqQnhe+xVmEWfob31ekMxTN2Q8
FN6I9T/zhQULotvC9hv2psEPDeo4L0ARjaVjn8l2zaRjjKTwTuCWY8JLmrAT+2Or
YnkRFtoqZJXaafGpwIcHU6vQ23RJOtii3dAn7CgwQ7Qi9ieZlKdzynvAHejg9UaA
Iylzykb6VG4zf6+WsX9XyXHj2amVd5tfBe2GUX5V8oyeGl9nSRck5kSaKVpDGn1U
YWZxf4o90/6SBnr0VqQR0p5QHXjxTEsQIAq6e5lrxTjSgUpTWMVdWaHta7q/W+59
Swmdm8Ckk/jHkjG5nthUn8va7JxJRYQLATiCG0ribVJMbMDXYZeBGH9Fv+5Gavq7
pyfO79wgHFQjYS3Qt5N5
=PdgN
-----END PGP SIGNATURE-----

--wjxyu4qegvbtqzqb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
