From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [RFC v2 4/5] DT bindings documentation for Synopsys UDC platform driver
Date: Tue, 17 Jan 2017 13:35:07 +0530
Message-ID: <1484640308-25976-5-git-send-email-raviteja.garimella@broadcom.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484640308-25976-1-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree bindings documentation for Synopsys
USB device controller platform driver.

Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/usb/snps,dw-ahb-udc.txt    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt

diff --git a/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
new file mode 100644
index 0000000..0c18327
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
@@ -0,0 +1,27 @@
+Synopsys USB Device controller.
+
+The device node is used for Synopsys Designware Cores AHB
+Subsystem Device Controller (UDC).
+
+This device node is used by UDCs integrated it Broadcom's
+Northstar2 and Cygnus SoC's.
+
+Required properties:
+ - compatible: should be "snps,dw-ahb-udc"
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
+		compatible = "snps,dw-ahb-udc";
+		reg = <0x664e0000 0x2000>;
+		interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usbdrd_phy>;
+		extcon = <&usbdrd_phy>";
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
