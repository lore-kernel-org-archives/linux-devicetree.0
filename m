From: Noam Camus <noamca@mellanox.com>
Subject: [RESEND PATCH v7 2/3] clocksource: update "fn" at CLOCKSOURCE_OF_DECLARE() of nps400 timer
Date: Wed, 16 Nov 2016 08:31:12 +0200
Message-ID: <1479277873-18994-3-git-send-email-noamca@mellanox.com>
References: <1479277873-18994-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479277873-18994-1-git-send-email-noamca@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com, Noam Camus <noamca@mellanox.com>
List-Id: devicetree@vger.kernel.org

From: Noam Camus <noamca@mellanox.com>

nps_setup_clocksource() should take node as only argument as defined by
typedef int (*of_init_fn_1_ret)(struct device_node *)

Therefore need to replace:
int __init nps_setup_clocksource(struct device_node *node, struct clk *clk)
with
int __init nps_setup_clocksource(struct device_node *node)

This patch also serve as preparation for next patch which add support
for clockevents to nps400.
Specifically we add new function nps_get_timer_clk() to serve clocksource
and later clockevent registration.

Signed-off-by: Noam Camus <noamca@mellanox.com>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-nps.c |   65 +++++++++++++++++++++++---------------
 1 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c
index 70c149a..0c8e21f 100644
--- a/drivers/clocksource/timer-nps.c
+++ b/drivers/clocksource/timer-nps.c
@@ -46,7 +46,35 @@
 /* This array is per cluster of CPUs (Each NPS400 cluster got 256 CPUs) */
 static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] __read_mostly;
 
-static unsigned long nps_timer_rate;
+static int __init nps_get_timer_clk(struct device_node *node,
+			     unsigned long *timer_freq,
+			     struct clk **clk)
+{
+	int ret;
+
+	*clk = of_clk_get(node, 0);
+	if (IS_ERR(*clk)) {
+		pr_err("timer missing clk");
+		return PTR_ERR(*clk);
+	}
+
+	ret = clk_prepare_enable(*clk);
+	if (ret) {
+		pr_err("Couldn't enable parent clk\n");
+		clk_put(*clk);
+		return ret;
+	}
+
+	*timer_freq = clk_get_rate(*clk);
+	if (!(*timer_freq)) {
+		pr_err("Couldn't get clk rate\n");
+		clk_disable_unprepare(*clk);
+		clk_put(*clk);
+		return -EINVAL;
+	}
+
+	return 0;
+}
 
 static cycle_t nps_clksrc_read(struct clocksource *clksrc)
 {
@@ -55,26 +83,24 @@ static cycle_t nps_clksrc_read(struct clocksource *clksrc)
 	return (cycle_t)ioread32be(nps_msu_reg_low_addr[cluster]);
 }
 
-static int __init nps_setup_clocksource(struct device_node *node,
-					struct clk *clk)
+static int __init nps_setup_clocksource(struct device_node *node)
 {
 	int ret, cluster;
+	struct clk *clk;
+	unsigned long nps_timer1_freq;
+
 
 	for (cluster = 0; cluster < NPS_CLUSTER_NUM; cluster++)
 		nps_msu_reg_low_addr[cluster] =
 			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
-				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
+				     NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
 
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		pr_err("Couldn't enable parent clock\n");
+	ret = nps_get_timer_clk(node, &nps_timer1_freq, &clk);
+	if (ret)
 		return ret;
-	}
 
-	nps_timer_rate = clk_get_rate(clk);
-
-	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "EZnps-tick",
-				    nps_timer_rate, 301, 32, nps_clksrc_read);
+	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "nps-tick",
+				    nps_timer1_freq, 300, 32, nps_clksrc_read);
 	if (ret) {
 		pr_err("Couldn't register clock source.\n");
 		clk_disable_unprepare(clk);
@@ -83,18 +109,5 @@ static int __init nps_setup_clocksource(struct device_node *node,
 	return ret;
 }
 
-static int __init nps_timer_init(struct device_node *node)
-{
-	struct clk *clk;
-
-	clk = of_clk_get(node, 0);
-	if (IS_ERR(clk)) {
-		pr_err("Can't get timer clock.\n");
-		return PTR_ERR(clk);
-	}
-
-	return nps_setup_clocksource(node, clk);
-}
-
 CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
-		       nps_timer_init);
+		       nps_setup_clocksource);
-- 
1.7.1
