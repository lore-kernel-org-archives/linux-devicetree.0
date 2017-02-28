From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 5/5] pinctrl: sunxi: Add A64 R_PIO
 controller support
Date: Wed, 01 Mar 2017 02:58:30 +0800
Message-ID: <492301488308310@web13j.yandex.ru>
References: <20170228172444.59655-1-icenowy@aosc.xyz>
	 <20170228172444.59655-5-icenowy@aosc.xyz> <b04ad85d-698b-56b4-6b82-1791bd7b14b7@arm.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBV4Q27CQKGQEU24L5RQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <b04ad85d-698b-56b4-6b82-1791bd7b14b7-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: "andre.przywara-5wv7dgnIgG8@public.gmane.org" <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



01.03.2017, 02:27, "Andre Przywara" <andre.przywara-5wv7dgnIgG8@public.gmane.org>:
> Hi,
>
> On 28/02/17 17:24, Icenowy Zheng wrote:
>> =C2=A0The A64 has a R_PIO pin controller, similar to the one found on th=
e H3 SoC.
>> =C2=A0Add support for the pins controlled by the R_PIO controller.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0=C2=A0drivers/pinctrl/sunxi/Kconfig | 5 +
>> =C2=A0=C2=A0drivers/pinctrl/sunxi/Makefile | 1 +
>> =C2=A0=C2=A0drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c | 143 +++++++++=
++++++++++++++++++
>> =C2=A0=C2=A03 files changed, 149 insertions(+)
>> =C2=A0=C2=A0create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a64-=
r.c
>>
>> =C2=A0diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi=
/Kconfig
>> =C2=A0index 92325736d953..0738b0df5a0b 100644
>> =C2=A0--- a/drivers/pinctrl/sunxi/Kconfig
>> =C2=A0+++ b/drivers/pinctrl/sunxi/Kconfig
>> =C2=A0@@ -69,6 +69,11 @@ config PINCTRL_SUN50I_A64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0def_bool ARM=
64 && ARCH_SUNXI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select PINCT=
RL_SUNXI
>>
>> =C2=A0+config PINCTRL_SUN50I_A64_R
>> =C2=A0+ def_bool ARM64 && ARCH_SUNXI
>> =C2=A0+ depends on RESET_CONTROLLER
>
> Same comment as on patch 1/5 (select instead of "depends on").
> I take it this for drivers/reset/reset-sunxi.c?
> Shouldn't this be the sunxi specific CONFIG_RESET_SUNXI then?
> Also from from having a quick look at the driver this is broken for
> arm64 (BITS_PER_LONG usage).
> From having a closer look this driver is actually not Allwinner specific
> at all, since it just describes a number of bits in consecutive
> 32-bit(!) registers as reset cells.
> As I today stumbled upon another SoC which has the same reset register
> layout I was wondering if it's worth to generalise this? Possibly
> renaming the driver, and allowing additional compatibles?
> I can take a stab at this.

As I said, the driver now doesn't play under ARM64.
But, sunxi-ng ccu driver is now a reset controller.

