From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] clk: hisi: add stub clock register function
Date: Thu, 26 Mar 2015 19:13:39 +0800
Message-ID: <1427368419-22222-5-git-send-email-leo.yan@linaro.org>
References: <1427368419-22222-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427368419-22222-1-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add stub clock register function, so can easily enable stub clock for
platforms.

Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/hisilicon/clk.c | 29 +++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk.h | 12 ++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 1e4c5c6..74ce813 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -244,3 +244,32 @@ void __init hisi_clk_register_gate_sep(struct hisi_gate_clock *clks,
 		data->clk_data.clks[clks[i].id] = clk;
 	}
 }
+
+void __init hisi_clk_register_stub(struct hisi_stub_clock *clks, int nums,
+				   struct hisi_clock_data *data,
+				   struct device_node *np)
+{
+	struct clk *clk;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		clk = hisi_register_stub_clk(np,
+					     clks[i].id,
+					     clks[i].name,
+					     clks[i].parent_name,
+					     clks[i].flags,
+					     &hisi_clk_lock);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n",
+			       __func__, clks[i].name);
+			continue;
+		}
+
+		if (clks[i].alias)
+			clk_register_clkdev(clk, clks[i].name, NULL);
+
+		data->clk_data.clks[clks[i].id] = clk;
+	}
+
+	return;
+}
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index e99184a..89ce9ad 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -90,6 +90,14 @@ struct hisi_gate_clock {
 	const char		*alias;
 };
 
+struct hisi_stub_clock {
+	unsigned int		id;
+	char			*name;
+	const char		*parent_name;
+	unsigned long		flags;
+	const char		*alias;
+};
+
 struct clk *hisi_register_clkgate_sep(struct device *, const char *,
 				const char *, unsigned long,
 				void __iomem *, u8,
@@ -113,4 +121,8 @@ void __init hisi_clk_register_gate(struct hisi_gate_clock *,
 					int, struct hisi_clock_data *);
 void __init hisi_clk_register_gate_sep(struct hisi_gate_clock *,
 					int, struct hisi_clock_data *);
+void __init hisi_clk_register_stub(struct hisi_stub_clock *clks, int nums,
+				   struct hisi_clock_data *data,
+				   struct device_node *np);
+
 #endif	/* __HISI_CLK_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
