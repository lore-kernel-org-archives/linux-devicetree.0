From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8][ 1/5] ARM i.MX35: Add devicetree support.
Date: Tue, 12 Nov 2013 12:24:15 +0100
Message-ID: <1384255459-15134-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v7->v8:
- Splitted out the dts part.
- The commit message was updated accordingly.
- clk_max was removed from the documentation.
- status =3D "disabled"; was removed from the dts examples in the docum=
entation.
- The imx35 pinctrl driver selection in Kconfig was splitted out.
- Some unused variables were removed from mx35_clocks_init_dt in clk-im=
x35.c

ChangeLog v6->v7:
- Added Grant Likely in the Cc list.
- Added imx35-pingrp.h, and converted the rest of the patch to use it.
- lcdc pads were moved from the dtsi into another commit.
- A whitespace issue in the dtsi was removed.

ChangeLog v5->v6:
- The dependency on pdata clocks has been removed,
  and the dtsi adapted accordinly.
- Adaptation to the for-next branch of Shawn Guo at
  git://git.linaro.org/people/shawnguo/linux-2.6.git for-next
- imx35-dt.c: very small whitespace cleanup.
- Kconfig: The selection of IMX_HAVE_PLATFORM_* has been removed.
- dtsi: The nodes were reordered alphabetically.
- dtsi: The aliases have been reordered alphabetically.
- Shawn Guo was added in the Cc.
---
 .../devicetree/bindings/clock/imx35-clock.txt      |  113 ++++++++++++=
++++++++
 arch/arm/mach-imx/Kconfig                          |    7 ++
 arch/arm/mach-imx/Makefile                         |    1 +
 arch/arm/mach-imx/clk-imx35.c                      |   16 +++
 arch/arm/mach-imx/common.h                         |    1 +
 arch/arm/mach-imx/imx35-dt.c                       |   48 +++++++++
 6 files changed, 186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imx35-clock=
=2Etxt
 create mode 100644 arch/arm/mach-imx/imx35-dt.c

diff --git a/Documentation/devicetree/bindings/clock/imx35-clock.txt b/=
Documentation/devicetree/bindings/clock/imx35-clock.txt
new file mode 100644
index 0000000..a703564
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imx35-clock.txt
@@ -0,0 +1,113 @@
+* Clock bindings for Freescale i.MX35
+
+Required properties:
+- compatible: Should be "fsl,imx35-ccm"
+- reg: Address and length of the register set
+- interrupts: Should contain CCM interrupt
+- #clock-cells: Should be <1>
+
+The clock consumer should specify the desired clock by having the cloc=
k
+ID in its "clocks" phandle cell.  The following is a full list of i.MX=
35
+clocks and IDs.
+
+	Clock			ID
+	---------------------------
+	ckih			0
+	mpll			1
+	ppll			2
+	mpll_075		3
+	arm			4
+	hsp			5
+	hsp_div			6
+	hsp_sel			7
+	ahb			8
+	ipg			9
+	arm_per_div		10
+	ahb_per_div		11
+	ipg_per			12
+	uart_sel		13
+	uart_div		14
+	esdhc_sel		15
+	esdhc1_div		16
+	esdhc2_div		17
+	esdhc3_div		18
+	spdif_sel		19
+	spdif_div_pre		20
+	spdif_div_post		21
+	ssi_sel			22
+	ssi1_div_pre		23
+	ssi1_div_post		24
+	ssi2_div_pre		25
+	ssi2_div_post		26
+	usb_sel			27
+	usb_div			28
+	nfc_div			29
+	asrc_gate		30
+	pata_gate		31
+	audmux_gate		32
+	can1_gate		33
+	can2_gate		34
+	cspi1_gate		35
+	cspi2_gate		36
+	ect_gate		37
+	edio_gate		38
+	emi_gate		39
+	epit1_gate		40
+	epit2_gate		41
+	esai_gate		42
+	esdhc1_gate		43
+	esdhc2_gate		44
+	esdhc3_gate		45
+	fec_gate		46
+	gpio1_gate		47
+	gpio2_gate		48
+	gpio3_gate		49
+	gpt_gate		50
+	i2c1_gate		51
+	i2c2_gate		52
+	i2c3_gate		53
+	iomuxc_gate		54
+	ipu_gate		55
+	kpp_gate		56
+	mlb_gate		57
+	mshc_gate		58
+	owire_gate		59
+	pwm_gate		60
+	rngc_gate		61
+	rtc_gate		62
+	rtic_gate		63
+	scc_gate		64
+	sdma_gate		65
+	spba_gate		66
+	spdif_gate		67
+	ssi1_gate		68
+	ssi2_gate		69
+	uart1_gate		70
+	uart2_gate		71
+	uart3_gate		72
+	usbotg_gate		73
+	wdog_gate		74
+	max_gate		75
+	admux_gate		76
+	csi_gate		77
+	csi_div			78
+	csi_sel			79
+	iim_gate		80
+	gpu2d_gate		81
+
+Examples:
+
+clks: ccm@53f80000 {
+	compatible =3D "fsl,imx35-ccm";
+	reg =3D <0x53f80000 0x4000>;
+	interrupts =3D <31>;
+	#clock-cells =3D <1>;
+};
+
+esdhc1: esdhc@53fb4000 {
+	compatible =3D "fsl,imx35-esdhc";
+	reg =3D <0x53fb4000 0x4000>;
+	interrupts =3D <7>;
+	clocks =3D <&clks 9>, <&clks 8>, <&clks 43>;
+	clock-names =3D "ipg", "ahb", "per";
+};
diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 8f6ce05..36014e2 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -611,6 +611,13 @@ config MACH_IMX31_DT
=20
 comment "MX35 platforms:"
