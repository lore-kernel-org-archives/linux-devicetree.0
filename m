From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v7 1/2] regmap: Add one flag to indicate if a hwlock should be used
Date: Mon, 25 Dec 2017 14:37:09 +0800
Message-ID: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Since the hwlock id 0 is valid for hardware spinlock core, but now id 0
is treated as one invalid value for regmap. Thus we should add one extra
flag for regmap config to indicate if a hardware spinlock should be used,
then id 0 can be valid for regmap to request.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 - Add this new patch in V7.
---
 drivers/base/regmap/regmap.c |    2 +-
 include/linux/regmap.h       |    2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index f25ab18..d23a5c9 100644
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
index 15eddc1..c78e005 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -317,6 +317,7 @@ struct regmap_access_table {
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
1.7.9.5
