From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 3/4] clk: hix5hd2: add watchdog0 clocks
Date: Mon, 22 Sep 2014 11:20:15 +0800
Message-ID: <1411356016-20553-4-git-send-email-zhangfei.gao@linaro.org>
References: <1411356016-20553-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411356016-20553-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guoxiong Yan <yanguoxiong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Guoxiong Yan <yanguoxiong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

hix5hd2 add watchdog0 clocks

Signed-off-by: Guoxiong Yan <yanguoxiong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/hisilicon/clk-hix5hd2.c       |    5 +++++
 include/dt-bindings/clock/hix5hd2-clock.h |    2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/hisilicon/clk-hix5hd2.c b/drivers/clk/hisilicon/clk-hix5hd2.c
index 13d6ec2..6e97e54 100644
--- a/drivers/clk/hisilicon/clk-hix5hd2.c
+++ b/drivers/clk/hisilicon/clk-hix5hd2.c
@@ -95,6 +95,11 @@ static struct hisi_gate_clock hix5hd2_gate_clks[] __initdata = {
 	{ HIX5HD2_FWD_SYS_CLK, "clk_fwd_sys", "clk_fwd_bus", 0, 0xcc, 5, 0, },
 	{ HIX5HD2_MAC0_PHY_CLK, "clk_fephy", "clk_fwd_sys",
 		 CLK_SET_RATE_PARENT, 0x120, 0, 0, },
+	/* wdg0 */
+	{ HIX5HD2_WDG0_CLK, "clk_wdg0", "24m",
+		CLK_SET_RATE_PARENT, 0x178, 0, 0, },
+	{ HIX5HD2_WDG0_RST, "rst_wdg0", "clk_wdg0",
+		CLK_SET_RATE_PARENT, 0x178, 4, CLK_GATE_SET_TO_DISABLE, },
 };
 
 enum hix5hd2_clk_type {
diff --git a/include/dt-bindings/clock/hix5hd2-clock.h b/include/dt-bindings/clock/hix5hd2-clock.h
index 5bd4135..b8e3c9d 100644
--- a/include/dt-bindings/clock/hix5hd2-clock.h
+++ b/include/dt-bindings/clock/hix5hd2-clock.h
@@ -60,6 +60,8 @@
 #define HIX5HD2_SD_CIU_CLK		136
 #define HIX5HD2_SD_BIU_CLK		137
 #define HIX5HD2_SD_CIU_RST		138
+#define HIX5HD2_WDG0_CLK		139
+#define HIX5HD2_WDG0_RST		140
 
 /* complex */
 #define HIX5HD2_MAC0_CLK		192
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
