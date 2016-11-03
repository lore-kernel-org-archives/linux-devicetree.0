From: Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 1/4] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Thu,  3 Nov 2016 16:59:09 +0100
Message-ID: <1478188752-22447-2-git-send-email-abailon@baylibre.com>
References: <1478188752-22447-1-git-send-email-abailon@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478188752-22447-1-git-send-email-abailon@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, robh+dt@kernel.org, b-liu@ti.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, Petr Kulhavy <petr@barix.com>, Alexandre Bailon <abailon@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Petr Kulhavy <petr@barix.com>

DT binding for the TI DA8xx/OMAP-L1x/AM17xx/AM18xx MUSB driver.

Signed-off-by: Petr Kulhavy <petr@barix.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/da8xx-usb.txt          | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
new file mode 100644
index 0000000..ccb844a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -0,0 +1,43 @@
+TI DA8xx MUSB
+~~~~~~~~~~~~~
+For DA8xx/OMAP-L1x/AM17xx/AM18xx platforms.
+
+Required properties:
+~~~~~~~~~~~~~~~~~~~~
+ - compatible : Should be set to "ti,da830-musb".
+
+ - reg: Offset and length of the USB controller register set.
+
+ - interrupts: The USB interrupt number.
+
+ - interrupt-names: Should be set to "mc".
+
+ - dr_mode: The USB operation mode. Should be one of "host", "peripheral" or "otg".
+
+ - phys: Phandle for the PHY device
+
+ - phy-names: Should be "usb-phy"
+
+Optional properties:
+~~~~~~~~~~~~~~~~~~~~
+ - vbus-supply: Phandle to a regulator providing the USB bus power.
+
+Example:
+	usb_phy: usb-phy {
+		compatible = "ti,da830-usb-phy";
+		#phy-cells = <0>;
+		status = "okay";
+	};
+	usb0: usb@200000 {
+		compatible = "ti,da830-musb";
+		reg =   <0x00200000 0x10000>;
+		interrupts = <58>;
+		interrupt-names = "mc";
+
+		dr_mode = "host";
+		vbus-supply = <&usb_vbus>;
+		phys = <&usb_phy 0>;
+		phy-names = "usb-phy";
+
+		status = "okay";
+	};
-- 
2.7.3
