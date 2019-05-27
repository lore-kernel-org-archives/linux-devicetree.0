From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: bananapi-m64: enable UART2
Date: Mon, 27 May 2019 11:58:49 +0200
Message-ID: <20190527095849.uvsivexbb6tfjccw@flea>
References: <20190526094715.12289-1-yegortimoshenko@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ktylujpg3yzbdylg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190526094715.12289-1-yegortimoshenko@riseup.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Yegor Timoshenko <yegortimoshenko@riseup.net>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ktylujpg3yzbdylg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, May 26, 2019 at 12:47:15PM +0300, Yegor Timoshenko wrote:
> BananaPi M64 exposes UART2 interface that is supposed to be enabled
> by default (see "Default Function" in the pin definition table from
> the manufacturer [1]).
>
> [1]: https://bananapi.gitbooks.io/bpi-m64/en/bpi-m64gpiopindefine.html
>
> Signed-off-by: Yegor Timoshenko <yegortimoshenko@riseup.net>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> index 094cfed13df9..100d1a8fd292 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> @@ -54,6 +54,7 @@
>  		ethernet0 = &emac;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
> +		serial2 = &uart2;
>  	};
>
>  	chosen {
> @@ -312,6 +313,12 @@
>  	status = "okay";
>  };
>
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2_pins>;
> +	status = "okay";
> +};
> +

Unfortunately, this can still be used for something else. Our policy
so far has been that we would fill the muxing but keep the nodes
disabled so that it's easier for people that want to enable it, but it
seems like it's already using the default muxing as well.

Maxime


--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ktylujpg3yzbdylg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOu02QAKCRDj7w1vZxhR
xUciAP4y8fZNwh7eAtCPtUgJ3FdM3Qacd6yxUNimUc62YkREFQD6Az4IJj3Bx6Iv
LnR7PXw+or0ouBFSx4ziaPuhdOMsPQg=
=VGIR
-----END PGP SIGNATURE-----

--ktylujpg3yzbdylg--
