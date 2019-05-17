From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sun8i-h3: Fix wifi in Beelink X2 DT
Date: Fri, 17 May 2019 09:30:48 +0200
Message-ID: <20190517073048.y6mzgbhhryfmuckl@flea>
References: <20190516161039.18534-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jkbi65rx3dzh424y"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190516161039.18534-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--jkbi65rx3dzh424y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, May 16, 2019 at 06:10:39PM +0200, Jernej Skrabec wrote:
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
> ---
>  arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> index 6277f13f3eb3..6a0ac85b4616 100644
> --- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> @@ -89,7 +89,10 @@
>
>  	wifi_pwrseq: wifi_pwrseq {
>  		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";

pinctrl-names only make sense with another pinctrl-[0-255]
property. Did you forgot something here?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jkbi65rx3dzh424y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXN5jKAAKCRDj7w1vZxhR
xUr9AP97UzodMbd7XRkMSWOZH5h4GuNferFgLYoAMM0yGXZWrwD6AwhGz1w7cehv
pfHluFzjaOLCt4LLQWUiDAMaW2+Y0wU=
=ocrv
-----END PGP SIGNATURE-----

--jkbi65rx3dzh424y--
