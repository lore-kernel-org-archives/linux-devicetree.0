From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: imx6ul: Add DTS for liteSOM module
Date: Fri,  9 Sep 2016 12:39:05 +0200
Message-ID: <20160909103906.15209-1-m.niestroj@grinn-global.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a SOM (System on Module), so it will be part of another boards.
Hence, this is a "dtsi" file that will be included from another device
tree files.

Hardware specification:
 * Freescale i.MX6UL SoC
 * up to 512 MB RAM
 * eMMC on uSDHC2

Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul-litesom.dtsi | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-litesom.dtsi

diff --git a/arch/arm/boot/dts/imx6ul-litesom.dtsi b/arch/arm/boot/dts/imx6ul-litesom.dtsi
new file mode 100644
index 0000000..7a7f47d
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ul-litesom.dtsi
@@ -0,0 +1,52 @@
+/*
+ * Copyright (C) 2016 Grinn
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include "imx6ul.dtsi"
+
+/ {
+	model = "Grinn i.MX6UL liteSOM";
+	compatible = "grinn,imx6ul-litesom", "fsl,imx6ul";
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&cpu0 {
+	arm-supply = <&reg_arm>;
+	soc-supply = <&reg_soc>;
+};
+
+&iomuxc {
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK	    0x10069
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD	    0x17059
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0 0x17059
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1 0x17059
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2 0x17059
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3 0x17059
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4 0x17059
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5 0x17059
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6 0x17059
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7 0x17059
+			MX6UL_PAD_NAND_ALE__USDHC2_RESET_B  0x17059
+		>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	no-1-8-v;
+	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
+	bus-width = <8>;
+	status = "okay";
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
