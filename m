From: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 4/5] phy: DT binding documentation for qoriq usb 2.0 phy
Date: Sat, 9 Jul 2016 10:00:55 +0530
Message-ID: <1468038656-10345-5-git-send-email-rajesh.bhagat@nxp.com>
References: <1468038656-10345-1-git-send-email-rajesh.bhagat@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468038656-10345-1-git-send-email-rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter.Chen-3arQi8VN3Tc@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Describes the qoriq usb 2.0 phy driver binding, currently used
for LS1021A and LS1012A platform.

Signed-off-by: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
---
Changes in v2:
 - Adds DT binding documentation for qoriq usb 2.0 phy
 - Changed the compatible string to fsl,qoriq-usb2-phy

 .../devicetree/bindings/phy/qoriq-usb2-phy.txt     | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qoriq-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qoriq-usb2-phy.txt b/Documentation/devicetree/bindings/phy/qoriq-usb2-phy.txt
new file mode 100644
index 0000000..f043855
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qoriq-usb2-phy.txt
@@ -0,0 +1,22 @@
+QorIQ SoC USB 2.0 PHY
+
+Required properties:
+ - compatible: should be "fsl,qoriq-usb2-phy",
+   Wherever applicable, the version of the USB PHY should
+   also be mentioned (for eg. fsl,qoriq-usb2-phy-vX.Y).
+   where, X = Phy vendor(Legacy = 1, NXP = 2) and Y = PHY version
+ - reg : Address and length of the usb phy control register set.
+ - phy_type : For multi port host USB controllers, should be one of
+   "ulpi", or "serial". For dual role USB controllers, should be
+   one of "ulpi", "utmi", "utmi_wide", or "serial".
+
+The main purpose of this PHY driver is to enable the USB PHY reference clock
+gate on the QorIQ SOC for USB2 PHY OR implement errata workaround in
+future. Otherwise it is just an NOP PHY driver.
+
+usbphy0: usbphy@8600000 {
+        compatible = "fsl,qoriq-usb2-phy" "fsl,qoriq-usb2-phy-vX.Y";
+        reg = <0x0 0x8600000 0x0 0x1000>;
+        #phy-cells = <0>;
+        phy_type = "ulpi";
+};
-- 
2.6.2.198.g614a2ac

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
