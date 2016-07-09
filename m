From: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 2/5] usb: DT binding documentation for qoriq usb 2.0 controller
Date: Sat, 9 Jul 2016 10:00:53 +0530
Message-ID: <1468038656-10345-3-git-send-email-rajesh.bhagat@nxp.com>
References: <1468038656-10345-1-git-send-email-rajesh.bhagat@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468038656-10345-1-git-send-email-rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter.Chen-3arQi8VN3Tc@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Describes the qoriq usb 2.0 controller driver binding, currently used
for LS1021A and LS1012A platform.

Signed-off-by: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
---
Changes in v2: 
 - Adds DT binding documentation for qoriq usb 2.0 controller
 - Changed the compatible string to fsl,ci-qoriq-usb2

 .../devicetree/bindings/usb/ci-hdrc-qoriq.txt      | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt
new file mode 100644
index 0000000..8ad7306
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt
@@ -0,0 +1,34 @@
+* Freescale QorIQ SoC USB 2.0 Controllers
+
+Required properties:
+- compatible: Should be "fsl,ci-qoriq-usb2"
+  Wherever applicable, the IP version of the USB controller should
+  also be mentioned (for eg. fsl,ci-qoriq-usb2-vX.Y).
+  where, X.Y is IP version of USB controller.
+- reg: Should contain registers location and length
+- interrupts: Should contain controller interrupt
+- phy-names: from the *Generic PHY* bindings
+- phys: from the *Generic PHY* bindings
+- clocks: clock provider specifier
+- clock-names: shall be "usb2-clock"
+Refer to clk/clock-bindings.txt for generic clock consumer properties
+
+Recommended properties:
+- dr_mode: One of "host" or "peripheral".
+- phy_type: the type of the phy connected to the core. Should be one
+  of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
+  property the PORTSC register won't be touched
+
+Examples:
+usb@8600000 {
+	compatible =  "fsl,ci-qoriq-usb2",
+		      "fsl,ci-qoriq-usb2-v2.5";
+	reg = <0x0 0x8600000 0x0 0x1000>;
+	interrupts = <0 139 0x4>;
+	phy-names = "usb2-phy";
+	phys = <&usbphy0>;
+	clock-names = "usb2-clock";
+	clocks = <&clockgen 4 3>;
+	dr_mode = "host";
+	phy_type = "ulpi";
+};
-- 
2.6.2.198.g614a2ac

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
