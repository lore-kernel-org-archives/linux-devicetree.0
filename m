From: David Lechner <david@lechnology.com>
Subject: [PATCH v5 2/7] dt-bindings: Add bindings for phy-da8xx-usb
Date: Mon,  9 May 2016 18:39:58 -0500
Message-ID: <1462837203-12125-3-git-send-email-david@lechnology.com>
References: <1462837203-12125-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462837203-12125-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com, khilman@kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>
Cc: David Lechner <david@lechnology.com>, petr@barix.com, sergei.shtylyov@cogentembedded.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Device tree binding for new phy-da8xx-usb driver.

Signed-off-by: David Lechner <david@lechnology.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/phy/phy-da8xx-usb.txt      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
new file mode 100644
index 0000000..c26478b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
@@ -0,0 +1,40 @@
+TI DA8xx/OMAP-L1xx/AM18xx USB PHY
+
+Required properties:
+ - compatible: must be "ti,da830-usb-phy".
+ - #phy-cells: must be 1.
+
+This device controls the PHY for both the USB 1.1 OHCI and USB 2.0 OTG
+controllers on DA8xx SoCs. Consumers of this device should use index 0 for
+the USB 2.0 phy device and index 1 for the USB 1.1 phy device.
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
+	usb_phy: usb-phy {
+		compatible = "ti,da830-usb-phy";
+		#phy-cells = <1>;
+	};
+
+	usb20: usb@200000 {
+		compatible = "ti,da830-musb";
+		reg = <0x200000 0x1000>;
+		interrupts = <58>;
+		phys = <&usb_phy 0>;
+		phy-names = "usb-phy";
+	};
+
+	usb11: usb@225000 {
+		compatible = "ti,da830-ohci";
+		reg = <0x225000 0x1000>;
+		interrupts = <59>;
+		phys = <&usb_phy 1>;
+		phy-names = "usb-phy";
+	};
-- 
2.7.4
