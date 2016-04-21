From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 4/7] regulator: rk808: Add regulator driver for RK818
Date: Thu, 21 Apr 2016 17:02:32 +0100
Message-ID: <20160421160232.GU3217@sirena.org.uk>
References: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
 <1461244361-45686-5-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fkX35UkdEibezs2J"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461244361-45686-5-git-send-email-w.egorov@phytec.de>
Sender: linux-clk-owner@vger.kernel.org
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org


--fkX35UkdEibezs2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2016 at 03:12:38PM +0200, Wadim Egorov wrote:
> Add support for the rk818 regulator. The regulator module consists
> of 4 DCDCs, 9 LDOs, 1 switch and 1 BOOST converter which is used to
> power OTG and HDMI5V.

Acked-by: Mark Brown <broonie@kernel.org>

--fkX35UkdEibezs2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGPmXAAoJECTWi3JdVIfQ3w0H/A+ZTcyGxM8WpZfJGaJkczkE
5tO4SaQOojezvfRrd9Y5q8PRYljPpjMTCzqoxD94FC2pplzKBVqsLWeaPeUNqr/K
37FeCFl/8u2RjmkjD/Xav51ML44K1CzvYCndZJE3JfzmPhJy0mt6LO1imPKkhsf5
nVIErqORwxkzYF/baLLlI8Rmiqk4BWMgsyMuL1l0xIvNb8yLfKo9olDQGI3PsU0s
i7iXSiNgSbXTQ+BbCpADzT0i+VzCdpy5ELzgpejtQE5A2reUksuIprr8gsTuLiGS
axev5G24loRMkgdVb36SAfn2ndDQ+gFMJjiw7oxkcBMmFwaDro3ju80fJznJzNY=
=nc2X
-----END PGP SIGNATURE-----

--fkX35UkdEibezs2J--
