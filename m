From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/3] arm64: allwinner: Enable AXP803's USB power supply
Date: Mon, 20 May 2019 09:41:40 +0200
Message-ID: <20190520074140.7kln73ws3fkt63gm@flea>
References: <20190418161804.17723-1-wens@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5pummrpkyefqzedl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418161804.17723-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--5pummrpkyefqzedl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 19, 2019 at 12:18:01AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> Hi everyone,
>
> This series follows up on the A83T USB OTG series. The USB power supply
> portion of the AXP803, the PMIC used with the A64, is identical to the
> part in the AXP813/AXP818, used with the A83T.
>
> This series enables the USB power supply in the AXP803 using the AXP813's
> compatible string as a fallback. The per-model compatible string is still
> added as a contigency.
>
> Patch 1 adds an mfd cell for the USB power supply, to the AXP803.
>
> Patch 2 adds a device node for the USB power supply.
>
> Patch 3 enables the USB power supply on the Bananapi M64.
>
> Unfortunately the original Pine64 does not wire up the USB power supply,
> and I don't have any other A64 boards.
>
> The mfd patch can go in through the mfd tree. There are no compile-time
> dependencies. We, sunxi, can take the DT patches.

Applied 2 and 3, thanks!

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--5pummrpkyefqzedl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOJaNAAKCRDj7w1vZxhR
xT8YAQCrhNoaCeDiNfKD0yyLnByQlt1Fhq3zrDMR7EoKAmRKSwD47VSRP1Bqcw2Q
ljwc/WnLZXRKEMlsgmjlH+EMmQ0vAg==
=A9Ui
-----END PGP SIGNATURE-----

--5pummrpkyefqzedl--
