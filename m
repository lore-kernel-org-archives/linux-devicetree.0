From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 07/12] drm/sun4i: Add has_channel_0 TCON quirk
Date: Thu, 11 Jan 2018 13:18:15 +0100
Message-ID: <20180111121815.lzhfy7n7uppamznj@flea.lan>
References: <20180110192512.19684-1-jernej.skrabec@siol.net>
 <20180110192512.19684-8-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zok6ncilkcjhhzzp"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180110192512.19684-8-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, mturquette@baylibre.com, sboyd@codeaurora.org, Jose.Abreu@synopsys.com, narmstrong@baylibre.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--zok6ncilkcjhhzzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2018 at 08:25:07PM +0100, Jernej Skrabec wrote:
> Some TCONs on newer SoCs doesn't support channel 0, since they are meant
> to be used only with TV or HDMI encoder.
>=20
> Prepare support for them with adding has_channel_0 quirk.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zok6ncilkcjhhzzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpXVgYACgkQ0rTAlCFN
r3T1HBAAhx3piBiWrfsjuBWDTSYsq/ELGiToYoMKJZK7poKdjb/Ikps83FKbFYEF
KK7f/63s8ScjDBAxvCOoPO3nIVsIRfAmiqlcsaLzNbwkcdMF/oo6YHKi00GqETGf
W1+8MhaEVuW/UWJG73oVsBJIQ8Mp5ertfZIeDpvWw/s70SlRHSNiaOfryMwx4OM0
3M+ZcI9PK04AKT6V8pJ5/hPqsE0G85q/uDlBod+KtZ2NCosgPin48RLx38qjmRF3
OAfc+iz3KwwpxxfXPNlkKAzWyTmmaPFYL8JSb0nqSXLIhwAdhcDCDB/RgBcUFbUa
2HjrS2m3K/X397ngQCs7VsABBmYZlQBGFQ2xhgfw0ZRj7TdrkApG1uJhjGrjvXgm
zAa9ocVcVDaDj9X43dpMFBZJWILQ3FbaPJl+nOgQHmq+Kven0pFuksKU4yhvEMRs
k13kSi0c7WdxnHltoPz71QtmszrOLmXQ0zV0AsHRrp9Zwpwt1jo4nCWOisVShxM9
xAOFYGD/rs3j2FnJ3WU4ubijf/OKl2zHfebF9GOIaJZ0JJ9sfzBVxud3ogUMsUwn
QzbM6gzl7x235mOnWXfPWvzct54UXVOB+JboRXPIy+JS8+xSWIv67spSzn6Nnuhb
MyHc74rHZ64hJ04UakLuHDFf1lKC+UHqj+9ouUwIHGvuY9hvW2o=
=4PAM
-----END PGP SIGNATURE-----

--zok6ncilkcjhhzzp--
