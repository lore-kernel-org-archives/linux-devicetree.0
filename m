From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: a64: Add pinmux setting for
 CSI MCLK on PE1
Date: Thu, 18 Apr 2019 13:20:49 +0200
Message-ID: <20190418112049.mgvvvcwzf3ezg4pw@flea>
References: <20190418083813.11776-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="awtgps4p5ffdljja"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418083813.11776-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org


--awtgps4p5ffdljja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 18, 2019 at 02:08:12PM +0530, Jagan Teki wrote:
> Some camera modules have the SoC feeding a master clock to the sensor
> instead of having a standalone crystal. This clock signal is generated
> from the clock control unit and output from the CSI MCLK function of
> pin PE1.
>
> Add a pinmux setting for it for camera sensors to reference.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 6f27eb082429..6f4e00ec9c68 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -597,6 +597,11 @@
>  				function = "csi";
>  			};
>
> +			csi_mclk_pin: csi-mclk {

The name of the pin should be ending with -pin, and please add
/omit-if-no-ref/

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--awtgps4p5ffdljja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLhdkQAKCRDj7w1vZxhR
xX0SAP91Z9NPv6I8QWcHV4ella9gF/FwxKlQf6i3TvT72y91GQEAvpMhVn1S6zhZ
2Z1ZlvmSuZLeJ9UuOwCmu7ndJU/rQwA=
=YFn5
-----END PGP SIGNATURE-----

--awtgps4p5ffdljja--
