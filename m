From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 4/6] dt-bindings: Consolidate ChipIdea USB ci13xxx bindings
Date: Tue, 19 May 2015 21:10:03 -0500
Message-ID: <1432087805-16671-5-git-send-email-robh@kernel.org>
References: <1432087805-16671-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432087805-16671-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@freescale.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh@kernel.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Daniel Tang <dt.tangr@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Combine the ChipIdea USB binding into a single document to reduce
duplication and fragmentation. This marks use of the old PHY bindings as
deprecated. Future compatible bindings should use generic PHY binding.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ivan T. Ivanov <iivanov@mm-sol.com>
Cc: Peter Chen <peter.chen@freescale.com>
Cc: Daniel Tang <dt.tangr@gmail.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/usb/ci-hdrc-imx.txt        | 35 ----------------------
 .../devicetree/bindings/usb/ci-hdrc-qcom.txt       | 17 -----------
 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       | 22 +++++++++++++-
 .../devicetree/bindings/usb/ci-hdrc-zevio.txt      | 17 -----------
 4 files changed, 21 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
deleted file mode 100644
index 38a5480..0000000
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Freescale i.MX ci13xxx usb controllers
-
-Required properties:
-- compatible: Should be "fsl,imx27-usb"
-- reg: Should contain registers location and length
-- interrupts: Should contain controller interrupt
-- fsl,usbphy: phandle of usb phy that connects to the port
-
-Recommended properies:
-- phy_type: the type of the phy connected to the core. Should be one
-  of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
-  property the PORTSC register won't be touched
-- dr_mode: One of "host", "peripheral" or "otg". Defaults to "otg"
-
-Optional properties:
-- fsl,usbmisc: phandler of non-core register device, with one argument
-  that indicate usb controller index
-- vbus-supply: regulator for vbus
-- disable-over-current: disable over current detect
-- external-vbus-divider: enables off-chip resistor divider for Vbus
-- maximum-speed: limit the maximum connection speed to "full-speed".
-- tpl-support: TPL (Targeted Peripheral List) feature for targeted hosts
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
-	maximum-speed = "full-speed";
-	tpl-support;
-};
diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
deleted file mode 100644
index f2899b5..0000000
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Qualcomm CI13xxx (Chipidea) USB controllers
-
-Required properties:
-- compatible:   should contain "qcom,ci-hdrc"
-- reg:          offset and length of the register set in the memory map
-- interrupts:   interrupt-specifier for the controller interrupt.
-- usb-phy:      phandle for the PHY device
-- dr_mode:      Should be "peripheral"
-
-Examples:
-	gadget@f9a55000 {
-		compatible = "qcom,ci-hdrc";
-		reg = <0xf9a55000 0x400>;
-		dr_mode = "peripheral";
-		interrupts = <0 134 0>;
-		usb-phy = <&usbphy0>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 27f8b1e..f074827 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -1,15 +1,35 @@
 * USB2 ChipIdea USB controller for ci13xxx
 
 Required properties:
-- compatible: should be "chipidea,usb2"
+- compatible: should be one of:
+	"fsl,imx27-usb"
+	"lsi,zevio-usb"
+	"qcom,ci-hdrc"
+	"chipidea,usb2"
 - reg: base address and length of the registers
 - interrupts: interrupt for the USB controller
 
+Recommended properies:
+- phy_type: the type of the phy connected to the core. Should be one
+  of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
+  property the PORTSC register won't be touched.
+- dr_mode: One of "host", "peripheral" or "otg". Defaults to "otg"
+
+Deprecated properties:
+- usb-phy:      phandle for the PHY device. Use "phys" instead.
+- fsl,usbphy: phandle of usb phy that connects to the port. Use "phys" instead.
+
 Optional properties:
 - clocks: reference to the USB clock
 - phys: reference to the USB PHY
 - phy-names: should be "usb-phy"
 - vbus-supply: reference to the VBUS regulator
+- fsl,usbmisc: phandler of non-core register device, with one argument
+  that indicate usb controller index
+- disable-over-current: disable over current detect
+- external-vbus-divider: enables off-chip resistor divider for Vbus
+- maximum-speed: limit the maximum connection speed to "full-speed".
+- tpl-support: TPL (Targeted Peripheral List) feature for targeted hosts
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt
deleted file mode 100644
index abbcb2a..0000000
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* LSI Zevio USB OTG Controller
-
-Required properties:
-- compatible: Should be "lsi,zevio-usb"
-- reg: Should contain registers location and length
-- interrupts: Should contain controller interrupt
-
-Optional properties:
-- vbus-supply: regulator for vbus
-
-Examples:
-		usb0: usb@b0000000 {
-			reg = <0xb0000000 0x1000>;
-			compatible = "lsi,zevio-usb";
-			interrupts = <8>;
-			vbus-supply = <&vbus_reg>;
-		};
-- 
2.1.0
