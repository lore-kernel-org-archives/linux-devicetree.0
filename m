From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v5 1/3] dt-bindings: phy: Add Stingray USB PHY binding document
Date: Tue, 12 Mar 2019 21:36:19 +0530
Message-ID: <1552406781-5180-2-git-send-email-srinath.mannam@broadcom.com>
References: <1552406781-5180-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552406781-5180-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add DT binding document for Stingray USB PHY.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 .../bindings/phy/brcm,stingray-usb-phy.txt         | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
new file mode 100644
index 0000000..51c3d73
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
@@ -0,0 +1,40 @@
+Broadcom Stingray USB PHY
+
+Required properties:
+ - compatible : should be one of the listed compatibles
+	- "brcm,sr-usb-combo-phy" is combo PHY has two PHYs, one SS and one HS.
+	- "brcm,sr-usb-hs-phy" is a single HS PHY.
+ - reg: offset and length of the PHY blocks registers
+ - address-cells: should be 1
+ - size-cells: should be 0
+ - #phy-cells:
+   - Must be 1 for brcm,sr-usb-combo-phy as it expects one argument to indicate
+     the PHY number of two PHYs. 0 for HS PHY and 1 for SS PHY.
+   - Must be 0 for brcm,sr-usb-hs-phy.
+
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+Example:
+	usbphy0: usb-phy@0 {
+		compatible = "brcm,sr-usb-combo-phy";
+		reg = <0x00000000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#phy-cells = <1>;
+	};
+
+	usbphy1: usb-phy@10000 {
+		compatible = "brcm,sr-usb-combo-phy";
+		reg = <0x00010000 0x100>,
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#phy-cells = <1>;
+	};
+
+	usbphy2: usb-phy@20000 {
+		compatible = "brcm,sr-usb-hs-phy";
+		reg = <0x00020000 0x100>,
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#phy-cells = <0>;
+	};
-- 
2.7.4
