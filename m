From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/6] pinctrl: sunxi: Add H3 PIO controller support
Date: Wed, 6 May 2015 12:11:37 +0200
Message-ID: <20150506101137.GB11057@lukather>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>
 <1430904693-1404-4-git-send-email-jenskuske@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430904693-1404-4-git-send-email-jenskuske@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Kuske <jenskuske@gmail.com>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2015 at 11:31:30AM +0200, Jens Kuske wrote:
> The H3 uses the same pin controller as previous SoC's from Allwinner.
> Add support for the pins controlled by the main PIO controller.
>=20
> Signed-off-by: Jens Kuske <jenskuske@gmail.com>
> ---
>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           | 521 +++++++++++++++=
++++++
>  4 files changed, 527 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pi=
nctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinct=
rl.txt
> index fdd8046..c46af8e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.t=
xt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.t=
xt
> @@ -16,6 +16,7 @@ Required properties:
>    "allwinner,sun7i-a20-pinctrl"
>    "allwinner,sun8i-a23-pinctrl"
>    "allwinner,sun8i-a23-r-pinctrl"
> +  "allwinner,sun8i-h3-pinctrl"
>  - reg: Should contain the register physical address and length for the
>    pin controller.
> =20
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
> index 2eb893e..c49e762 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -38,6 +38,10 @@ config PINCTRL_SUN8I_A23
>  	def_bool MACH_SUN8I
>  	select PINCTRL_SUNXI_COMMON
> =20
> +config PINCTRL_SUN8I_H3
> +	def_bool MACH_SUN8I
> +	select PINCTRL_SUNXI_COMMON
> +
>  config PINCTRL_SUN8I_A23_R
>  	def_bool MACH_SUN8I
>  	depends on RESET_CONTROLLER
> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makef=
ile
> index b796d57..fd4a068 100644
> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile
> @@ -11,4 +11,5 @@ obj-$(CONFIG_PINCTRL_SUN6I_A31_R)	+=3D pinctrl-sun6i-a3=
1-r.o
>  obj-$(CONFIG_PINCTRL_SUN7I_A20)		+=3D pinctrl-sun7i-a20.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A23)		+=3D pinctrl-sun8i-a23.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A23_R)	+=3D pinctrl-sun8i-a23-r.o
> +obj-$(CONFIG_PINCTRL_SUN8I_H3)		+=3D pinctrl-sun8i-h3.o
>  obj-$(CONFIG_PINCTRL_SUN9I_A80)		+=3D pinctrl-sun9i-a80.o
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c b/drivers/pinctrl/s=
unxi/pinctrl-sun8i-h3.c
> new file mode 100644
> index 0000000..e20f511
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
> @@ -0,0 +1,521 @@
> +/*
> + * Allwinner H3 SoCs pinctrl driver.
> + *
> + * Copyright (C) 2015 Jens Kuske <jenskuske@gmail.com>
> + *
> + * Based on pinctrl-sun8i-a23.c, which is:
> + * Copyright (C) 2014 Chen-Yu Tsai <wens@csie.org>
> + * Copyright (C) 2014 Maxime Ripard <maxime.ripard@free-electrons.com>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#include "pinctrl-sunxi.h"
> +
> +static const struct sunxi_desc_pin sun8i_h3_pins[] =3D {
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* TX */
> +		  SUNXI_FUNCTION(0x3, "jtag"),		/* MS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),	/* PA_EINT0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* RX */
> +		  SUNXI_FUNCTION(0x3, "jtag"),		/* CK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),	/* PA_EINT1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* RTS */
> +		  SUNXI_FUNCTION(0x3, "jtag"),		/* DO */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),	/* PA_EINT2 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* CTS */
> +		  SUNXI_FUNCTION(0x3, "jtag"),		/* DI */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),	/* PA_EINT3 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart0"),		/* TX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),	/* PA_EINT4 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart0"),		/* RX */
> +		  SUNXI_FUNCTION(0x3, "pwm0"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),	/* PA_EINT5 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "scr"),		/* PWREN */

The datasheet uses "SIM" for this, why have you changed the name here?

