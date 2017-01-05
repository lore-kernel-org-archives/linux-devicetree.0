From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH 1/6] drivers: pinctrl: add driver for
 Allwinner H5 SoC
Date: Fri, 06 Jan 2017 06:49:48 +0800
Message-ID: <20170106015017.oBBq5TM1@smtp1h.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBMU3XPBQKGQETVUSEHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B41=E6=9C=886=E6=97=A5 06:08=E4=BA=8E Maxime Ripard <maxime.ripa=
rd-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Dec 27, 2016 at 12:25:13AM +0800, Icenowy Zheng wrote:=20
> > Based on the Allwinner H5 datasheet and the pinctrl driver of the=20
> > backward-compatible H3 this introduces the pin multiplex assignments fo=
r=20
> > the H5 SoC.=20
> >=20
> > H5 introduced some more pin functions (e.g. three more groups of TS=20
> > pins, and one more groups of SIM pins) than H3.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> >=C2=A0 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +=20
> >=C2=A0 drivers/pinctrl/sunxi/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +=20
> >=C2=A0 drivers/pinctrl/sunxi/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +=20
> >=C2=A0 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 551 +++++++++++++++++++++=20
> >=C2=A0 4 files changed, 557 insertions(+)=20
> >=C2=A0 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c=20
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-=
pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pin=
ctrl.txt=20
> > index c931fb1c01a6..2fd688c8dbdb 100644=20
> > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl=
.txt=20
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl=
.txt=20
> > @@ -23,6 +23,7 @@ Required properties:=20
> >=C2=A0=C2=A0=C2=A0 "allwinner,sun8i-h3-pinctrl"=20
> >=C2=A0=C2=A0=C2=A0 "allwinner,sun8i-h3-r-pinctrl"=20
> >=C2=A0=C2=A0=C2=A0 "allwinner,sun50i-a64-pinctrl"=20
> > +=C2=A0 "allwinner,sun50i-h5-r-pinctrl"=20
>
> You're using a different compatible in your driver.=20

oh... just drop "-r".

R_PIO in H5 is the same with H3.

