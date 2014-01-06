From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH 3/8] usb: doc: rename ci13xxx-imx.txt to ci-hdrc-imx.txt
Date: Mon, 6 Jan 2014 10:10:40 +0800
Message-ID: <1388974245-16504-4-git-send-email-peter.chen@freescale.com>
References: <1388974245-16504-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1388974245-16504-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, Peter Chen <peter.chen@freescale.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We have already renamed the file name, change doc name at this
patch.

Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 .../devicetree/bindings/usb/ci-hdrc-imx.txt        |   31 ++++++++++++++++++++
 .../devicetree/bindings/usb/ci13xxx-imx.txt        |   31 --------------------
 2 files changed, 31 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
new file mode 100644
index 0000000..b4b5b79
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
@@ -0,0 +1,31 @@
+* Freescale i.MX ci13xxx usb controllers
+
+Required properties:
+- compatible: Should be "fsl,imx27-usb"
+- reg: Should contain registers location and length
+- interrupts: Should contain controller interrupt
+
+Recommended properies:
+- phy_type: the type of the phy connected to the core. Should be one
+  of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
+  property the PORTSC register won't be touched
+- dr_mode: One of "host", "peripheral" or "otg". Defaults to "otg"
+
+Optional properties:
+- fsl,usbphy: phandler of usb phy that connects to the only one port
+- fsl,usbmisc: phandler of non-core register device, with one argument
+  that indicate usb controller index
+- vbus-supply: regulator for vbus
+- disable-over-current: disable over current detect
+- external-vbus-divider: enables off-chip resistor divider for Vbus
+
+Examples:
+usb@02184000 { /* USB OTG */
+	compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
+	reg = <0x02184000 0x200>;
+	interrupts = <0 43 0x04>;
+	fsl,usbphy = <&usbphy1>;
+	fsl,usbmisc = <&usbmisc 0>;
+	disable-over-current;
+	external-vbus-divider;
+};
diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
deleted file mode 100644
index b4b5b79..0000000
--- a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* Freescale i.MX ci13xxx usb controllers
-
-Required properties:
-- compatible: Should be "fsl,imx27-usb"
-- reg: Should contain registers location and length
-- interrupts: Should contain controller interrupt
-
-Recommended properies:
-- phy_type: the type of the phy connected to the core. Should be one
-  of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
-  property the PORTSC register won't be touched
-- dr_mode: One of "host", "peripheral" or "otg". Defaults to "otg"
-
-Optional properties:
-- fsl,usbphy: phandler of usb phy that connects to the only one port
-- fsl,usbmisc: phandler of non-core register device, with one argument
-  that indicate usb controller index
-- vbus-supply: regulator for vbus
-- disable-over-current: disable over current detect
-- external-vbus-divider: enables off-chip resistor divider for Vbus
-
-Examples:
-usb@02184000 { /* USB OTG */
-	compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
-	reg = <0x02184000 0x200>;
-	interrupts = <0 43 0x04>;
-	fsl,usbphy = <&usbphy1>;
-	fsl,usbmisc = <&usbmisc 0>;
-	disable-over-current;
-	external-vbus-divider;
-};
-- 
1.7.8


