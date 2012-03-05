From: Haojian Zhuang <haojian.zhuang@marvell.com>
Subject: [PATCH v2 2/7] rtc: sa1100: add OF support
Date: Mon,  5 Mar 2012 20:21:46 +0800
Message-ID: <1330950111-30797-3-git-send-email-haojian.zhuang@marvell.com>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux@arm.linux.org.uk, eric.y.miao@gmail.com
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
List-Id: devicetree@vger.kernel.org

Add OF support on rtc-sa1100.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/rtc/rtc-sa1100.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 962510c..e443b78 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -30,6 +30,7 @@
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/bitops.h>
 
@@ -349,6 +350,13 @@ static const struct dev_pm_ops sa1100_rtc_pm_ops = {
 };
 #endif
 
+static struct of_device_id sa1100_rtc_dt_ids[] = {
+	{ .compatible = "mrvl,sa1100-rtc", },
+	{ .compatible = "mrvl,mmp-rtc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sa1100_rtc_dt_ids);
+
 static struct platform_driver sa1100_rtc_driver = {
 	.probe		= sa1100_rtc_probe,
 	.remove		= sa1100_rtc_remove,
@@ -357,6 +365,7 @@ static struct platform_driver sa1100_rtc_driver = {
 #ifdef CONFIG_PM
 		.pm	= &sa1100_rtc_pm_ops,
 #endif
+		.of_match_table = sa1100_rtc_dt_ids,
 	},
 };
 
-- 
1.7.0.4
