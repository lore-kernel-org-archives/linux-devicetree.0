From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 01/11] dt-bindings: phy-mtk-tphy: add two optional properties for u2phy
Date: Fri, 23 Aug 2019 15:00:08 +0800
Message-ID: <e99c0d7a55869a4425250c601b80a3331c9d0976.1566542696.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add two optional properties, one for J-K test, another for disconnect
threshold, both of them can be used to debug disconnection issues.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
index a5f7a4f0dbc1..d5b327f85fa2 100644
--- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
@@ -52,6 +52,8 @@ Optional properties (PHY_TYPE_USB2 port (child) node):
 - mediatek,eye-vrt	: u32, the selection of VRT reference voltage
 - mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage
 - mediatek,bc12	: bool, enable BC12 of u2phy if support it
+- mediatek,discth	: u32, the voltage of disconnect threshold
+- mediatek,intr	: u32, the value of internal R (resistance)
 
 Example:
 
-- 
2.23.0
