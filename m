From: <sean.wang@mediatek.com>
Subject: [PATCH v4 1/9] dt-bindings: arm: mediatek: update for MT7623n SoC and
 relevant boards
Date: Thu, 25 May 2017 12:02:39 +0800
Message-ID: <ec281bfc67e633873bb519e607aca67213454b6d.1495683769.git.sean.wang@mediatek.com>
References: <cover.1495683769.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1495683769.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Because there are two versions of MT7623 SoC that is MT7623a and MT7623n
respectively. So update the part of MT7623n bindings to allow that people
tend to differentiate which MT7623 SoC the boards applies.

And "mediatek,mt7623-evb" can be safely changed to
"mediatek,mt7623n-rfb-nand" because mt7623-evb is a kind of debug board
internally in Mediatek which real users can't get. So instead we should
indicate which variants it belongs to with more specific postfix as the
adding here to let people easily know what board they use.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index c860b24..0924b62 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -1,6 +1,6 @@
 MediaTek mt65xx, mt67xx & mt81xx Platforms Device Tree Bindings
 
-Boards with a MediaTek mt65xx/mt67xx/mt81xx SoC shall have the
+Boards with a MediaTek mt65xx/mt67xx/mt762x/mt81xx SoC shall have the
 following property:
 
 Required root node property:
@@ -12,7 +12,7 @@ compatible: Must contain one of
    "mediatek,mt6592"
    "mediatek,mt6755"
    "mediatek,mt6795"
-   "mediatek,mt7623"
+   "mediatek,mt7623" which is referred to MT7623N SoC
    "mediatek,mt8127"
    "mediatek,mt8135"
    "mediatek,mt8173"
@@ -38,9 +38,9 @@ Supported boards:
 - Evaluation board for MT6795(Helio X10):
     Required root node properties:
       - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
-- Evaluation board for MT7623:
+- Reference  board for MT7623n with NAND:
     Required root node properties:
-      - compatible = "mediatek,mt7623-evb", "mediatek,mt7623";
+      - compatible = "mediatek,mt7623n-rfb-nand", "mediatek,mt7623";
 - MTK mt8127 tablet moose EVB:
     Required root node properties:
       - compatible = "mediatek,mt8127-moose", "mediatek,mt8127";
-- 
2.7.4