> +		  SUNXI_FUNCTION(0x3, "pwm1"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),	/* PA_EINT6 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "scr"),		/* CLK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),	/* PA_EINT7 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "scr"),		/* DATA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),	/* PA_EINT8 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "scr"),		/* RST */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),	/* PA_EINT9 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "scr"),		/* DET */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),	/* PA_EINT10 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
> +		  SUNXI_FUNCTION(0x3, "di"),		/* TX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),	/* PA_EINT11 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
> +		  SUNXI_FUNCTION(0x3, "di"),		/* RX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),	/* PA_EINT12 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "spi1"),		/* CS */
> +		  SUNXI_FUNCTION(0x3, "uart3"),		/* TX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),	/* PA_EINT13 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "spi1"),		/* CLK */
> +		  SUNXI_FUNCTION(0x3, "uart3"),		/* RX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),	/* PA_EINT14 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "spi1"),		/* MOSI */
> +		  SUNXI_FUNCTION(0x3, "uart3"),		/* RTS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),	/* PA_EINT15 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 16),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "spi1"),		/* MISO */
> +		  SUNXI_FUNCTION(0x3, "uart3"),		/* CTS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),	/* PA_EINT16 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 17),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "spdif"),		/* OUT */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 17)),	/* PA_EINT17 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 18),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),		/* SYNC */
> +		  SUNXI_FUNCTION(0x3, "i2c1"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 18)),	/* PA_EINT18 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 19),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),		/* CLK */
> +		  SUNXI_FUNCTION(0x3, "i2c1"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 19)),	/* PA_EINT19 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 20),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),		/* DOUT */
> +		  SUNXI_FUNCTION(0x3, "scr"),		/* VPPEN */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 20)),	/* PA_EINT20 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 21),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),		/* DIN */
> +		  SUNXI_FUNCTION(0x3, "scr"),		/* VPPPP */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 21)),	/* PA_EINT21 */
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* WE */
> +		  SUNXI_FUNCTION(0x3, "spi0")),		/* MOSI */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* ALE */
> +		  SUNXI_FUNCTION(0x3, "spi0")),		/* MISO */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* CLE */
> +		  SUNXI_FUNCTION(0x3, "spi0")),		/* CLK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* CE1 */
> +		  SUNXI_FUNCTION(0x3, "spi0")),		/* CS */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0")),	/* CE0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* RE */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* CLK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* RB0 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* CMD */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0")),	/* RB1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ0 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ1 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ2 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D2 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ3 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D3 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ4 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D4 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ5 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D5 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand"),		/* DQ6 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D6 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand"),		/* DQ7 */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D7 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand"),		/* DQS */
> +		  SUNXI_FUNCTION(0x3, "mmc2")),		/* RST */
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* RXD3 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* RXD2 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* RXD1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* RXD0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* RXCK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* RXCTL/RCDV */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* RXERR */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* TXD3 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* TXD2L */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* TXD1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* TXD0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* CRS */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* TXCK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* TXCTL/TXEN */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* TXERR */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* CLKIN/COL */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* MDC */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac")),		/* MDIO */
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* PCLK */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* CLK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* MCLK */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* ERR */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* HSYNC */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* SYNC */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* VSYNC */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* DVLD */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* D0 */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* D0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* D1 */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* D1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* D2 */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* D2 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* D3 */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* D3 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* D4 */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* D4 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* D5 */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* D5 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* D6 */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* D6 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* D7 */
> +		  SUNXI_FUNCTION(0x3, "ts")),		/* D7 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* SCK */
> +		  SUNXI_FUNCTION(0x3, "i2c2")),		/* SCK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "csi"),		/* SDA */
> +		  SUNXI_FUNCTION(0x3, "i2c2")),		/* SDA */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out")),
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D1 */
> +		  SUNXI_FUNCTION(0x3, "jtag")),		/* MS */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D0 */
> +		  SUNXI_FUNCTION(0x3, "jtag")),		/* DI */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CLK */
> +		  SUNXI_FUNCTION(0x3, "uart0")),	/* TX */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CMD */
> +		  SUNXI_FUNCTION(0x3, "jtag")),		/* DO */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D3 */
> +		  SUNXI_FUNCTION(0x3, "uart0")),	/* RX */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D2 */
> +		  SUNXI_FUNCTION(0x3, "jtag")),		/* CK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0")),		/* DET */
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CLK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 0)),	/* PG_EINT0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CMD */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 1)),	/* PG_EINT1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D0 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 2)),	/* PG_EINT2 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 3)),	/* PG_EINT3 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D2 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 4)),	/* PG_EINT4 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D3 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 5)),	/* PG_EINT5 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* TX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 6)),	/* PG_EINT6 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* RX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 7)),	/* PG_EINT7 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* RTS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 8)),	/* PG_EINT8 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* CTS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 9)),	/* PG_EINT9 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),		/* SYNC */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 10)),	/* PG_EINT10 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),		/* CLK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 11)),	/* PG_EINT11 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),		/* DOUT */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 12)),	/* PG_EINT12 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),		/* DIN */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 13)),	/* PG_EINT13 */
> +};
> +
> +static const struct sunxi_pinctrl_desc sun8i_h3_pinctrl_data =3D {
> +	.pins =3D sun8i_h3_pins,
> +	.npins =3D ARRAY_SIZE(sun8i_h3_pins),
> +	.irq_banks =3D 2,
> +};
> +
> +static int sun8i_h3_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_init(pdev,
> +				  &sun8i_h3_pinctrl_data);
> +}
> +
> +static const struct of_device_id sun8i_h3_pinctrl_match[] =3D {
> +	{ .compatible =3D "allwinner,sun8i-h3-pinctrl", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sun8i_h3_pinctrl_match);
> +
> +static struct platform_driver sun8i_h3_pinctrl_driver =3D {
> +	.probe	=3D sun8i_h3_pinctrl_probe,
> +	.driver	=3D {
> +		.name		=3D "sun8i-h3-pinctrl",
> +		.of_match_table	=3D sun8i_h3_pinctrl_match,
> +	},
> +};
> +module_platform_driver(sun8i_h3_pinctrl_driver);
> +
> +MODULE_AUTHOR("Jens Kuske <jenskuske@gmail.com>");
> +MODULE_DESCRIPTION("Allwinner H3 pinctrl driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.3.7
>=20

Looks good otherwise, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSejZAAoJEBx+YmzsjxAg3XgP/i5Oc6il6WK8tzofZuqQNW0S
fMilfZ77/iZUjEFzsbUlC94AiIMvouWvmj8TdaD/ThOoBCzdB0xISVqh3kLiFA5c
50RSslVoftnnEwhUQ9ho00KRaPP8juirdP5Yc6l7LYvd6zIZpBp1Cb3E2queTKuS
GkFT64pg/j/pMiRn3wbgSonNogTrch1CbBl/r63tNXMaT6kwQHnJNpvocLMK14H1
HYWzSoBLT+UtI+RNe25NgDNQhXOfsbopoaOPLHuPaCJuTsAIqjPHnHgHiL23BrGx
hOAxTB80IWjx2I9luPxX0/UtWphU7E3S4+AosgBr1bJmISG9WovmFFQzqZUb1bWG
AFSNo8ZyqikrnVzwzsyiB5XULIRRUts7W2ccS11jGeiNPNPRu1xWce9C3uM9r7rS
28pjJseVtEy0ckaNKccuBGg+ZOiKB6h6NeWUNHwb8TAdIsXEOITy78PeKpNXvzWh
XSmCFRbO0vUitWAxu0du2jMBvSSGW+3IeHaQXb0uXpvC1wH4XcZrDgek/e599ZcU
HELHDSS/4fQPAW+dpvBn6JXTOwijWgD+bPx+IBsqlnQWg7gqwrSAgIukxpg5ixo+
FIoevLGQhTtRd8p7RJdEZSaopCbPGpH8D3rnVZnmiiOG5BjyUqCWDn5ZrE+n8MjU
LbnkaKWP+5ZvidYH4aQW
=jJrg
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
