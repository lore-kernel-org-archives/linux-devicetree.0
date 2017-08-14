From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFCv3 usb-next 1/3] dt-bindings: usb: add the documentation for USB root-hub
Date: Tue, 15 Aug 2017 00:45:40 +0200
Message-ID: <20170814224542.18257-2-martin.blumenstingl@googlemail.com>
References: <20170814224542.18257-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814224542.18257-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A USB root-hub may have several PHYs which need to be configured before
the root-hub starts working.
This adds the documentation for such a USB root-hub.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../devicetree/bindings/usb/usb-roothub.txt        | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-roothub.txt

diff --git a/Documentation/devicetree/bindings/usb/usb-roothub.txt b/Documentation/devicetree/bindings/usb/usb-roothub.txt
new file mode 100644
index 000000000000..fc0797d7cee9
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-roothub.txt
@@ -0,0 +1,46 @@
+Generic USB root-hub Properties
+
+similar to the USB device bindings (documented in usb-device.txt from the
+current directory) this provides support for configuring the root-hub.
+
+Required properties:
+- compatible: should be at least one of "usb1d6b,3", "usb1d6b,2"
+- reg: must be 0.
+- address-cells: must be 1
+- size-cells: must be 0
+
+Required sub-nodes:
+a sub-node per actual USB port is required. each sub-node supports the
+following properties:
+  Required properties:
+    - reg: the port number on the root-hub (mandatory)
+  Optional properties:
+    - phys: optional, from the *Generic PHY* bindings (mandatory needed
+      when phy-names is given)
+    - phy-names: optional, from the *Generic PHY* bindings; supported names
+      are "usb2-phy" or "usb3-phy"
+
+Example:
+	&usb1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		roothub@0 {
+			compatible = "usb1d6b,3", "usb1d6b,2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			port@1 {
+				reg = <1>;
+				phys = <&usb2_phy1>, <&usb3_phy1>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+
+			port@2 {
+				reg = <2>;
+				phys = <&usb2_phy2>, <&usb3_phy2>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+	}
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
