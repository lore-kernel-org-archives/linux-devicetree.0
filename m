From: Biao Huang <biao.huang@mediatek.com>
Subject: [v3, PATCH 1/2] net-next: dt-binding: dwmac-mediatek: remove fine-tune property
Date: Wed, 19 Dec 2018 15:22:40 +0800
Message-ID: <1545204161-15742-2-git-send-email-biao.huang@mediatek.com>
References: <1545204161-15742-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1545204161-15742-1-git-send-email-biao.huang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org
Cc: honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, biao.huang@mediatek.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

remove fine-tune property in device tree, modify
the corresponding description in dt-binding.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../devicetree/bindings/net/mediatek-dwmac.txt     |   31 +++++++-------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
index 4de479b..8a08621 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
@@ -22,33 +22,25 @@ Required properties:
 
 Optional properties:
 - mediatek,tx-delay-ps: TX clock delay macro value. Default is 0.
-	It should be defined for rgmii/rgmii-rxid/mii interface.
+	It should be defined for RGMII/MII interface.
 - mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
-	It should be defined for rgmii/rgmii-txid/mii/rmii interface.
-Both delay properties need to be a multiple of 170 for fine-tune rgmii,
-range 0~31*170.
-Both delay properties need to be a multiple of 550 for coarse-tune rgmii,
-range 0~31*550.
-Both delay properties need to be a multiple of 550 for mii/rmii,
-range 0~31*550.
+	It should be defined for RGMII/MII/RMII interface.
+Both delay properties need to be a multiple of 170 for RGMII interface,
+or will round down. Range 0~31*170.
+Both delay properties need to be a multiple of 550 for MII/RMII interface,
+or will round down. Range 0~31*550.
 
-- mediatek,fine-tune: boolean property, if present indicates that fine delay
-	is selected for rgmii interface.
-	If present, tx-delay-ps/rx-delay-ps is 170+/-50ps per stage.
-	Else tx-delay-ps/rx-delay-ps of coarse delay macro is 0.55+/-0.2ns per stage.
-	This property do not apply to non-rgmii PHYs.
-	Only coarse-tune delay is supported for mii/rmii PHYs.
-- mediatek,rmii-rxc: boolean property, if present indicates that the rmii
+- mediatek,rmii-rxc: boolean property, if present indicates that the RMII
 	reference clock, which is from external PHYs, is connected to RXC pin
 	on MT2712 SoC.
 	Otherwise, is connected to TXC pin.
 - mediatek,txc-inverse: boolean property, if present indicates that
-	1. tx clock will be inversed in mii/rgmii case,
+	1. tx clock will be inversed in MII/RGMII case,
 	2. tx clock inside MAC will be inversed relative to reference clock
-	   which is from external PHYs in rmii case, and it rarely happen.
+	   which is from external PHYs in RMII case, and it rarely happen.
 - mediatek,rxc-inverse: boolean property, if present indicates that
-	1. rx clock will be inversed in mii/rgmii case.
-	2. reference clock will be inversed when arrived at MAC in rmii case.
+	1. rx clock will be inversed in MII/RGMII case.
+	2. reference clock will be inversed when arrived at MAC in RMII case.
 - assigned-clocks: mac_main and ptp_ref clocks
 - assigned-clock-parents: parent clocks of the assigned clocks
 
@@ -76,7 +68,6 @@ Example:
 		mediatek,pericfg = <&pericfg>;
 		mediatek,tx-delay-ps = <1530>;
 		mediatek,rx-delay-ps = <1530>;
-		mediatek,fine-tune;
 		mediatek,rmii-rxc;
 		mediatek,txc-inverse;
 		mediatek,rxc-inverse;
-- 
1.7.9.5
