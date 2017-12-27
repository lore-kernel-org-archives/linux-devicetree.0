From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regmap: Add one flag to indicate if a hwlock should be used" to the regmap tree
Date: Wed, 27 Dec 2017 10:39:54 +0000 (GMT)
Message-ID: <20171227103954.25E3644006B@finisterre.ee.mobilebroadband>
References: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.orgbroonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.orglinux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regmap: Add one flag to indicate if a hwlock should be used

has been applied to the regmap tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From a4887813c3a9481ab87c8a71ab1de50b975cc823 Mon Sep 17 00:00:00 2001
From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Mon, 25 Dec 2017 14:37:09 +0800
Subject: [PATCH] regmap: Add one flag to indicate if a hwlock should be used

Since the hwlock id 0 is valid for hardware spinlock core, but now id 0
is treated as one invalid value for regmap. Thus we should add one extra
flag for regmap config to indicate if a hardware spinlock should be used,
then id 0 can be valid for regmap to request.

Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/base/regmap/regmap.c | 2 +-
 include/linux/regmap.h       | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index f25ab18ca057..d23a5c99b639 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -671,7 +671,7 @@ struct regmap *__regmap_init(struct device *dev,
 		map->lock = config->lock;
 		map->unlock = config->unlock;
 		map->lock_arg = config->lock_arg;
-	} else if (config->hwlock_id) {
+	} else if (config->use_hwlock) {
 		map->hwlock = hwspin_lock_request_specific(config->hwlock_id);
 		if (!map->hwlock) {
 			ret = -ENXIO;
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 15eddc1353ba..c78e0057df66 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -317,6 +317,7 @@ typedef void (*regmap_unlock)(void *);
  *
  * @ranges: Array of configuration entries for virtual address ranges.
  * @num_ranges: Number of range configuration entries.
+ * @use_hwlock: Indicate if a hardware spinlock should be used.
  * @hwlock_id: Specify the hardware spinlock id.
  * @hwlock_mode: The hardware spinlock mode, should be HWLOCK_IRQSTATE,
  *		 HWLOCK_IRQ or 0.
@@ -365,6 +366,7 @@ struct regmap_config {
 	const struct regmap_range_cfg *ranges;
 	unsigned int num_ranges;
 
+	bool use_hwlock;
 	unsigned int hwlock_id;
 	unsigned int hwlock_mode;
 };
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
