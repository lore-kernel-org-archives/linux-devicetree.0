From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 6/7] clocksource: sh_cmt: Remove unused "renesas,channels-mask" handling
Date: Mon, 18 Sep 2017 15:46:46 +0200
Message-ID: <1505742407-31576-7-git-send-email-geert+renesas@glider.be>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <damm+renesas@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The in-driver channel configuration in sh_cmt_info.channels_mask is now
always set for all CMT devices instantiated from DT.

Hence the "renesas,channels-mask" property is no longer checked, and its
handling can be removed, cfr. commit 4e18111ff38f0664 ("devicetree:
bindings: Remove deprecated properties").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clocksource/sh_cmt.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 61a9225097065cc4..89c514cf59a44e48 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -946,14 +946,6 @@ static const struct of_device_id sh_cmt_of_table[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(of, sh_cmt_of_table);
 
-static int sh_cmt_parse_dt(struct sh_cmt_device *cmt)
-{
-	struct device_node *np = cmt->pdev->dev.of_node;
-
-	return of_property_read_u32(np, "renesas,channels-mask",
-				    &cmt->hw_channels);
-}
-
 static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 {
 	unsigned int mask;
@@ -968,15 +960,7 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 
 		id = of_match_node(sh_cmt_of_table, pdev->dev.of_node);
 		cmt->info = id->data;
-
-		/* prefer in-driver channel configuration over DT */
-		if (cmt->info->channels_mask) {
-			cmt->hw_channels = cmt->info->channels_mask;
-		} else {
-			ret = sh_cmt_parse_dt(cmt);
-			if (ret < 0)
-				return ret;
-		}
+		cmt->hw_channels = cmt->info->channels_mask;
 	} else if (pdev->dev.platform_data) {
 		struct sh_timer_config *cfg = pdev->dev.platform_data;
 		const struct platform_device_id *id = pdev->id_entry;
-- 
2.7.4
