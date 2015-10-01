From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/16] ARM: dts: lpc18xx: add i2c nodes
Date: Thu,  1 Oct 2015 22:54:44 +0200
Message-ID: <1443732893-17145-8-git-send-email-manabian@gmail.com>
References: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443732893-17145-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add NXP LPC1778 I2C controller nodes to the dtsi for all
lpc18xx/43xx devices.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index f97feea5f5da..04bea2dc0e66 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -287,6 +287,17 @@
 			clocks = <&ccu1 CLK_CPU_SCU>;
 		};
 
+		i2c0: i2c@400a1000 {
+			compatible = "nxp,lpc1788-i2c";
+			reg = <0x400a1000 0x1000>;
+			interrupts = <18>;
+			clocks = <&ccu1 CLK_APB1_I2C0>;
+			resets = <&rgu 48>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		can1: can@400a4000 {
 			compatible = "bosch,c_can";
 			reg = <0x400a4000 0x1000>;
@@ -360,6 +371,17 @@
 			status = "disabled";
 		};
 
+		i2c1: i2c@400e0000 {
+			compatible = "nxp,lpc1788-i2c";
+			reg = <0x400e0000 0x1000>;
+			interrupts = <19>;
+			clocks = <&ccu1 CLK_APB3_I2C1>;
+			resets = <&rgu 49>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		can0: can@400e2000 {
 			compatible = "bosch,c_can";
 			reg = <0x400e2000 0x1000>;
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
