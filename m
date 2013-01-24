From: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>
Subject: [PATCH 3/6] davinci: mfd: tps6507x: add device-tree support.
Date: Thu, 24 Jan 2013 16:25:17 +0530
Message-ID: <1359024920-32190-4-git-send-email-manishv.b@ti.com>
References: <1359024920-32190-1-git-send-email-manishv.b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1359024920-32190-1-git-send-email-manishv.b@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, davinci-linux-open-source@linux.davincidsp.com
Cc: khilman@ti.com, manishv.b@ti.com, linux@arm.linux.org.uk, sameo@linux.intel.com, tony@atomide.com, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, rob@landley.net, anilkumar@ti.com, hs@denx.de, lrg@ti.com
List-Id: devicetree@vger.kernel.org

Add device tree based initialization support for TI's
tps6507x mfd device.

Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b@ti.com>
---
 drivers/mfd/tps6507x.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/tps6507x.c b/drivers/mfd/tps6507x.c
index 409afa2..5ad4b77 100644
--- a/drivers/mfd/tps6507x.c
+++ b/drivers/mfd/tps6507x.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
+#include <linux/of_device.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6507x.h>
 
@@ -116,11 +117,19 @@ static const struct i2c_device_id tps6507x_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tps6507x_i2c_id);
 
+#ifdef CONFIG_OF
+static struct of_device_id tps6507x_of_match[] = {
+	{.compatible = "ti,tps6507x", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tps6507x_of_match);
+#endif
 
 static struct i2c_driver tps6507x_i2c_driver = {
 	.driver = {
 		   .name = "tps6507x",
 		   .owner = THIS_MODULE,
+		   .of_match_table = of_match_ptr(tps6507x_of_match),
 	},
 	.probe = tps6507x_i2c_probe,
 	.remove = tps6507x_i2c_remove,
-- 
1.7.4.1
