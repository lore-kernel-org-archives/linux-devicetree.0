From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/8] ARM: dts: keystone: Move keystone_irq to under device-state-control
Date: Tue, 2 Jan 2018 11:01:55 -0600
Message-ID: <20180102170202.15045-2-afd@ti.com>
References: <20180102170202.15045-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102170202.15045-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The keystone_irq node describes a device that is a component of the device
state control module. As such, it should not be a member of soc0 bus
but instead a sub-node of device-state-control.

This move also fixes a warning about not having a reg property. Now
that this is a sub-node of device-state-control, a syscon type node,
we add this reg property but relative to the syscon base, this way
when the dt-binding/driver are updated we can drop the non-standard
ti,syscon-dev property completely and simply use get_resource() in
the driver.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
Acked-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone.dtsi | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 93ea5c69ea77..158e0a903f7e 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -87,8 +87,19 @@
 		};
 
 		devctrl: device-state-control@2620000 {
-			compatible = "ti,keystone-devctrl", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
 			reg = <0x02620000 0x1000>;
+
+			kirq0: keystone_irq@2a0 {
+				compatible = "ti,keystone-irq";
+				reg = <0x2a0 0x4>;
+				interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				ti,syscon-dev = <&devctrl 0x2a0>;
+			};
 		};
 
 		rstctrl: reset-controller {
@@ -282,14 +293,6 @@
 				  1 0 0x21000A00 0x00000100>;
 		};
 
-		kirq0: keystone_irq@26202a0 {
-			compatible = "ti,keystone-irq";
-			interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
-			ti,syscon-dev = <&devctrl 0x2a0>;
-		};
-
 		pcie0: pcie@21800000 {
 			compatible = "ti,keystone-pcie", "snps,dw-pcie";
 			clocks = <&clkpcie>;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
