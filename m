From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 3/6] regulator: rk808: Add regulator driver for RK818
Date: Fri, 13 May 2016 12:20:56 +0100
Message-ID: <20160513112055.GE22038@sirena.org.uk>
References: <1462886340-7893-1-git-send-email-w.egorov@phytec.de>
 <1462886340-7893-4-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462886340-7893-4-git-send-email-w.egorov@phytec.de>
Sender: linux-clk-owner@vger.kernel.org
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2016 at 03:18:57PM +0200, Wadim Egorov wrote:
> Add support for the rk818 regulator. The regulator module consists
> of 4 DCDCs, 9 LDOs, 1 switch and 1 BOOST converter which is used to
> power OTG and HDMI5V.

Acked-by: Mark Brown <broonie@kernel.org>

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXNbiWAAoJECTWi3JdVIfQ82IH/0WRYTRTlQk/OPon4FIaa0IO
oBFGlMS/tz6UgBysOleM8JPoDrX4wKImWQHYurbJ8IGOqpGfScZ7o1g5h79t05RQ
HABbHNz+BDHg49foowhQGAKBW7enpzIkKEbsXEj/Bt76g5l3Mdoj9Gzn6HuJILM4
HmGm05lSdLtxJE1zXZXcl74MqAWRgbVA9jw+KoHOMnSumLLHso1vue5A+UtvJImE
Q5J9L1BGjCyxXfGXWq7JAFtBcPPokFv/A3vbdsLMlHfFHYkZLHR74IAXWM2IIiSh
NoaM234W/hluaDT+P4ftX45ZInqqo6S8KbEznQsTAuKMWopfgeu2L27C4vqbXBg=
=hJT+
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
