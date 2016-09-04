From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 3/4] include: dt-bindings: Add more GPIO bank and index definition for rockchip pinctrl
Date: Sun,  4 Sep 2016 16:35:30 +0800
Message-ID: <1472978130-919-1-git-send-email-andy.yan@rock-chips.com>
References: <1472977937-758-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472977937-758-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are 8 gpio banks on RK3288, so add the missing
RK_GPIO7 and RK_GPIO8. Also add gpio index definition
to make it easier to description GPIO in dts.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 include/dt-bindings/pinctrl/rockchip.h | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/dt-bindings/pinctrl/rockchip.h b/include/dt-bindings/pinctrl/rockchip.h
index 743e66a..fd35350 100644
--- a/include/dt-bindings/pinctrl/rockchip.h
+++ b/include/dt-bindings/pinctrl/rockchip.h
@@ -24,6 +24,41 @@
 #define RK_GPIO3	3
 #define RK_GPIO4	4
 #define RK_GPIO6	6
+#define RK_GPIO7	7
+#define RK_GPIO8	8
+
+#define GPIO_A0		0
+#define GPIO_A1		1
+#define GPIO_A2		2
+#define GPIO_A3		3
+#define GPIO_A4		4
+#define GPIO_A5		5
+#define GPIO_A6		6
+#define GPIO_A7		7
+#define GPIO_B0		8
+#define GPIO_B1		9
+#define GPIO_B2		10
+#define GPIO_B3		11
+#define GPIO_B4		12
+#define GPIO_B5		13
+#define GPIO_B6		14
+#define GPIO_B7		15
+#define GPIO_C0		16
+#define GPIO_C1		17
+#define GPIO_C2		18
+#define GPIO_C3		19
+#define GPIO_C4		20
+#define GPIO_C5		21
+#define GPIO_C6		22
+#define GPIO_C7		23
+#define GPIO_D0		24
+#define GPIO_D1		25
+#define GPIO_D2		26
+#define GPIO_D3		27
+#define GPIO_D4		28
+#define GPIO_D5		29
+#define GPIO_D6		30
+#define GPIO_D7		31
 
 #define RK_FUNC_GPIO	0
 #define RK_FUNC_1	1
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
