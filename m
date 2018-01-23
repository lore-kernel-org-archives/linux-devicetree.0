From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/4] rtc: isl1208: Add device tree binding documentation
Date: Tue, 23 Jan 2018 13:17:59 +0100
Message-ID: <20180123121801.4214-3-m.grzeschik@pengutronix.de>
References: <20180123121801.4214-1-m.grzeschik@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180123121801.4214-1-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Denis.Osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Denis Osterland <Denis.Osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org>

Wrote documentation for ISL1208, ISL1218 device tree
binding with short examples.

Signed-off-by: Denis Osterland <Denis.Osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/rtc/intersil,isl1208.txt   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/intersil,isl1208.txt

diff --git a/Documentation/devicetree/bindings/rtc/intersil,isl1208.txt b/Documentation/devicetree/bindings/rtc/intersil,isl1208.txt
new file mode 100644
index 0000000000000..a54e99feae1ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/intersil,isl1208.txt
@@ -0,0 +1,35 @@
+Intersil ISL1208, ISL1218 I2C RTC/Alarm chip
+
+ISL1208 is a trivial I2C device (it has simple device tree bindings,
+consisting of a compatible field, an address and possibly an interrupt
+line).
+
+Required properties supported by the device:
+
+ - "compatible": must be one of
+	"isil,isl1208"
+	"isil,isl1218"
+ - "reg": I2C bus address of the device
+
+Optional properties:
+
+ - "interrupt-parent", "interrupts", "interrupts-extended":
+   for passing the interrupt line of the SoC connected to #IRQ pin
+   of the RTC chip.
+
+
+Example isl1208 node without #IRQ pin connected:
+
+	isl1208: isl1208@68 {
+		compatible = "isil,isl1208";
+		reg = <0x68>;
+	};
+
+Example isl1208 node with #IRQ pin connected to SoC gpio1 pin 12:
+
+	isl1208: isl1208@68 {
+		compatible = "isil,isl1208";
+		reg = <0x68>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
