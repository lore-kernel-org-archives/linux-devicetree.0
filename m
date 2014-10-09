From: <dinguyen@opensource.altera.com>
Subject: [PATCH] reset: socfpga: use arch_initcall for early initialization
Date: Wed, 8 Oct 2014 21:44:06 -0500
Message-ID: <1412822646-11257-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: dinh.linux@gmail.com, s.trumtrar@pengutronix.de, grant.likely@linaro.org, robh+dt@kernel.org, atull@opensource.altera.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

There are certain drivers that are required to get loaded very early using
arch_initcall. An example of such a driver is the SOCFPGA's FPGA bridge driver.
This driver has to get loaded early because it needs to enable FPGA components
that are connected to the bridge.

This FPGA bridge driver will using the reset controller API to toggle it's
reset bits, thus, it needs the reset driver to be loaded as early as possible
in order for it to get used properly.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 drivers/reset/reset-socfpga.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
index 79c32ca..a5e8d37 100644
--- a/drivers/reset/reset-socfpga.c
+++ b/drivers/reset/reset-socfpga.c
@@ -139,7 +139,20 @@ static struct platform_driver socfpga_reset_driver = {
 		.of_match_table	= socfpga_reset_dt_ids,
 	},
 };
-module_platform_driver(socfpga_reset_driver);
+
+static int __init socfpga_reset_init(void)
+{
+	return platform_driver_probe(&socfpga_reset_driver,
+					socfpga_reset_probe);
+}
+
+static void __exit socfpga_reset_exit(void)
+{
+	platform_driver_unregister(&socfpga_reset_driver);
+}
+
+arch_initcall(socfpga_reset_init);
+module_exit(socfpga_reset_exit);
 
 MODULE_AUTHOR("Steffen Trumtrar <s.trumtrar@pengutronix.de");
 MODULE_DESCRIPTION("Socfpga Reset Controller Driver");
-- 
2.0.3
