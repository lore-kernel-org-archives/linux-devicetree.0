From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v1 1/2] dt-bindings: add binding for USBSS-DRD controller.
Date: Mon, 10 Dec 2018 12:39:14 +0000
Message-ID: <1544445555-17325-2-git-send-email-pawell@cadence.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544445555-17325-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, balbi@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch aim at documenting USB related dt-bindings for the
Cadence USBSS-DRD controller.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 .../devicetree/bindings/usb/cdns3-usb.txt     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cdns3-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/cdns3-usb.txt b/Documentation/devicetree/bindings/usb/cdns3-usb.txt
new file mode 100644
index 000000000000..ae4a255f0b10
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cdns3-usb.txt
@@ -0,0 +1,31 @@
+Binding for the Cadence USBSS-DRD controller
+
+Required properties:
+  - reg: Physical base address and size of the controller's register areas.
+	 Controller has 3 different regions:
+	 region 1 - HOST registers area
+	 region 2 - DEVICE registers area
+	 region 3 - OTG/DRD registers area
+  - compatible: Should contain: "cdns,usb3"
+  - interrupts: Interrupt specifier. Refer to interrupt bindings.
+		Driver supports only single interrupt line.
+                This single interrupt is shared between Device,
+		host and OTG/DRD part of driver.
+
+Optional propertiesi:
+ - maximum-speed : valid arguments are "super-speed", "high-speed" and
+                   "full-speed"; refer to usb/generic.txt
+ - dr_mode: Should be one of "host", "peripheral" or "otg".
+ - phys: reference to the USB PHY
+ - phy-names: name of the USB PHY, should be "cdns3,usbphy"
+
+
+Example:
+	usb@f3000000 {
+		compatible = "cdns,usb3";
+		interrupts = <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;
+		reg = <0xf3000000 0x10000	//memory area for HOST registers
+			0xf3010000 0x10000	//memory area for DEVICE registers
+			0xf3020000 0x10000>;	//memory area for OTG/DRD registers
+	};
+
-- 
2.17.1
