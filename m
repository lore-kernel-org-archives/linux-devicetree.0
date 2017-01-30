From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [PATCH 5/6] DT bindings documentation for Broadcom IPROC USB Device controller.
Date: Mon, 30 Jan 2017 13:26:12 +0530
Message-ID: <1485762973-14586-6-git-send-email-raviteja.garimella@broadcom.com>
References: <1485762973-14586-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485762973-14586-1-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The device node is used for UDCs integrated into Broadcom's
iProc family of SoCs'. The UDC is based on Synopsys Designware
Cores AHB Subsystem USB Device Controller IP.

Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
---
 .../bindings/usb/brcm,iproc-snps-udc.txt           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,iproc-snps-udc.txt

diff --git a/Documentation/devicetree/bindings/usb/brcm,iproc-snps-udc.txt b/Documentation/devicetree/bindings/usb/brcm,iproc-snps-udc.txt
new file mode 100644
index 0000000..537dd4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,iproc-snps-udc.txt
@@ -0,0 +1,24 @@
+Broadcom IPROC USB Device controller.
+
+The device node is used for UDCs integrated into Broadcom's
+iProc family of SoCs'. The UDC is based on Synopsys Designware
+Cores AHB Subsystem Device Controller.
+
+Required properties:
+ - compatible: should be "brcm,iproc-snps-udc"
+ - reg: Offset and length of UDC register set
+ - interrupts: description of interrupt line
+ - phys: phandle to phy node.
+ - extcon: phandle to the extcon device. This is optional and
+   not required for those that don't require extcon support.
+   Extcon support will be required if the UDC is connected to
+   a Dual Role Device Phy that supports both Host and Device
+   mode based on the external cable.
+
+Example:
+	udc_dwc: usb@664e0000 {
+		compatible = "brcm,iproc-snps-udc";
+		reg = <0x664e0000 0x2000>;
+		interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usbdrd_phy>;
+		extcon = <&usbdrd_phy>";
-- 
2.1.0
