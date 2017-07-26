From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH v2 1/6] dt-bindings: phy: Add documentation for NS2 USB3 PHY
Date: Wed, 26 Jul 2017 18:56:22 -0400
Message-ID: <1501109787-15489-2-git-send-email-jon.mason@broadcom.com>
References: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>

Add documentation for USB3 PHY available in NS2 SoC

Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Signed-off-by: Jon Mason <jon.mason@broadcom.com>
---
 .../devicetree/bindings/phy/brcm,ns2-usb3-phy.txt  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-usb3-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,ns2-usb3-phy.txt b/Documentation/devicetree/bindings/phy/brcm,ns2-usb3-phy.txt
new file mode 100644
index 000000000000..b1c058c37d54
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,ns2-usb3-phy.txt
@@ -0,0 +1,48 @@
+Broadcom USB3 dual port phy for Northstar2 SoC
+This is a child bus node of "brcm,mdio-mux-iproc" node.
+
+Required mdio bus properties:
+- reg: MDIO Bus number for the MDIO interface
+- #address-cells: must be 1
+- #size-cells: must be 0
+
+Required PHY properties:
+- compatible: should be "brcm,ns2-usb3-phy"
+- reg: MDIO Phy ID for the MDIO interface
+- #phy-cells: must be 0
+- #address-cells: must be 1
+- #size-cells: must be 0
+
+Sub-nodes:
+  Each port's PHY should be represented as a sub-node.
+
+Sub-nodes required properties:
+ - reg: the PHY number
+ - phy-cells: from the generic PHY bindings, must be 0
+
+Example:
+
+mdio@1 {
+	reg = <0x1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	usb3_phy: usb3_phy@0 {
+		compatible = "brcm,ns2-usb3-phy";
+		reg = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb3_phy0: usb3_phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3_phy1: usb_phy@1 {
+			reg = <1>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.7.4
