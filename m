From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/8] clk: bcm2835: add missing PLL clock divider
Date: Thu, 17 Mar 2016 09:57:14 -0700
Message-ID: <87y49hjb4l.fsf@eliezer.anholt.net>
References: <1456760642-2412-1-git-send-email-kernel@martin.sperl.org> <1456760642-2412-3-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1456760642-2412-3-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Add the missing pll clock divider definitions.
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> ---
>  drivers/clk/bcm/clk-bcm2835.c       |   50 +++++++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/bcm2835.h |    8 ++++++
>  2 files changed, 58 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 01a48cb..710cf15 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1497,6 +1497,22 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
>  		.load_mask = CM_PLLA_LOADPER,
>  		.hold_mask = CM_PLLA_HOLDPER,
>  		.fixed_divider = 1),
> +	[BCM2835_PLLA_DSI0]	= REGISTER_PLL_DIV(
> +		.name = "plla_dsi0",
> +		.source_pll = "plla",
> +		.cm_reg = CM_PLLA,
> +		.a2w_reg = A2W_PLLA_DSI0,
> +		.load_mask = CM_PLLA_LOADDSI0,
> +		.hold_mask = CM_PLLA_HOLDDSI0,
> +		.fixed_divider = 1),
> +	[BCM2835_PLLA_CCP2]	= REGISTER_PLL_DIV(
> +		.name = "plla_ccp2",
> +		.source_pll = "plla",
> +		.cm_reg = CM_PLLA,
> +		.a2w_reg = A2W_PLLA_DSI0,
> +		.load_mask = CM_PLLA_LOADCCP2,
> +		.hold_mask = CM_PLLA_HOLDCCP2,
> +		.fixed_divider = 1),
>
>  	/* PLLB is used for the ARM's clock. */
>  	[BCM2835_PLLB]		= REGISTER_PLL(
> @@ -1521,6 +1537,24 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
>  		.load_mask = CM_PLLB_LOADARM,
>  		.hold_mask = CM_PLLB_HOLDARM,
>  		.fixed_divider = 1),
> +	[BCM2835_PLLB_SP0]	= REGISTER_PLL_DIV(
> +		.name = "pllb_sp0",
> +		.source_pll = "pllb",
> +		.cm_reg = CM_PLLB,
> +		.a2w_reg = A2W_PLLB_SP0,
> +		.fixed_divider = 1),
> +	[BCM2835_PLLB_SP1]	= REGISTER_PLL_DIV(
> +		.name = "pllb_sp1",
> +		.source_pll = "pllb",
> +		.cm_reg = CM_PLLB,
> +		.a2w_reg = A2W_PLLB_SP1,
> +		.fixed_divider = 1),
> +	[BCM2835_PLLB_SP2]	= REGISTER_PLL_DIV(
> +		.name = "pllb_sp2",
> +		.source_pll = "pllb",
> +		.cm_reg = CM_PLLB,
> +		.a2w_reg = A2W_PLLB_SP2,
> +		.fixed_divider = 1),

These don't exist on the hardware as far as I've been able to find.  "I
found it in a header file somewhere" is not sufficient justification to
expose it.

I'm working on getting a series of all of these reviewed and ready, so
I'm just dropping these PLLB hunks.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW6uHqAAoJELXWKTbR/J7oqRoP/2POKOSZUwSdl9cxXYaCaSVc
IwwoeStF/bGYAS9xHLJnxY1elVo8Jb9IdnkIywtnHSZqqIVzdu5d7IdTQyad+QjM
GV3BaslFr0YL9Au7cm65aBmbmTLmbLGvU8aIAfw5GemyeYdmHEPy3UKhkfDyF95r
r+gooD7ER4k0TtMkv6X1WgQHSort+RhSi+aAQgM4CeJsrSf8W135KCIHk8ehcB9z
rbgatus4jSRkIcWoNtMijq37c4tdal+6X/CTGaYdONYesM8nKskwzdoTEPMquDJb
X5waLptC37NA61uRa4UCVJ02IoMAMPgEhhxH8I9G1B8gSVV3eYtwyZLdTJ0DP6Oo
I8Cly9wiC/cDtyJeNHsbUUU7gua4/Izz/exz1XPvtH+oTcS4HYBz7Av8drmaqOI+
abMnChdm0NLwFTO4V9dWxK16wlVAKTokKp+Nhk264j05a+nIuoQLVwnqAFmGrNX7
SzBHjkOtydQu01O0wEWrqUfmPupEGczj28w3mE1wzLGCQDhZl3Ht/1fIPR7YlHNG
mcPZ1hLVrWPsSh/zspsV9qUr6r0wGbMGMTPVPLhl8HtD+KYW55LSXAS8Dadi+j9Q
CUktTLtNf8/P+pUX7/VS9nrL6O547hdSvdeOlBQflEL69QmYkZ3O6V4IRpOSpD+K
Emb5bvauqG023DQtyFab
=W/xB
-----END PGP SIGNATURE-----
--=-=-=--
