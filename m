From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 10/11] arm64: dts: renesas: initial Eagle board device tree
Date: Tue, 12 Sep 2017 23:37:26 +0300
Message-ID: <20170912210543.810219167@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=arm64-dts-renesas-initial-Eagle-board-device-tree.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add the initial device  tree for  the R8A77970 SoC based Eagle board.
The board has 1 debug serial port (SCIF0); include support for it,
so that the serial console can work.

Based on the original (and large) patch by Vladimir Barinov
<vladimir.barinov@cogentembedded.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/Makefile           |    1 
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   45 +++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/Makefile
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/Makefile
+++ renesas/arch/arm64/boot/dts/renesas/Makefile
@@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-sa
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 always		:= $(dtb-y)
Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
===================================================================
--- /dev/null
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -0,0 +1,45 @@
+/*
+ * Device Tree Source for the Eagle board
+ *
+ * Copyright (C) 2016-2017 Renesas Electronics Corp.
+ * Copyright (C) 2017 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a77970.dtsi"
+
+/ {
+	model = "Renesas Eagle board based on r8a77970";
+	compatible = "renesas,eagle", "renesas,r8a77970";
+
+	aliases {
+		serial0 = &scif0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&scif0 {
+	status = "okay";
+};
