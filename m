From: <sean.wang@mediatek.com>
Subject: [PATCH v1 04/19] dt-bindings: arm: mediatek: add support for more
 mt7623 reference boards
Date: Fri, 23 Feb 2018 18:16:24 +0800
Message-ID: <e77690ea7f7332e9e1ee64204a4e72c759c41aa9.1519378871.git.sean.wang@mediatek.com>
References: <cover.1519378871.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1519378871.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Update binding document for more mt7623[A,N] reference boards being
supported.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index 91d5178..7d21ab3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -50,6 +50,15 @@ Supported boards:
 - Reference board variant 1 for MT7622:
     Required root node properties:
       - compatible = "mediatek,mt7622-rfb1", "mediatek,mt7622";
+- Reference board for MT7623a with eMMC:
+    Required root node properties:
+      - compatible = "mediatek,mt7623a-rfb-emmc", "mediatek,mt7623";
+- Reference board for MT7623a with NAND:
+    Required root node properties:
+      - compatible = "mediatek,mt7623a-rfb-nand", "mediatek,mt7623";
+- Reference board for MT7623n with eMMC:
+    Required root node properties:
+      - compatible = "mediatek,mt7623n-rfb-emmc", "mediatek,mt7623";
 - Reference  board for MT7623n with NAND:
     Required root node properties:
       - compatible = "mediatek,mt7623n-rfb-nand", "mediatek,mt7623";
-- 
2.7.4
