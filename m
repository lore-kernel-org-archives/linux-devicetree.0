From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 3/3] dt-bindings: phy-mtk-tphy: add properties for U2 slew rate calibrate
Date: Mon, 12 Mar 2018 13:25:40 +0800
Message-ID: <94a7d3b1240297cd0cac82df52954d0a53d50d36.1520832210.git.chunfeng.yun@mediatek.com>
References: <c9679bc6e969ebf0f97a01c6d1aff3bbc0e8e4f7.1520832210.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c9679bc6e969ebf0f97a01c6d1aff3bbc0e8e4f7.1520832210.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ryder Lee <ryder.lee@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add two properties of ref_clk and coefficient used by U2 slew rate
calibrate which may vary on different SoCs

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
index 41e09ed..0d34b2b 100644
--- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
@@ -27,6 +27,10 @@ Optional properties (controller (parent) node):
  - reg		: offset and length of register shared by multiple ports,
 		  exclude port's private register. It is needed on mt2701
 		  and mt8173, but not on mt2712.
+ - mediatek,src-ref-clk-mhz	: frequency of reference clock for slew rate
+		  calibrate
+ - mediatek,src-coef	: coefficient for slew rate calibrate, depends on
+		  SoC process
 
 Required properties (port (child) node):
 - reg		: address and length of the register set for the port.
-- 
1.9.1
