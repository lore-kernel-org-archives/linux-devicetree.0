From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date: Mon, 20 May 2019 13:07:42 +0200
Message-ID: <20190520110742.ykgxwaabzzwovgpl@flea>
References: <20190518170929.24789-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2tvwy2f7gcggtbhz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190518170929.24789-1-luca@z3ntu.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: Luca Weiss <luca@z3ntu.xyz>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--2tvwy2f7gcggtbhz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

On Sat, May 18, 2019 at 07:09:30PM +0200, Luca Weiss wrote:
> Add a node describing the KEYADC on the A64.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 7734f70e1057..dc1bf8c1afb5 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -704,6 +704,13 @@
>  			status = "disabled";
>  		};
>
> +		lradc: lradc@1c21800 {
> +			compatible = "allwinner,sun4i-a10-lradc-keys";
> +			reg = <0x01c21800 0x100>;
> +			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +

The controller is pretty different on the A64 compared to the A10. The
A10 has two channels for example, while the A64 has only one.

It looks like the one in the A83t though, so you can use that
compatible instead.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--2tvwy2f7gcggtbhz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOKKfgAKCRDj7w1vZxhR
xQtDAQDRqheEYCsPyl3AeW0fjU9b+loQ9xMJslojYXUeY00sCAEAwj5O5rO1Q8Tw
C6Mk9UGH1BCkUcHPRpTCOaOAmurSpgA=
=fEN1
-----END PGP SIGNATURE-----

--2tvwy2f7gcggtbhz--
