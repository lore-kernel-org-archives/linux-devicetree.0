From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 5/8] clk: sunxi-ng: v3s: add Allwinner V3 support
Date: Sat, 20 Jul 2019 11:46:32 +0200
Message-ID: <20190720094632.6plwtvt73xlnucw7@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-6-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qzyk6exegy3asgml"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-6-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--qzyk6exegy3asgml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:31AM +0800, Icenowy Zheng wrote:
> +		[CLK_MMC1]		= &mmc1_clk.common.hw,
> +		[CLK_MMC1_SAMPLE]	= &mmc1_sample_clk.common.hw,
> +		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
> +		[CLK_MMC2]		= &mmc1_clk.common.hw,
> +		[CLK_MMC2_SAMPLE]	= &mmc1_sample_clk.common.hw,
> +		[CLK_MMC2_OUTPUT]	= &mmc1_output_clk.common.hw,

And there's the same mistake here.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qzyk6exegy3asgml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLi+AAKCRDj7w1vZxhR
xQjRAP9ST2/2c5sjUdw8/ITU0eEvk6+5Bu5SYQ2ltWVX6cOWFgEA9vegVFVC4LnG
ZendV+/AhkM+QvA9ziMPeStbZE5x+A4=
=nSSY
-----END PGP SIGNATURE-----

--qzyk6exegy3asgml--
