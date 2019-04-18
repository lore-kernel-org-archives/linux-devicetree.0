From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: a64-oceanic-5205-5inmfd:
 Enable GT911 CTP
Date: Thu, 18 Apr 2019 13:24:45 +0200
Message-ID: <20190418112445.wlom3pisnwmddlnr@flea>
References: <20190418083543.11695-1-jagan@amarulasolutions.com>
 <20190418083543.11695-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ydku54e2qlyhouka"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418083543.11695-2-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org


--ydku54e2qlyhouka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 18, 2019 at 02:05:43PM +0530, Jagan Teki wrote:
> Goodix GT911 CTP is bound with Oceanic 5205 5inMFD board.
>
> The CTP connected to board with,
> - SDA, SCK from i2c0
> - GPIO-LD0 as AVDD28 supply
> - PH4 gpio as interrupt pin
> - PH11 gpio as reset pin
> - X axis is inverted
> - Y axis is inverted
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - drop i2c1, bias-pull-up
>
>  .../sun50i-a64-oceanic-5205-5inmfd.dts        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
> index 6a2154525d1e..02c1a04cc7eb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
> @@ -37,6 +37,24 @@
>  	status = "okay";
>  };
>
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;

The comments on PATCH 1 apply here as well.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ydku54e2qlyhouka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLhefQAKCRDj7w1vZxhR
xWPaAQCD5smtLgqsihoZx6uOeqUyKtycUPc+rF3zT080U/t13QEA3Ecl/2Umk+WE
LHJ2JpBbkRtMVZI9x98AazdkFo9e6A0=
=K7xJ
-----END PGP SIGNATURE-----

--ydku54e2qlyhouka--
