From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 4/8] ARM: dts: keystone-k2l: Move keystone_dsp_gpio to under device-state-control
Date: Tue, 2 Jan 2018 11:01:58 -0600
Message-ID: <20180102170202.15045-5-afd@ti.com>
References: <20180102170202.15045-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102170202.15045-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The keystone_dsp_gpio nodes describe devices that are a component of the
device state control module. As such, they should not be a member of soc0
bus but instead sub-nodes of device-state-control.

This move also fixes warnings about not having a reg property. Now
that this is a sub-node of device-state-control, a syscon type node,
we add this reg property but relative to the syscon base, this way
when the dt-binding/driver are updated we can drop the non-standard
gpio,syscon-dev property completely and simply use get_resource() in
the driver.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
Acked-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2l.dtsi | 52 +++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2l.dtsi b/arch/arm/boot/dts/keystone-k2l.dtsi
index b61a830f4a4d..374c80124c4e 100644
--- a/arch/arm/boot/dts/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/keystone-k2l.dtsi
@@ -289,32 +289,38 @@
 			clocks = <&clkosr>;
 		};
 
-		dspgpio0: keystone_dsp_gpio@2620240 {
-			compatible = "ti,keystone-dsp-gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio,syscon-dev = <&devctrl 0x240>;
-		};
+		devctrl: device-state-control@2620000 {
+			dspgpio0: keystone_dsp_gpio@240 {
+				compatible = "ti,keystone-dsp-gpio";
+				reg = <0x240 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio,syscon-dev = <&devctrl 0x240>;
+			};
 
-		dspgpio1: keystone_dsp_gpio@2620244 {
-			compatible = "ti,keystone-dsp-gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio,syscon-dev = <&devctrl 0x244>;
-		};
+			dspgpio1: keystone_dsp_gpio@244 {
+				compatible = "ti,keystone-dsp-gpio";
+				reg = <0x244 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio,syscon-dev = <&devctrl 0x244>;
+			};
 
-		dspgpio2: keystone_dsp_gpio@2620248 {
-			compatible = "ti,keystone-dsp-gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio,syscon-dev = <&devctrl 0x248>;
-		};
+			dspgpio2: keystone_dsp_gpio@248 {
+				compatible = "ti,keystone-dsp-gpio";
+				reg = <0x248 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio,syscon-dev = <&devctrl 0x248>;
+			};
 
-		dspgpio3: keystone_dsp_gpio@262024c {
-			compatible = "ti,keystone-dsp-gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio,syscon-dev = <&devctrl 0x24c>;
+			dspgpio3: keystone_dsp_gpio@24c {
+				compatible = "ti,keystone-dsp-gpio";
+				reg = <0x24c 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio,syscon-dev = <&devctrl 0x24c>;
+			};
 		};
 
 		dsp0: dsp@10800000 {
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
