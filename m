From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 1/7] dt-bindings: add power-domain header for RK3188 SoCs
Date: Sun, 23 Sep 2018 17:23:50 +0200
Message-ID: <20180923152356.30154-2-heiko@sntech.de>
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

Add rk3188 power-domains as described by the TRM.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 include/dt-bindings/power/rk3188-power.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/power/rk3188-power.h

diff --git a/include/dt-bindings/power/rk3188-power.h b/include/dt-bindings/power/rk3188-power.h
new file mode 100644
index 000000000000..820db55fc4b7
--- /dev/null
+++ b/include/dt-bindings/power/rk3188-power.h
@@ -0,0 +1,23 @@
+#ifndef __DT_BINDINGS_POWER_RK3188_POWER_H__
+#define __DT_BINDINGS_POWER_RK3188_POWER_H__
+
+/* VD_CORE */
+#define RK3188_PD_A9_0		0
+#define RK3188_PD_A9_1		1
+#define RK3188_PD_A9_2		2
+#define RK3188_PD_A9_3		3
+#define RK3188_PD_DBG		4
+#define RK3188_PD_SCU		5
+
+/* VD_LOGIC */
+#define RK3188_PD_VIDEO		6
+#define RK3188_PD_VIO		7
+#define RK3188_PD_GPU		8
+#define RK3188_PD_PERI		9
+#define RK3188_PD_CPU		10
+#define RK3188_PD_ALIVE		11
+
+/* VD_PMU */
+#define RK3188_PD_RTC		12
+
+#endif
-- 
2.18.0
