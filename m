From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 03/18] arm64: dts: ulcb-kf: initial device tree
Date: Fri,  6 Oct 2017 20:55:56 +0300
Message-ID: <1507312556-23900-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add the initial common dtsi file for Kingfisher infotainment board (R-Car
Starter Kit extension)

This commit supports the following peripherals:
- HSCIF0

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes in version 2:
- none

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
new file mode 100644
index 0000000..849f8b1
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -0,0 +1,31 @@
+/*
+ * Device Tree Source for the Kingfisher (ULCB extension) board
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ * Copyright (C) 2017 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/ {
+	aliases {
+		serial1 = &hscif0;
+	};
+};
+
+&hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	status = "okay";
+};
+
+&pfc {
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+};
-- 
1.9.1
