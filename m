From: <honghui.zhang@mediatek.com>
Subject: [PATCH 2/4] dt-bindings: PCI: MediaTek: Remove un-used property
Date: Fri, 14 Dec 2018 09:25:40 +0800
Message-ID: <1544750742-31419-3-git-send-email-honghui.zhang@mediatek.com>
References: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com, Honghui Zhang <honghui.zhang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

The "num-lanes" property is not used, remove it.

Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
---
 Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
index 20227a8..92437a3 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
@@ -65,7 +65,6 @@ Required properties:
   explanation.
 - ranges: Sub-ranges distributed from the PCIe controller node. An empty
   property is sufficient.
-- num-lanes: Number of lanes to use for this port.
 
 Examples for MT7623:
 
@@ -118,7 +117,6 @@ Examples for MT7623:
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
 			ranges;
-			num-lanes = <1>;
 		};
 
 		pcie@1,0 {
@@ -129,7 +127,6 @@ Examples for MT7623:
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
 			ranges;
-			num-lanes = <1>;
 		};
 
 		pcie@2,0 {
@@ -140,7 +137,6 @@ Examples for MT7623:
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
 			ranges;
-			num-lanes = <1>;
 		};
 	};
 
@@ -172,7 +168,6 @@ Examples for MT2712:
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
 			ranges;
-			num-lanes = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
 					<0 0 0 2 &pcie_intc0 1>,
@@ -191,7 +186,6 @@ Examples for MT2712:
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
 			ranges;
-			num-lanes = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
 					<0 0 0 2 &pcie_intc1 1>,
@@ -245,7 +239,6 @@ Examples for MT7622:
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
 			ranges;
-			num-lanes = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
 					<0 0 0 2 &pcie_intc0 1>,
@@ -264,7 +257,6 @@ Examples for MT7622:
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
 			ranges;
-			num-lanes = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
 					<0 0 0 2 &pcie_intc1 1>,
-- 
2.6.4
