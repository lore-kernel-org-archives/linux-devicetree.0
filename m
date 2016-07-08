From: <shh.xie@gmail.com>
Subject: [PATCH 3/5] arm64: dts: add LS1046A-RDB board support
Date: Fri, 8 Jul 2016 18:15:42 +0800
Message-ID: <1467972944-12293-4-git-send-email-shh.xie@gmail.com>
References: <1467972944-12293-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467972944-12293-1-git-send-email-shh.xie@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Shaohui Xie <Shaohui.Xie@nxp.com>, Mingkai Hu <Mingkai.Hu@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Mingkai Hu <Mingkai.Hu@nxp.com>

The LS1046A reference design board (RDB) is a high-performance computing,
evaluation, and development platform that supports the LS1046A SoC.

Signed-off-by: Mingkai Hu <Mingkai.Hu@nxp.com>
Signed-off-by: Shaohui Xie <Shaohui.Xie@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile            |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 138 ++++++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 1b7783d..9c81b9e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-rdb.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1046a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
new file mode 100644
index 0000000..cafe8e4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -0,0 +1,138 @@
+/*
+ * Device Tree Include file for Freescale Layerscape-1046A family SoC.
+ *
+ * Copyright 2016, Freescale Semiconductor, Inc.
+ *
+ * Mingkai Hu <mingkai.hu@nxp.com>
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
+/include/ "fsl-ls1046a.dtsi"
+
+/ {
+	model = "LS1046A RDB Board";
+	compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
+};
+
+&duart0 {
+	status = "okay";
+};
+
+&duart1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	ina220@40 {
+		compatible = "ti,ina220";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	temp-sensor@4c {
+		compatible = "adi,adt7461";
+		reg = <0x4c>;
+	};
+
+	eeprom@56 {
+		compatible = "atmel,24c512";
+		reg = <0x52>;
+	};
+
+	eeprom@57 {
+		compatible = "atmel,24c512";
+		reg = <0x53>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	rtc@51 {
+		compatible = "nxp,pcf2129";
+		reg = <0x51>;
+	};
+};
+
+&ifc {
+	status = "okay";
+	#address-cells = <2>;
+	#size-cells = <1>;
+	/* NAND Flashe and CPLD on board */
+	ranges = <0x0 0x0 0x0 0x7e800000 0x00010000
+		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
+
+	nand@0,0 {
+		compatible = "fsl,ifc-nand";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x0 0x0 0x10000>;
+	};
+
+	cpld: board-control@2,0 {
+		compatible = "fsl,ls1046ardb-cpld";
+		reg = <0x2 0x0 0x0000100>;
+	};
+};
+
+&qspi {
+	num-cs = <2>;
+	bus-num = <0>;
+	status = "okay";
+
+	qflash0: s25fs512s@0 {
+		compatible = "spansion,m25p80";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+	};
+
+	qflash1: s25fs512s@1 {
+		compatible = "spansion,m25p80";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <1>;
+	};
+};
-- 
2.1.0.27.g96db324
