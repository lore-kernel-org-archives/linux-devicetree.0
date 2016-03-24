From: David Lechner <david@lechnology.com>
Subject: [PATCH v3 08/16] dt-bindings: Add bindings for phy-da8xx-usb
Date: Thu, 24 Mar 2016 18:51:33 -0500
Message-ID: <1458863503-31121-9-git-send-email-david@lechnology.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458863503-31121-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, David.Laight@ACULAB.COM, David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Device tree binding for new phy-da8xx-usb driver.

Signed-off-by: David Lechner <david@lechnology.com>
---

v3 changes:

* added cfgchip info and example
* correct usage of "DA8xx"
* correct address after @
* dropped 11 before @ in usb@


 .../devicetree/bindings/phy/phy-da8xx-usb.txt      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
new file mode 100644
index 0000000..684c548
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
@@ -0,0 +1,40 @@
+TI DaVinci DA8xx USB PHY
+
+Required properties:
+ - compatible: must be "ti,da830-usbphy".
+ - #phy-cells: must be 1.
+
+This device controls the PHY for both the USB 1.1 OHCI and USB 2.0 OTG
+controllers on DA8xx SoCs. Consumers of this device should use index 1 for
+the USB 1.1 phy device and index 2 for the USB 2.0 phy device.
+
+It also requires a "syscon" node with compatible = "ti,da830-cfgchip", "syscon"
+to access the CFGCHIP2 register.
+
+Example:
+
+	cfgchip: cfgchip@1417c {
+		compatible = "ti,da830-cfgchip", "syscon";
+		reg = <0x1417c 0x14>;
+	};
+
+	usbphy: usbphy {
+		compatible = "ti,da830-usbphy";
+		#phy-cells = <1>;
+	};
+
+	usb11: usb@225000 {
+		compatible = "ti,da830-ohci";
+		reg = <0x225000 0x1000>;
+		interrupts = <59>;
+		phys = <&usbphy 1>;
+		phy-names = "usbphy";
+	};
+
+	usb20: usb@200000 {
+		compatible = "ti,da830-musb";
+		reg = <0x200000 0x1000>;
+		interrupts = <58>;
+		phys = <&usbphy 2>;
+		phy-names = "usbphy";
+	};
-- 
1.9.1
