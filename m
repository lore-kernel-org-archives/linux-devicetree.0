From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] ARM64: dts: allwinner: Add devicetree for pine H64
 modelA evaluation board
Date: Mon, 12 Aug 2019 11:40:00 +0200
Message-ID: <20190812094000.ebdmhyxx7xzbevef@flea>
References: <20190808084253.10573-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qxku4lofbephj3it"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190808084253.10573-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--qxku4lofbephj3it
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 10:42:53AM +0200, Corentin Labbe wrote:
> This patch adds the evaluation variant of the model A of the PineH64.
> The model A has the same size of the pine64 and has a PCIE slot.
>
> The only devicetree difference with current pineH64, is the PHY
> regulator.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
>  .../sun50i-h6-pine-h64-modelA-eval.dts        | 26 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
>
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index f6db0611cb85..9a02166cbf72 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -25,3 +25,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-3.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-modelA-eval.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
> new file mode 100644
> index 000000000000..d8ff02747efe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2019 Corentin Labbe <clabbe.montjoie@gmail.com>
> + */
> +
> +#include "sun50i-h6-pine-h64.dts"
> +
> +/ {
> +	model = "Pine H64 model A evaluation board";
> +	compatible = "pine64,pine-h64-modelA-eval", "allwinner,sun50i-h6";
> +
> +	reg_gmac_3v3: gmac-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-gmac-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <100000>;
> +		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +};
> +
> +&emac {
> +	phy-supply = <&reg_gmac_3v3>;
> +};

I might be missing some context here, but I'm pretty sure that the
initial intent of the pine h64 DTS was to support the model A all
along.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qxku4lofbephj3it
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVEz8AAKCRDj7w1vZxhR
xVT5AQCmtGrOG8xFK95J8ZjmGV7HZxfxvNxV172wPtPegEHT2gEAtbdxFg5Ppsz/
TgtO+rT2XvcyllgsUSCaps9xmEidaAY=
=GlSZ
-----END PGP SIGNATURE-----

--qxku4lofbephj3it--
