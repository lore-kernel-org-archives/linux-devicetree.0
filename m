From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/8] clk: bcm2835: add missing osc and per clocks
Date: Thu, 17 Mar 2016 10:10:19 -0700
Message-ID: <87egb99gjo.fsf@eliezer.anholt.net>
References: <1456760642-2412-1-git-send-email-kernel@martin.sperl.org> <1456760642-2412-4-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456760642-2412-4-git-send-email-kernel@martin.sperl.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Add definitions for the following clocks:
> * AVE0
> * DFT
> * GP0
> * GP1
> * GP2
> * PULSE
> * SLIM
> * SMI
> * TEC
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> ---
>  drivers/clk/bcm/clk-bcm2835.c       |   71 +++++++++++++++++++++++++++++=
++++++
>  include/dt-bindings/clock/bcm2835.h |   10 +++++
>  2 files changed, 81 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 710cf15..f43e1ca 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -118,6 +118,8 @@
>  #define CM_SDCCTL		0x1a8
>  #define CM_SDCDIV		0x1ac
>  #define CM_ARMCTL		0x1b0
> +#define CM_AVEOCTL		0x1b8
> +#define CM_AVEODIV		0x1bc
>  #define CM_EMMCCTL		0x1c0
>  #define CM_EMMCDIV		0x1c4
>=20=20
> @@ -1738,6 +1740,18 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
>  		.div_reg =3D CM_TSENSDIV,
>  		.int_bits =3D 5,
>  		.frac_bits =3D 0),
> +	[BCM2835_CLOCK_PULSE]	=3D REGISTER_OSC_CLK(
> +		.name =3D "pulse",
> +		.ctl_reg =3D CM_PULSECTL,
> +		.div_reg =3D CM_PULSEDIV,
> +		.int_bits =3D 12,
> +		.frac_bits =3D 0),

As I noted in previous review, PULSE has another divider on it that you
haven't accounted for, so it would be broken if we exposed it.  I've
dropped it from the patch.

> +	[BCM2835_CLOCK_TEC]	=3D REGISTER_OSC_CLK(
> +		.name =3D "tec",
> +		.ctl_reg =3D CM_TECCTL,
> +		.div_reg =3D CM_TECDIV,
> +		.int_bits =3D 6,
> +		.frac_bits =3D 0),
>=20=20
>  	/* clocks with vpu parent mux */
>  	[BCM2835_CLOCK_H264]	=3D REGISTER_VPU_CLK(
> @@ -1752,6 +1766,7 @@ static const struct bcm2835_clk_desc clk_desc_array=
[] =3D {
>  		.div_reg =3D CM_ISPDIV,
>  		.int_bits =3D 4,
>  		.frac_bits =3D 8),
> +
>  	/*
>  	 * Secondary SDRAM clock.  Used for low-voltage modes when the PLL
>  	 * in the SDRAM controller can't be used.
> @@ -1783,6 +1798,24 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
>  		.is_vpu_clock =3D true),
>=20=20
>  	/* clocks with per parent mux */
> +	[BCM2835_CLOCK_AVEO]	=3D REGISTER_PER_CLK(
> +		.name =3D "aveo",
> +		.ctl_reg =3D CM_AVEOCTL,
> +		.div_reg =3D CM_AVEODIV,
> +		.int_bits =3D 4,
> +		.frac_bits =3D 0),
> +	[BCM2835_CLOCK_DFT]	=3D REGISTER_PER_CLK(
> +		.name =3D "dft",
> +		.ctl_reg =3D CM_DFTCTL,
> +		.div_reg =3D CM_DFTDIV,
> +		.int_bits =3D 5,
> +		.frac_bits =3D 0),
> +	[BCM2835_CLOCK_DFT]	=3D REGISTER_PER_CLK(
> +		.name =3D "dpi",
> +		.ctl_reg =3D CM_DPICTL,
> +		.div_reg =3D CM_DPIDIV,
> +		.int_bits =3D 4,
> +		.frac_bits =3D 8),
>=20=20
>  	/* Arasan EMMC clock */
>  	[BCM2835_CLOCK_EMMC]	=3D REGISTER_PER_CLK(
> @@ -1791,6 +1824,30 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
>  		.div_reg =3D CM_EMMCDIV,
>  		.int_bits =3D 4,
>  		.frac_bits =3D 8),
> +
> +	/* General purpose (GPIO) clocks */
> +	[BCM2835_CLOCK_GP0]	=3D REGISTER_PER_CLK(
> +		.name =3D "gp0",
> +		.ctl_reg =3D CM_GP0CTL,
> +		.div_reg =3D CM_GP0DIV,
> +		.int_bits =3D 12,
> +		.frac_bits =3D 12,
> +		.is_mash_clock =3D true),
> +	[BCM2835_CLOCK_GP1]	=3D REGISTER_PER_CLK(
> +		.name =3D "gp1",
> +		.ctl_reg =3D CM_GP1CTL,
> +		.div_reg =3D CM_GP1DIV,
> +		.int_bits =3D 12,
> +		.frac_bits =3D 12,
> +		.is_mash_clock =3D true),
> +	[BCM2835_CLOCK_GP2]	=3D REGISTER_PER_CLK(
> +		.name =3D "gp2",
> +		.ctl_reg =3D CM_GP2CTL,
> +		.div_reg =3D CM_GP2DIV,
> +		.int_bits =3D 12,
> +		.frac_bits =3D 12,
> +		.is_mash_clock =3D true),

As I've noted previously, gp2 is not a mash clock.  I've dropped that
line.

Other than these two issues, this patch looks fine.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW6uT7AAoJELXWKTbR/J7oGd0QAInFPo8JD/gVc9ry9WE5xfk0
sgxTXD7MDbRaAyrxD7FqfXUrm/xCR0FzMxPxtsusK4l4ENnzG3jvrPMnJRvFIUdD
tRhCXr/TmVzHcqgosOZFklbbVgIp04NgHnRyXjGFremzhWNPTJWj0MlZB05UMJJu
amWZtKJAM9IMJD9DVEq2QB50ToVZoniq2NH3nind051QWZ2hjoo8K21kuCqr4KzL
1QyEOgMdZrCXPzAsyFcEgnfpPaOjTm+UNSGNsyT5wExfwGSpjGuShNqzY/yPnkVw
SFXZ9JuFMwKO/oiwgk9MmtoRNysoLS7/DJxW/uwX3hy2ts2bJ3UadtOg6+9pAcWR
Xt61Vj7+RHVF4ouyz7jF6sKERhMXzxWYh/LGpysuo/5aTqi+ViaMTMQEUAWIwOMg
Of2S+xzSLjyGDfNSYHYIRDwtKx4LcjGGklJqZAphLqXlmwSeAHGq2dht7wxjVUe1
eowde2Km8G4a8hTIL0gxry/xe2RtXV50jEpUMQC6ovKGamKkSfj9Umg/tPonKFmF
mQdfB/rFE2EYFtmgE+BrDMxAWCposGG/ae63TxlL2Sqq4sVwaqm4MtrtNFgqPvMd
6OW67UVTpKJd6PXETEwQkFAc7AdRlV9EAmRDfn71J9lNFhyxg8PhI3w336qBe+5i
iUGybJcep2tUhtlrxU7M
=aFPv
-----END PGP SIGNATURE-----
--=-=-=--
