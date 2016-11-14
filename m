From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 2/3] clocksource: update "fn" at CLOCKSOURCE_OF_DECLARE() of nps400 timer
Date: Mon, 14 Nov 2016 11:40:46 +0200
Message-ID: <1479116447-29483-3-git-send-email-noamca@mellanox.com>
References: <1479116447-29483-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479116447-29483-1-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

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

Signed-off-by: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
