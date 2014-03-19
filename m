From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH 5/9] usb: doc: rename ci13xxx-imx.txt to ci-hdrc-imx.txt
Date: Wed, 19 Mar 2014 09:58:14 +0800
Message-ID: <1395194298-25529-6-git-send-email-peter.chen@freescale.com>
References: <1395194298-25529-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1395194298-25529-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: b47624@freescale.com
Cc: LNXREVLI@freescale.com, Peter Chen <peter.chen@freescale.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

We have already renamed the file name, change doc name at this
patch.

Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Peter Chen <peter.chen@freescale.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../devicetree/bindings/usb/ci-hdrc-imx.txt        |   51 ++++++++++++++++++++
 .../devicetree/bindings/usb/ci13xxx-imx.txt        |   51 --------------------
 2 files changed, 51 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
new file mode 100644
index 0000000..881901a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
@@ -0,0 +1,51 @@
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
+- imx6-usb-charger-detection: enable imx6 usb charger detect function,
+only set it when the user wants SoC usb charger detection capabilities.
+If the user wants to use charger IC's usb charger detection capabilities,
+please do not set it.
+- fsl,anatop: phandle for anatop module, anatop module is only existed
+at imx6 SoC series
+- pinctrl-names: for names of hsic pin group
+- pinctrl-0: hsic "idle" pin group
+- pinctrl-1: hsic "active" pin group
+- osc-clkgate-delay: the delay between powering up the xtal 24MHz clock
+  and release the clock to the digital logic inside the analog block,
+  0 <= osc-clkgate-delay <= 7.
+- maximum-speed: limit the maximum connection speed to "full-speed".
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
+	imx6-usb-charger-detection;
+	fsl,anatop = <&anatop>;
+	pinctrl-names = "idle", "active";
+	pinctrl-0 = <&pinctrl_usbh2_1>;
+	pinctrl-1 = <&pinctrl_usbh2_2>;
+	osc-clkgate-delay = <0x3>;
+	maximum-speed = "full-speed";
+};
diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
deleted file mode 100644
index 881901a..0000000
--- a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
+++ /dev/null
@@ -1,51 +0,0 @@
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
-- imx6-usb-charger-detection: enable imx6 usb charger detect function,
-only set it when the user wants SoC usb charger detection capabilities.
-If the user wants to use charger IC's usb charger detection capabilities,
-please do not set it.
-- fsl,anatop: phandle for anatop module, anatop module is only existed
-at imx6 SoC series
-- pinctrl-names: for names of hsic pin group
-- pinctrl-0: hsic "idle" pin group
-- pinctrl-1: hsic "active" pin group
-- osc-clkgate-delay: the delay between powering up the xtal 24MHz clock
-  and release the clock to the digital logic inside the analog block,
-  0 <= osc-clkgate-delay <= 7.
-- maximum-speed: limit the maximum connection speed to "full-speed".
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
-	imx6-usb-charger-detection;
-	fsl,anatop = <&anatop>;
-	pinctrl-names = "idle", "active";
-	pinctrl-0 = <&pinctrl_usbh2_1>;
-	pinctrl-1 = <&pinctrl_usbh2_2>;
-	osc-clkgate-delay = <0x3>;
-	maximum-speed = "full-speed";
-};
-- 
1.7.8


