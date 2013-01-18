From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 1/5] ARM: dts: twl4030: Add PWM support
Date: Fri, 18 Jan 2013 15:36:30 +0100
Message-ID: <1358519794-13214-2-git-send-email-peter.ujfalusi@ti.com>
References: <1358519794-13214-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1358519794-13214-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Benoit Cousson <b-cousson@ti.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Enable support for the PWMs and LEDs as PWM drivers.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/twl4030.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/twl4030.dtsi b/arch/arm/boot/dts/twl4030.dtsi
index ed0bc95..d216853 100644
--- a/arch/arm/boot/dts/twl4030.dtsi
+++ b/arch/arm/boot/dts/twl4030.dtsi
@@ -75,4 +75,14 @@
 		usb3v1-supply = <&vusb3v1>;
 		usb_mode = <1>;
 	};
+
+	twl_pwm: pwm {
+		compatible = "ti,twl4030-pwm";
+		#pwm-cells = <2>;
+	};
+
+	twl_pwmled: pwmled {
+		compatible = "ti,twl4030-pwmled";
+		#pwm-cells = <2>;
+	};
 };
-- 
1.8.1

