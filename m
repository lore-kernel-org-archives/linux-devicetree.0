From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] arm64: dts: renesas: Add support for Salvator-XS with R-Car H3 ES2.0
Date: Fri,  9 Jun 2017 13:43:49 +0200
Message-ID: <1497008629-3974-5-git-send-email-geert+renesas@glider.be>
References: <1497008629-3974-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497008629-3974-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add initial support for the Renesas Salvator-XS (Salvator-X 2nd version)
development board equipped with an R-Car H3 ES2.0 SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 109 +++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d5451015950e3dfc..acc4bb30d485b6bc 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,4 +1,5 @@
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
new file mode 100644
index 0000000000000000..de354957144b4822
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -0,0 +1,109 @@
+/*
+ * Device Tree Source for the Salvator-X 2nd version board
+ *
+ * Copyright (C) 2015-2017 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
+
+/dts-v1/;
+#include "r8a7795.dtsi"
+#include "salvator-xs.dtsi"
+
+/ {
+	model = "Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+";
+	compatible = "renesas,salvator-xs", "renesas,r8a7795";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <0x7 0x00000000 0x0 0x40000000>;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 721>,
+		 <&cpg CPG_MOD 727>,
+		 <&x21_clk>,
+		 <&x22_clk>;
+	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+		      "dclkin.1", "dclkin.2";
+};
+
+&ehci2 {
+	status = "okay";
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
+
+&hdmi1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi1_out: endpoint {
+				remote-endpoint = <&hdmi1_con>;
+			};
+		};
+	};
+};
+
+&hdmi1_con {
+	remote-endpoint = <&rcar_dw_hdmi1_out>;
+};
+
+&ohci2 {
+	status = "okay";
+};
+
+&pfc {
+	usb2_pins: usb2 {
+		groups = "usb2";
+		function = "usb2";
+	};
+};
+
+&usb2_phy2 {
+	pinctrl-0 = <&usb2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4
