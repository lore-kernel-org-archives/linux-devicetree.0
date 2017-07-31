From: <sean.wang@mediatek.com>
Subject: [PATCH v5 02/10] dt-bindings: arm: mediatek: add bindings for mediatek MT7623a SoC Platform
Date: Mon, 31 Jul 2017 15:36:35 +0800
Message-ID: <61b96a69cf5a76932fe1e8cbe0d0fce32f11dca2.1501486190.git.sean.wang@mediatek.com>
References: <cover.1501486190.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1501486190.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: john@phrozen.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

This adds DT binding documentation for Mediatek MT7623a

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index cab2074..ae011b2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -14,6 +14,7 @@ compatible: Must contain one of
    "mediatek,mt6797"
    "mediatek,mt7622"
    "mediatek,mt7623" which is referred to MT7623N SoC
+   "mediatek,mt7623a"
    "mediatek,mt8127"
    "mediatek,mt8135"
    "mediatek,mt8173"
-- 
2.7.4
