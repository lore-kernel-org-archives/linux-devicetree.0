From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v6 1/3] dt-bindings: phy: Add Stingray USB PHY binding document
Date: Tue, 19 Mar 2019 14:45:42 +0530
Message-ID: <1552986944-3398-2-git-send-email-srinath.mannam@broadcom.com>
References: <1552986944-3398-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552986944-3398-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add DT binding document for Stingray USB PHY.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/brcm,stingray-usb-phy.txt         | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
new file mode 100644
index 0000000..4ba2989
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
@@ -0,0 +1,32 @@
+Broadcom Stingray USB PHY
+
+Required properties:
+ - compatible : should be one of the listed compatibles
+	- "brcm,sr-usb-combo-phy" is combo PHY has two PHYs, one SS and one HS.
+	- "brcm,sr-usb-hs-phy" is a single HS PHY.
+ - reg: offset and length of the PHY blocks registers
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
+		#phy-cells = <1>;
+	};
+
+	usbphy1: usb-phy@10000 {
+		compatible = "brcm,sr-usb-combo-phy";
+		reg = <0x00010000 0x100>,
+		#phy-cells = <1>;
+	};
+
+	usbphy2: usb-phy@20000 {
+		compatible = "brcm,sr-usb-hs-phy";
+		reg = <0x00020000 0x100>,
+		#phy-cells = <0>;
+	};
-- 
2.7.4
