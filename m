Return-Path: <newchief@king.net.pl>
From: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 7/9] arm: twr-k70f120m: IOMUX driver for Kinetis SoC
Date: Tue, 23 Jun 2015 23:19:45 +0200
Message-Id: <1435094387-20146-8-git-send-email-pawelo@king.net.pl>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
To: Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas Pitre <nico@linaro.org>, Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, Paul Bolle <pebolle@tiscali.nl>, Rob Herring <r.herring@freescale.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Simon Horman <horms+renesas@verge.net.au>, Stefan Agner <stefan@agner.ch>, Stephen Boyd <sboyd@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
Cc: Paul Osmialowski <pawelo@king.net.pl>, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>
List-ID: <devicetree@vger.kernel.org>

This is very cheap and simple implementation of pinctrl driver
for Kinetis SoC - its primary role is to provide means for enabling UART
fuctionality on I/O PORT_E which will be utilized by the commits
yet to come.

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 .../bindings/pinctrl/fsl,kinetis-pinctrl.txt       |  31 ++
 arch/arm/Kconfig                                   |   1 +
 arch/arm/boot/dts/kinetis.dtsi                     |  48 ++
 arch/arm/mach-kinetis/Kconfig                      |   6 +
 drivers/clk/clk-kinetis.c                          |  28 ++
 drivers/pinctrl/freescale/Kconfig                  |   8 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-kinetis.c        | 529 +++++++++++++++++++++
 include/dt-bindings/clock/kinetis-mcg.h            |   8 +-
 9 files changed, 659 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,kinetis-pinctrl.txt
 create mode 100644 drivers/pinctrl/freescale/pinctrl-kinetis.c

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,kinetis-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,kinetis-pinctrl.txt
new file mode 100644
index 0000000..04798c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,kinetis-pinctrl.txt
@@ -0,0 +1,31 @@
+Freescale Kinetis IOMUX Controller
+
+This controller is largely based on i.MX IOMUX Controller. Please refer to
+fsl,imx-pinctrl.txt in this directory for more detailed description.
+
+Required properties:
+- compatible: Should be "fsl,kinetis-iomuxc".
+- reg: Should contain the physical address and length of the gpio/pinmux
+  register range.
+- clocks: Clock that drives this I/O port.
+- fsl,pins: Two integers array, represents a group of pins mux and config
+  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is
+  a pin working on a specific function, CONFIG is the pad setting value
+  such as pull enable, pull select, drive strength enable. Please refer to
+  Kinetis datasheet for the valid pad config settings.
+
+Example:
+
+portE: pinmux@4004d000 {
+	compatible = "fsl,kinetis-padconf";
+	reg = <0x4004d000 0x1000>;
+	clocks = <&mcg CLOCK_PORTE>;
+	uart2 {
+		uart2_pins: pinmux_uart2_pins {
+			fsl,pins = <
+				16	0x300 /* E.16 = UART2_TX */
+				17	0x300 /* E.17 = UART2_RX */
+			>;
+		};
+	};
+};
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8630aff..662447c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -980,6 +980,7 @@ config ARCH_KINETIS
 	select ARM_CPU_IDLE_QUIRKS
 	select ARMV7M_SYSTICK
 	select CLKSRC_KINETIS
+	select PINCTRL
 	select ZLIB_INFLATE_STACK_SAVING if ZLIB_INFLATE
 	help
 	  This enables support for the Freescale Kinetis MCUs
diff --git a/arch/arm/boot/dts/kinetis.dtsi b/arch/arm/boot/dts/kinetis.dtsi
index 770760f..f3f22b5 100644
--- a/arch/arm/boot/dts/kinetis.dtsi
+++ b/arch/arm/boot/dts/kinetis.dtsi
@@ -11,9 +11,57 @@
 		pit1 = &pit1;
 		pit2 = &pit2;
 		pit3 = &pit3;
