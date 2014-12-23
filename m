From: Walter Lozano <walter@vanguardiasur.com.ar>
Subject: [PATCH] ARM: socfpga: dts: Add adxl34x
Date: Tue, 23 Dec 2014 10:04:22 -0300
Message-ID: <1419339862-29852-1-git-send-email-walter@vanguardiasur.com.ar>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Walter Lozano <walter@vanguardiasur.com.ar>
List-Id: devicetree@vger.kernel.org

This patch adds the DTS bindings for the adxl34x digital
accelerometer.

Signed-off-by: Walter Lozano <walter@vanguardiasur.com.ar>
---
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
index 16ea6f5..f99d7dec 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
@@ -68,3 +68,20 @@
 &usb1 {
 	status = "okay";
 };
+
+&gpio2 {
+	status = "okay";
+};
+
+&i2c1{
+	status = "okay";
+
+	accel1: accel1@53{
+		compatible = "adxl34x";
+		reg = <0x53>;
+
+		interrupt-parent = < &portc >;
+		interrupts = <3 2>;
+
+	};
+};
-- 
1.7.10.4
