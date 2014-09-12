From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] clk: rockchip: rk3288: add reset indices for SOFTRST9-11
Date: Fri, 12 Sep 2014 19:45:27 +0800
Message-ID: <1410522327-23175-1-git-send-email-mark.yao@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dkl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kfx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, yxj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The patch add the rest of the indices of the additional reset
registers from the updated TRM.

Signed-off-by: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 include/dt-bindings/clock/rk3288-cru.h | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index ebcb460..e65d522 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -276,3 +276,46 @@
 #define SRST_USBHOST1_CON	140
 #define SRST_USB_ADP		141
 #define SRST_ACC_EFUSE		142
+
+#define SRST_CORESIGHT		144
+#define SRST_PD_CORE_AHB_NOC	145
+#define SRST_PD_CORE_APB_NOC	146
+#define SRST_PD_CORE_MP_AXI	147
+#define SRST_GIC		148
+#define SRST_LCDC_PWM0		149
+#define SRST_LCDC_PWM1		150
+#define SRST_VIO0_H2P_BRG	151
+#define SRST_VIO1_H2P_BRG	152
+#define SRST_RGA_H2P_BRG	153
+#define SRST_HEVC		154
+#define SRST_TSADC		159
+
+#define SRST_DDRPHY0		160
+#define SRST_DDRPHY0_APB	161
+#define SRST_DDRCTRL0		162
+#define SRST_DDRCTRL0_APB	163
+#define SRST_DDRPHY0_CTRL	164
+#define SRST_DDRPHY1		165
+#define SRST_DDRPHY1_APB	166
+#define SRST_DDRCTRL1		167
+#define SRST_DDRCTRL1_APB	168
+#define SRST_DDRPHY1_CTRL	169
+#define SRST_DDRMSCH0		170
+#define SRST_DDRMSCH1		171
+#define SRST_CRYPTO		174
+#define SRST_C2C_HOST		175
+
+#define SRST_LCDC1_AXI		176
+#define SRST_LCDC1_AHB		177
+#define SRST_LCDC1_DCLK		178
+#define SRST_UART0		179
+#define SRST_UART1		180
+#define SRST_UART2		181
+#define SRST_UART3		182
+#define SRST_UART4		183
+#define SRST_SIMC		186
+#define SRST_PS2C		187
+#define SRST_TSP		188
+#define SRST_TSP_CLKIN0		189
+#define SRST_TSP_CLKIN1		190
+#define SRST_TSP_27M		191
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
