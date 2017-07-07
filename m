From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH 1/2] dt-bindings: phy: Add stingray usb phy documentation
Date: Fri,  7 Jul 2017 18:37:04 +0530
Message-ID: <1499432825-15820-2-git-send-email-srinath.mannam@broadcom.com>
References: <1499432825-15820-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499432825-15820-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add DT binding document for stingray usb phy driver.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
---
 .../bindings/phy/brcm,stingray-usb-phy.txt         | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
new file mode 100644
index 0000000..22ff1db
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
@@ -0,0 +1,72 @@
+BROADCOM STINGRAY USB PHY
+
+Required properties:
+ - compatible : should be one of the listed compatibles
+	- "brcm,sr-u3h-u2drd-phy"
+	- "brcm,sr-u3drd-phy"
+ - reg: offset and length of the PHY blocks registers
+	two base address and length should be passed.
+ - reg-names: should be from "drdu3","usb3h", "drdu2"
+	"drdu3" for compatible string "brcm,sr-u3drd-phy"
+	"usb3h" and "drdu2" for compatible string "brcm,sr-u3h-u2drd-phy"
+ - address-cells: should be 1
+ - size-cells: should be 0
+
+Sub-nodes:
+  Each port's PHY should be represented as a sub-node.
+
+Sub-nodes required properties:
+ - reg: the PHY port number
+	port numbers of sr-u3h-u2drd-phy should be as
+	- USB3H super speed port is 0
+	- DRDU2 is 1
+	- USB3H high speed port is 2
+	port numbers of sr-u3drd-phy should be as
+	- DRDU3 super speed port is 0
+	- DRDU3 high speed port is 1
+ - phy-cells: generic PHY binding; must be 1
+	The first argument of phy-cell represents the PHY mode in the requested node
+	as either host mode or device mode.
+	for host mode is 1 and device mode is 2.
+
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+Example:
+	usbphy0: usb-phy@68500000 {
+		compatible = "brcm,sr-u3drd-phy";
+		reg = <0x68500000 0x100>;
+		reg-names = "drdu3";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb0_phy0: phy@0 {
+			reg = <0>;
+			#phy-cells = <1>;
+		};
+		usb0_phy1: phy@1 {
+			reg = <1>;
+			#phy-cells = <1>;
+		};
+	};
+
+	usbphy1: usb-phy@68520000 {
+		compatible = "brcm,sr-u3h-u2drd-phy";
+		reg = <0x68510000 0x100>,
+		      <0x68520000 0x100>;
+		reg-names = "usb3h", "drdu2";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb1_phy0: phy@0 {
+			reg = <0>;
+			#phy-cells = <1>;
+		};
+		usb1_phy1: phy@1 {
+			reg = <1>;
+			#phy-cells = <1>;
+		};
+		usb1_phy2: phy@2 {
+			reg = <2>;
+			#phy-cells = <1>;
+		};
+	};
-- 
2.7.4
