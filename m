From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: net: Add bindings for National Instruments XGE netdev
Date: Fri, 16 Feb 2018 09:00:32 -0800
Message-ID: <20180216170033.3834-1-mdf@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

This adds bindings for the NI XGE 1G/10G network device.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---

Changes from v2:
- Addressed Rob's comments w.r.t to IRQ names and typo

Changes from v1:
- Corrected from nixge -> nixge.txt

---
 Documentation/devicetree/bindings/net/nixge.txt | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nixge.txt

diff --git a/Documentation/devicetree/bindings/net/nixge.txt b/Documentation/devicetree/bindings/net/nixge.txt
new file mode 100644
index 000000000000..e55af7f0881a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nixge.txt
@@ -0,0 +1,32 @@
+* NI XGE Ethernet controller
+
+Required properties:
+- compatible: Should be "ni,xge-enet-2.00"
+- reg: Address and length of the register set for the device
+- interrupts: Should contain tx and rx interrupt
+- interrupt-names: Should be "rx" and "tx"
+- phy-mode: See ethernet.txt file in the same directory.
+- phy-handle: See ethernet.txt file in the same directory.
+- nvmem-cells: Phandle of nvmem cell containing the MAC address
+- nvmem-cell-names: Should be "address"
+
+Examples (10G generic PHY):
+	nixge0: ethernet@40000000 {
+		compatible = "ni,xge-enet-2.00";
+		reg = <0x40000000 0x6000>;
+
+		nvmem-cells = <&eth1_addr>;
+		nvmem-cell-names = "address";
+
+		interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>, <0 30 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "rx", "tx";
+		interrupt-parent = <&intc>;
+
+		phy-mode = "xgmii";
+		phy-handle = <&ethernet_phy1>;
+
+		ethernet_phy1: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <4>;
+		};
+	};
-- 
2.16.1
