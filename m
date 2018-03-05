Return-Path: <SRS0=ZXHR=F3=mleia.com=vz@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v2 2/2] hwrng: mxc-rnga - add driver support on boards with device tree
Date: Tue,  6 Mar 2018 00:21:00 +0200
Message-Id: <20180305222100.29351-3-vz@mleia.com>
In-Reply-To: <20180305222100.29351-1-vz@mleia.com>
References: <20180305222100.29351-1-vz@mleia.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The driver works well on i.MX31 powered boards with device description
taken from board device tree, the only change to add to the driver is
the missing OF device id, the affected list of included headers and
indentation in platform driver struct are beautified a little.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
Changes from v1 to v2:
* a kernel for iMX boards is always built with multiplatform support,
  thus CONFIG_OF guards were removed, thanks to Kim Phillips for review,
* added "fsl,imx21-rnga" compatible to the list.

 drivers/char/hw_random/mxc-rnga.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/char/hw_random/mxc-rnga.c b/drivers/char/hw_random/mxc-rnga.c
index 4673622..f83bee5 100644
--- a/drivers/char/hw_random/mxc-rnga.c
+++ b/drivers/char/hw_random/mxc-rnga.c
@@ -16,16 +16,13 @@
  * This driver is based on other RNG drivers.
  */
 
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
 #include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/ioport.h>
-#include <linux/platform_device.h>
-#include <linux/hw_random.h>
 #include <linux/delay.h>
+#include <linux/hw_random.h>
 #include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 /* RNGA Registers */
 #define RNGA_CONTROL			0x00
@@ -197,10 +194,18 @@ static int __exit mxc_rnga_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id mxc_rnga_of_match[] = {
+	{ .compatible = "fsl,imx21-rnga", },
+	{ .compatible = "fsl,imx31-rnga", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mxc_rnga_of_match);
+
 static struct platform_driver mxc_rnga_driver = {
 	.driver = {
-		   .name = "mxc_rnga",
-		   },
+		.name = "mxc_rnga",
+		.of_match_table = mxc_rnga_of_match,
+	},
 	.remove = __exit_p(mxc_rnga_remove),
 };
 
-- 
2.10.2
