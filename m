From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/7] dt-bindings: arm: mediatek: add support for MT7622
 BPI-R64 and MT7629 RFB
Date: Tue, 29 Jan 2019 12:31:15 +0800
Message-ID: <1421bc57f9f4d5f3e087a1fd38c5fa9ef087dd1b.1548735271.git.ryder.lee@mediatek.com>
References: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Roy Luo <roychl666@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Update binding document for MT7622 BPI-R64 and MT7629 reference board.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index a3d1b4f..3ebcc9e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -16,6 +16,7 @@ compatible: Must contain one of
    "mediatek,mt6797"
    "mediatek,mt7622"
    "mediatek,mt7623"
+   "mediatek,mt7629"
    "mediatek,mt8127"
    "mediatek,mt8135"
    "mediatek,mt8173"
@@ -56,6 +57,9 @@ Supported boards:
 - Reference board variant 1 for MT7622:
     Required root node properties:
       - compatible = "mediatek,mt7622-rfb1", "mediatek,mt7622";
+- Bananapi BPI-R64 for MT7622:
+    Required root node properties:
+      - compatible = "bananapi,bpi-r64", "mediatek,mt7622";
 - Reference board for MT7623a with eMMC:
     Required root node properties:
       - compatible = "mediatek,mt7623a-rfb-emmc", "mediatek,mt7623";
@@ -67,6 +71,9 @@ Supported boards:
       - compatible = "mediatek,mt7623n-rfb-emmc", "mediatek,mt7623";
 - Bananapi BPI-R2 board:
       - compatible = "bananapi,bpi-r2", "mediatek,mt7623";
+- Reference board for MT7629:
+    Required root node properties:
+      - compatible = "mediatek,mt7629-rfb", "mediatek,mt7629";
 - MTK mt8127 tablet moose EVB:
     Required root node properties:
       - compatible = "mediatek,mt8127-moose", "mediatek,mt8127";
-- 
1.9.1
