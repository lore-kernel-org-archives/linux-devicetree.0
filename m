From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] mmc: sdhci-dove: remove duplicated include from sdhci-dove.c
Date: Thu, 1 Nov 2012 13:51:24 +0800
Message-ID: <CAPgLHd_WSwv7yWsnxRrikitMvR8aVPJ6ey5MJJ5jRUVuMofkKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: cjb@laptop.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

dpatch engine is used to auto generate this patch.
(https://github.com/weiyj/dpatch)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mmc/host/sdhci-dove.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-dove.c b/drivers/mmc/host/sdhci-dove.c
index 8fd50a2..2a03f30 100644
--- a/drivers/mmc/host/sdhci-dove.c
+++ b/drivers/mmc/host/sdhci-dove.c
@@ -22,7 +22,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/clk.h>
-#include <linux/err.h>
 #include <linux/module.h>
 #include <linux/mmc/host.h>
 #include <linux/of.h>

