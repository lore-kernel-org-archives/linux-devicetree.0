From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 7/7] clocksource: sh_cmt: Use of_device_get_match_data() helper
Date: Mon, 18 Sep 2017 15:46:47 +0200
Message-ID: <1505742407-31576-8-git-send-email-geert+renesas@glider.be>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <damm+renesas@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Use the existing of_device_get_match_data() helper instead of
open-coding its functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clocksource/sh_cmt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 89c514cf59a44e48..70b3cf8e23d01bd8 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -25,6 +25,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -956,10 +957,7 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 	raw_spin_lock_init(&cmt->lock);
 
 	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
-		const struct of_device_id *id;
-
-		id = of_match_node(sh_cmt_of_table, pdev->dev.of_node);
-		cmt->info = id->data;
+		cmt->info = of_device_get_match_data(&pdev->dev);
 		cmt->hw_channels = cmt->info->channels_mask;
 	} else if (pdev->dev.platform_data) {
 		struct sh_timer_config *cfg = pdev->dev.platform_data;
-- 
2.7.4