+		pmx0 = &portA;
+		pmx1 = &portB;
+		pmx2 = &portC;
+		pmx3 = &portD;
+		pmx4 = &portE;
+		pmx5 = &portF;
 	};
 
 	soc {
+		portA: pinmux@40049000 {
+			compatible = "fsl,kinetis-padconf";
+			reg = <0x40049000 0x1000>;
+			clocks = <&mcg CLOCK_PORTA>;
+			status = "disabled";
+		};
+
+		portB: pinmux@4004a000 {
+			compatible = "fsl,kinetis-padconf";
+			reg = <0x4004a000 0x1000>;
+			clocks = <&mcg CLOCK_PORTB>;
+			status = "disabled";
+		};
+
+		portC: pinmux@4004b000 {
+			compatible = "fsl,kinetis-padconf";
+			reg = <0x4004b000 0x1000>;
+			clocks = <&mcg CLOCK_PORTC>;
+			status = "disabled";
+		};
+
+		portD: pinmux@4004c000 {
+			compatible = "fsl,kinetis-padconf";
+			reg = <0x4004c000 0x1000>;
+			clocks = <&mcg CLOCK_PORTD>;
+			status = "disabled";
+		};
+
+		portE: pinmux@4004d000 {
+			compatible = "fsl,kinetis-padconf";
+			reg = <0x4004d000 0x1000>;
+			clocks = <&mcg CLOCK_PORTE>;
+			status = "disabled";
+		};
+
+		portF: pinmux@4004e000 {
+			compatible = "fsl,kinetis-padconf";
+			reg = <0x4004e000 0x1000>;
+			clocks = <&mcg CLOCK_PORTF>;
+			status = "disabled";
+		};
+
 		pit0: timer@40037100 {
 			compatible = "fsl,kinetis-pit-timer";
 			reg = <0x40037100 0x10>;
diff --git a/arch/arm/mach-kinetis/Kconfig b/arch/arm/mach-kinetis/Kconfig
index 300bcea..c9a9d3a 100644
--- a/arch/arm/mach-kinetis/Kconfig
+++ b/arch/arm/mach-kinetis/Kconfig
@@ -1,8 +1,14 @@
 if ARCH_KINETIS
 
+config SOC_K70
+	bool
+	depends on ARCH_KINETIS
+	select PINCTRL_KINETIS
+
 config MACH_KINETIS
 	bool "Kinetis K70 based development board"
 	default y
+	select SOC_K70
 	help
 	  Say Y here if you are using Kinetis K70 based development board
 
diff --git a/drivers/clk/clk-kinetis.c b/drivers/clk/clk-kinetis.c
index dea1054..b6620c0 100644
--- a/drivers/clk/clk-kinetis.c
+++ b/drivers/clk/clk-kinetis.c
@@ -220,6 +220,34 @@ static void __init kinetis_mcg_init(struct device_node *np)
 			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PIT)]),
 			KINETIS_CG_IDX(KINETIS_CG_PIT), 0, NULL);
 
+	/*
+	 * Port control clock gates,
+	 *   see K70 Sub-Family Reference Manual, Rev. 3 pg. 223:
+	 */
+	clk[CLOCK_PORTA] = clk_register_gate(NULL, "PORTA", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PORTA)]),
+			KINETIS_CG_IDX(KINETIS_CG_PORTA), 0, NULL);
+
+	clk[CLOCK_PORTB] = clk_register_gate(NULL, "PORTB", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PORTB)]),
+			KINETIS_CG_IDX(KINETIS_CG_PORTB), 0, NULL);
+
+	clk[CLOCK_PORTC] = clk_register_gate(NULL, "PORTC", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PORTC)]),
+			KINETIS_CG_IDX(KINETIS_CG_PORTC), 0, NULL);
+
+	clk[CLOCK_PORTD] = clk_register_gate(NULL, "PORTD", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PORTD)]),
+			KINETIS_CG_IDX(KINETIS_CG_PORTD), 0, NULL);
+
+	clk[CLOCK_PORTE] = clk_register_gate(NULL, "PORTE", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PORTE)]),
+			KINETIS_CG_IDX(KINETIS_CG_PORTE), 0, NULL);
+
+	clk[CLOCK_PORTF] = clk_register_gate(NULL, "PORTF", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PORTF)]),
+			KINETIS_CG_IDX(KINETIS_CG_PORTF), 0, NULL);
+
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 }
 
diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 12ef544..2d0dfa9 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -94,6 +94,14 @@ config PINCTRL_IMX7D
 	help
 	  Say Y here to enable the imx7d pinctrl driver
 
+config PINCTRL_KINETIS
+	bool "Kinetis pinctrl driver"
+	depends on OF
+	depends on SOC_K70
+	select PINMUX
+	help
+	  Say Y here to enable the Kinetis pinctrl driver
+
 config PINCTRL_VF610
 	bool "Freescale Vybrid VF610 pinctrl driver"
 	depends on SOC_VF610
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index 343cb43..8db5f4c 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_PINCTRL_IMX6Q)	+= pinctrl-imx6dl.o
 obj-$(CONFIG_PINCTRL_IMX6SL)	+= pinctrl-imx6sl.o
 obj-$(CONFIG_PINCTRL_IMX6SX)	+= pinctrl-imx6sx.o
 obj-$(CONFIG_PINCTRL_IMX7D)	+= pinctrl-imx7d.o
+obj-$(CONFIG_PINCTRL_KINETIS)	+= pinctrl-kinetis.o
 obj-$(CONFIG_PINCTRL_VF610)	+= pinctrl-vf610.o
 obj-$(CONFIG_PINCTRL_MXS)	+= pinctrl-mxs.o
 obj-$(CONFIG_PINCTRL_IMX23)	+= pinctrl-imx23.o
