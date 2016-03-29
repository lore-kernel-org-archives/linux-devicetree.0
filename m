From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [RFC 6/8] ARM: socfpga: dts: Add LED framework to A10-SR GPIO
Date: Tue, 29 Mar 2016 14:13:09 -0500
Message-ID: <1459278791-3646-7-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawell.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Add the LED framework to the Arria10 System Resource chip GPIO hooks.

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 095fd72..fc0b7a0 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -31,6 +31,30 @@
 		reg = <0x0 0x40000000>; /* 1GB */
 	};
 
+	a10_leds {
+		compatible = "gpio-leds";
+
+		a10sr_led0 {
+			label = "a10sr_led0";
+			gpios = <&a10sr_gpio 4 1>;
+		};
+
+		a10sr_led1 {
+			label = "a10sr_led1";
+			gpios = <&a10sr_gpio 5 1>;
+		};
+
+		a10sr_led2 {
+			label = "a10sr_led2";
+			gpios = <&a10sr_gpio 6 1>;
+		};
+
+		a10sr_led3 {
+			label = "a10sr_led3";
+			gpios = <&a10sr_gpio 7 1>;
+		};
+	};
+
 	soc {
 		clkmgr@ffd04000 {
 			clocks {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
