From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v16 2/4] ARM: power-domain: rockchip: add all the domain type
 on RK3288 SoCs
Date: Wed, 12 Aug 2015 12:42:30 +0800
Message-ID: <1439354552-20098-3-git-send-email-wxt@rock-chips.com>
References: <1439354552-20098-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1439354552-20098-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

According to a description from TRM, the following table lists
all the power domains.

------------------------   -------------------------
|VD_CORE               |   |VD_LOGIC    |  PD_VIO  |
|xxxxxxxxxxxxxxxxxxxx  |   |xxxxxxxx    -----------|
|xxxxxxxxxxxxxxxxxxxx  |   |xxxxxxxx               |
|xxxxxxxxxxxxxxxxxxxx  |   |                       |
|xxxxxxxxxxxxxxxxxxxx  |   |---------   -----------|
|                      |   |PD_PERI  |  | PD_VIDEO |
|                      |   |---------   -----------|
|                      |   |---------   -----------|
|                      |   |PD_ALIVE |  | PD_HEVC  |
|---------- ---------- |   |---------   -----------|
||PD_A17_1| |PD_A17_2| |   -------------------------
|---------- ---------- |   |VD_GPU      |PD_GPU    |
|---------- ---------- |   -------------------------
||PD_A17_3| |PD_DEBUG| |   -------------------------
|---------- ---------- |   |VD_PMU      |PD_PMU    |
------------------------   -------------------------
VD_* :  voltage domain
PD_* :  power domain

At the moment, we can support some power-domain type on RK3288.
We can add more types on RK3288 in the future, that's need to do.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v16:
- Add more domain decription.
Series-changes: 15
- change the comment.

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
