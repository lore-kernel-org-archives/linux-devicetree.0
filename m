From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v9 03/10] clk: mediatek: Refine the makefile to support
 multiple clock drivers
Date: Wed, 22 Jun 2016 15:40:22 +0800
Message-ID: <1466581229-2342-4-git-send-email-erin.lo@mediatek.com>
References: <1466581229-2342-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1466581229-2342-1-git-send-email-erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add a Kconfig to define clock configuration for each SoC, and
modify the Makefile to build drivers that only selected in config.

Signed-off-by: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Tested-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/Kconfig           |  1 +
 drivers/clk/mediatek/Kconfig  | 23 +++++++++++++++++++++++
 drivers/clk/mediatek/Makefile |  6 +++---
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/mediatek/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 53ddba2..665c03b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -208,6 +208,7 @@ config COMMON_CLK_OXNAS
 
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
+source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/renesas/Kconfig"
diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
new file mode 100644
index 0000000..dc224e6
--- /dev/null
+++ b/drivers/clk/mediatek/Kconfig
@@ -0,0 +1,23 @@
+#
+# MediaTek SoC drivers
+#
+config COMMON_CLK_MEDIATEK
+	bool
+	---help---
+	  Mediatek SoCs' clock support.
+
+config COMMON_CLK_MT8135
+	bool "Clock driver for Mediatek MT8135"
+	depends on COMMON_CLK
+	select COMMON_CLK_MEDIATEK
+	default ARCH_MEDIATEK
+	---help---
+	  This driver supports Mediatek MT8135 clocks.
+
+config COMMON_CLK_MT8173
+	bool "Clock driver for Mediatek MT8173"
+	depends on COMMON_CLK
+	select COMMON_CLK_MEDIATEK
+	default ARCH_MEDIATEK
+	---help---
+	  This driver supports Mediatek MT8173 clocks.
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 95fdfac..32e7222 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -1,4 +1,4 @@
-obj-y += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o
+obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o
 obj-$(CONFIG_RESET_CONTROLLER) += reset.o
-obj-y += clk-mt8135.o
-obj-y += clk-mt8173.o
+obj-$(CONFIG_COMMON_CLK_MT8135) += clk-mt8135.o
+obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173.o
-- 
1.9.1
