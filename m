From: christopher.lee.bostic@gmail.com
Subject: [PATCH v2 07/18] drivers/fsi: Kick off master scan via sysfs
Date: Thu, 12 Jan 2017 16:28:04 -0600
Message-ID: <1484260084-79366-1-git-send-email-christopher.lee.bostic@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, gregkh@linuxfoundation.org, mturquette@baylibre.com, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au, jk@ozlabs.org, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org
Cc: Chris Bostic <cbostic@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: Chris Bostic <cbostic@us.ibm.com>

Move master scan from automatic kick off early in kernel power up
to a scan file that can be invoked at any particular time based
on needs of a given platform.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3160c1c..5f9f7a9 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -53,8 +53,19 @@ static int fsi_master_scan(struct fsi_master *master)
 			fsi_slave_init(master, link, slave_id);
 
 	return 0;
+}
+
+static ssize_t store_scan(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t count)
+{
+	struct fsi_master *master = dev_get_drvdata(dev);
 
+	fsi_master_scan(master);
+	return count;
 }
+static DEVICE_ATTR(scan, 0200, NULL, store_scan);
 
 int fsi_master_register(struct fsi_master *master)
 {
@@ -63,8 +74,8 @@ int fsi_master_register(struct fsi_master *master)
 
 	master->idx = ida_simple_get(&master_ida, 0, 0, GFP_KERNEL);
 	get_device(master->dev);
-	fsi_master_scan(master);
-	return 0;
+	dev_set_drvdata(master->dev, master);
+	return device_create_file(master->dev, &dev_attr_scan);
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
 
-- 
1.8.2.2
