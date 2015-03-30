From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/5] clk: hisi: refine parameter checking for init
Date: Mon, 30 Mar 2015 13:24:20 +0800
Message-ID: <1427693064-11062-2-git-send-email-leo.yan@linaro.org>
References: <1427693064-11062-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427693064-11062-1-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

*of_iomap()* will check the device node pointer, and if the pointer is
NULL it will return error code. So refine clock's init flow by checking
the device node with this simple way; and polish a little for the print
out message.

Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/hisilicon/clk.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index a078e84..1951b37 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -45,14 +45,9 @@ struct hisi_clock_data __init *hisi_clk_init(struct device_node *np,
 	struct clk **clk_table;
 	void __iomem *base;
 
-	if (np) {
-		base = of_iomap(np, 0);
-		if (!base) {
-			pr_err("failed to map Hisilicon clock registers\n");
-			goto err;
-		}
-	} else {
-		pr_err("failed to find Hisilicon clock node in DTS\n");
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("%s: failed to map clock registers\n", __func__);
 		goto err;
 	}
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
