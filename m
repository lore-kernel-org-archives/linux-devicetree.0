From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 6/6] ARM64: dts: meson-gx: add gpio interrupt controller
Date: Thu, 15 Jun 2017 18:18:04 +0200
Message-ID: <20170615161804.32658-7-jbrunet@baylibre.com>
References: <20170615161804.32658-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615161804.32658-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add gpio interrupt controller to Amlogic GX family SoCs

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 603491df9f0f..95d4f4c60b4f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -218,6 +218,15 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc1100000 0x0 0x100000>;
 
+			gpio_intc: interrupt-controller@9880 {
+				compatible = "amlogic,meson-gpio-intc";
+				reg = <0x0 0x9880 0x0 0x10>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,upstream-interrupts = <64 65 66 67 68 69 70 71>;
+				status = "disabled";
+			};
+
 			reset: reset-controller@4404 {
 				compatible = "amlogic,meson-gx-reset", "amlogic,meson-gxbb-reset";
 				reg = <0x0 0x04404 0x0 0x20>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index dbd300fffa8a..b6f3561c803c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -314,6 +314,12 @@
 	clock-names = "stmmaceth", "clkin0", "clkin1";
 };
 
+&gpio_intc {
+	compatible = "amlogic,meson-gpio-intc",
+		     "amlogic,meson-gxbb-gpio-intc";
+	status = "okay";
+};
+
 &hdmi_tx {
 	compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
 	resets = <&reset RESET_HDMITX_CAPB3>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 4dfc22b07bf0..08268cedd965 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -207,6 +207,12 @@
 	};
 };
 
+&gpio_intc {
+	compatible = "amlogic,meson-gpio-intc",
+		     "amlogic,meson-gxl-gpio-intc";
+	status = "okay";
+};
+
 &hdmi_tx {
 	compatible = "amlogic,meson-gxl-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
 	resets = <&reset RESET_HDMITX_CAPB3>,
-- 
2.9.4
