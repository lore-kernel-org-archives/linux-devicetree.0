From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 2/9] dt-bindings: usb: bdc: Add Device Tree binding for Broadcom UDC driver
Date: Wed, 19 Jul 2017 15:11:41 -0400
Message-ID: <1500491508-9783-3-git-send-email-alcooperx@gmail.com>
References: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Add Device Tree binding document for Broadcom USB Device
Controller (BDC).

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 Documentation/devicetree/bindings/usb/brcm,bdc.txt | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bdc.txt

diff --git a/Documentation/devicetree/bindings/usb/brcm,bdc.txt b/Documentation/devicetree/bindings/usb/brcm,bdc.txt
new file mode 100644
index 0000000..63e63af
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,bdc.txt
@@ -0,0 +1,29 @@
+Broadcom USB Device Controller (BDC)
+====================================
+
+Required properties:
+
+- compatible: must be one of:
+                "brcm,bdc-v0.16"
+                "brcm,bdc"
+- reg: the base register address and length
+- interrupts: the interrupt line for this controller
+
+Optional properties:
+
+On Broadcom STB platforms, these properties are required:
+
+- phys: phandle to one or two USB PHY blocks
+        NOTE: Some SoC's have a single phy and some have
+        USB 2.0 and USB 3.0 phys
+- clocks: phandle to the functional clock of this block
+
+Example:
+
+        bdc@f0b02000 {
+                compatible = "brcm,bdc-v0.16";
+                reg = <0xf0b02000 0xfc4>;
+                interrupts = <0x0 0x60 0x0>;
+                phys = <&usbphy_0 0x0>;
+                clocks = <&sw_usbd>;
+        };
-- 
1.9.0.138.g2de3478
