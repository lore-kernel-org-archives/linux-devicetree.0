From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 5/8] drm/sun4i: Add compatible strings for A31/A31s
 display pipelines
Date: Thu, 20 Oct 2016 18:00:07 +0200
Message-ID: <20161020160007.hbdzhw53gcrl3hvj@lukather>
References: <20161020034344.14154-1-wens@csie.org>
 <20161020034344.14154-6-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k7gxwuktgm2bccos"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161020034344.14154-6-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--k7gxwuktgm2bccos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 11:43:41AM +0800, Chen-Yu Tsai wrote:
> The A31's display pipeline has 2 frontends, 2 backends, and 2 TCONs. It
> also has new display enhancement blocks, such as the DRC (Dynamic Range
> Controller), the DEU (Display Enhancement Unit), and the CMU (Color
> Management Unit). It supports HDMI, MIPI DSI, and 2 LCD/LVDS channels.
>=20
> The A31s display pipeline is almost the same, just without MIPI DSI.
> Only the TCON seems to be different, due to the missing mux for MIPI
> DSI.
>=20
> Add compatible strings for both of them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--k7gxwuktgm2bccos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCOoGAAoJEBx+YmzsjxAgXCoP/0awRZ72JvJm1pf4MprZlibo
+Tr+ScfCdcptmWrw04RHQWPbj407zmJyShCKRfSSSi4ZmURqWfZEOxqUcz0Xj+Bo
niTielDtqgff1+PR6lCy/g7zGdL5HnBKsLD1Bj7eGXfE/OQ6EXw1kXDgctiYUP1e
3pr+mYg1Z4GU0QBkPidyYLDI4cShqD/R8NF6iBtcFLhgvDL5cNQ+4Vz/pt0p5f7e
9ACYewt5AvJEx9ekEPiXR7z0E2+tX0WU8qe5DRRzVUdD9kKADOKlpmgKah49FD9e
0VIkILq8RC5SCRZ+S40KEhmcM3wYGE1A19PY1GZ80Z2UVpFH4bdhI/9s0j6Y83S0
rOxAFu0FK9ZqtyODLI8cGsgBawJlqESaQDQwwJIKdj8ZDldMNNkO6T5ElgXCrO9+
jrkB86haBEVn/KP4Sgx2YES2ACyt0tnxbpQLVqp7SCD9W4azdPrKrRbMOIvJOKVX
n2XWoe+OAdIGV1a7bq/fyrwNGU5lzl7guQmtzG1M9M4spGUZCAnN70RfQrVvR76Q
fgbmBX7NwZ9iA4gHN//jIRycg2BaMreYt+HxK4P0KE7xi9oxMBbiSacettzx4l9X
bKytHF15FawK3Qeyw/OcUpAXSRy4B0cpo3UtVf9UAg52wemoNb4iRBGDMadN2z7I
xlbIjKaGq9ugjKvSHHSv
=ZDpR
-----END PGP SIGNATURE-----

--k7gxwuktgm2bccos--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
