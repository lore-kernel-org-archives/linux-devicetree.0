From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 2/9] arm64: dts: m3ulcb: initial device tree
Date: Thu,  3 Nov 2016 21:07:09 +0300
Message-ID: <1478196429-1219-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add the initial device tree for the R8A7796 SoC based M3ULCB low cost
board (R-Car Starter Kit Pro)

This commit supports the following peripherals:
- SCIF (console)

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/Makefile           |  2 +-
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 51 ++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index eb72830..1618e0a 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,5 +1,5 @@
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb
+dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 
 always		:= $(dtb-y)
 clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
new file mode 100644
index 0000000..ecb9e11
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -0,0 +1,51 @@
+/*
+ * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board
+ *
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a7796.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Renesas M3ULCB board based on r8a7796";
+	compatible = "renesas,m3ulcb", "renesas,r8a7796";
+
+	aliases {
+		serial0 = &scif2;
+	};
+
+	chosen {
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
+&pfc {
+	scif2_pins: scif2 {
+		groups = "scif2_data_a";
+		function = "scif2";
+	};
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
1.9.1
