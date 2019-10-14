From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 00/11] crypto: add sun8i-ce driver for Allwinner
 crypto engine
Date: Mon, 14 Oct 2019 12:47:08 +0200
Message-ID: <20191014104708.cur6zbabmozhwu5o@gilmour>
References: <20191012184852.28329-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jcraal7cz45esj3i"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191012184852.28329-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: catalin.marinas@arm.com, davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--jcraal7cz45esj3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sat, Oct 12, 2019 at 08:48:41PM +0200, Corentin Labbe wrote:
> Hello
>
> This patch serie adds support for the Allwinner crypto engine.
> The Crypto Engine is the third generation of Allwinner cryptogaphic offloader.
> The first generation is the Security System already handled by the
> sun4i-ss driver.
> The second is named also Security System and is present on A80 and A83T
> SoCs, originaly this driver supported it also, but supporting both IP bringing
> too much complexity and another driver (sun8i-ss) will came for it.
>
> For the moment, the driver support only DES3/AES in ECB/CBC mode.
> Patchs for CTR/CTS/XTS, RSA and RNGs will came later.
>
> This serie is tested with CRYPTO_MANAGER_EXTRA_TESTS
> and tested on:
> sun50i-a64-bananapi-m64
> sun50i-a64-pine64-plus
> sun50i-h5-libretech-all-h3-cc
> sun50i-h6-pine-h64
> sun8i-h2-plus-libretech-all-h3-cc
> sun8i-h2-plus-orangepi-r1
> sun8i-h2-plus-orangepi-zero
> sun8i-h3-libretech-all-h3-cc
> sun8i-h3-orangepi-pc
> sun8i-r40-bananapi-m2-ultra

for the drivers/crypto part
Acked-by: Maxime Ripard <mripard@kernel.org>

I'll merge the dt and defconfig bits when Herbert will be ok with the
changes.

Maxime

--jcraal7cz45esj3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXaRSLAAKCRDj7w1vZxhR
xbAiAQCXNw9TZ+NI9M/ffhLEMVuGBoKDSMxJpeuryNZeejUpbAEAotBuhlogZFYt
6gcqR7k6JoRm4LKGytJt02QqNsKkQAI=
=JdiC
-----END PGP SIGNATURE-----

--jcraal7cz45esj3i--
