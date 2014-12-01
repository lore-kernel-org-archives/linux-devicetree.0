From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [PATCH v3 3/3] arm: dts: zynq: Add Digilent ZYBO board
Date: Mon,  1 Dec 2014 10:25:50 +1000
Message-ID: <1417393550-6674-3-git-send-email-crosthwaite.peter@gmail.com>
References: <1417393550-6674-1-git-send-email-crosthwaite.peter@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417393550-6674-1-git-send-email-crosthwaite.peter@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: michals@xilinx.com, sorenb@xilinx.com, steven.wang@digilentinc.com
List-Id: devicetree@vger.kernel.org

Add a DTS describing the Digilent ZYBO board. Similar to ZED but with
a 50MHz crystal instead of 33MHz.

Acked-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

---
Changed since v1:
Change compat vendor prefix from xlnx to digilent (Soren review)
Alphabetise nodes
---
 arch/arm/boot/dts/Makefile      |  3 ++-
 arch/arm/boot/dts/zynq-zybo.dts | 52 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/zynq-zybo.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7cd36a7..be2e8ce 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -513,7 +513,8 @@ dtb-$(CONFIG_ARCH_ZYNQ) += \
 	zynq-parallella.dtb \
 	zynq-zc702.dtb \
 	zynq-zc706.dtb \
-	zynq-zed.dtb
+	zynq-zed.dtb \
+	zynq-zybo.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += \
 	armada-370-db.dtb \
 	armada-370-mirabox.dtb \
diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq-zybo.dts
new file mode 100644
index 0000000..a9a12ce
--- /dev/null
+++ b/arch/arm/boot/dts/zynq-zybo.dts
@@ -0,0 +1,52 @@
+/*
+ *  Copyright (C) 2011 - 2014 Xilinx
+ *  Copyright (C) 2012 National Instruments Corp.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+/dts-v1/;
+/include/ "zynq-7000.dtsi"
+
+/ {
+	model = "Zynq ZYBO Development Board";
+	compatible = "digilent,zynq-zybo", "xlnx,zynq-7000";
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyPS0,115200 earlyprintk";
+	};
+
+};
+
+&clkc {
+	ps-clk-frequency = <50000000>;
+};
+
+&gem0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	ethernet_phy: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&sdhci0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
-- 
1.9.1
