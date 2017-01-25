From: Guochun Mao <guochun.mao@mediatek.com>
Subject: [PATCH v2 1/2] Documentation: mtk-quadspi: update DT bindings
Date: Wed, 25 Jan 2017 11:38:34 +0800
Message-ID: <1485315515-29942-2-git-send-email-guochun.mao@mediatek.com>
References: <1485315515-29942-1-git-send-email-guochun.mao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485315515-29942-1-git-send-email-guochun.mao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, John Crispin <john@phrozen.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Guochun Mao <guochun.mao@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add "mediatek,mt2701-nor" for nor flash node's compatible.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
---
 .../devicetree/bindings/mtd/mtk-quadspi.txt        |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
index fb314f0..5ded66a 100644
--- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
@@ -1,7 +1,13 @@
 * Serial NOR flash controller for MTK MT81xx (and similar)
 
 Required properties:
-- compatible: 	  should be "mediatek,mt8173-nor";
+- compatible: 	  The possible values are:
+		  "mediatek,mt2701-nor"
+		  "mediatek,mt7623-nor"
+		  "mediatek,mt8173-nor"
+		  For mt8173, compatible should be "mediatek,mt8173-nor".
+		  For every other SoC, should contain both the SoC-specific compatible string
+		  and "mediatek,mt8173-nor".
 - reg: 		  physical base address and length of the controller's register
 - clocks: 	  the phandle of the clocks needed by the nor controller
 - clock-names: 	  the names of the clocks
-- 
1.7.9.5
