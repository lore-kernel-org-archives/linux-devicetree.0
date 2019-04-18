From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: a64-amarula-relic: Add
 OV5640 camera node
Date: Thu, 18 Apr 2019 16:54:10 +0200
Message-ID: <20190418145410.nm6c3jjwo6xw5mm5@flea>
References: <20190418135232.9368-1-jagan@amarulasolutions.com>
 <20190418135232.9368-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ahboa3r6xa7npauw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418135232.9368-2-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org


--ahboa3r6xa7npauw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 18, 2019 at 07:22:32PM +0530, Jagan Teki wrote:
> Amarula A64-Relic board by default bound with OV5640 camera,
> so add support for it with below pin information.
>
> - PE13, PE12 via i2c-gpio bitbanging
> - CLK_CSI_MCLK as external clock
> - PE1 as external clock pin muxing
> - ALDO1 as AVDD supply
> - DLDO3 as DOVDD supply
> - ELDO3 as DVDD supply
> - PE14 gpio for reset pin
> - PE15 gpio for powerdown pin
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Applied both, thanks

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ahboa3r6xa7npauw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLiPkgAKCRDj7w1vZxhR
xensAQCOVagcgDSylkXif/UTqSfpo76tHC/BFay1hla0hEqCgAEAlkdGi50wQWz5
KmvDP48t64pcmSV5rDir06szRQ8ICAM=
=Kvur
-----END PGP SIGNATURE-----

--ahboa3r6xa7npauw--
