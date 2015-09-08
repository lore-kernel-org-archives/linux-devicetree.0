From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v18 2/4] ARM: power-domain: rockchip: add all the domain type on RK3288 SoCs
Date: Tue,  8 Sep 2015 14:18:21 +0800
Message-ID: <1441693103-26712-3-git-send-email-wxt@rock-chips.com>
References: <1441693103-26712-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441693103-26712-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

According to a description from TRM, add all the power domains.

At the moment, we can support some domains on RK3288.
We can add more types on RK3288 in the future, that's need to do.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v18: None
Changes in v17:
- delete the ugly chart in the commit.

Changes in v16:
- Add more domain decription.

Changes in v15:
- change the comment.

Changes in v14: None
Changes in v13: None
Changes in v12: None
Changes in v11: None
Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 include/dt-bindings/power-domain/rk3288.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 include/dt-bindings/power-domain/rk3288.h

diff --git a/include/dt-bindings/power-domain/rk3288.h b/include/dt-bindings/power-domain/rk3288.h
new file mode 100644
index 0000000..db5e810
--- /dev/null
+++ b/include/dt-bindings/power-domain/rk3288.h
@@ -0,0 +1,31 @@
+#ifndef __DT_BINDINGS_POWER_DOMAIN_RK3288_H__
+#define __DT_BINDINGS_POWER_DOMAIN_RK3288_H__
+
+/**
+ * RK3288 Power Domain and Voltage Domain Summary.
+ */
+
+/* VD_CORE */
+#define RK3288_PD_A17_0		0
+#define RK3288_PD_A17_1		1
+#define RK3288_PD_A17_2		2
+#define RK3288_PD_A17_3		3
+#define RK3288_PD_SCU		4
+#define RK3288_PD_DEBUG		5
+#define RK3288_PD_MEM		6
+
+/* VD_LOGIC */
+#define RK3288_PD_BUS		7
+#define RK3288_PD_PERI		8
+#define RK3288_PD_VIO		9
+#define RK3288_PD_ALIVE		10
+#define RK3288_PD_HEVC		11
+#define RK3288_PD_VIDEO		12
+
+/* VD_GPU */
+#define RK3288_PD_GPU		13
+
+/* VD_PMU */
+#define RK3288_PD_PMU		14
+
+#endif
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
