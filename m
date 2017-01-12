From: christopher.lee.bostic@gmail.com
Subject: [PATCH v2 02/18] drivers/fsi: add driver to device matches
Date: Thu, 12 Jan 2017 16:21:33 -0600
Message-ID: <1484259693-79062-1-git-send-email-christopher.lee.bostic@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, gregkh@linuxfoundation.org, mturquette@baylibre.com, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au, jk@ozlabs.org, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org
Cc: Chris Bostic <cbostic@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

Driver bind to devices based on the engine types & (optional) versions.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 21 +++++++++++++++++++++
 include/linux/fsi.h    | 21 +++++++++++++++++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3e45306..3d55bd5 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -19,8 +19,29 @@
 
 /* FSI core & Linux bus type definitions */
 
+static int fsi_bus_match(struct device *dev, struct device_driver *drv)
+{
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct fsi_driver *fsi_drv = to_fsi_drv(drv);
+	const struct fsi_device_id *id;
+
+	if (!fsi_drv->id_table)
+		return 0;
+
+	for (id = fsi_drv->id_table; id->engine_type; id++) {
+		if (id->engine_type != fsi_dev->engine_type)
+			continue;
+		if (id->version == FSI_VERSION_ANY ||
+				id->version == fsi_dev->version)
+			return 1;
+	}
+
+	return 0;
+}
+
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
+	.match		= fsi_bus_match,
 };
 EXPORT_SYMBOL_GPL(fsi_bus_type);
 
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index f73886a..273cbf6 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -18,11 +18,28 @@
 #include <linux/device.h>
 
 struct fsi_device {
-	struct device dev;
+	struct device		dev;
+	u8			engine_type;
+	u8			version;
 };
 
+struct fsi_device_id {
+	u8	engine_type;
+	u8	version;
+};
+
+#define FSI_VERSION_ANY		0
+
+#define FSI_DEVICE(t) \
+	.engine_type = (t), .version = FSI_VERSION_ANY,
+
+#define FSI_DEVICE_VERSIONED(t, v) \
+	.engine_type = (t), .version = (v),
+
+
 struct fsi_driver {
-	struct device_driver drv;
+	struct device_driver		drv;
+	const struct fsi_device_id	*id_table;
 };
 
 #define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
-- 
1.8.2.2
