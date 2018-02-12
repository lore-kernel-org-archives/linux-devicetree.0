From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 01/10] fsi: Add fsi_master_rescan()
Date: Mon, 12 Feb 2018 15:45:40 +1030
Message-ID: <20180212051549.8575-2-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212051549.8575-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

We'll want non-core fsi code to trigger a rescan, so introduce a
non-static fsi_master_rescan() function. Use this for the existing
unscan/scan behaviour too.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Christopher Bostic <clbostic@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-core.c   | 10 ++++++++--
 drivers/fsi/fsi-master.h |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e318bf8c623c..6e5aa9b26665 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -762,14 +762,20 @@ static void fsi_master_unscan(struct fsi_master *master)
 	device_for_each_child(&master->dev, NULL, fsi_master_remove_slave);
 }
 
+int fsi_master_rescan(struct fsi_master *master)
+{
+	fsi_master_unscan(master);
+	return fsi_master_scan(master);
+}
+EXPORT_SYMBOL_GPL(fsi_master_rescan);
+
 static ssize_t master_rescan_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t count)
 {
 	struct fsi_master *master = to_fsi_master(dev);
 	int rc;
 
-	fsi_master_unscan(master);
-	rc = fsi_master_scan(master);
+	rc = fsi_master_rescan(master);
 	if (rc < 0)
 		return rc;
 
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 12f7b119567d..18bd4ad79356 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -40,4 +40,6 @@ struct fsi_master {
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
 
+extern int fsi_master_rescan(struct fsi_master *master);
+
 #endif /* DRIVERS_FSI_MASTER_H */
-- 
2.15.1