>
> Cheers,
> Andre.
>
>> =C2=A0+ select PINCTRL_SUNXI
>> =C2=A0+
>> =C2=A0=C2=A0config PINCTRL_SUN50I_H5
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0def_bool ARM=
64 && ARCH_SUNXI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select PINCT=
RL_SUNXI
>> =C2=A0diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunx=
i/Makefile
>> =C2=A0index 04ccb88ebd5f..df4ccd6cd44c 100644
>> =C2=A0--- a/drivers/pinctrl/sunxi/Makefile
>> =C2=A0+++ b/drivers/pinctrl/sunxi/Makefile
>> =C2=A0@@ -11,6 +11,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_A23) +=3D pinctrl-sun=
8i-a23.o
>> =C2=A0=C2=A0obj-$(CONFIG_PINCTRL_SUN8I_A23_R) +=3D pinctrl-sun8i-a23-r.o
>> =C2=A0=C2=A0obj-$(CONFIG_PINCTRL_SUN8I_A33) +=3D pinctrl-sun8i-a33.o
>> =C2=A0=C2=A0obj-$(CONFIG_PINCTRL_SUN50I_A64) +=3D pinctrl-sun50i-a64.o
>> =C2=A0+obj-$(CONFIG_PINCTRL_SUN50I_A64_R) +=3D pinctrl-sun50i-a64-r.o
>> =C2=A0=C2=A0obj-$(CONFIG_PINCTRL_SUN8I_A83T) +=3D pinctrl-sun8i-a83t.o
>> =C2=A0=C2=A0obj-$(CONFIG_PINCTRL_SUN8I_H3) +=3D pinctrl-sun8i-h3.o
>> =C2=A0=C2=A0obj-$(CONFIG_PINCTRL_SUN8I_H3_R) +=3D pinctrl-sun8i-h3-r.o
>> =C2=A0diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c b/driver=
s/pinctrl/sunxi/pinctrl-sun50i-a64-r.c
>> =C2=A0new file mode 100644
>> =C2=A0index 000000000000..90996a63689b
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c
>> =C2=A0@@ -0,0 +1,143 @@
>> =C2=A0+/*
>> =C2=A0+ * Allwinner A64 SoCs special pins pinctrl driver.
>> =C2=A0+ *
>> =C2=A0+ * Based on pinctrl-sun8i-a23-r.c
>> =C2=A0+ *
>> =C2=A0+ * Copyright (C) 2016 Icenowy Zheng
>> =C2=A0+ * Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0+ *
>> =C2=A0+ * Copyright (C) 2014 Chen-Yu Tsai
>> =C2=A0+ * Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> =C2=A0+ *
>> =C2=A0+ * Copyright (C) 2014 Boris Brezillon
>> =C2=A0+ * Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> =C2=A0+ *
>> =C2=A0+ * Copyright (C) 2014 Maxime Ripard
>> =C2=A0+ * Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> =C2=A0+ *
>> =C2=A0+ * This file is licensed under the terms of the GNU General Publi=
c
>> =C2=A0+ * License version 2. This program is licensed "as is" without an=
y
>> =C2=A0+ * warranty of any kind, whether express or implied.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#include <linux/of.h>
>> =C2=A0+#include <linux/of_device.h>
>> =C2=A0+#include <linux/pinctrl/pinctrl.h>
>> =C2=A0+#include <linux/platform_device.h>
>> =C2=A0+#include <linux/reset.h>
>> =C2=A0+
>> =C2=A0+#include "pinctrl-sunxi.h"
>> =C2=A0+
>> =C2=A0+static const struct sunxi_desc_pin sun50i_a64_r_pins[] =3D {
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 0),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x2, "s_rsb"), /* SCK */
>> =C2=A0+ SUNXI_FUNCTION(0x3, "s_i2c"), /* SCK */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)), /* PL_EINT0 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 1),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x2, "s_rsb"), /* SDA */
>> =C2=A0+ SUNXI_FUNCTION(0x3, "s_i2c"), /* SDA */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)), /* PL_EINT1 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 2),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x2, "s_uart"), /* TX */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)), /* PL_EINT2 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 3),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x2, "s_uart"), /* RX */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)), /* PL_EINT3 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 4),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x3, "s_jtag"), /* MS */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)), /* PL_EINT4 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 5),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x3, "s_jtag"), /* CK */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)), /* PL_EINT5 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 6),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x3, "s_jtag"), /* DO */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)), /* PL_EINT6 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 7),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x3, "s_jtag"), /* DI */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)), /* PL_EINT7 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 8),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x2, "s_i2c"), /* SCK */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)), /* PL_EINT8 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 9),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x2, "s_i2c"), /* SDA */
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)), /* PL_EINT9 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 10),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x2, "s_pwm"),
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)), /* PL_EINT10 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 11),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION(0x2, "s_cir_rx"),
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)), /* PL_EINT11 */
>> =C2=A0+ SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 12),
>> =C2=A0+ SUNXI_FUNCTION(0x0, "gpio_in"),
>> =C2=A0+ SUNXI_FUNCTION(0x1, "gpio_out"),
>> =C2=A0+ SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)), /* PL_EINT12 */
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static const struct sunxi_pinctrl_desc sun50i_a64_r_pinctrl_data =
=3D {
>> =C2=A0+ .pins =3D sun50i_a64_r_pins,
>> =C2=A0+ .npins =3D ARRAY_SIZE(sun50i_a64_r_pins),
>> =C2=A0+ .pin_base =3D PL_BASE,
>> =C2=A0+ .irq_banks =3D 1,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static int sun50i_a64_r_pinctrl_probe(struct platform_device *pde=
v)
>> =C2=A0+{
>> =C2=A0+ struct reset_control *rstc;
>> =C2=A0+ int ret;
>> =C2=A0+
>> =C2=A0+ rstc =3D devm_reset_control_get(&pdev->dev, NULL);
>> =C2=A0+ if (IS_ERR(rstc)) {
>> =C2=A0+ dev_err(&pdev->dev, "Reset controller missing\n");
>> =C2=A0+ return PTR_ERR(rstc);
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ ret =3D reset_control_deassert(rstc);
>> =C2=A0+ if (ret)
>> =C2=A0+ return ret;
>> =C2=A0+
>> =C2=A0+ ret =3D sunxi_pinctrl_init(pdev,
>> =C2=A0+ &sun50i_a64_r_pinctrl_data);
>> =C2=A0+
>> =C2=A0+ if (ret)
>> =C2=A0+ reset_control_assert(rstc);
>> =C2=A0+
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct of_device_id sun50i_a64_r_pinctrl_match[] =3D=
 {
>> =C2=A0+ { .compatible =3D "allwinner,sun50i-a64-r-pinctrl", },
>> =C2=A0+ {}
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static struct platform_driver sun50i_a64_r_pinctrl_driver =3D {
>> =C2=A0+ .probe =3D sun50i_a64_r_pinctrl_probe,
>> =C2=A0+ .driver =3D {
>> =C2=A0+ .name =3D "sun50i-a64-r-pinctrl",
>> =C2=A0+ .of_match_table =3D sun50i_a64_r_pinctrl_match,
>> =C2=A0+ },
>> =C2=A0+};
>> =C2=A0+builtin_platform_driver(sun50i_a64_r_pinctrl_driver);
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
