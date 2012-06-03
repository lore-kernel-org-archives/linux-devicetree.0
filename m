From: Michael Walle <michael@walle.cc>
Subject: [PATCH 1/3] spi-orion: add device tree binding
Date: Sun,  3 Jun 2012 22:17:56 +0200
Message-ID: <1338754678-17000-1-git-send-email-michael@walle.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Michael Walle <michael@walle.cc>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Michael Walle <michael@walle.cc>
---
 .../devicetree/bindings/spi/spi-orion.txt          |    5 +++++
 drivers/spi/spi-orion.c                            |   11 +++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-orion.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-orion.txt b/Documentation/devicetree/bindings/spi/spi-orion.txt
new file mode 100644
index 0000000..e68597a
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-orion.txt
@@ -0,0 +1,5 @@
+Marvell Orion SPI device
+
+Required properties:
+- compatible : should be "marvell,orion-spi".
+- reg : offset and length of the register set for the device
diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index 2760450..2de58bb 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/clk.h>
 #include <asm/unaligned.h>
 
@@ -506,6 +507,7 @@ static int __init orion_spi_probe(struct platform_device *pdev)
 	if (orion_spi_reset(spi) < 0)
 		goto out_rel_mem;
 
+	master->dev.of_node = pdev->dev.of_node;
 	status = spi_register_master(master);
 	if (status < 0)
 		goto out_rel_mem;
@@ -547,10 +549,19 @@ static int __exit orion_spi_remove(struct platform_device *pdev)
 
 MODULE_ALIAS("platform:" DRIVER_NAME);
 
+#ifdef CONFIG_OF
+static const struct of_device_id orion_spi_of_match_table[] __devinitdata = {
+	{ .compatible = "mrvl,orion-spi", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, orion_spi_of_match_table);
+#endif
+
 static struct platform_driver orion_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(orion_spi_of_match_table),
 	},
 	.remove		= __exit_p(orion_spi_remove),
 };
-- 
1.7.2.5