=20
+config MACH_IMX35_DT
+	bool "Support i.MX35 platforms from device tree"
+	select SOC_IMX35
+	help
+	  Include support for Freescale i.MX35 based platforms
+	  using the device tree for discovery.
+
 config MACH_PCM043
 	bool "Support Phytec pcm043 (i.MX35) platforms"
 	select IMX_HAVE_PLATFORM_FLEXCAN
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index 0db1697..befcaf5 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_MACH_MX35_3DS) +=3D mach-mx35_3ds.o
 obj-$(CONFIG_MACH_EUKREA_CPUIMX35SD) +=3D mach-cpuimx35.o
 obj-$(CONFIG_MACH_EUKREA_MBIMXSD35_BASEBOARD) +=3D eukrea_mbimxsd35-ba=
seboard.o
 obj-$(CONFIG_MACH_VPR200) +=3D mach-vpr200.o
+obj-$(CONFIG_MACH_IMX35_DT) +=3D imx35-dt.o
=20
 obj-$(CONFIG_HAVE_IMX_ANATOP) +=3D anatop.o
 obj-$(CONFIG_HAVE_IMX_GPC) +=3D gpc.o
diff --git a/arch/arm/mach-imx/clk-imx35.c b/arch/arm/mach-imx/clk-imx3=
5.c
index 2193c83..9ef3c55 100644
--- a/arch/arm/mach-imx/clk-imx35.c
+++ b/arch/arm/mach-imx/clk-imx35.c
@@ -45,6 +45,8 @@ static struct arm_ahb_div clk_consumer[] =3D {
 static char hsp_div_532[] =3D { 4, 8, 3, 0 };
 static char hsp_div_400[] =3D { 3, 6, 3, 0 };
=20
+static struct clk_onecell_data clk_data;
+
 static const char *std_sel[] =3D {"ppll", "arm"};
 static const char *ipg_per_sel[] =3D {"ahb_per_div", "arm_per_div"};
=20
@@ -286,3 +288,17 @@ int __init mx35_clocks_init(void)
=20
 	return 0;
 }
+
+int __init mx35_clocks_init_dt(void)
+{
+	struct device_node *np;
+
+	np =3D of_find_compatible_node(NULL, NULL, "fsl,imx35-ccm");
+	clk_data.clks =3D clk;
+	clk_data.clk_num =3D ARRAY_SIZE(clk);
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+
+	mx35_clocks_init();
+
+	return 0;
+}
diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
index 59c3b9b..6919b7d 100644
--- a/arch/arm/mach-imx/common.h
+++ b/arch/arm/mach-imx/common.h
@@ -65,6 +65,7 @@ int mx35_clocks_init(void);
 int mx51_clocks_init(unsigned long ckil, unsigned long osc,
 			unsigned long ckih1, unsigned long ckih2);
 int mx25_clocks_init_dt(void);
+int mx35_clocks_init_dt(void);
 int mx27_clocks_init_dt(void);
 int mx31_clocks_init_dt(void);
 struct platform_device *mxc_register_gpio(char *name, int id,
diff --git a/arch/arm/mach-imx/imx35-dt.c b/arch/arm/mach-imx/imx35-dt.=
c
new file mode 100644
index 0000000..e3def45
--- /dev/null
+++ b/arch/arm/mach-imx/imx35-dt.c
@@ -0,0 +1,48 @@
+/*
+ * Copyright 2012 Steffen Trumtrar, Pengutronix
+ *
+ * based on imx27-dt.c
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it under
+ * the terms of the GNU General Public License version 2 as published =
by the
+ * Free Software Foundation.
+ */
+
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/time.h>
+#include <asm/hardware/cache-l2x0.h>
+#include "common.h"
+#include "mx35.h"
+
+static void __init imx35_dt_init(void)
+{
+	mxc_arch_reset_init_dt();
+
+	of_platform_populate(NULL, of_default_bus_match_table,
+			     NULL, NULL);
+}
+
+static void __init imx35_timer_init(void)
+{
+	mx35_clocks_init_dt();
+}
+
+static const char *imx35_dt_board_compat[] __initdata =3D {
+	"fsl,imx35",
+	NULL
+};
+
+DT_MACHINE_START(IMX35_DT, "Freescale i.MX35 (Device Tree Support)")
+	.map_io		=3D mx35_map_io,
+	.init_early	=3D imx35_init_early,
+	.init_irq	=3D mx35_init_irq,
+	.handle_irq	=3D imx35_handle_irq,
+	.init_time	=3D imx35_timer_init,
+	.init_machine	=3D imx35_dt_init,
+	.dt_compat	=3D imx35_dt_board_compat,
+	.restart	=3D mxc_restart,
+MACHINE_END
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
