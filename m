From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 1/3] arm64: dts: allwinner: a64: Move I2C pinctrl to
 dtsi
Date: Thu, 2 May 2019 09:15:21 +0200
Message-ID: <20190502071521.7ekih3bgjth54sry@flea>
References: <20190418174720.17230-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l3fjic7vuxbz5vss"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418174720.17230-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--l3fjic7vuxbz5vss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Apr 18, 2019 at 11:17:18PM +0530, Jagan Teki wrote:
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
> index f4e78531f639..bef4abf6fa25 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
> @@ -121,8 +121,6 @@
>
>  /* i2c1 connected with gpio headers like pine64, bananapi */
>  &i2c1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c1_pins>;
>  	status = "disabled";
>  };

That node can be removed entirely

It looks fine otherwise.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--l3fjic7vuxbz5vss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXMqZCQAKCRDj7w1vZxhR
xU9OAQDxTAEtGhuPzyZjpKPIGQXLaALohb8tDqQ5pCkcRraUIQEAvx/AzS8BBrHq
CikCMIi3e4lw8EMelHNzyKK0j78UpQc=
=gnAK
-----END PGP SIGNATURE-----

--l3fjic7vuxbz5vss--
