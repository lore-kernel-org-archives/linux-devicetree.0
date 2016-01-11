From: zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 1/3] dt-bindings: add power-domain header for RK3368 SoCs
Date: Mon, 11 Jan 2016 02:36:38 -0800
Message-ID: <1452508600-3512-2-git-send-email-zhangqing@rock-chips.com>
References: <1452508600-3512-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452508600-3512-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

According to a description from TRM, add all the power domains.

Signed-off-by: zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 include/dt-bindings/power/rk3368-power.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/power/rk3368-power.h

diff --git a/include/dt-bindings/power/rk3368-power.h b/include/dt-bindings/power/rk3368-power.h
new file mode 100644
index 0000000..93633d5
--- /dev/null
+++ b/include/dt-bindings/power/rk3368-power.h
@@ -0,0 +1,28 @@
+#ifndef __DT_BINDINGS_POWER_RK3368_POWER_H__
+#define __DT_BINDINGS_POWER_RK3368_POWER_H__
+
+/* VD_CORE */
+#define RK3368_PD_A53_L0	0
+#define RK3368_PD_A53_L1	1
+#define RK3368_PD_A53_L2	2
+#define RK3368_PD_A53_L3	3
+#define RK3368_PD_SCU_L		4
+#define RK3368_PD_A53_B0	5
+#define RK3368_PD_A53_B1	6
+#define RK3368_PD_A53_B2	7
+#define RK3368_PD_A53_B3	8
+#define RK3368_PD_SCU_B		9
+
+/* VD_LOGIC */
+#define RK3368_PD_BUS		10
+#define RK3368_PD_PERI		11
+#define RK3368_PD_VIO		12
+#define RK3368_PD_ALIVE		13
+#define RK3368_PD_VIDEO		14
+#define RK3368_PD_GPU_0		15
+#define RK3368_PD_GPU_1		16
+
+/* VD_PMU */
+#define RK3368_PD_PMU		17
+
+#endif
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
