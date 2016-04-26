From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 3/8] regulator: rk808: remove linear range definitions
 with a single range
Date: Tue, 26 Apr 2016 11:46:45 +0100
Message-ID: <20160426104645.GU3217@sirena.org.uk>
References: <1461590448-47685-1-git-send-email-w.egorov@phytec.de>
 <1461590448-47685-4-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UDCjyp4MAF5V3Huu"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461590448-47685-4-git-send-email-w.egorov@phytec.de>
Sender: linux-clk-owner@vger.kernel.org
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org


--UDCjyp4MAF5V3Huu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 25, 2016 at 03:20:43PM +0200, Wadim Egorov wrote:
> The driver was using only linear ranges. Now we remove linear range
> definitions with a single range. So we have to add an ops struct for
> ranges and adjust all other ops functions accordingly.

This and some other cleanups are now available as a signed tag from my
repository:

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-rk808-cleanups

for you to fetch changes up to 4a5ed8c1adc39f86a2887183c71b007bc962fdce:

  regulator: rk808: remove unused rk808_reg_ops_ranges (2016-04-26 11:11:29 +0100)

----------------------------------------------------------------
regulator: rk808: Some cleanups for the rk808 driver

These are tagged to facilitate the addition of support for the rk818
which may end up overlapping with some of these cleanups.

----------------------------------------------------------------
Arnd Bergmann (1):
      regulator: rk808: remove unused rk808_reg_ops_ranges

Wadim Egorov (1):
      regulator: rk808: remove linear range definitions with a single range

 drivers/regulator/rk808-regulator.c | 66 ++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 41 deletions(-)

--UDCjyp4MAF5V3Huu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXH0cUAAoJECTWi3JdVIfQ6aoH/AmnClPzC9wF7fbnXCseYz8O
87ecgxRazLhU3fasgfIH8m6+Gj2P7Go+UgHWq9f3ewfdpdU1bFbmGVcCp5hhYscq
N2X+QdPdcP8FlkqxXzsJP3RI8dCUXofhnVkfX6c5VpjvtT1eUXRyFlNM3fvH3Jpz
c6mzb41jxOehCGNvnlYwKiYL/ADwa54y0XF8aLbSHjm2OKiA3TbcS0sAjsVAE529
Eu3jxf9IoxEfVpd7nR5VjSUxjRKZtr8Q9/E8LMdnK9sFiDsWZ97LmaBdyP7II5Eq
N7W5PmrxqnPo5Y4WBh6zMCvNWm92Wx/D1fkZrN+qQKLqA+ETkpsSIQ6tx0Yik2Q=
=l/MP
-----END PGP SIGNATURE-----

--UDCjyp4MAF5V3Huu--
