From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] clk: hisi: add API for allocation clk data struct
Date: Thu, 26 Mar 2015 19:13:36 +0800
Message-ID: <1427368419-22222-2-git-send-email-leo.yan@linaro.org>
References: <1427368419-22222-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427368419-22222-1-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In the old clk init function, it will read the register base address
from dts and allocate the clk data structures. But for the some cases,
the clock driver don't need init the reg's base address, which will
directly access mmio region with syscon.

So for clock's initialization, this patch adds one more API which is
only for allocating clock data structure.

Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/hisilicon/clk.c | 42 +++++++++++++++++++++++++++---------------
 drivers/clk/hisilicon/clk.h |  2 ++
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index a078e84..1e4c5c6 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -38,30 +38,17 @@
 
 static DEFINE_SPINLOCK(hisi_clk_lock);
 
-struct hisi_clock_data __init *hisi_clk_init(struct device_node *np,
-					     int nr_clks)
+struct hisi_clock_data __init *hisi_clk_alloc_data(struct device_node *np,
+						   int nr_clks)
 {
 	struct hisi_clock_data *clk_data;
 	struct clk **clk_table;
-	void __iomem *base;
-
-	if (np) {
-		base = of_iomap(np, 0);
-		if (!base) {
-			pr_err("failed to map Hisilicon clock registers\n");
-			goto err;
-		}
-	} else {
-		pr_err("failed to find Hisilicon clock node in DTS\n");
-		goto err;
-	}
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data) {
 		pr_err("%s: could not allocate clock data\n", __func__);
 		goto err;
 	}
-	clk_data->base = base;
 
 	clk_table = kzalloc(sizeof(struct clk *) * nr_clks, GFP_KERNEL);
 	if (!clk_table) {
@@ -72,12 +59,37 @@ struct hisi_clock_data __init *hisi_clk_init(struct device_node *np,
 	clk_data->clk_data.clk_num = nr_clks;
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data->clk_data);
 	return clk_data;
+
 err_data:
 	kfree(clk_data);
 err:
 	return NULL;
 }
 
+struct hisi_clock_data __init *hisi_clk_init(struct device_node *np,
+					     int nr_clks)
+{
+	struct hisi_clock_data *clk_data;
+	void __iomem *base;
+
+	if (np) {
+		base = of_iomap(np, 0);
+		if (!base) {
+			pr_err("failed to map Hisilicon clock registers\n");
+			return NULL;
+		}
+		printk("%s: base %p\n", __func__, base);
+	} else {
+		pr_err("failed to find Hisilicon clock node in DTS\n");
+		return NULL;
+	}
+
+	clk_data = hisi_clk_alloc_data(np, nr_clks);
+	if (clk_data)
+		clk_data->base = base;
+	return clk_data;
+}
+
 void __init hisi_clk_register_fixed_rate(struct hisi_fixed_rate_clock *clks,
 					 int nums, struct hisi_clock_data *data)
 {
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 31083ff..624f608 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -96,6 +96,8 @@ struct clk *hisi_register_clkgate_sep(struct device *, const char *,
 				u8, spinlock_t *);
 
 struct hisi_clock_data __init *hisi_clk_init(struct device_node *, int);
+struct hisi_clock_data __init *hisi_clk_alloc_data(struct device_node *np,
+						   int nr_clks);
 void __init hisi_clk_register_fixed_rate(struct hisi_fixed_rate_clock *,
 					int, struct hisi_clock_data *);
 void __init hisi_clk_register_fixed_factor(struct hisi_fixed_factor_clock *,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
