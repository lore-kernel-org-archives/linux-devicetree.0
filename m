From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 02/11] dt-bindings: power: amlogic, meson-gx-pwrc: Add SM1 bindings
Date: Mon,  1 Jul 2019 12:46:56 +0200
Message-ID: <20190701104705.18271-3-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, khilman@baylibre.com, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add bindings for the Amlogic SM1 Power control:
- the VPU power control compatible
- the general-purpose power controller, controlling the USB, PCIe, NNA and
  GE2D power domains.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/power/amlogic,meson-gx-pwrc.txt  | 35 +++++++++++++++++++
 include/dt-bindings/power/meson-sm1-power.h   | 15 ++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 include/dt-bindings/power/meson-sm1-power.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
index 0fdc3dd1125e..f0a1e20555bf 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
@@ -19,6 +19,7 @@ Required properties:
 - compatible: should be one of the following :
 	- "amlogic,meson-gx-pwrc-vpu" for the Meson GX SoCs
 	- "amlogic,meson-g12a-pwrc-vpu" for the Meson G12A SoCs
+	- "amlogic,meson-sm1-pwrc-vpu" for the Meson SM1 SoCs
 - #power-domain-cells: should be 0
 - amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
 - resets: phandles to the reset lines needed for this power demain sequence
@@ -60,4 +61,38 @@ ao_sysctrl: sys-ctrl@0 {
 	};
 };
 
+General Purpose Power Controller
+--------------------------------
 
+The Amlogic SM1 SoCs embeds a General Purpose Power Controller used
+to control the power domain for, at least, the USB PHYs and PCIe
+peripherals.
+
+
+Device Tree Bindings:
+---------------------
+
+Required properties:
+- compatible: should be one of the following :
+	- "amlogic,meson-sm1-pwrc" for the Meson SM1 SoCs
+- #power-domain-cells: should be 0
+- amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
+
+Parent node should have the following properties :
+- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
+- reg: base address and size of the AO system control register space.
+
+
+Example:
+-------
+
+ao_sysctrl: sys-ctrl@0 {
+	compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
+	reg =  <0x0 0x0 0x0 0x100>;
+
+	pwrc: power-controller {
+		compatible = "amlogic,meson-sm1-pwrc";
+		#power-domain-cells = <1>;
+		amlogic,hhi-sysctrl = <&hhi>;
+	};
+};
diff --git a/include/dt-bindings/power/meson-sm1-power.h b/include/dt-bindings/power/meson-sm1-power.h
new file mode 100644
index 000000000000..30e17e4a478e
--- /dev/null
+++ b/include/dt-bindings/power/meson-sm1-power.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_MESON_SM1_POWER_H
+#define _DT_BINDINGS_MESON_SM1_POWER_H
+
+#define PWRC_SM1_NNA_ID		0
+#define PWRC_SM1_USB_ID		1
+#define PWRC_SM1_PCIE_ID	2
+#define PWRC_SM1_GE2D_ID	3
+
+#endif
-- 
2.21.0
