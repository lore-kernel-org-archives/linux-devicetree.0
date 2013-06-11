From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v3 1/2] i2c: designware: use module_platform_driver
Date: Tue, 11 Jun 2013 10:37:09 +0800
Message-ID: <1370918230-24793-2-git-send-email-zhangfei.gao@linaro.org>
References: <1370918230-24793-1-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1370918230-24793-1-git-send-email-zhangfei.gao@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <wsa@the-dreams.de>, Dirk Brandewie <dirk.brandewie@gmail.com>, baruch@tkos.co.il
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Instead of use platform_driver_probe, use module_platform_driver
To support deferred probing
Also subsys_initcall may too early to auto set pinctl

Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
CC: Baruch Siach <baruch@tkos.co.il>
---
 drivers/i2c/busses/i2c-designware-platdrv.c |   14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 35b70a1..41659c0 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -231,6 +231,7 @@ static SIMPLE_DEV_PM_OPS(dw_i2c_dev_pm_ops, dw_i2c_suspend, dw_i2c_resume);
 MODULE_ALIAS("platform:i2c_designware");
 
 static struct platform_driver dw_i2c_driver = {
+	.probe		= dw_i2c_probe,
 	.remove		= dw_i2c_remove,
 	.driver		= {
 		.name	= "i2c_designware",
@@ -240,18 +241,7 @@ static struct platform_driver dw_i2c_driver = {
 		.pm	= &dw_i2c_dev_pm_ops,
 	},
 };
-
-static int __init dw_i2c_init_driver(void)
-{
-	return platform_driver_probe(&dw_i2c_driver, dw_i2c_probe);
-}
-subsys_initcall(dw_i2c_init_driver);
-
-static void __exit dw_i2c_exit_driver(void)
-{
-	platform_driver_unregister(&dw_i2c_driver);
-}
-module_exit(dw_i2c_exit_driver);
+module_platform_driver(dw_i2c_driver);
 
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter");
-- 
1.7.9.5
