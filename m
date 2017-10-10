From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 3/3] of: overlay_mgr: Add ability to apply several hardware configurations
Date: Mon,  9 Oct 2017 22:34:20 -0700
Message-ID: <1507613660-27236-4-git-send-email-john.stultz@linaro.org>
References: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Dmitry Shmidt <dimitrysh@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Dmitry Shmidt <dimitrysh@google.com>

This adds the ability to specify multiple DT overlay
configurations, which are predefined in the overlay_mgr entry,
at once via the boot arguments.

Example:
  overlay_mgr.overlay_dt_entry=hardware_cfg_0,hardware_cfg_1,...

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Dmitry Shmidt <dimitrysh@google.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
[jstultz: reworded commit message]
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/of/overlay_mgr.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay_mgr.c b/drivers/of/overlay_mgr.c
index 5a082be..6b15f7c 100644
--- a/drivers/of/overlay_mgr.c
+++ b/drivers/of/overlay_mgr.c
@@ -112,12 +112,22 @@ static DEVICE_ATTR(current_overlay, 0644, current_overlay_show,
 
 static int of_overlay_mgr_probe(struct platform_device *pdev)
 {
+	char *cur_entry;
+	char *next_entry;
+
 	if (device_create_file(&pdev->dev, &dev_attr_current_overlay))
 		pr_err("overlay_mgr: fail to register apply entry\n");
 
 	if (!of_overlay_dt_entry)
 		return 0;
-	of_overlay_mgr_apply_dt(&pdev->dev, of_overlay_dt_entry);
+	next_entry = of_overlay_dt_entry;
+	do {
+		cur_entry = next_entry;
+		next_entry = strchr(cur_entry, ',');
+		if (next_entry)
+			*next_entry++ = '\0';
+		of_overlay_mgr_apply_dt(&pdev->dev, cur_entry);
+	} while (next_entry);
 	return 0;
 }
 
-- 
2.7.4