>
> >=C2=A0=C2=A0=C2=A0 "nextthing,gr8-pinctrl"=20
> >=C2=A0=20
> >=C2=A0 - reg: Should contain the register physical address and length fo=
r the=20
> > diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kcon=
fig=20
> > index bff1ffc6f01e..e9c47e8b2ee0 100644=20
> > --- a/drivers/pinctrl/sunxi/Kconfig=20
> > +++ b/drivers/pinctrl/sunxi/Kconfig=20
> > @@ -76,4 +76,8 @@ config PINCTRL_SUN50I_A64=20
> >=C2=A0 bool=20
> >=C2=A0 select PINCTRL_SUNXI=20
> >=C2=A0=20
> > +config PINCTRL_SUN50I_H5=20
> > + bool=20
> > + select PINCTRL_SUNXI=20
> > +=20
> >=C2=A0 endif=20
> > diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Mak=
efile=20
> > index 95f93d0561fc..bab215d25440 100644=20
> > --- a/drivers/pinctrl/sunxi/Makefile=20
> > +++ b/drivers/pinctrl/sunxi/Makefile=20
> > @@ -17,5 +17,6 @@ obj-$(CONFIG_PINCTRL_SUN50I_A64) +=3D pinctrl-sun50i-=
a64.o=20
> >=C2=A0 obj-$(CONFIG_PINCTRL_SUN8I_A83T) +=3D pinctrl-sun8i-a83t.o=20
> >=C2=A0 obj-$(CONFIG_PINCTRL_SUN8I_H3) +=3D pinctrl-sun8i-h3.o=20
> >=C2=A0 obj-$(CONFIG_PINCTRL_SUN8I_H3_R) +=3D pinctrl-sun8i-h3-r.o=20
> > +obj-$(CONFIG_PINCTRL_SUN50I_H5) +=3D pinctrl-sun50i-h5.o=20
> >=C2=A0 obj-$(CONFIG_PINCTRL_SUN9I_A80) +=3D pinctrl-sun9i-a80.o=20
> >=C2=A0 obj-$(CONFIG_PINCTRL_SUN9I_A80_R) +=3D pinctrl-sun9i-a80-r.o=20
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c b/drivers/pinctr=
l/sunxi/pinctrl-sun50i-h5.c=20
> > new file mode 100644=20
> > index 000000000000..67a55df37782=20
> > --- /dev/null=20
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c=20
> > @@ -0,0 +1,551 @@=20
> > +/*=20
> > + * Allwinner H5 SoC pinctrl driver.=20
> > + *=20
> > + * Copyright (C) 2016 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > + *=20
> > + * Based on pinctrl-sun8i-h3.c, which is:=20
> > + * Copyright (C) 2015 Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=20
> > + *=20
> > + * Based on pinctrl-sun8i-a23.c, which is:=20
> > + * Copyright (C) 2014 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>=20
> > + * Copyright (C) 2014 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=
=20
> > + *=20
> > + * This file is licensed under the terms of the GNU General Public=20
> > + * License version 2.=C2=A0 This program is licensed "as is" without a=
ny=20
> > + * warranty of any kind, whether express or implied.=20
> > + */=20
> > +=20
> > +#include <linux/module.h>=20
> > +#include <linux/platform_device.h>=20
> > +#include <linux/of.h>=20
> > +#include <linux/of_device.h>=20
> > +#include <linux/pinctrl/pinctrl.h>=20
> > +=20
> > +#include "pinctrl-sunxi.h"=20
> > +=20
> > +static const struct sunxi_desc_pin sun50i_h5_pins[] =3D {=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart2"), /* TX */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "jtag"), /* MS */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)), /* PA_EINT0 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 1),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart2"), /* RX */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "jtag"), /* CK */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)), /* PA_EINT1 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 2),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart2"), /* RTS */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "jtag"), /* DO */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)), /* PA_EINT2 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart2"), /* CTS */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "jtag"), /* DI */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)), /* PA_EINT3 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 4),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart0"), /* TX */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)), /* PA_EINT4 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 5),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart0"), /* RX */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "pwm0"),=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)), /* PA_EINT5 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 6),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "sim"), /* PWREN */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)), /* PA_EINT6 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "sim"), /* CLK */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)), /* PA_EINT7 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 8),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "sim"), /* DATA */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)), /* PA_EINT8 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 9),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "sim"), /* RST */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)), /* PA_EINT9 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 10),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "sim"), /* DET */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)), /* PA_EINT10 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 11),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2c0"), /* SCK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "di"), /* TX */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)), /* PA_EINT11 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 12),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2c0"), /* SDA */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "di"), /* RX */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)), /* PA_EINT12 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 13),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "spi1"), /* CS */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "uart3"), /* TX */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)), /* PA_EINT13 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 14),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "spi1"), /* CLK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "uart3"), /* RX */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)), /* PA_EINT14 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 15),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "spi1"), /* MOSI */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "uart3"), /* RTS */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)), /* PA_EINT15 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 16),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "spi1"), /* MISO */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "uart3"), /* CTS */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)), /* PA_EINT16 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 17),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "spdif"), /* OUT */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 17)), /* PA_EINT17 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 18),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2s0"), /* SYNC */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "i2c1"), /* SCK */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 18)), /* PA_EINT18 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 19),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2s0"), /* CLK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "i2c1"), /* SDA */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 19)), /* PA_EINT19 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 20),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2s0"), /* DOUT */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "sim"), /* VPPEN */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 20)), /* PA_EINT20 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 21),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2s0"), /* DIN */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "sim"), /* VPPPP */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 21)), /* PA_EINT21 */=20
> > + /* Hole */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* WE */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "spi0")), /* MOSI */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* ALE */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "spi0"), /* MISO */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "mmc2")), /* DS */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* CLE */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "spi0")), /* CLK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* CE1 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "spi0")), /* CS */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* CE0 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "spi0")), /* MISO */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* RE */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* CLK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* RB0 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* CMD */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0")), /* RB1 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQ0 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* D0 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQ1 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* D1 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQ2 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* D2 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQ3 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* D3 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQ4 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* D4 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQ5 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* D5 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQ6 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* D6 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQ7 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* D7 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "nand0"), /* DQS */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "mmc2")), /* RST */=20
> > + /* Hole */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* RXD3 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "di"), /* TX */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2")), /* CLK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* RXD2 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "di"), /* RX */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2")), /* ERR */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* RXD1 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2")), /* SYNC */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* RXD0 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2")), /* DVLD */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* RXCK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2")), /* D0 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* RXCTL/RXDV */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2")), /* D1 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* RXERR */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2")), /* D2 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* TXD3 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2"), /* D3 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x5, "ts3")), /* CLK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* TXD2 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2"), /* D4 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x5, "ts3")), /* ERR */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* TXD1 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2"), /* D5 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x5, "ts3")), /* SYNC */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* TXD0 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2"), /* D6 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x5, "ts3")), /* DVLD */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* CRS */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts2"), /* D7 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x5, "ts3")), /* D0 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* TXCK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "sim")), /* PWREN */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* TXCTL/TXEN */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "sim")), /* CLK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* TXERR */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "sim")), /* DATA */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* CLKIN/COL */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "sim")), /* RST */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac"), /* MDC */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "sim")), /* DET */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "emac")), /* MDIO */=20
> > + /* Hole */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 0),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* PCLK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0")), /* CLK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 1),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* MCLK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0")), /* ERR */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 2),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* HSYNC */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0")), /* SYNC */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 3),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* VSYNC */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0")), /* DVLD */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 4),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* D0 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0")), /* D0 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 5),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* D1 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0")), /* D1 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 6),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* D2 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0")), /* D2 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 7),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* D3 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0"), /* D3 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts1")), /* CLK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 8),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* D4 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0"), /* D4 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts1")), /* ERR */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 9),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* D5 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0"), /* D5 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts1")), /* SYNC */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 10),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* D6 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts0"), /* D6 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts1")), /* DVLD */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 11),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* D7 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "ts"), /* D7 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x4, "ts1")), /* D0 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 12),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* SCK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "i2c2")), /* SCK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 13),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "csi"), /* SDA */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "i2c2")), /* SDA */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 14),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "sim")), /* VPPEN */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 15),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "sim")), /* VPPPP */=20
> > + /* Hole */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc0"), /* D1 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "jtag")), /* MS */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc0"), /* D0 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "jtag")), /* DI */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc0"), /* CLK */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "uart0")), /* TX */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc0"), /* CMD */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "jtag")), /* DO */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc0"), /* D3 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "uart0")), /* RX */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc0"), /* D2 */=20
> > + =C2=A0 SUNXI_FUNCTION(0x3, "jtag")), /* CK */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out")),=20
> > + /* Hole */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc1"), /* CLK */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)), /* PG_EINT0 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc1"), /* CMD */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)), /* PG_EINT1 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc1"), /* D0 */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)), /* PG_EINT2 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc1"), /* D1 */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)), /* PG_EINT3 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc1"), /* D2 */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)), /* PG_EINT4 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "mmc1"), /* D3 */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)), /* PG_EINT5 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart1"), /* TX */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)), /* PG_EINT6 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart1"), /* RX */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)), /* PG_EINT7 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart1"), /* RTS */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)), /* PG_EINT8 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "uart1"), /* CTS */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)), /* PG_EINT9 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2s1"), /* SYNC */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)), /* PG_EINT10 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2s1"), /* CLK */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)), /* PG_EINT11 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 12),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2s1"), /* DOUT */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)), /* PG_EINT12 */=20
> > + SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 13),=20
> > + =C2=A0 SUNXI_FUNCTION(0x0, "gpio_in"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x1, "gpio_out"),=20
> > + =C2=A0 SUNXI_FUNCTION(0x2, "i2s1"), /* DIN */=20
> > + =C2=A0 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)), /* PG_EINT13 */=20
> > +};=20
> > +=20
> > +static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data =3D {=20
> > + .pins =3D sun50i_h5_pins,=20
> > + .npins =3D ARRAY_SIZE(sun50i_h5_pins),=20
> > + .irq_banks =3D 2,=20
> > + .irq_read_needs_mux =3D true=20
> > +};=20
> > +=20
> > +static int sun50i_h5_pinctrl_probe(struct platform_device *pdev)=20
> > +{=20
> > + return sunxi_pinctrl_init(pdev,=20
> > + =C2=A0 &sun50i_h5_pinctrl_data);=20
> > +}=20
> > +=20
> > +static const struct of_device_id sun50i_h5_pinctrl_match[] =3D {=20
> > + { .compatible =3D "allwinner,sun50i-h5-pinctrl", },=20
> > + {}=20
> > +};=20
> > +=20
> > +static struct platform_driver sun50i_h5_pinctrl_driver =3D {=20
> > + .probe =3D sun50i_h5_pinctrl_probe,=20
> > + .driver =3D {=20
> > + .name =3D "sun50i-h5-pinctrl",=20
> > + .of_match_table =3D sun50i_h5_pinctrl_match,=20
> > + },=20
> > +};=20
> > +builtin_platform_driver(sun50i_h5_pinctrl_driver);=20
>
> This also looks very much like the H3. I'll post a patchset during the=20
> weekend to avoid duplicating those drivers. This was initially done=20
> for the sun5i, but it very much applies here.=20
>
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.=20
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org=20
> For more options, visit https://groups.google.com/d/optout.=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
