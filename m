From: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] phy: usbphy: Add dt documentation for Broadcom Cygnus USB PHY driver
Date: Tue, 17 Feb 2015 11:20:20 -0800
Message-ID: <1424200821-16368-2-git-send-email-arun.ramamurthy@broadcom.com>
References: <1424200821-16368-1-git-send-email-arun.ramamurthy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424200821-16368-1-git-send-email-arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../bindings/phy/brcm,cygnus-usb-phy.txt           | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
new file mode 100644
index 0000000..f218fae
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
@@ -0,0 +1,50 @@
+BROADCOM CYGNUS USB PHY
+
+Required Properties:
+	- compatible:  brcm,cygnus-usb-phy
+	- reg : usbphy_regs - Base address of phy registers
+			usb2h_idm_regs - Base address of host idm registers
+			usb2d_idm_regs - Base address of device idm registers
+	 - num_phys : Number of phys available
+	 - #phy-cells must be 2
+The node that uses the phy must provide two integers, the first indicates the
+port and the second indicates whether its host or device. The second integer
+is 0 for device and 1 for host
+
+NOTE: port 0 and port 1 are host only and port 2 can be configured for host or device.
+
+Example of phy :
+	usbphy0: usbphy@0x0301c000 {
+		#phy-cells = <2>;
+		num_phys = <3>;
+		compatible = "brcm,cygnus-usb-phy";
+		reg = <0x0301c000 0x2000>,
+		      <0x18115000 0x1000>,
+		      <0x18111000 0x1000>;
+		status = "okay";
+	};
+
+Example of node using the phy:
+
+	/* This nodes declares  port 0
+	and port 1 as host*/
+
+	ehci0: usb@0x18048000 {
+		compatible = "generic-ehci";
+		reg = <0x18048000 0x100>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usbphy0 0 1 &usbphy0 1>;
+		phy-names = "usbp0","usbp1";
+		status = "okay";
+	};
+
+	/* This node declares port 2 phy
+	and configures it for device */
+
+	usbd_udc_dwc1: usbd_udc_dwc@0x1804c000 {
+		compatible = "iproc-udc";
+		reg = <0x1804c000 0x2000>;
+		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usbphy0 2 0>;
+		phy-names = "usb";
+	};
-- 
2.3.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
