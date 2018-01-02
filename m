From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/8] ARM: dts: keystone-k2e: Move keystone_dsp_gpio to under device-state-control
Date: Tue, 2 Jan 2018 11:01:57 -0600
Message-ID: <20180102170202.15045-4-afd@ti.com>
References: <20180102170202.15045-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102170202.15045-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The keystone_dsp_gpio node describes a device that is a component of the
device state control module. As such, it should not be a member of soc0
bus but instead a sub-node of device-state-control.

This move also fixes a warning about not having a reg property. Now
that this is a sub-node of device-state-control, a syscon type node,
we add this reg property but relative to the syscon base, this way
when the dt-binding/driver are updated we can drop the non-standard
gpio,syscon-dev property completely and simply use get_resource() in
the driver.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
Acked-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2e.dtsi | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e.dtsi b/arch/arm/boot/dts/keystone-k2e.dtsi
index 0bcd3f8a9c45..085e7326ea8e 100644
--- a/arch/arm/boot/dts/keystone-k2e.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e.dtsi
@@ -109,11 +109,14 @@
 			};
 		};
 
-		dspgpio0: keystone_dsp_gpio@2620240 {
-			compatible = "ti,keystone-dsp-gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio,syscon-dev = <&devctrl 0x240>;
+		devctrl: device-state-control@2620000 {
+			dspgpio0: keystone_dsp_gpio@240 {
+				compatible = "ti,keystone-dsp-gpio";
+				reg = <0x240 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio,syscon-dev = <&devctrl 0x240>;
+			};
 		};
 
 		dsp0: dsp@10800000 {
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
