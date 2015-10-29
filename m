From: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V7 3/3] ARM64: dts: add LS1043a-RDB board support
Date: Thu, 29 Oct 2015 16:12:06 -0500
Message-ID: <1446153126-6219-4-git-send-email-leoli@freescale.com>
References: <1446153126-6219-1-git-send-email-leoli@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446153126-6219-1-git-send-email-leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Wenbin Song <Wenbin.Song-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Signed-off-by: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Wenbin Song <Wenbin.Song-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
V7:
 - Rebased on latest LS2080 patches.

V6:
 - No change.

V5:
 - Move gic, timer and pmu nodes out of SoC node.

V4:
 - Add soc node with simple-bus compatible.
 - Add property interrupt-affinity for armv8 pmuv3 node.

V3:
 - Add device tree node for SATA.
 - Remove properity enable-method for all cpu node.
   Remove reserved memory region for spin-table.

V2:
 - Add secondary core boot method.
 - Move out the sysclk node from the clockgen node.
 - Correct the reg size of GICC.

 arch/arm64/boot/dts/freescale/Makefile            |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 116 ++++++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c4957a4..f3c2516 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -1,6 +1,7 @@
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-rdb.dtb
  
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
new file mode 100644
index 0000000..7a351e2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -0,0 +1,116 @@
+/*
+ * Device Tree Include file for Freescale Layerscape-1043A family SoC.
+ *
+ * Copyright 2014-2015, Freescale Semiconductor
+ *
+ * Mingkai Hu <Mingkai.hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPLv2 or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "fsl-ls1043a.dtsi"
+
+/ {
+	model = "LS1043A RDB Board";
+};
+
+&i2c0 {
+	status = "okay";
+	ina220@40 {
+		compatible = "ti,ina220";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+	adt7461a@4c {
+		compatible = "adi,adt7461";
+		reg = <0x4c>;
+	};
+	eeprom@56 {
+		compatible = "at24,24c512";
+		reg = <0x52>;
+	};
+	eeprom@57 {
+		compatible = "at24,24c512";
+		reg = <0x53>;
+	};
+	rtc@68 {
+		compatible = "pericom,pt7c4338";
+		reg = <0x68>;
+	};
+};
+
+&ifc {
+	status = "okay";
+	#address-cells = <2>;
+	#size-cells = <1>;
+	/* NOR, NAND Flashes and FPGA on board */
+	ranges = <0x0 0x0 0x0 0x60000000 0x08000000
+		  0x1 0x0 0x0 0x7e800000 0x00010000
+		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
+
+		nor@0,0 {
+			compatible = "cfi-flash";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0x0 0x8000000>;
+			bank-width = <2>;
+			device-width = <1>;
+		};
+
+		nand@1,0 {
+			compatible = "fsl,ifc-nand";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x1 0x0 0x10000>;
+		};
+
+		cpld: board-control@2,0 {
+			compatible = "fsl,ls1043ardb-cpld";
+			reg = <0x2 0x0 0x0000100>;
+		};
+};
+
+&duart0 {
+	status = "okay";
+};
+
+&duart1 {
+	status = "okay";
+};
-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
