From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] clk: hisi: use clk_register_mux_table in hisi_clk_register_mux
Date: Tue, 22 Apr 2014 19:46:52 +0800
Message-ID: <1398167214-1604-2-git-send-email-zhangfei.gao@linaro.org>
References: <1398167214-1604-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398167214-1604-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Platform hix5hd2 use mux table, so use clk_register_mux_table instead

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/hisilicon/clk.c |   13 ++++++++-----
 drivers/clk/hisilicon/clk.h |    1 +
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 276f672..2699388 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -127,11 +127,14 @@ void __init hisi_clk_register_mux(struct hisi_mux_clock *clks,
 	int i;
 
 	for (i = 0; i < nums; i++) {
-		clk = clk_register_mux(NULL, clks[i].name, clks[i].parent_names,
-				       clks[i].num_parents, clks[i].flags,
-				       base + clks[i].offset, clks[i].shift,
-				       clks[i].width, clks[i].mux_flags,
-				       &hisi_clk_lock);
+		u32 mask = BIT(clks[i].width) - 1;
+
+		clk = clk_register_mux_table(NULL, clks[i].name,
+					clks[i].parent_names,
+					clks[i].num_parents, clks[i].flags,
+					base + clks[i].offset, clks[i].shift,
+					mask, clks[i].mux_flags,
+					clks[i].table, &hisi_clk_lock);
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 43fa5da..bc39a6a 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -62,6 +62,7 @@ struct hisi_mux_clock {
 	u8			shift;
 	u8			width;
 	u8			mux_flags;
+	u32			*table;
 	const char		*alias;
 };
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
