From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 05/14] drm/sun4i: hdmi: Disable clks in bind function
 error path and unbind function
Date: Mon, 2 Oct 2017 22:02:38 +0200
Message-ID: <20171002200238.zdn3frmdi4b2hh2e@flea>
References: <20170929082306.16193-1-wens@csie.org>
 <20170929082306.16193-6-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n4x2nbpglluim5vk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170929082306.16193-6-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--n4x2nbpglluim5vk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 08:22:57AM +0000, Chen-Yu Tsai wrote:
> The HDMI driver enables the bus and mod clocks in the bind function, but
> does not disable them if it then bails our due to any errors. Neither
> does it disable the clocks in the unbind function.
>=20
> Fix this by adding a proper error path to the bind function, and
> clk_disable_unprepare calls to the unbind function.
>=20
> Also rename the err_cleanup_connector label to err_cleanup_encoder,
> since it is the encoder that gets cleaned up.
>=20
> Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--n4x2nbpglluim5vk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ0pteAAoJEBx+YmzsjxAgPa0P/iKserH5q0J62i4p8nurCwew
11L0Rq25x/6ZxA3VuuhYiBayfqdtilpEiEbWgfjhC1bSNu4TG+bm+7Mh/kgsleBK
rDrEQW4TBCsJWAYdqgtI/htYHqiexNjlw4AusENiDH3b9KrJ4KQnR2IXQ6yTp8Gf
595jqji2LqF15EUZOgfRUs4DpO5zbeyqEgB3bupmzehpWfUX8p8qQjBaPMKJkbYF
VX7tIJfDkCRvTTjRUPcGRB3egd+wh7FC2wEf3vYxCxjlrnzNxKSimxXaLKFdr/TD
cn5CZX7NB+T/yonHNiRYxKUXObfRKSKozCxdqu5+sipQy6FgTRKxcTR59/S7ZTuU
1V5iXBlZgMDQ+hlqCJYJlFr+CDedIZL+JDEIboMtMrDt6JTCOwiMAEsmz1fVITwW
k45epSRh+w7GX3csZdaSgLXoPm06Jvt8OLdlRpmjGyNSCUL7BHXCv4dCHaOFPBIO
SPzillGbYD0vTdyU3Gxp4K+QJZDqBlO2G1jQGTaUOM1jNcmwzbN0+xy7QTJiXW/T
UmFsgVpamT+PVek6QTMnlrvIhwPRdlFuUbgWh9xG2gYqU1ey26XP71RnF8M9Sroz
QzbfEkCcNB7juG2Mp05Ol9VDN0j27QhAwbbykKNX9+D+/PwvWuzQ7f9QW3O+eD2x
ZBMfcaB55fFX1JEdjJZD
=HGI6
-----END PGP SIGNATURE-----

--n4x2nbpglluim5vk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