diff --git a/drivers/pinctrl/freescale/pinctrl-kinetis.c b/drivers/pinctrl/freescale/pinctrl-kinetis.c
new file mode 100644
index 0000000..baa913e
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-kinetis.c
@@ -0,0 +1,529 @@
+/*
+ * pinctrl-kinetis.c - iomux for Kinetis MCUs
+ *
+ * Based on pinctrl-imx.c by Dong Aisheng <dong.aisheng@linaro.org>
+ *
+ * Copyright (C) 2015 Paul Osmialowski <pawelo@king.net.pl>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/slab.h>
+
+/**
+ * struct kinetis_pin_group - describes a single pin
+ * @mux_reg: the mux register for this pin.
+ * @mux_mode: the mux mode for this pin.
+ */
+struct kinetis_pin {
+	u32 mux_reg;
+	u32 mux_mode;
+};
+
+/**
+ * struct kinetis_pin_group - describes a pin group
+ * @name: the name of this specific pin group
+ * @npins: the number of pins in this group array, i.e. the number of
+ *	elements in .pins so we can iterate over that array
+ * @pins: array of pins
+ */
+struct kinetis_pin_group {
+	const char *name;
+	unsigned npins;
+	struct kinetis_pin *pins;
+};
+
+/**
+ * struct kinetis_pmx_func - describes pinmux functions
+ * @name: the name of this specific function
+ * @groups: corresponding pin groups
+ * @num_groups: the number of groups
+ */
+struct kinetis_pmx_func {
+	const char *name;
+	const char **groups;
+	unsigned num_groups;
+};
+
+struct kinetis_pinctrl_soc_info {
+	struct device			*dev;
+	struct kinetis_pin_group	*groups;
+	unsigned int			ngroups;
+	struct kinetis_pmx_func		*functions;
+	unsigned int			nfunctions;
+};
+
+struct kinetis_pinctrl {
+	int				port_id;
+	struct device			*dev;
+	struct pinctrl_dev		*pctl;
+	void __iomem			*base;
+	struct clk			*clk;
+	struct kinetis_pinctrl_soc_info	info;
+};
+
+static const struct of_device_id kinetis_pinctrl_of_match[] = {
+	{ .compatible = "fsl,kinetis-padconf", },
+	{ /* sentinel */ }
+};
+
+/*
+ * PORTx register map
+ */
+struct kinetis_port_regs {
+	u32 pcr[32];	/* Pin Control Registers */
+	u32 gpclr;	/* Global Pin Control Low Register */
+	u32 gpchr;	/* Global Pin Control High Register */
+	u32 rsv0[6];
+	u32 isfr;	/* Interrupt Status Flag Register */
+	u32 rsv1[7];
+	u32 dfer;	/* Digital Filter Enable Register */
+	u32 dfcr;	/* Digital Filter Clock Register */
+	u32 dfwr;	/* Digital Filter Width Register */
+};
+
+/*
+ * PORTx registers base
+ */
+#define KINETIS_PORT_PTR(base, reg) \
+	(&(((struct kinetis_port_regs *)(base))->reg))
+#define KINETIS_PORT_RD(base, reg) readl_relaxed(KINETIS_PORT_PTR(base, reg))
+#define KINETIS_PORT_WR(base, reg, val) \
+		writel_relaxed((val), KINETIS_PORT_PTR(base, reg))
+#define KINETIS_PORT_SET(base, reg, mask) \
+	KINETIS_PORT_WR(base, reg, (KINETIS_PORT_RD(base, reg)) | (mask))
+#define KINETIS_PORT_RESET(base, reg, mask) \
+	KINETIS_PORT_WR(base, reg, (KINETIS_PORT_RD(base, reg)) & (~(mask)))
+
+static const struct kinetis_pin_group *kinetis_pinctrl_find_group_by_name(
+				const struct kinetis_pinctrl_soc_info *info,
+				const char *name)
+{
+	const struct kinetis_pin_group *grp = NULL;
+	int i;
+
+	for (i = 0; i < info->ngroups; i++) {
+		if (!strcmp(info->groups[i].name, name)) {
+			grp = &info->groups[i];
+			break;
+		}
+	}
+
+	return grp;
+}
+
+static int kinetis_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct kinetis_pinctrl *kpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct kinetis_pinctrl_soc_info *info = &kpctl->info;
+
+	return info->ngroups;
+}
+
+static const char *kinetis_get_group_name(struct pinctrl_dev *pctldev,
+				unsigned selector)
+{
+	struct kinetis_pinctrl *kpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct kinetis_pinctrl_soc_info *info = &kpctl->info;
+
+	return info->groups[selector].name;
+}
+
+static int kinetis_dt_node_to_map(struct pinctrl_dev *pctldev,
+			struct device_node *np,
+			struct pinctrl_map **map, unsigned *num_maps)
+{
+	struct kinetis_pinctrl *kpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct kinetis_pinctrl_soc_info *info = &kpctl->info;
+	const struct kinetis_pin_group *grp;
+	struct pinctrl_map *new_map;
+	struct device_node *parent;
+
+	/*
+	 * first find the group of this node and check if we need create
+	 * config maps for pins
+	 */
+	grp = kinetis_pinctrl_find_group_by_name(info, np->name);
+	if (!grp) {
+		dev_err(info->dev, "unable to find group for node %s\n",
+			np->name);
+		return -EINVAL;
+	}
+
+	new_map = kmalloc(sizeof(struct pinctrl_map), GFP_KERNEL);
+	if (!new_map)
+		return -ENOMEM;
+
+	*map = new_map;
+	*num_maps = 1;
+
+	/* create mux map */
+	parent = of_get_parent(np);
+	if (!parent) {
+		dev_err(info->dev, "%s has no parent\n", np->name);
+		kfree(new_map);
+		return -EINVAL;
+	}
+	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
+	new_map[0].data.mux.function = parent->name;
+	new_map[0].data.mux.group = np->name;
+	of_node_put(parent);
+
+	dev_dbg(info->dev, "maps: function %s group %s\n",
+		(*map)->data.mux.function, (*map)->data.mux.group);
+
+	return 0;
+}
+
+static void kinetis_dt_free_map(struct pinctrl_dev *pctldev,
+				struct pinctrl_map *map, unsigned num_maps)
+{
+	kfree(map);
+}
+
+static int kinetis_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct kinetis_pinctrl *kpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct kinetis_pinctrl_soc_info *info = &kpctl->info;
+
+	return info->nfunctions;
+}
+
+static const char *kinetis_get_function_name(struct pinctrl_dev *pctldev,
+				unsigned selector)
+{
+	struct kinetis_pinctrl *kpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct kinetis_pinctrl_soc_info *info = &kpctl->info;
+
+	return info->functions[selector].name;
+}
+
+static int kinetis_get_function_groups(struct pinctrl_dev *pctldev,
+				unsigned selector,
+				const char * const **groups,
+				unsigned * const num_groups)
+{
+	struct kinetis_pinctrl *kpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct kinetis_pinctrl_soc_info *info = &kpctl->info;
+
+	*groups = info->functions[selector].groups;
+	*num_groups = info->functions[selector].num_groups;
+
+	return 0;
+}
+
+static int kinetis_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
+				unsigned group)
+{
+	struct kinetis_pinctrl *kpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct kinetis_pinctrl_soc_info *info = &kpctl->info;
+	struct kinetis_pin_group *grp = &info->groups[group];
+	unsigned int npins = grp->npins;
+	struct kinetis_pin *pin;
+	int i;
+
+	for (i = 0; i < npins; i++) {
+		pin = &grp->pins[i];
+		KINETIS_PORT_WR(kpctl->base, pcr[pin->mux_reg], pin->mux_mode);
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_ops kinetis_pctrl_ops = {
+	.get_groups_count = kinetis_get_groups_count,
+	.get_group_name = kinetis_get_group_name,
+	.dt_node_to_map = kinetis_dt_node_to_map,
+	.dt_free_map = kinetis_dt_free_map,
+};
+
+static const struct pinmux_ops kinetis_pmx_ops = {
+	.get_functions_count = kinetis_get_functions_count,
+	.get_function_name = kinetis_get_function_name,
+	.get_function_groups = kinetis_get_function_groups,
+	.set_mux = kinetis_set_mux,
+};
+
+static struct pinctrl_desc kinetis_pinctrl_desc = {
+	.pctlops = &kinetis_pctrl_ops,
+	.pmxops = &kinetis_pmx_ops,
+	.owner = THIS_MODULE,
+};
+
+#define KINETIS_PIN_SIZE 8
+
+static int kinetis_pinctrl_parse_groups(struct device_node *np,
+				    struct kinetis_pin_group *grp,
+				    struct kinetis_pinctrl_soc_info *info,
+				    u32 index)
+{
+	int size;
+	const int pin_size = KINETIS_PIN_SIZE;
+	const __be32 *list;
+	int i;
+
+	dev_dbg(info->dev, "group(%d): %s\n", index, np->name);
+
+	/* Initialise group */
+	grp->name = np->name;
+
+	list = of_get_property(np, "fsl,pins", &size);
+	if (!list) {
+		dev_err(info->dev, "no fsl,pins property in node %s\n",
+					np->full_name);
+		return -EINVAL;
+	}
+
+	/* we do not check return since it's safe node passed down */
+	if (!size || size % pin_size) {
+		dev_err(info->dev, "Invalid fsl,pins property in node %s\n",
+					np->full_name);
+		return -EINVAL;
+	}
+
+	grp->npins = size / pin_size;
+	grp->pins = devm_kzalloc(info->dev,
+				grp->npins * sizeof(struct kinetis_pin),
+				GFP_KERNEL);
+	if (!grp->pins)
+		return -ENOMEM;
+
+	for (i = 0; i < grp->npins; i++) {
+		grp->pins[i].mux_reg = be32_to_cpu(*list++);
+		grp->pins[i].mux_mode = be32_to_cpu(*list++);
+	}
+
+	return 0;
+}
+
+static int kinetis_pinctrl_parse_functions(struct device_node *np,
+				       struct kinetis_pinctrl_soc_info *info,
+				       u32 index)
+{
+	struct device_node *child;
+	struct kinetis_pmx_func *func;
+	struct kinetis_pin_group *grp;
+	static u32 grp_index;
+	u32 i = 0;
+
+	dev_dbg(info->dev, "parse function(%d): %s\n", index, np->name);
+
+	func = &info->functions[index];
+
+	/* Initialise function */
+	func->name = np->name;
+	func->num_groups = of_get_child_count(np);
+	if (func->num_groups == 0) {
+		dev_err(info->dev, "no groups defined in %s\n", np->full_name);
+		return -EINVAL;
+	}
+	func->groups = devm_kzalloc(info->dev,
+			func->num_groups * sizeof(char *), GFP_KERNEL);
+
+	for_each_child_of_node(np, child) {
+		func->groups[i] = child->name;
+		grp = &info->groups[grp_index++];
+		kinetis_pinctrl_parse_groups(child, grp, info, i++);
+	}
+
+	return 0;
+}
+
+/*
+ * Check if the DT contains pins in the direct child nodes. This indicates the
+ * newer DT format to store pins. This function returns true if the first found
+ * fsl,pins property is in a child of np. Otherwise false is returned.
+ */
+static bool kinetis_pinctrl_dt_is_flat_functions(struct device_node *np)
+{
+	struct device_node *function_np;
+	struct device_node *pinctrl_np;
+
+	for_each_child_of_node(np, function_np) {
+		if (of_property_read_bool(function_np, "fsl,pins"))
+			return true;
+
+		for_each_child_of_node(function_np, pinctrl_np) {
+			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
+				return false;
+		}
+	}
+
+	return true;
+}
+
+static int kinetis_pinctrl_probe_dt(struct platform_device *pdev,
+				struct kinetis_pinctrl_soc_info *info)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *child;
+	u32 nfuncs = 0;
+	u32 i = 0;
+	bool flat_funcs;
+
+	if (!np)
+		return -ENODEV;
+
+	flat_funcs = kinetis_pinctrl_dt_is_flat_functions(np);
+	if (flat_funcs) {
+		nfuncs = 1;
+	} else {
+		nfuncs = of_get_child_count(np);
+		if (nfuncs <= 0) {
+			dev_err(&pdev->dev, "no functions defined\n");
+			return -EINVAL;
+		}
+	}
+
+	info->nfunctions = nfuncs;
+	info->functions = devm_kzalloc(&pdev->dev,
+				nfuncs * sizeof(struct kinetis_pmx_func),
+				GFP_KERNEL);
+	if (!info->functions)
+		return -ENOMEM;
+
+	if (flat_funcs) {
+		info->ngroups = of_get_child_count(np);
+	} else {
+		info->ngroups = 0;
+		for_each_child_of_node(np, child)
+			info->ngroups += of_get_child_count(child);
+	}
+	if (!(info->ngroups)) {
+		dev_err(&pdev->dev, "no groups found\n");
+		return -EINVAL;
+	}
+	info->groups = devm_kzalloc(&pdev->dev,
+			info->ngroups * sizeof(struct kinetis_pin_group),
+			GFP_KERNEL);
+	if (!info->groups)
+		return -ENOMEM;
+
+	if (flat_funcs) {
+		kinetis_pinctrl_parse_functions(np, info, 0);
+	} else {
+		for_each_child_of_node(np, child)
+			kinetis_pinctrl_parse_functions(child, info, i++);
+	}
+
+	return 0;
+}
+
+static int kinetis_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct kinetis_pinctrl *kpctl;
+	struct resource *res;
+	int ret;
+
+	kpctl = devm_kzalloc(&pdev->dev, sizeof(struct kinetis_pinctrl),
+					GFP_KERNEL);
+	if (!kpctl)
+		return -ENOMEM;
+
+	ret = of_alias_get_id(np, "pmx");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
+		return ret;
+	}
+	kpctl->port_id = ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	kpctl->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(kpctl->base))
+		return PTR_ERR(kpctl->base);
+
+	kpctl->clk = of_clk_get(np, 0);
+	if (IS_ERR(kpctl->clk)) {
+		dev_err(&pdev->dev, "failed to get clock for PORT_%c\n",
+					'A' + kpctl->port_id);
+		return PTR_ERR(kpctl->clk);
+	}
+
+	ret = clk_prepare_enable(kpctl->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable clock for PORT_%c\n",
+					'A' + kpctl->port_id);
+		goto err_clk_enable;
+	}
+
+	kpctl->info.dev = &pdev->dev;
+	ret = kinetis_pinctrl_probe_dt(pdev, &kpctl->info);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to probe dt properties\n");
+		return ret;
+	}
+
+	kpctl->dev = &pdev->dev;
+	kinetis_pinctrl_desc.name = dev_name(&pdev->dev);
+
+	platform_set_drvdata(pdev, kpctl);
+	kpctl->pctl = pinctrl_register(&kinetis_pinctrl_desc,
+					&pdev->dev, kpctl);
+	if (IS_ERR(kpctl->pctl)) {
+		dev_err(&pdev->dev, "could not register Kinetis I/O PORT_%c\n",
+					'A' + kpctl->port_id);
+		ret = PTR_ERR(kpctl->pctl);
+		goto err_pinctrl_register;
+	}
+
+	dev_info(&pdev->dev, "initialized Kinetis I/O PORT_%c\n",
+					'A' + kpctl->port_id);
+
+	return 0;
+
+err_pinctrl_register:
+
+err_clk_enable:
+
+	clk_put(kpctl->clk);
+
+	return ret;
+}
+
+static int kinetis_pinctrl_remove(struct platform_device *pdev)
+{
+	struct kinetis_pinctrl *kpctl = platform_get_drvdata(pdev);
+
+	pinctrl_unregister(kpctl->pctl);
+	clk_disable_unprepare(kpctl->clk);
+	clk_put(kpctl->clk);
+	return 0;
+}
+
+static struct platform_driver kinetis_pinctrl_driver = {
+	.driver = {
+		.name = "kinetis-pinctrl",
+		.of_match_table = kinetis_pinctrl_of_match,
+	},
+	.probe = kinetis_pinctrl_probe,
+	.remove = kinetis_pinctrl_remove,
+};
+
+static int __init kinetis_pinctrl_init(void)
+{
+	return platform_driver_register(&kinetis_pinctrl_driver);
+}
+arch_initcall(kinetis_pinctrl_init);
+
+static void __exit kinetis_pinctrl_exit(void)
+{
+	platform_driver_unregister(&kinetis_pinctrl_driver);
+}
+module_exit(kinetis_pinctrl_exit);
+
+MODULE_DESCRIPTION("Freescale Kinetis pinctrl driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/dt-bindings/clock/kinetis-mcg.h b/include/dt-bindings/clock/kinetis-mcg.h
index 681732f..5eaeeec 100644
--- a/include/dt-bindings/clock/kinetis-mcg.h
+++ b/include/dt-bindings/clock/kinetis-mcg.h
@@ -5,6 +5,12 @@
 #define CLOCK_CCLK		 1
 #define CLOCK_PCLK		 2
 #define CLOCK_PIT		 3
-#define CLOCK_END		 4
+#define CLOCK_PORTA		 4
+#define CLOCK_PORTB		 5
+#define CLOCK_PORTC		 6
+#define CLOCK_PORTD		 7
+#define CLOCK_PORTE		 8
+#define CLOCK_PORTF		 9
+#define CLOCK_END		10
 
 #endif /* _DT_BINDINGS_CLOCK_KINETIS_MCG_H */
-- 
2.3.6
