From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2] ARM: dts: sun8i-h3: Fix wifi in Beelink X2 DT
Date: Mon, 20 May 2019 09:50:06 +0200
Message-ID: <20190520075006.pwrsaytg57d44377@flea>
References: <20190518154014.28998-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ccv2ztaysqwm5bmp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190518154014.28998-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ccv2ztaysqwm5bmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 18, 2019 at 05:40:14PM +0200, Jernej Skrabec wrote:
> mmc1 node where wifi module is connected doesn't have properly defined
> power supplies so wifi module is never powered up. Fix that by
> specifying additional power supplies.
>
> Additionally, this STB may have either Realtek or Broadcom based wifi
> module. One based on Broadcom module also needs external clock to work
> properly. Fix that by adding clock property to wifi_pwrseq node.
>
> Fixes: e582b47a9252 ("ARM: dts: sun8i-h3: Add dts for the Beelink X2 STB")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ccv2ztaysqwm5bmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOJcLgAKCRDj7w1vZxhR
xektAP9SnxxVhsL3J9tjBeCsUfx6I7mOWHiMoulYMbgQCQtW1AD/VJuC+zZfSxgg
QyXsTvQqjqBuraleNIOqwbIEAuz6ugI=
=nQKm
-----END PGP SIGNATURE-----

--ccv2ztaysqwm5bmp--
