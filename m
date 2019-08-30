From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 05/11] dt-bindings: phy-mtk-tphy: add the properties about address mapping
Date: Fri, 30 Aug 2019 15:14:52 +0800
Message-ID: <1567149298-29366-5-git-send-email-chunfeng.yun@mediatek.com>
References: <1567149298-29366-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567149298-29366-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add three required properties about the address mapping, including
'#address-cells', '#size-cells' and 'ranges'

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2: add Reviewed-by Rob
---
 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
index a859b0db4051..dd75b676b71d 100644
--- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
@@ -14,6 +14,16 @@ Required properties (controller (parent) node):
 		  make use of "mediatek,generic-tphy-v1" on mt2701 instead and
 		  "mediatek,generic-tphy-v2" on mt2712 instead.
 
+- #address-cells:	the number of cells used to represent physical
+		base addresses.
+- #size-cells:	the number of cells used to represent the size of an address.
+- ranges:	the address mapping relationship to the parent, defined with
+		- empty value: if optional 'reg' is used.
+		- non-empty value: if optional 'reg' is not used. should set
+			the child's base address to 0, the physical address
+			within parent's address space, and the length of
+			the address map.
+
 Required nodes	: a sub-node is required for each port the controller
 		  provides. Address range information including the usual
 		  'reg' property is used inside these nodes to describe
-- 
2.23.0
