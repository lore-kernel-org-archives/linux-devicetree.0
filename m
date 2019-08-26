From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v11 1/6] dt-bindings: add binding for USBSS-DRD controller.
Date: Mon, 26 Aug 2019 12:19:26 +0100
Message-ID: <1566818371-27721-2-git-send-email-pawell@cadence.com>
References: <1566818371-27721-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566818371-27721-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: felipe.balbi@linux.intel.com
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, jpawar@cadence.com, kurahul@cadence.com, sparmar@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch aim at documenting USB related dt-bindings for the
Cadence USBSS-DRD controller.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/cdns-usb3.txt     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3.txt

diff --git a/Documentation/devicetree/bindings/usb/cdns-usb3.txt b/Documentation/devicetree/bindings/usb/cdns-usb3.txt
new file mode 100644
index 000000000000..b7dc606d37b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cdns-usb3.txt
@@ -0,0 +1,45 @@
+Binding for the Cadence USBSS-DRD controller
+
+Required properties:
+ - reg: Physical base address and size of the controller's register areas.
+	 Controller has 3 different regions:
+	 - HOST registers area
+	 - DEVICE registers area
+	 - OTG/DRD registers area
+ - reg-names - register memory area names:
+	"xhci" - for HOST registers space
+	"dev" - for DEVICE registers space
+	"otg" - for OTG/DRD registers space
+ - compatible: Should contain: "cdns,usb3"
+ - interrupts: Interrupts used by cdns3 controller:
+	"host" - interrupt used by XHCI driver.
+	"peripheral" - interrupt used by device driver
+	"otg" - interrupt used by DRD/OTG  part of driver
+
+Optional properties:
+ - maximum-speed : valid arguments are "super-speed", "high-speed" and
+                   "full-speed"; refer to usb/generic.txt
+ - dr_mode: Should be one of "host", "peripheral" or "otg".
+ - phys: reference to the USB PHY
+ - phy-names: from the *Generic PHY* bindings;
+	Supported names are:
+	- cdns3,usb2-phy
+	- cdns3,usb3-phy
+
+ - cdns,on-chip-buff-size : size of memory intended as internal memory for endpoints
+	buffers expressed in KB
+
+Example:
+	usb@f3000000 {
+		compatible = "cdns,usb3";
+		interrupts = <GIC_USB_IRQ 7 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_USB_IRQ  8 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host", "peripheral", "otg";
+		reg = <0xf3000000 0x10000>,	/* memory area for HOST registers */
+			<0xf3010000 0x10000>,	/* memory area for DEVICE registers */
+			<0xf3020000 0x10000>;	/* memory area for OTG/DRD registers */
+		reg-names = "xhci", "dev", "otg";
+		phys = <&usb2_phy>, <&usb3_phy>;
+		phy-names = "cdns3,usb2-phy", "cnds3,usb3-phy";
+	};
-- 
2.17.1
