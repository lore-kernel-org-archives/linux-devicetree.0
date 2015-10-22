From: josef.gajdusek@gmail.com
Subject: Re: [PATCH 3/6] pinctrl: sunxi: Add H3 PIO controller support
Date: Thu, 22 Oct 2015 01:21:26 -0700 (PDT)
Message-ID: <883408ea-bb2e-4f93-a2e6-40efad4ee42f@googlegroups.com>
References: <5627BDB6.6020501@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_Part_324_694801473.1445502086641"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5627BDB6.6020501@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi <linux-sunxi@googlegroups.com>
Cc: devicetree@vger.kernel.org, vishnupatekar0510@gmail.com, emilio@elopez.com.ar, mturquette@baylibre.com, linux-kernel@vger.kernel.org, hdegoede@redhat.com, wens@csie.org, robh+dt@kernel.org, jenskuske@gmail.com, p.zabel@pengutronix.de, maxime.ripard@free-electrons.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

------=_Part_324_694801473.1445502086641
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I might be missing something, but why is the PL* GPIO bank not declared her=
e?=20

Dne st=C5=99eda 21. =C5=99=C3=ADjna 2015 18:30:50 UTC+2 Jens Kuske napsal(a=
):
> The H3 uses the same pin controller as previous SoC's from Allwinner.
> Add support for the pins controlled by the main PIO controller.
>=20
> Signed-off-by: Jens Kuske <jenskuske@gmail.com>
> ---
>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           | 516 +++++++++++++++=
++++++
>  4 files changed, 522 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pi=
nctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinct=
rl.txt
> index 3c821cd..094451c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.t=
xt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.t=
xt
> @@ -17,6 +17,7 @@ Required properties:
>    "allwinner,sun8i-a23-pinctrl"
>    "allwinner,sun8i-a23-r-pinctrl"
>    "allwinner,sun8i-a33-pinctrl"
> +  "allwinner,sun8i-h3-pinctrl"
> =20
>  - reg: Should contain the register physical address and length for the
>    pin controller.
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfi=
g
> index ae27872..f161e4c 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -47,6 +47,10 @@ config PINCTRL_SUN8I_A23_R
>  =09depends on RESET_CONTROLLER
>  =09select PINCTRL_SUNXI_COMMON
> =20
> +config PINCTRL_SUN8I_H3
> +=09def_bool MACH_SUN8I
> +=09select PINCTRL_SUNXI_COMMON
> +
>  config PINCTRL_SUN9I_A80
>  =09def_bool MACH_SUN9I
>  =09select PINCTRL_SUNXI_COMMON
> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makef=
ile
> index 227a121..ca19592 100644
> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile
> @@ -12,4 +12,5 @@ obj-$(CONFIG_PINCTRL_SUN7I_A20)=09=09+=3D pinctrl-sun7i=
-a20.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A23)=09=09+=3D pinctrl-sun8i-a23.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A23_R)=09+=3D pinctrl-sun8i-a23-r.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A33)=09=09+=3D pinctrl-sun8i-a33.o
> +obj-$(CONFIG_PINCTRL_SUN8I_H3)=09=09+=3D pinctrl-sun8i-h3.o
>  obj-$(CONFIG_PINCTRL_SUN9I_A80)=09=09+=3D pinctrl-sun9i-a80.o
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c b/drivers/pinctrl/s=
unxi/pinctrl-sun8i-h3.c
> new file mode 100644
> index 0000000..98d465d
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
> @@ -0,0 +1,516 @@
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
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart2"),=09=09/* TX */
> +=09=09  SUNXI_FUNCTION(0x3, "jtag"),=09=09/* MS */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),=09/* PA_EINT0 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 1),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart2"),=09=09/* RX */
> +=09=09  SUNXI_FUNCTION(0x3, "jtag"),=09=09/* CK */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),=09/* PA_EINT1 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 2),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart2"),=09=09/* RTS */
> +=09=09  SUNXI_FUNCTION(0x3, "jtag"),=09=09/* DO */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),=09/* PA_EINT2 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart2"),=09=09/* CTS */
> +=09=09  SUNXI_FUNCTION(0x3, "jtag"),=09=09/* DI */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),=09/* PA_EINT3 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 4),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart0"),=09=09/* TX */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),=09/* PA_EINT4 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 5),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart0"),=09=09/* RX */
> +=09=09  SUNXI_FUNCTION(0x3, "pwm0"),
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),=09/* PA_EINT5 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 6),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "sim"),=09=09/* PWREN */
> +=09=09  SUNXI_FUNCTION(0x3, "pwm1"),
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),=09/* PA_EINT6 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "sim"),=09=09/* CLK */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),=09/* PA_EINT7 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 8),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "sim"),=09=09/* DATA */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),=09/* PA_EINT8 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 9),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "sim"),=09=09/* RST */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),=09/* PA_EINT9 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 10),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "sim"),=09=09/* DET */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),=09/* PA_EINT10 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 11),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2c0"),=09=09/* SCK */
> +=09=09  SUNXI_FUNCTION(0x3, "di"),=09=09/* TX */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),=09/* PA_EINT11 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 12),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2c0"),=09=09/* SDA */
> +=09=09  SUNXI_FUNCTION(0x3, "di"),=09=09/* RX */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),=09/* PA_EINT12 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 13),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "spi1"),=09=09/* CS */
> +=09=09  SUNXI_FUNCTION(0x3, "uart3"),=09=09/* TX */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),=09/* PA_EINT13 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 14),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "spi1"),=09=09/* CLK */
> +=09=09  SUNXI_FUNCTION(0x3, "uart3"),=09=09/* RX */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),=09/* PA_EINT14 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 15),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "spi1"),=09=09/* MOSI */
> +=09=09  SUNXI_FUNCTION(0x3, "uart3"),=09=09/* RTS */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),=09/* PA_EINT15 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 16),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "spi1"),=09=09/* MISO */
> +=09=09  SUNXI_FUNCTION(0x3, "uart3"),=09=09/* CTS */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),=09/* PA_EINT16 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 17),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "spdif"),=09=09/* OUT */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 17)),=09/* PA_EINT17 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 18),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2s0"),=09=09/* SYNC */
> +=09=09  SUNXI_FUNCTION(0x3, "i2c1"),=09=09/* SCK */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 18)),=09/* PA_EINT18 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 19),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2s0"),=09=09/* CLK */
> +=09=09  SUNXI_FUNCTION(0x3, "i2c1"),=09=09/* SDA */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 19)),=09/* PA_EINT19 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 20),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2s0"),=09=09/* DOUT */
> +=09=09  SUNXI_FUNCTION(0x3, "sim"),=09=09/* VPPEN */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 20)),=09/* PA_EINT20 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 21),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2s0"),=09=09/* DIN */
> +=09=09  SUNXI_FUNCTION(0x3, "sim"),=09=09/* VPPPP */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 21)),=09/* PA_EINT21 */
> +=09/* Hole */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* WE */
> +=09=09  SUNXI_FUNCTION(0x3, "spi0")),=09=09/* MOSI */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* ALE */
> +=09=09  SUNXI_FUNCTION(0x3, "spi0")),=09=09/* MISO */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* CLE */
> +=09=09  SUNXI_FUNCTION(0x3, "spi0")),=09=09/* CLK */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* CE1 */
> +=09=09  SUNXI_FUNCTION(0x3, "spi0")),=09=09/* CS */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0")),=09/* CE0 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* RE */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* CLK */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* RB0 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* CMD */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0")),=09/* RB1 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* DQ0 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* D0 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* DQ1 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* D1 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* DQ2 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* D2 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* DQ3 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* D3 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* DQ4 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* D4 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand0"),=09=09/* DQ5 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* D5 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand"),=09=09/* DQ6 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* D6 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand"),=09=09/* DQ7 */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* D7 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "nand"),=09=09/* DQS */
> +=09=09  SUNXI_FUNCTION(0x3, "mmc2")),=09=09/* RST */
> +=09/* Hole */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* RXD3 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* RXD2 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* RXD1 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* RXD0 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* RXCK */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* RXCTL/RCDV */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* RXERR */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* TXD3 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* TXD2L */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* TXD1 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* TXD0 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* CRS */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* TXCK */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* TXCTL/TXEN */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* TXERR */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* CLKIN/COL */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* MDC */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "emac")),=09=09/* MDIO */
> +=09/* Hole */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 0),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* PCLK */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* CLK */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 1),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* MCLK */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* ERR */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 2),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* HSYNC */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* SYNC */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 3),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* VSYNC */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* DVLD */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 4),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* D0 */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* D0 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 5),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* D1 */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* D1 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 6),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* D2 */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* D2 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 7),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* D3 */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* D3 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 8),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* D4 */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* D4 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 9),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* D5 */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* D5 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 10),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* D6 */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* D6 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 11),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* D7 */
> +=09=09  SUNXI_FUNCTION(0x3, "ts")),=09=09/* D7 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 12),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* SCK */
> +=09=09  SUNXI_FUNCTION(0x3, "i2c2")),=09=09/* SCK */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 13),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "csi"),=09=09/* SDA */
> +=09=09  SUNXI_FUNCTION(0x3, "i2c2")),=09=09/* SDA */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 14),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out")),
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 15),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out")),
> +=09/* Hole */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc0"),=09=09/* D1 */
> +=09=09  SUNXI_FUNCTION(0x3, "jtag")),=09=09/* MS */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc0"),=09=09/* D0 */
> +=09=09  SUNXI_FUNCTION(0x3, "jtag")),=09=09/* DI */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc0"),=09=09/* CLK */
> +=09=09  SUNXI_FUNCTION(0x3, "uart0")),=09/* TX */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc0"),=09=09/* CMD */
> +=09=09  SUNXI_FUNCTION(0x3, "jtag")),=09=09/* DO */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc0"),=09=09/* D3 */
> +=09=09  SUNXI_FUNCTION(0x3, "uart0")),=09/* RX */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc0"),=09=09/* D2 */
> +=09=09  SUNXI_FUNCTION(0x3, "jtag")),=09=09/* CK */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc0")),=09=09/* DET */
> +=09/* Hole */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc1"),=09=09/* CLK */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 0)),=09/* PG_EINT0 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc1"),=09=09/* CMD */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 1)),=09/* PG_EINT1 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc1"),=09=09/* D0 */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 2)),=09/* PG_EINT2 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc1"),=09=09/* D1 */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 3)),=09/* PG_EINT3 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc1"),=09=09/* D2 */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 4)),=09/* PG_EINT4 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "mmc1"),=09=09/* D3 */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 5)),=09/* PG_EINT5 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart1"),=09=09/* TX */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 6)),=09/* PG_EINT6 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart1"),=09=09/* RX */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 7)),=09/* PG_EINT7 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart1"),=09=09/* RTS */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 8)),=09/* PG_EINT8 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "uart1"),=09=09/* CTS */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 9)),=09/* PG_EINT9 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2s1"),=09=09/* SYNC */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 10)),=09/* PG_EINT10 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2s1"),=09=09/* CLK */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 11)),=09/* PG_EINT11 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 12),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2s1"),=09=09/* DOUT */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 12)),=09/* PG_EINT12 */
> +=09SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 13),
> +=09=09  SUNXI_FUNCTION(0x0, "gpio_in"),
> +=09=09  SUNXI_FUNCTION(0x1, "gpio_out"),
> +=09=09  SUNXI_FUNCTION(0x2, "i2s1"),=09=09/* DIN */
> +=09=09  SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 13)),=09/* PG_EINT13 */
> +};
> +
> +static const struct sunxi_pinctrl_desc sun8i_h3_pinctrl_data =3D {
> +=09.pins =3D sun8i_h3_pins,
> +=09.npins =3D ARRAY_SIZE(sun8i_h3_pins),
> +=09.irq_banks =3D 2,
> +};
> +
> +static int sun8i_h3_pinctrl_probe(struct platform_device *pdev)
> +{
> +=09return sunxi_pinctrl_init(pdev,
> +=09=09=09=09  &sun8i_h3_pinctrl_data);
> +}
> +
> +static const struct of_device_id sun8i_h3_pinctrl_match[] =3D {
> +=09{ .compatible =3D "allwinner,sun8i-h3-pinctrl", },
> +=09{}
> +};
> +
> +static struct platform_driver sun8i_h3_pinctrl_driver =3D {
> +=09.probe=09=3D sun8i_h3_pinctrl_probe,
> +=09.driver=09=3D {
> +=09=09.name=09=09=3D "sun8i-h3-pinctrl",
> +=09=09.of_match_table=09=3D sun8i_h3_pinctrl_match,
> +=09},
> +};
> +builtin_platform_driver(sun8i_h3_pinctrl_driver);
> --=20
> 2.6.1


------=_Part_324_694801473.1445502086641
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

------=_Part_324_694801473.1445502086641--
