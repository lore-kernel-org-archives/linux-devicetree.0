From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 1/4] dt-bindings: media: mtk-cir: Add support for MT7622 SoC
Date: Fri, 30 Jun 2017 14:03:04 +0800
Message-ID: <a778a3a33a273f00d3ff071d62fe672a207d949c.1498794408.git.sean.wang@mediatek.com>
References: <cover.1498794408.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1498794408.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Document the devicetree bindings for CIR on MediaTek MT7622
SoC.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/media/mtk-cir.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mtk-cir.txt b/Documentation/devicetree/bindings/media/mtk-cir.txt
index 2be2005..5e18087 100644
--- a/Documentation/devicetree/bindings/media/mtk-cir.txt
+++ b/Documentation/devicetree/bindings/media/mtk-cir.txt
@@ -2,10 +2,14 @@ Device-Tree bindings for Mediatek consumer IR controller
 found in Mediatek SoC family
 
 Required properties:
-- compatible	    : "mediatek,mt7623-cir"
+- compatible	    : Should be
+			"mediatek,mt7623-cir": for MT7623 SoC
+			"mediatek,mt7622-cir": for MT7622 SoC
 - clocks	    : list of clock specifiers, corresponding to
 		      entries in clock-names property;
-- clock-names	    : should contain "clk" entries;
+- clock-names	    : should contain
+			- "clk" entries: for MT7623 SoC
+			- "clk", "bus" entries: for MT7622 SoC
 - interrupts	    : should contain IR IRQ number;
 - reg		    : should contain IO map address for IR.
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
