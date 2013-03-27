From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] ssbi: use module_platform_driver to simplify the code
Date: Wed, 27 Mar 2013 21:14:16 +0800
Message-ID: <CAPgLHd8NYrrWnNMbpa+pBAC87_ZYJDkoneHMB7=0m+1FiUQv_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: davidb@codeaurora.org, dwalker@fifo99.com, bryanh@codeaurora.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

module_platform_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/ssbi/ssbi.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/ssbi/ssbi.c b/drivers/ssbi/ssbi.c
index f32da02..f667204 100644
--- a/drivers/ssbi/ssbi.c
+++ b/drivers/ssbi/ssbi.c
@@ -361,17 +361,7 @@ static struct platform_driver ssbi_driver = {
 	},
 };
 
-static int __init ssbi_init(void)
-{
-	return platform_driver_register(&ssbi_driver);
-}
-module_init(ssbi_init);
-
-static void __exit ssbi_exit(void)
-{
-	platform_driver_unregister(&ssbi_driver);
-}
-module_exit(ssbi_exit)
+module_platform_driver(ssbi_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_VERSION("1.0");
