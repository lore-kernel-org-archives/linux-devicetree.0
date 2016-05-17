From: "jeffrey.lin" <yajohn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt-bindings: input: add Raydium I2C touch bindings
Date: Tue, 17 May 2016 23:32:14 +0800
Message-ID: <1463499134-20470-1-git-send-email-jeffrey.lin@rad-ic.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jeffrey.lin-s3Ivl27awEzQT0dZR+AlfA@public.gmane.org, roger.yang-s3Ivl27awEzQT0dZR+AlfA@public.gmane.org, KP.li-s3Ivl27awEzQT0dZR+AlfA@public.gmane.org, albert.shieh-s3Ivl27awEzQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the device tree binfings of Raydium I2C touch.

Signed-off-by: jeffrey.lin <jeffrey.lin-s3Ivl27awEzQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/input/touchscreen/raydium_i2c_ts.txt    | 20 ++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt          |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raydium_i2c_ts.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/raydium_i2c_ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raydium_i2c_ts.txt
new file mode 100644
index 0000000..52a7bf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/raydium_i2c_ts.txt
@@ -0,0 +1,20 @@
+Raydium I2C touchscreen
+
+Required properties:
+- compatible : must be "raydium,rm32380"
+- reg: The I2C address of the device
+- interrupt-parent: the phandle for the interrupt controller
+- interrupts: interrupt to which the chip is connected
+    See ../interrupt-controller/interrupts.txt
+Optional properties:
+- avdd-supply : analog power supply needed to power device
+- vccio-supply : IO Power source
+- reset-gpios : reset gpio the chip is connected to.
+
+Example:
+	raydium_i2c@39 {
+		compatible = "raydium,rm32380";
+		reg = <0x39>;
+		interrupt-parent = <&gpio>;
+		interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 97e6504..e1e5b7c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -127,6 +127,7 @@ radxa	Radxa
 raidsonic	RaidSonic Technology GmbH
 ralink	Mediatek/Ralink Technology Corp.
 ramtron	Ramtron International
+raydium Raydium Semiconductor Corp.
 realtek Realtek Semiconductor Corp.
 renesas	Renesas Electronics Corporation
 ricoh	Ricoh Co. Ltd.
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
