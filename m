From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W
Date: Mon, 30 Oct 2017 18:29:59 +0100
Message-ID: <1509384599-28953-4-git-send-email-geert+renesas@glider.be>
References: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add initial support for the Renesas Salvator-XS (Salvator-X 2nd version)
development board equipped with an R-Car M3-W SiP.

Based on work for the Salvator-X and -XS boards with M3-W resp. H3 SiPs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 .../arm64/boot/dts/renesas/r8a7796-salvator-xs.dts | 58 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b0d5af06e239206f..a78dafa81ea4bc41 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-h3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-m3ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
new file mode 100644
index 0000000000000000..2c37055efa94d3c3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
@@ -0,0 +1,58 @@
+/*
+ * Device Tree Source for the Salvator-X 2nd version board with R-Car M3-W
+ *
+ * Copyright (C) 2015-2017 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a7796.dtsi"
+#include "salvator-xs.dtsi"
+
+/ {
+	model = "Renesas Salvator-X 2nd version board based on r8a7796";
+	compatible = "renesas,salvator-xs", "renesas,r8a7796";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x80000000>;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 727>,
+		 <&versaclock6 1>,
+		 <&x21_clk>,
+		 <&versaclock6 2>;
+	clock-names = "du.0", "du.1", "du.2", "lvds.0",
+		      "dclkin.0", "dclkin.1", "dclkin.2";
+};
+
+&hdmi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi0_con>;
+			};
+		};
+	};
+};
+
+&hdmi0_con {
+	remote-endpoint = <&rcar_dw_hdmi0_out>;
+};
-- 
2.7.4
