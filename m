From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM64: dts: meson-gx: Add SPICC nodes
Date: Mon, 29 May 2017 10:09:55 +0200
Message-ID: <1496045395-5702-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add nodes for the SPICC controller on GX common dtsi, GXBB and
GXL dtsi files.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 7 +++++++
 3 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 436b875..613719d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -304,6 +304,15 @@
 				status = "disabled";
 			};
 
+			spicc: spi@8d80 {
+				compatible = "amlogic,meson-gx-spicc";
+				reg = <0x0 0x08d80 0x0 0x80>;
+				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			spifc: spi@8c80 {
 				compatible = "amlogic,meson-gx-spifc", "amlogic,meson-gxbb-spifc";
 				reg = <0x0 0x08c80 0x0 0x80>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 95a5d57..1734974 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -657,6 +657,13 @@
 	clock-names = "core", "clkin0", "clkin1";
 };
 
+&spicc {
+	clocks = <&clkc CLKID_SPICC>;
+	clock-names = "core";
+	resets = <&reset RESET_PERIPHS_SPICC>;
+	num-cs = <1>;
+};
+
 &spifc {
 	clocks = <&clkc CLKID_SPI>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 42d78f0..567dde4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -584,6 +584,13 @@
 	clock-names = "core", "clkin0", "clkin1";
 };
 
+&spicc {
+	clocks = <&clkc CLKID_SPICC>;
+	clock-names = "core";
+	resets = <&reset RESET_PERIPHS_SPICC>;
+	num-cs = <1>;
+};
+
 &spifc {
 	clocks = <&clkc CLKID_SPI>;
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
