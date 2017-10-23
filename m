From: Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 7/9] soc: mediatek: add dependent clock jpgdec/audio for scpsys
Date: Mon, 23 Oct 2017 12:10:38 +0800
Message-ID: <1508731840-4231-8-git-send-email-weiyi.lu@mediatek.com>
References: <1508731840-4231-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508731840-4231-1-git-send-email-weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are dependent clock jpgdec/audio in scpsys on MT2712,
and will exist three dependent clocks on MT2712 VDEC.

Signed-off-by: Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ba552de..7e7e4ec 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -84,6 +84,8 @@ enum clk_id {
 	CLK_ETHIF,
 	CLK_VDEC,
 	CLK_HIFSEL,
+	CLK_JPGDEC,
+	CLK_AUDIO,
 	CLK_MAX,
 };
 
@@ -96,10 +98,12 @@ enum clk_id {
 	"ethif",
 	"vdec",
 	"hif_sel",
+	"jpgdec",
+	"audio",
 	NULL,
 };
 
-#define MAX_CLKS	2
+#define MAX_CLKS	3
 
 struct scp_domain_data {
 	const char *name;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
