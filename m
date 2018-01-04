From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 06/10] ARM: dts: keystone-k2g: Move keystone_irq to under device-state-control
Date: Thu, 4 Jan 2018 13:56:57 -0600
Message-ID: <20180104195701.4042-7-afd@ti.com>
References: <20180104195701.4042-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104195701.4042-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The keystone_irq node describes a device that is a member of the device
state control module address space. As such, it should not be a member
of soc0 bus but instead a sub-node of device-state-control.

This move also fixes a warning about not having a reg property. Now
that this is a sub-node of device-state-control, a syscon type node,
we add this reg property but relative to the syscon base, this way
when the dt-binding/driver are updated we can drop the non-standard
ti,syscon-dev property completely and simply use get_resource() in
the driver.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
Acked-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index fd061718dc0a..225175d14826 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -97,8 +97,20 @@
 		};
 
 		devctrl: device-state-control@2620000 {
-			compatible = "ti,keystone-devctrl", "syscon";
+			compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
 			reg = <0x02620000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x02620000 0x1000>;
+
+			kirq0: keystone_irq@2a0 {
+				compatible = "ti,keystone-irq";
+				reg = <0x2a0 0x10>;
+				interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				ti,syscon-dev = <&devctrl 0x2a0>;
+			};
 		};
 
 		uart0: serial@2530c00 {
@@ -188,14 +200,6 @@
 			status = "disabled";
 		};
 
-		kirq0: keystone_irq@26202a0 {
-			compatible = "ti,keystone-irq";
-			interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
-			ti,syscon-dev = <&devctrl 0x2a0>;
-		};
-
 		dspgpio0: keystone_dsp_gpio@2620240 {
 			compatible = "ti,keystone-dsp-gpio";
 			gpio-controller;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
