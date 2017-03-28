From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 6/7] DT bindings documentation for Broadcom IPROC USB Device controller.
Date: Tue, 28 Mar 2017 16:32:08 +0530
Message-ID: <1490698929-10915-7-git-send-email-raviteja.garimella@broadcom.com>
References: <1490698929-10915-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490698929-10915-1-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The device node is used for UDCs integrated into Broadcom's
iProc family of SoCs'. The UDC is based on Synopsys Designware
Cores AHB Subsystem USB Device Controller IP.

Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/iproc-udc.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/iproc-udc.txt

diff --git a/Documentation/devicetree/bindings/usb/iproc-udc.txt b/Documentation/devicetree/bindings/usb/iproc-udc.txt
new file mode 100644
index 0000000..272d7fa
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
+   For Broadcom NS2 platform, add "brcm,ns2-udc","brcm,iproc-udc".
+   For Broadcom Cygnus platform, add "brcm,cygnus-udc", "brcm,iproc-udc".
+ - reg: Offset and length of UDC register set
+ - interrupts: description of interrupt line
+ - phys: phandle to phy node.
+
+Example:
+	udc_dwc: usb@664e0000 {
+		compatible = "brcm,ns2-udc", "brcm,iproc-udc";
+		reg = <0x664e0000 0x2000>;
+		interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usbdrd_phy>;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
