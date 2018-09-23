From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 5/7] soc: rockchip: power-domain: add rk3066 powerdomains
Date: Sun, 23 Sep 2018 17:23:54 +0200
Message-ID: <20180923152356.30154-6-heiko@sntech.de>
References: <20180923152356.30154-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180923152356.30154-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add power-domains found on rk3066 socs.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/soc/rockchip/pm_domains.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soc/rockchip/pm_domains.c b/drivers/soc/rockchip/pm_domains.c
index 58bd39cd3369..4587b27eeb9f 100644
--- a/drivers/soc/rockchip/pm_domains.c
+++ b/drivers/soc/rockchip/pm_domains.c
@@ -21,6 +21,7 @@
 #include <linux/mfd/syscon.h>
 #include <dt-bindings/power/px30-power.h>
 #include <dt-bindings/power/rk3036-power.h>
+#include <dt-bindings/power/rk3066-power.h>
 #include <dt-bindings/power/rk3128-power.h>
 #include <dt-bindings/power/rk3188-power.h>
 #include <dt-bindings/power/rk3228-power.h>
@@ -738,6 +739,14 @@ static const struct rockchip_domain_info rk3036_pm_domains[] = {
 	[RK3036_PD_SYS]		= DOMAIN_RK3036(8, 22, 29, false),
 };
 
+static const struct rockchip_domain_info rk3066_pm_domains[] = {
+	[RK3066_PD_GPU]		= DOMAIN(9, 9, 3, 24, 29, false),
+	[RK3066_PD_VIDEO]	= DOMAIN(8, 8, 4, 23, 28, false),
+	[RK3066_PD_VIO]		= DOMAIN(7, 7, 5, 22, 27, false),
+	[RK3066_PD_PERI]	= DOMAIN(6, 6, 2, 25, 30, false),
+	[RK3066_PD_CPU]		= DOMAIN(-1, 5, 1, 26, 31, false),
+};
+
 static const struct rockchip_domain_info rk3128_pm_domains[] = {
 	[RK3128_PD_CORE]	= DOMAIN_RK3288(0, 0, 4, false),
 	[RK3128_PD_MSCH]	= DOMAIN_RK3288(-1, -1, 6, true),
@@ -855,6 +864,17 @@ static const struct rockchip_pmu_info rk3036_pmu = {
 	.domain_info = rk3036_pm_domains,
 };
 
+static const struct rockchip_pmu_info rk3066_pmu = {
+	.pwr_offset = 0x08,
+	.status_offset = 0x0c,
+	.req_offset = 0x38, /* PMU_MISC_CON1 */
+	.idle_offset = 0x0c,
+	.ack_offset = 0x0c,
+
+	.num_domains = ARRAY_SIZE(rk3066_pm_domains),
+	.domain_info = rk3066_pm_domains,
+};
+
 static const struct rockchip_pmu_info rk3128_pmu = {
 	.pwr_offset = 0x04,
 	.status_offset = 0x08,
@@ -968,6 +988,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
 		.compatible = "rockchip,rk3036-power-controller",
 		.data = (void *)&rk3036_pmu,
 	},
+	{
+		.compatible = "rockchip,rk3066-power-controller",
+		.data = (void *)&rk3066_pmu,
+	},
 	{
 		.compatible = "rockchip,rk3128-power-controller",
 		.data = (void *)&rk3128_pmu,
-- 
2.18.0
