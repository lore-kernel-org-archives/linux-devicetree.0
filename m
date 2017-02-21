From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [PATCH v2 5/6] DT bindings documentation for Broadcom IPROC USB Device controller.
Date: Tue, 21 Feb 2017 17:13:03 +0530
Message-ID: <1487677384-6115-6-git-send-email-raviteja.garimella@broadcom.com>
References: <1487677384-6115-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487677384-6115-1-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The device node is used for UDCs integrated into Broadcom's
iProc family of SoCs'. The UDC is based on Synopsys Designware
Cores AHB Subsystem USB Device Controller IP.

Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
---
 Documentation/devicetree/bindings/usb/iproc-udc.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/iproc-udc.txt

diff --git a/Documentation/devicetree/bindings/usb/iproc-udc.txt b/Documentation/devicetree/bindings/usb/iproc-udc.txt
new file mode 100644
index 0000000..c2ce803
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/iproc-udc.txt
@@ -0,0 +1,21 @@
+Broadcom IPROC USB Device controller.
+
+The device node is used for UDCs integrated into Broadcom's
+iProc family (Northstar2, Cygnus) of SoCs'. The UDC is based
+on Synopsys Designware Cores AHB Subsystem Device Controller
+IP.
+
+Required properties:
+ - compatible: Add the compatibility strings for supported platforms.
+   For Broadcom NS2 platform, add "brcm,ns2-udc".
+   For Broadcom Cygnus platform, add "brcm,cygnus-udc".
+ - reg: Offset and length of UDC register set
+ - interrupts: description of interrupt line
+ - phys: phandle to phy node.
+
+Example:
+	udc_dwc: usb@664e0000 {
+		compatible = "brcm,ns2-udc", "brcm,cygnus-udc";
+		reg = <0x664e0000 0x2000>;
+		interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usbdrd_phy>;
-- 
2.1.0
