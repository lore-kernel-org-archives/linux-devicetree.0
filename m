From: zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/2] soc: rockchip: power-domain: Modify power domain driver for rk3368
Date: Fri,  8 Jan 2016 10:37:41 -0800
Message-ID: <1452278261-16864-3-git-send-email-zhangqing@rock-chips.com>
References: <1452278261-16864-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452278261-16864-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver is modified to support RK3368 SoC.

Signed-off-by: zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/soc/rockchip/pm_domains.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/soc/rockchip/pm_domains.c b/drivers/soc/rockchip/pm_domains.c
index 534c589..6cdffb1 100644
--- a/drivers/soc/rockchip/pm_domains.c
+++ b/drivers/soc/rockchip/pm_domains.c
@@ -18,6 +18,7 @@
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <dt-bindings/power/rk3288-power.h>
+#include <dt-bindings/power/rk3368-power.h>
 
 struct rockchip_domain_info {
 	int pwr_mask;
@@ -75,6 +76,9 @@ struct rockchip_pmu {
 #define DOMAIN_RK3288(pwr, status, req)		\
 	DOMAIN(pwr, status, req, req, (req) + 16)
 
+#define DOMAIN_RK3368(pwr, status, req)		\
+	DOMAIN(pwr, status, req, (req) + 16, req)
+
 static bool rockchip_pmu_domain_is_idle(struct rockchip_pm_domain *pd)
 {
 	struct rockchip_pmu *pmu = pd->pmu;
@@ -444,6 +448,14 @@ static const struct rockchip_domain_info rk3288_pm_domains[] = {
 	[RK3288_PD_GPU]		= DOMAIN_RK3288(9, 9, 2),
 };
 
+static const struct rockchip_domain_info rk3368_pm_domains[] = {
+	[RK3368_PD_PERI]	= DOMAIN_RK3368(13, 12, 6),
+	[RK3368_PD_VIO]		= DOMAIN_RK3368(15, 14, 8),
+	[RK3368_PD_VIDEO]	= DOMAIN_RK3368(14, 13, 7),
+	[RK3368_PD_GPU_0]	= DOMAIN_RK3368(16, 15, 2),
+	[RK3368_PD_GPU_1]	= DOMAIN_RK3368(17, 16, 2),
+};
+
 static const struct rockchip_pmu_info rk3288_pmu = {
 	.pwr_offset = 0x08,
 	.status_offset = 0x0c,
@@ -461,11 +473,32 @@ static const struct rockchip_pmu_info rk3288_pmu = {
 	.domain_info = rk3288_pm_domains,
 };
 
+static const struct rockchip_pmu_info rk3368_pmu = {
+	.pwr_offset = 0x0c,
+	.status_offset = 0x10,
+	.req_offset = 0x3c,
+	.idle_offset = 0x40,
+	.ack_offset = 0x40,
+
+	.core_pwrcnt_offset = 0x48,
+	.gpu_pwrcnt_offset = 0x50,
+
+	.core_power_transition_time = 24,
+	.gpu_power_transition_time = 24,
+
+	.num_domains = ARRAY_SIZE(rk3368_pm_domains),
+	.domain_info = rk3368_pm_domains,
+};
+
 static const struct of_device_id rockchip_pm_domain_dt_match[] = {
 	{
 		.compatible = "rockchip,rk3288-power-controller",
 		.data = (void *)&rk3288_pmu,
 	},
+	{
+		.compatible = "rockchip,rk3368-power-controller",
+		.data = (void *)&rk3368_pmu,
+	},
 	{ /* sentinel */ },
 };
 
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
