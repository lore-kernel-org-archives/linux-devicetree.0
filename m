From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 01/10] dt-bindings: arm: mediatek: update for MT7623n SoC
 and relevant boards
Date: Mon, 31 Jul 2017 15:36:34 +0800
Message-ID: <ad88de729b4b0f9fe1dba765c27eacf25ca23956.1501486190.git.sean.wang@mediatek.com>
References: <cover.1501486190.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1501486190.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Because there are two versions of MT7623 SoC that is MT7623a and MT7623n
respectively. So update the part of MT7623n bindings to allow that people
tend to differentiate which MT7623 SoC the boards applies.

And "mediatek,mt7623-evb" can be safely changed to
"mediatek,mt7623n-rfb-nand" because mt7623-evb is a kind of debug board
internally in Mediatek which real users can't get. So instead we should
indicate which variants it belongs to with more specific postfix as the
adding here to let people easily know what board they use.

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index da7bd13..cab2074 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -1,7 +1,6 @@
-MediaTek mt65xx, mt67xx & mt81xx Platforms Device Tree Bindings
+MediaTek SoC based Platforms Device Tree Bindings
 
-Boards with a MediaTek mt65xx/mt67xx/mt81xx SoC shall have the
-following property:
+Boards with a MediaTek SoC shall have the following property:
 
 Required root node property:
 
@@ -14,7 +13,7 @@ compatible: Must contain one of
    "mediatek,mt6795"
    "mediatek,mt6797"
    "mediatek,mt7622"
-   "mediatek,mt7623"
+   "mediatek,mt7623" which is referred to MT7623N SoC
    "mediatek,mt8127"
    "mediatek,mt8135"
    "mediatek,mt8173"
@@ -46,9 +45,9 @@ Supported boards:
 - Reference board variant 1 for MT7622:
     Required root node properties:
       - compatible = "mediatek,mt7622-rfb1", "mediatek,mt7622";
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
