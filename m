From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: Add SEI Robotics SEI510 Board
Date: Tue, 12 Feb 2019 15:02:59 +0100
Message-ID: <20190212140259.9537-3-narmstrong@baylibre.com>
References: <20190212140259.9537-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212140259.9537-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The SEI Robotics SEI510 Board is based on the Amlogic G12A S905X2
and has the following features :
- Amlogic G12A S905X2 SoC
- 10/100 Ethernet
- USB2 + USB3 ports
- Micro SDCard Port
- Audio + CVBS AV Jack port
- HDMI 2.1 + CEC Port
- ADC Touch Button
- Far-Field Microphone Array + Mono HP
- IR Sensor
- IR Emmiter LED Array
- RGB Led

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/arm/amlogic.txt       |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 38 +++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 7f40cb5f490b..061f7b98a07f 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -110,6 +110,7 @@ Board compatible values (alphabetically, grouped by SoC):
 
   - "amlogic,u200" (Meson g12a s905d2)
   - "amediatech,x96-max" (Meson g12a s905x2)
+  - "seirobotics,sei510" (Meson g12a s905x2)
 
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 0821fed4c074..2709f7ede908 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
new file mode 100644
index 000000000000..6a7c3241862a
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre SAS. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "meson-g12a.dtsi"
+
+/ {
+	compatible = "seirobotics,sei510", "amlogic,g12a";
+	model = "SEI Robotics SEI510";
+
+	aliases {
+		serial0 = &uart_AO;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		/* TEE Reserved Memory */
+		bl32_reserved: bl32@5000000 {
+			reg = <0x0 0x05300000 0x0 0x2000000>;
+			no-map;
+		};
+	};
+};
+
+&uart_AO {
+	status = "okay";
+};
-- 
2.20.1
