From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 2/7] ARM: dts: sun8i: v40: bananapi-m2-berry: Add PIO
 node
Date: Wed, 17 Apr 2019 12:18:44 +0200
Message-ID: <20190417101844.fzpnm3hsv76w4ljy@flea>
References: <1555492863-88860-1-git-send-email-pgreco@centosproject.org>
 <1555492863-88860-3-git-send-email-pgreco@centosproject.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4i4hztvqcydnesyc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1555492863-88860-3-git-send-email-pgreco@centosproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Greco <pgreco@centosproject.org>
Cc: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--4i4hztvqcydnesyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 17, 2019 at 06:20:57AM -0300, Pablo Greco wrote:
> In preparation to tie regulators, add the basic PIO node
>
> Signed-off-by: Pablo Greco <pgreco@centosproject.org>
> ---
>  arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> index f05cabd..e63f5f2 100644
> --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> @@ -123,6 +123,11 @@
>  	status = "okay";
>  };
>
> +&pio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&clk_out_a_pin>;
> +};
> +

That's not really what you describe in your commit log though. Why do
you need that pin muxed?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4i4hztvqcydnesyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLb9hAAKCRDj7w1vZxhR
xQO4AQCLWBYSlWioOj/Yj4UJkBPmpX6aemboORtVJ//D+o0OwAEA2GGvtMaarWxs
yCMTFV5Sj1DkQGG4XSIgYYpwREAmvwg=
=LiNg
-----END PGP SIGNATURE-----

--4i4hztvqcydnesyc--
