From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: sopine-baseboard: Add PHY
 regulator delay
Date: Mon, 30 Sep 2019 16:21:10 +0200
Message-ID: <20190930142110.vscmnupg6lqrbmuy@gilmour>
References: <20190929085259.76462-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="quermkw47rmscx7x"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190929085259.76462-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--quermkw47rmscx7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 29, 2019 at 10:52:59AM +0200, Jernej Skrabec wrote:
> It turns out that sopine-baseboard needs same fix as pine64-plus
> for ethernet PHY. Here too Realtek ethernet PHY chip needs additional
> power on delay to properly initialize. Datasheet mentions that chip
> needs 30 ms to be properly powered on and that it needs some more time
> to be initialized.
>
> Fix that by adding 100ms ramp delay to regulator responsible for
> powering PHY.
>
> Note that issue was found out and fix tested on pine64-lts, but it's
> basically the same as sopine-baseboard, only layout and connectors
> differ.
>
> Fixes: bdfe4cebea11 ("arm64: allwinner: a64: add Ethernet PHY regulator for several boards")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied as a fix for 5.4, thanks!
Maxime

--quermkw47rmscx7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZIPVgAKCRDj7w1vZxhR
xVgqAQCDfcX+A/qtKjlld5IAr3fEdXZnqTWyYKgCOlqsd8Kl7gEA8JWPsQEWWnH9
gsSbLYjkSKUkUMavqHDbIgZ6r9D58wg=
=PU/D
-----END PGP SIGNATURE-----

--quermkw47rmscx7x--
