From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH RFC 4/4] w1: ds2760: add devicetree matching glue
Date: Tue, 19 Jun 2018 23:27:44 +0200
Message-ID: <20180619212744.794-5-daniel@zonque.org>
References: <20180619212744.794-1-daniel@zonque.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619212744.794-1-daniel@zonque.org>
Sender: linux-kernel-owner@vger.kernel.org
To: zbr@ioremap.net, robh+dt@kernel.org, mark.rutland@arm.com, szabolcs.gyurko@tlt.hu
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

Add an id table for ds2760 so it can be matched by the core.

Also, refrain from allocating the platform device for the supply driver at
runtime when the device was matched via DT, because in this case, supply
devices are also probed with device tree nodes, so they will always be
present.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/w1/slaves/w1_ds2760.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/w1/slaves/w1_ds2760.c b/drivers/w1/slaves/w1_ds2760.c
index 26168abfb8b8..a737a96204ed 100644
--- a/drivers/w1/slaves/w1_ds2760.c
+++ b/drivers/w1/slaves/w1_ds2760.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/idr.h>
 #include <linux/gfp.h>
+#include <linux/of.h>
 
 #include <linux/w1.h>
 
@@ -131,6 +132,9 @@ static int w1_ds2760_add_slave(struct w1_slave *sl)
 	int ret;
 	struct platform_device *pdev;
 
+	if (sl->dev.of_node)
+		return 0;
+
 	pdev = platform_device_alloc("ds2760-battery", PLATFORM_DEVID_AUTO);
 	if (!pdev)
 		return -ENOMEM;
@@ -154,9 +158,17 @@ static void w1_ds2760_remove_slave(struct w1_slave *sl)
 {
 	struct platform_device *pdev = dev_get_drvdata(&sl->dev);
 
-	platform_device_unregister(pdev);
+	if (!sl->dev.of_node)
+		platform_device_unregister(pdev);
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id w1_ds2760_of_ids[] = {
+	{ .compatible = "maxim,w1-ds2760" },
+	{}
+};
+#endif
+
 static struct w1_family_ops w1_ds2760_fops = {
 	.add_slave    = w1_ds2760_add_slave,
 	.remove_slave = w1_ds2760_remove_slave,
@@ -166,6 +178,7 @@ static struct w1_family_ops w1_ds2760_fops = {
 static struct w1_family w1_ds2760_family = {
 	.fid = W1_FAMILY_DS2760,
 	.fops = &w1_ds2760_fops,
+	.of_match_table = of_match_ptr(w1_ds2760_of_ids),
 };
 module_w1_family(w1_ds2760_family);
 
-- 
2.17.1
