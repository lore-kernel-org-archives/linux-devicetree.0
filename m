From: Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v9 1/6] clk: hisilicon: export some hisilicon APIs to modules
Date: Mon, 22 Feb 2016 15:47:55 +0800
Message-ID: <1456127280-23275-2-git-send-email-xuejiancheng@huawei.com>
References: <1456127280-23275-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456127280-23275-1-git-send-email-xuejiancheng@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com
Cc: suwenping@hisilicon.com, devicetree@vger.kernel.org, lidongpo@hisilicon.com, yanhaifeng@hisilicon.com, linux-kernel@vger.kernel.org, raojun@hisilicon.com, xuejiancheng@hisilicon.com, gaofei@hisilicon.com, Jiancheng Xue <xuejiancheng@huawei.com>, ml.yang@hisilicon.com, yanghongwei@hisilicon.com, zhangzhenxing@hisilicon.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Change some arguments to constant type.
Export some hisilicon APIs to modules.

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 drivers/clk/hisilicon/clk.c | 23 +++++++++++++++--------
 drivers/clk/hisilicon/clk.h | 14 +++++++-------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 9f8e766..06ec3fe 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -37,7 +37,7 @@
 
 static DEFINE_SPINLOCK(hisi_clk_lock);
 
-struct hisi_clock_data __init *hisi_clk_init(struct device_node *np,
+struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 					     int nr_clks)
 {
 	struct hisi_clock_data *clk_data;
@@ -71,8 +71,9 @@ err_data:
 err:
 	return NULL;
 }
+EXPORT_SYMBOL(hisi_clk_init);
 
-void __init hisi_clk_register_fixed_rate(struct hisi_fixed_rate_clock *clks,
+void hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *clks,
 					 int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -91,8 +92,9 @@ void __init hisi_clk_register_fixed_rate(struct hisi_fixed_rate_clock *clks,
 		data->clk_data.clks[clks[i].id] = clk;
 	}
 }
+EXPORT_SYMBOL(hisi_clk_register_fixed_rate);
 
-void __init hisi_clk_register_fixed_factor(struct hisi_fixed_factor_clock *clks,
+void hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *clks,
 					   int nums,
 					   struct hisi_clock_data *data)
 {
@@ -112,8 +114,9 @@ void __init hisi_clk_register_fixed_factor(struct hisi_fixed_factor_clock *clks,
 		data->clk_data.clks[clks[i].id] = clk;
 	}
 }
+EXPORT_SYMBOL(hisi_clk_register_fixed_factor);
 
-void __init hisi_clk_register_mux(struct hisi_mux_clock *clks,
+void hisi_clk_register_mux(const struct hisi_mux_clock *clks,
 				  int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -141,8 +144,9 @@ void __init hisi_clk_register_mux(struct hisi_mux_clock *clks,
 		data->clk_data.clks[clks[i].id] = clk;
 	}
 }
+EXPORT_SYMBOL(hisi_clk_register_mux);
 
-void __init hisi_clk_register_divider(struct hisi_divider_clock *clks,
+void hisi_clk_register_divider(const struct hisi_divider_clock *clks,
 				      int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -170,8 +174,9 @@ void __init hisi_clk_register_divider(struct hisi_divider_clock *clks,
 		data->clk_data.clks[clks[i].id] = clk;
 	}
 }
+EXPORT_SYMBOL(hisi_clk_register_divider);
 
-void __init hisi_clk_register_gate(struct hisi_gate_clock *clks,
+void hisi_clk_register_gate(const struct hisi_gate_clock *clks,
 				       int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -198,8 +203,9 @@ void __init hisi_clk_register_gate(struct hisi_gate_clock *clks,
 		data->clk_data.clks[clks[i].id] = clk;
 	}
 }
+EXPORT_SYMBOL(hisi_clk_register_gate);
 
-void __init hisi_clk_register_gate_sep(struct hisi_gate_clock *clks,
+void hisi_clk_register_gate_sep(const struct hisi_gate_clock *clks,
 				       int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -226,8 +232,9 @@ void __init hisi_clk_register_gate_sep(struct hisi_gate_clock *clks,
 		data->clk_data.clks[clks[i].id] = clk;
 	}
 }
+EXPORT_SYMBOL(hisi_clk_register_gate_sep);
 
-void __init hi6220_clk_register_divider(struct hi6220_divider_clock *clks,
+void __init hi6220_clk_register_divider(const struct hi6220_divider_clock *clks,
 					int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index b56fbc1..20d64af 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -111,18 +111,18 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 	u8 shift, u8 width, u32 mask_bit, spinlock_t *lock);
 
 struct hisi_clock_data *hisi_clk_init(struct device_node *, int);
-void hisi_clk_register_fixed_rate(struct hisi_fixed_rate_clock *,
+void hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *,
 				int, struct hisi_clock_data *);
-void hisi_clk_register_fixed_factor(struct hisi_fixed_factor_clock *,
+void hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *,
 				int, struct hisi_clock_data *);
-void hisi_clk_register_mux(struct hisi_mux_clock *, int,
+void hisi_clk_register_mux(const struct hisi_mux_clock *, int,
 				struct hisi_clock_data *);
-void hisi_clk_register_divider(struct hisi_divider_clock *,
+void hisi_clk_register_divider(const struct hisi_divider_clock *,
 				int, struct hisi_clock_data *);
-void hisi_clk_register_gate(struct hisi_gate_clock *,
+void hisi_clk_register_gate(const struct hisi_gate_clock *,
 				int, struct hisi_clock_data *);
-void hisi_clk_register_gate_sep(struct hisi_gate_clock *,
+void hisi_clk_register_gate_sep(const struct hisi_gate_clock *,
 				int, struct hisi_clock_data *);
-void hi6220_clk_register_divider(struct hi6220_divider_clock *,
+void hi6220_clk_register_divider(const struct hi6220_divider_clock *,
 				int, struct hisi_clock_data *);
 #endif	/* __HISI_CLK_H */
-- 
1.9.1
