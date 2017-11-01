From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] regmap: Add hardware spinlock support
Date: Wed,  1 Nov 2017 10:11:55 +0800
Message-ID: <00b91de822135699da81f70c4d2b8fecbc113ab1.1509501110.git.baolin.wang@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On some platforms, when reading or writing some special registers through
regmap, we should acquire one hardware spinlock to synchronize between
the multiple subsystems. Thus this patch adds the hardware spinlock
support for regmap.

Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Changes since v1:
 - Move hwspinlock.h including to regmap.c file.
 - Remove hwspin_trylock_xxx() functions.
 - We always set the timeout as maximum values to avoid getting lock failed.
 - Coding style fixes.
---
 drivers/base/regmap/internal.h |    2 +
 drivers/base/regmap/regmap.c   |  101 +++++++++++++++++++++++++++++++++-------
 include/linux/regmap.h         |    6 +++
 3 files changed, 93 insertions(+), 16 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 2a4435d..8641183 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -157,6 +157,8 @@ struct regmap {
 
 	struct rb_root range_tree;
 	void *selector_work_buf;	/* Scratch buffer used for selector */
+
+	struct hwspinlock *hwlock;
 };
 
 struct regcache_ops {
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index b9a779a..999e981 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -20,6 +20,7 @@
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/log2.h>
+#include <linux/hwspinlock.h>
 
 #define CREATE_TRACE_POINTS
 #include "trace.h"
@@ -413,6 +414,49 @@ static unsigned int regmap_parse_64_native(const void *buf)
 }
 #endif
 
+static void regmap_lock_hwlock(void *__map)
+{
+	struct regmap *map = __map;
+
+	hwspin_lock_timeout(map->hwlock, UINT_MAX);
+}
+
+static void regmap_lock_hwlock_irq(void *__map)
+{
+	struct regmap *map = __map;
+
+	hwspin_lock_timeout_irq(map->hwlock, UINT_MAX);
+}
+
+static void regmap_lock_hwlock_irqsave(void *__map)
+{
+	struct regmap *map = __map;
+
+	hwspin_lock_timeout_irqsave(map->hwlock, UINT_MAX,
+				    &map->spinlock_flags);
+}
+
+static void regmap_unlock_hwlock(void *__map)
+{
+	struct regmap *map = __map;
+
+	hwspin_unlock(map->hwlock);
+}
+
+static void regmap_unlock_hwlock_irq(void *__map)
+{
+	struct regmap *map = __map;
+
+	hwspin_unlock_irq(map->hwlock);
+}
+
+static void regmap_unlock_hwlock_irqrestore(void *__map)
+{
+	struct regmap *map = __map;
+
+	hwspin_unlock_irqrestore(map->hwlock, &map->spinlock_flags);
+}
+
 static void regmap_lock_mutex(void *__map)
 {
 	struct regmap *map = __map;
@@ -627,6 +671,29 @@ struct regmap *__regmap_init(struct device *dev,
 		map->lock = config->lock;
 		map->unlock = config->unlock;
 		map->lock_arg = config->lock_arg;
+	} else if (config->hwlock_id) {
+		map->hwlock = hwspin_lock_request_specific(config->hwlock_id);
+		if (!map->hwlock) {
+			ret = -ENXIO;
+			goto err_map;
+		}
+
+		switch (config->hwlock_mode) {
+		case HWLOCK_IRQSTATE:
+			map->lock = regmap_lock_hwlock_irqsave;
+			map->unlock = regmap_unlock_hwlock_irqrestore;
+			break;
+		case HWLOCK_IRQ:
+			map->lock = regmap_lock_hwlock_irq;
+			map->unlock = regmap_unlock_hwlock_irq;
+			break;
+		default:
+			map->lock = regmap_lock_hwlock;
+			map->unlock = regmap_unlock_hwlock;
+			break;
+		}
+
+		map->lock_arg = map;
 	} else {
 		if ((bus && bus->fast_io) ||
 		    config->fast_io) {
@@ -729,7 +796,7 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.format_write = regmap_format_2_6_write;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 
@@ -739,7 +806,7 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.format_write = regmap_format_4_12_write;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 
@@ -749,7 +816,7 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.format_write = regmap_format_7_9_write;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 
@@ -759,7 +826,7 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.format_write = regmap_format_10_14_write;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 
@@ -779,13 +846,13 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.format_reg = regmap_format_16_native;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 
 	case 24:
 		if (reg_endian != REGMAP_ENDIAN_BIG)
-			goto err_map;
+			goto err_hwlock;
 		map->format.format_reg = regmap_format_24;
 		break;
 
@@ -801,7 +868,7 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.format_reg = regmap_format_32_native;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 
@@ -818,13 +885,13 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.format_reg = regmap_format_64_native;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 #endif
 
 	default:
-		goto err_map;
+		goto err_hwlock;
 	}
 
 	if (val_endian == REGMAP_ENDIAN_NATIVE)
@@ -853,12 +920,12 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.parse_val = regmap_parse_16_native;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 	case 24:
 		if (val_endian != REGMAP_ENDIAN_BIG)
-			goto err_map;
+			goto err_hwlock;
 		map->format.format_val = regmap_format_24;
 		map->format.parse_val = regmap_parse_24;
 		break;
@@ -879,7 +946,7 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.parse_val = regmap_parse_32_native;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 #ifdef CONFIG_64BIT
@@ -900,7 +967,7 @@ struct regmap *__regmap_init(struct device *dev,
 			map->format.parse_val = regmap_parse_64_native;
 			break;
 		default:
-			goto err_map;
+			goto err_hwlock;
 		}
 		break;
 #endif
@@ -909,18 +976,18 @@ struct regmap *__regmap_init(struct device *dev,
 	if (map->format.format_write) {
 		if ((reg_endian != REGMAP_ENDIAN_BIG) ||
 		    (val_endian != REGMAP_ENDIAN_BIG))
-			goto err_map;
+			goto err_hwlock;
 		map->use_single_write = true;
 	}
 
 	if (!map->format.format_write &&
 	    !(map->format.format_reg && map->format.format_val))
-		goto err_map;
+		goto err_hwlock;
 
 	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
 	if (map->work_buf == NULL) {
 		ret = -ENOMEM;
-		goto err_map;
+		goto err_hwlock;
 	}
 
 	if (map->format.format_write) {
@@ -1041,6 +1108,8 @@ struct regmap *__regmap_init(struct device *dev,
 err_range:
 	regmap_range_exit(map);
 	kfree(map->work_buf);
+err_hwlock:
+	hwspin_lock_free(map->hwlock);
 err_map:
 	kfree(map);
 err:
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 978abfb..edc32aa 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -273,6 +273,9 @@ struct regmap_access_table {
  *
  * @ranges: Array of configuration entries for virtual address ranges.
  * @num_ranges: Number of range configuration entries.
+ * @hwlock_id: Specify the hardware spinlock id.
+ * @hwlock_mode: The hardware spinlock mode, should be HWLOCK_IRQSTATE,
+ *		 HWLOCK_IRQ or 0.
  */
 struct regmap_config {
 	const char *name;
@@ -317,6 +320,9 @@ struct regmap_config {
 
 	const struct regmap_range_cfg *ranges;
 	unsigned int num_ranges;
+
+	unsigned int hwlock_id;
+	unsigned int hwlock_mode;
 };
 
 /**
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
