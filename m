From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] clk: rockchip: rk3288: add VOP1 softresets and rename VOP0 softresets
Date: Fri, 12 Sep 2014 18:33:23 +0800
Message-ID: <1410518004-19040-1-git-send-email-mark.yao@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dkl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kfx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, yxj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The rk3288 have two vop, and each vop has three softresets were axi_reset,
ahb_reset and dclk_reset.

Signed-off-by: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 include/dt-bindings/clock/rk3288-cru.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index ebcb460..4d65959 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -235,9 +235,9 @@
 #define SRST_RGA_NIU		97
 #define SRST_VIO0_NIU_AXI	98
 #define SRST_VIO_NIU_AHB	99
-#define SRST_LCDC0_AXI		100
-#define SRST_LCDC0_AHB		101
-#define SRST_LCDC0_DCLK		102
+#define SRST_VOP0_AXI		100
+#define SRST_VOP0_AHB		101
+#define SRST_VOP0_DCLK		102
 #define SRST_VIO1_NIU_AXI	103
 #define SRST_VIP		104
 #define SRST_RGA_CORE		105
@@ -276,3 +276,7 @@
 #define SRST_USBHOST1_CON	140
 #define SRST_USB_ADP		141
 #define SRST_ACC_EFUSE		142
+
+#define SRST_VOP1_AXI		176
+#define SRST_VOP1_AHB		177
+#define SRST_VOP1_DCLK		178
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
