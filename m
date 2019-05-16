From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/4] arm64: DTS: allwinner: a64: Add pinmux for RGB666 LCD
Date: Thu, 16 May 2019 10:54:16 +0200
Message-ID: <20190516085416.qfrbylku7226rub6@flea>
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160225.AB0D368B20@newverein.lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h2fn4argqt45zmoa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190514160225.AB0D368B20@newverein.lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Torsten Duwe <duwe@lst.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--h2fn4argqt45zmoa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 14, 2019 at 06:02:25PM +0200, Torsten Duwe wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
>
> Allwinner A64's TCON0 can output RGB666 LCD signal.
>
> Add its pinmux.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Signed-off-by: Torsten Duwe <duwe@suse.de>
> ---
>
> originally: patchwork.kernel.org/patch/10814179
>
> Almost trivial, and obviously correct.
> I added the /omit-if-no-ref/.
>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 2abb335145a6..a8bbee84e7da 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -559,6 +559,16 @@
>  				function = "i2c1";
>  			};
>
> +			/omit-if-no-ref/
> +			lcd_rgb666_pins: lcd-rgb666 {

This should have the -pins suffix

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--h2fn4argqt45zmoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXN0lOAAKCRDj7w1vZxhR
xfczAP949KD6LxwvBpLAV424mzw9jhUzLgBNJAOIYxQ1QQ2afAEAqHyh7A4+J2EV
4OxzrWJXa/IL7TiTlQCvFyhQrynH+AI=
=R8dD
-----END PGP SIGNATURE-----

--h2fn4argqt45zmoa--
