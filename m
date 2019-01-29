From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/7] dt-bindings: arm: mediatek: remove unused "mediatek,mt7623a"
Date: Tue, 29 Jan 2019 12:31:14 +0800
Message-ID: <53903e2e6d01978e5e5e9de4367042dc6749efa6.1548735271.git.ryder.lee@mediatek.com>
References: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Roy Luo <roychl666@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

As we fallback to use "mediatek,mt7623" for MT7623a, remove unused
root node property "mediatek,mt7623a" in the document.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index 8f260e5..a3d1b4f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -15,8 +15,7 @@ compatible: Must contain one of
    "mediatek,mt6795"
    "mediatek,mt6797"
    "mediatek,mt7622"
-   "mediatek,mt7623" which is referred to MT7623N SoC
-   "mediatek,mt7623a"
+   "mediatek,mt7623"
    "mediatek,mt8127"
    "mediatek,mt8135"
    "mediatek,mt8173"
-- 
1.9.1
