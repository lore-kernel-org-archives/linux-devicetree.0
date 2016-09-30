From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: [RESEND PATCH v3 1/2] ARM: dts: imx6ul: Add DTS for liteSOM module
Date: Fri, 30 Sep 2016 11:36:25 +0200
Message-ID: <20160930093626.3843-1-m.niestroj@grinn-global.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
Changes v2 -> v3:
 * Remove cpu0 supplies (arm-supply, soc-supply), as they were already
   set in imx6ul.dtsi file (reported by Sébastien Szymanski)

Changes v1 -> v2:
 * Use dual license

 arch/arm/boot/dts/imx6ul-litesom.dtsi | 82 +++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-litesom.dtsi

diff --git a/arch/arm/boot/dts/imx6ul-litesom.dtsi b/arch/arm/boot/dts/imx6ul-litesom.dtsi
new file mode 100644
index 0000000..461292d
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ul-litesom.dtsi
@@ -0,0 +1,82 @@
+/*
+ * Copyright 2016 Grinn
+ *
+ * Author: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
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
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
