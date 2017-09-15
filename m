From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 3/9] dt-bindings: add power-domain header for RK3188 SoCs
Date: Fri, 15 Sep 2017 10:33:51 +0200
Message-ID: <20170915083357.11296-4-heiko@sntech.de>
References: <20170915083357.11296-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915083357.11296-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
