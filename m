From: Al Cooper <al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/4] dt-bindings: Add Broadcom STB USB PHY binding document
Date: Tue, 13 Jun 2017 10:55:19 -0400
Message-ID: <1497365721-31188-3-git-send-email-al.cooper@broadcom.com>
References: <1497365721-31188-1-git-send-email-al.cooper@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497365721-31188-1-git-send-email-al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add DT bindings document for Broadcom STB USB PHYs

Signed-off-by: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/phy/brcm,brcmstb-usb-phy.txt          | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
new file mode 100644
index 0000000..bde0f5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
@@ -0,0 +1,42 @@
+Broadcom STB USB PHY
+
+Required properties:
+ - compatible: brcm,brcmstb-usb-phy
+ - reg: two offset and length pairs.
+	The first pair specifies a manditory set of memory mapped
+	registers used for general control of the PHY.
+	The second pair specifies optional registers used by some of
+	the SoCs that support USB 3.x
+ - #phy-cells: Shall be 1 as it expects one argument for setting
+	       the type of the PHY. Possible values are:
+	       - PHY_TYPE_USB2 for USB1.1/2.0 PHY
+	       - PHY_TYPE_USB3 for USB3.x PHY
+
+Optional Properties:
+- clocks : clock phandles.
+- clock-names: String, clock name.
+- brcm,ipp: Boolean, Invert Port Power.
+  Possible values are: 0 (Don't invert), 1 (Invert)
+- brcm,ioc: Boolean, Invert Over Current detection.
+  Possible values are: 0 (Don't invert), 1 (Invert)
+- brcm,has-xhci: Boolean indicating an optional 3.x only XHCI controller.
+- brcm,has-xhci-only: Boolean indicating an XHCI controller that supports
+  1.1, 2.0 and 3.0 devices
+- dr_mode: String, PHY Device mode.
+  Possible values are: "host", "peripheral ", "drd" or "typec-pd"
+  If this property is not defined, the phy will default to "host" mode.
+
+Example:
+
+usbphy_0: usb-phy@f0470200 {
+	reg = <0xf0470200 0xb8>,
+		<0xf0471940 0x6c0>;
+	compatible = "brcm,brcmstb-usb-phy";
+	#phy-cells = <1>;
+	dr_mode = "host"
+	brcm,ioc = <1>;
+	brcm,ipp = <1>;
+	brcm,has-xhci;
+	clocks = <&usb20>, <&usb30>;
+	clock-names = "sw_usb", "sw_usb3";
+};
-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
