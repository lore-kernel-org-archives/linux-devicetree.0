From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 2/8] usb: bdc: Add Device Tree binding document for Broadcom BDC driver
Date: Tue, 27 Jun 2017 14:23:20 -0400
Message-ID: <1498587806-24781-3-git-send-email-alcooperx@gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Add Device Tree binding document for Broadcom USB Device
Controller (BDC).

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 .../devicetree/bindings/usb/brcm,bdc-udc.txt       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt

diff --git a/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt b/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
new file mode 100644
index 0000000..4eeaddb
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
@@ -0,0 +1,28 @@
+Broadcom USB Device Controller (BDC)
+====================================
+
+Required properties:
+
+- compatible: must be one of:
+                "brcm,bdc-udc-v0.16"
+                "brcm,bdc-udc"
+- reg: the base register address and length
+- interrupts: ther interrupt line for this controller
+
+Optional properties:
+
+On Broadcom STB platforms, these properties are required:
+
+- phys: phandle to the USB PHY blocks
+- clocks: phandle to the functional clock of this block
+
+Example:
+
+        udc@f0b02000 {
+                status = "disabled";
+                compatible = "brcm,bdc-udc-v0.16";
+                reg = <0xf0b02000 0xfc4>;
+                interrupts = <0x0 0x60 0x0>;
+                phys = <&usbphy_0 0x0>;
+                clocks = <&sw_usbd>;
+        };
-- 
1.9.0.138.g2de3478
