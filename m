From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] dt-bindings: nvmem: mediatek: add support for MediaTek MT7623 and MT7622 SoC
Date: Fri, 30 Jun 2017 15:49:00 +0800
Message-ID: <fc06fbe496ac237b961b73d51bb823e4ac2f8578.1498808678.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This updates dt-binding documentation for MediaTek MT7622 and
MT7623 SoC. For the both SoCs supported all rely on the fallback
binding of the generic case with "mediatek,efuse".

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
index 74cf529..0668c45 100644
--- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
@@ -3,7 +3,10 @@
 This binding is intended to represent MTK-EFUSE which is found in most Mediatek SOCs.
 
 Required properties:
-- compatible: should be "mediatek,mt8173-efuse" or "mediatek,efuse"
+- compatible: should be
+	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
+	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
+	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
 - reg: Should contain registers location and length
 
 = Data cells =
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
