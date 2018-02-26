Return-Path: <SRS0=8w0u=FU=mleia.com=vz@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 2/2] hwrng: mxc-rnga - add driver support on boards with device tree
Date: Mon, 26 Feb 2018 20:38:49 +0200
Message-Id: <20180226183849.11562-3-vz@mleia.com>
In-Reply-To: <20180226183849.11562-1-vz@mleia.com>
References: <20180226183849.11562-1-vz@mleia.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The driver works well on i.MX31 powered boards with device description
taken from board device tree, the only change to add to the driver is
the missing OF device id, the affected list of included headers and
platform driver struct are beautified a little.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/char/hw_random/mxc-rnga.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/char/hw_random/mxc-rnga.c b/drivers/char/hw_random/mxc-rnga.c
index 4673622..b749e00 100644
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
@@ -197,10 +194,19 @@ static int __exit mxc_rnga_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id mxc_rnga_of_match[] = {
+	{ .compatible = "fsl,imx31-rnga", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mxc_rnga_of_match);
+#endif
+
 static struct platform_driver mxc_rnga_driver = {
 	.driver = {
-		   .name = "mxc_rnga",
-		   },
+		.name = "mxc_rnga",
+		.of_match_table = of_match_ptr(mxc_rnga_of_match),
+	},
 	.remove = __exit_p(mxc_rnga_remove),
 };
 
-- 
2.10.2
