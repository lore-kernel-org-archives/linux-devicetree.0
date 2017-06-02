From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 2/3] dt-bindings: Add Broadcom STB USB PHY binding document
Date: Fri,  2 Jun 2017 14:01:51 -0400
Message-ID: <1496426512-10590-3-git-send-email-alcooperx@gmail.com>
References: <1496426512-10590-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496426512-10590-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add DT bindings document for Broadcom STB USB PHYs

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 .../bindings/phy/brcm,brcmstb-usb-phy.txt          | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
new file mode 100644
index 0000000..e1e9b16
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
@@ -0,0 +1,37 @@
+Broadcom STB USB PHY
+
+Required properties:
+ - compatible: brcm,brcmstb-usb-phy
+ - reg: two offset and length pairs. The second pair specifies optional
+        registers used by some of the SoCs that support USB 3.x
+ - #phy-cells: Shall be 1 as it expects one argument for setting
+	       the type of the PHY. Possible values are 0 (1.1 and 2.0),
+	       1 (3.x)
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
+- brcm,device: String, PHY Device mode.
+  Possible values are: off (Host), on (Device), dual (DRD)
+  or typec-pd (Type-C PD control)
+
+Example:
+
+usbphy_0: usb-phy@f0470200 {
+	reg = <0xf0470200 0xb8>,
+		<0xf0471940 0x6c0>;
+	compatible = "brcm,brcmstb-usb-phy";
+	#phy-cells = <1>;
+	brcm,ioc = <1>;
+	brcm,ipp = <1>;
+	brcm,has-xhci;
+	clocks = <&usb20>, <&usb30>;
+	clock-names = "sw_usb", "sw_usb3";
+};
-- 
1.9.0.138.g2de3478
