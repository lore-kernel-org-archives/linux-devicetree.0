From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2] ARM64: dts: meson-gxbb-wetek: add ttyAML1 uart for Bluetooth
Date: Fri,  7 Sep 2018 16:15:36 +0400
Message-ID: <1536322536-53109-1-git-send-email-christianshewitt@gmail.com>
References: <1536072290-28015-1-git-send-email-christianshewitt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536072290-28015-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: narmstrong@baylibre.com, christianshewitt@gmail.com, martin.blumenstingl@googlemail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This change adds the uart_A used by the brmcfmac sdio module in the
WeTek Hub and WeTek Play 2 devices. meson_uart_probe seems to mandate
an alias (without it, BT is not working) so this is also included.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 70325b2..e75ace7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		serial0 = &uart_AO;
+		serial1 = &uart_A;
 		ethernet0 = &ethmac;
 	};
 
@@ -239,6 +240,18 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
+/* This is connected to the Bluetooth module: */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 /* This UART is brought out to the DB9 connector */
 &uart_AO {
 	status = "okay";
-- 
2.7.4
