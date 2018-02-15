From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v5 00/12] drm/sun4i: Add A83T HDMI support
Date: Thu, 15 Feb 2018 14:52:22 +0100
Message-ID: <20180215135222.7ta2r22je3dun3lm@flea.lan>
References: <20180214200906.31509-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hmkaczg3omrq4h5g"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180214200906.31509-1-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com, Jose.Abreu@synopsys.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--hmkaczg3omrq4h5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2018 at 09:08:54PM +0100, Jernej Skrabec wrote:
> This patch series implements support for A83T DW HDMI and PHY. Contrary to
> v1 series, this one is based on latest linux-next, since all needed patch=
es
> were merged.
>=20
> While exactly this combination of HDMI controller and PHY is not common in
> Allwinner SoCs, this patch series nevertheless makes groundwork for other
> SoCs, which have same DW HDMI IP block, but different PHYs, like H3 and H=
5.
>=20
> Please take a look.

I've applied the two clk patches. I'm waiting for some review from
Archit on the synopsys bridge before merging anything else.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--hmkaczg3omrq4h5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqFkJUACgkQ0rTAlCFN
r3Ttxw/+LBVtH/qfKjzG6L16Jur2rgZk5GZtfhatjnRwsCpSAjYmNEaG2kbhfSwI
rlY4sY+kE7MY26PKnSNx4hlQ1EB4yAa2I4nkE34a9tDRcdWcl88vz4hrM84yLB7d
BuIB/qcgkAVxVP8IcRM5bFfWZx1JkBm3JUF1Md8ZITdY/aGyc1hdga+aQjbOwEiO
AdROg0k79xnkacbEwxv6DGvFU+NquEObvQ29hNGQqXutbzKr/N1OYjc5hw+uFbmz
HaXtoZXRnywJGeIEakufxHqgvnMxUEQd3J0jOOK4b3ZPMIqA6in0qKEzfWAhivpn
JxXO7nMeDh/t9OAf3eKheFc/m46vp6/G0TB6HMif/ZYeLOB+bcGQThfDH3C/inWR
Qhs/ivYEVOCVo/Gdv8Y5lkMXQt5RUW1JJnC8x9phQAD3rBfCLkHX5LkDdPtffYtv
XLAFwUet1Q2ixENP3nEBsBne013nDZbYG7jyIVHrTGcWECqxa+hIbf1JwNaH3AUd
3QS3dLMV9rs9twqdUcnKITNRZIDr9k5rSRknAZTyCKl04z+8KP6QSwH8bV83Ak4v
7V7rRdkm4McJwjWSRIQSWHRjswT83AaalFy47AiMq5cMaco0uNiN/HJVPIyO4ku9
eBzpg1FQfq/LNEfG0o/bDjXBVe2Pa4tuGHmDfEgjklKRDTCG/gI=
=aMPH
-----END PGP SIGNATURE-----

--hmkaczg3omrq4h5g--
