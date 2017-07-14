From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 1/3] dt-bindings: power: add RK3366 SoCs header for power-domain
Date: Fri, 14 Jul 2017 15:02:41 +0800
Message-ID: <1500015763-4940-2-git-send-email-zhangqing@rock-chips.com>
References: <1500015763-4940-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500015763-4940-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org, tomeu.vizoso@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, wxt@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, wdc@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

According to a description from TRM, add all the power domains.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 include/dt-bindings/power/rk3366-power.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/power/rk3366-power.h

diff --git a/include/dt-bindings/power/rk3366-power.h b/include/dt-bindings/power/rk3366-power.h
new file mode 100644
index 000000000000..223a3dce049a
--- /dev/null
+++ b/include/dt-bindings/power/rk3366-power.h
@@ -0,0 +1,24 @@
+#ifndef __DT_BINDINGS_POWER_RK3366_POWER_H__
+#define __DT_BINDINGS_POWER_RK3366_POWER_H__
+
+/* VD_CORE */
+#define RK3366_PD_A53_0		0
+#define RK3366_PD_A53_1		1
+#define RK3366_PD_A53_2		2
+#define RK3366_PD_A53_3		3
+
+/* VD_LOGIC */
+#define RK3366_PD_BUS		4
+#define RK3366_PD_PERI		5
+#define RK3366_PD_VIO		6
+#define RK3366_PD_VIDEO		7
+#define RK3366_PD_RKVDEC	8
+#define RK3366_PD_WIFIBT	9
+#define RK3366_PD_VPU		10
+#define RK3366_PD_GPU		11
+#define RK3366_PD_ALIVE		12
+
+/* VD_PMU */
+#define RK3366_PD_PMU		13
+
+#endif
-- 
1.9.1
