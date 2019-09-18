From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64: pine64-plus: Add PHY
 regulator delay
Date: Wed, 18 Sep 2019 16:46:23 +0200
Message-ID: <20190918144623.tkwrhykb3sxqbr6d@gilmour>
References: <20190909184235.13196-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="td5nie2iuibay3rv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190909184235.13196-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org


--td5nie2iuibay3rv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2019 at 08:42:35PM +0200, Jernej Skrabec wrote:
> Depending on kernel and bootloader configuration, it's possible that
> Realtek ethernet PHY isn't powered on properly. According to the
> datasheet, it needs 30ms to power up and then some more time before it
> can be used.
>
> Fix that by adding 100ms ramp delay to regulator responsible for
> powering PHY.
>
> Fixes: 94dcfdc77fc5 ("arm64: allwinner: pine64-plus: Enable dwmac-sun8i")
> Suggested-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Queued as a fix for 5.4, thanks!
Maxime

--td5nie2iuibay3rv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYJDPwAKCRDj7w1vZxhR
xdK4AP0RZ4CscsTpkYmuYSXG3hH/C10hoz66XEjSw3F/uixspAD+O2C20oxlnZhd
xnwehkcetGTGELnGwpmVspE3HGCD+gA=
=CDeL
-----END PGP SIGNATURE-----

--td5nie2iuibay3rv--
