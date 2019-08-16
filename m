From: Stefan Roese <sr@denx.de>
Subject: [PATCH net-next 1/4 v3] dt-bindings: net: mediatek: Add support for MediaTek MT7628/88 SoC
Date: Fri, 16 Aug 2019 15:23:22 +0200
Message-ID: <20190816132325.28426-1-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add compatible for the ethernet IP core on MT7628/88 SoCs. Its
compatible with the older Ralink Rt5350F SoC. And OpenWrt already
uses this compatible string for the MT76x8.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: René van Dorst <opensource@vdorst.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: John Crispin <john@phrozen.org>
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
---
v3:
- No change

v2:
- New patch - bindings description moved to separate patch

 Documentation/devicetree/bindings/net/mediatek-net.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index 770ff98d4524..72d03e07cf7c 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -12,6 +12,7 @@ Required properties:
 		"mediatek,mt7623-eth", "mediatek,mt2701-eth": for MT7623 SoC
 		"mediatek,mt7622-eth": for MT7622 SoC
 		"mediatek,mt7629-eth": for MT7629 SoC
+		"ralink,rt5350-eth": for Ralink Rt5350F and MT7628/88 SoC
 - reg: Address and length of the register set for the device
 - interrupts: Should contain the three frame engines interrupts in numeric
 	order. These are fe_int0, fe_int1 and fe_int2.
-- 
2.22.1
