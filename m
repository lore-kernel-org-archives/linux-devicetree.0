From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 08/10] fsi: master: Clarify master lifetimes & fix use-after-free in hub master
Date: Mon, 12 Feb 2018 15:45:47 +1030
Message-ID: <20180212051549.8575-9-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212051549.8575-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

Once we call fsi_master_unregister, the core will put_device,
potentially freeing the hub master. This change adds a comment
explaining the lifetime of an allocated fsi_master.

We then add a reference from the driver to the hub master, so it stays
around until we've finished ->remove().

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Tested-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-hub.c | 21 ++++++++++++++++++---
 drivers/fsi/fsi-master.h     | 15 +++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 5e4cd3134bc0..5885fc4a1ef0 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -288,10 +288,19 @@ static int hub_master_probe(struct device *dev)
 	hub_master_init(hub);
 
 	rc = fsi_master_register(&hub->master);
-	if (!rc)
-		return 0;
+	if (rc)
+		goto err_release;
+
+	/* At this point, fsi_master_register performs the device_initialize(),
+	 * and holds the sole reference on master.dev. This means the device
+	 * will be freed (via ->release) during any subsequent call to
+	 * fsi_master_unregister.  We add our own reference to it here, so we
+	 * can perform cleanup (in _remove()) without it being freed before
+	 * we're ready.
+	 */
+	get_device(&hub->master.dev);
+	return 0;
 
-	kfree(hub);
 err_release:
 	fsi_slave_release_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
 			FSI_HUB_LINK_SIZE * links);
@@ -306,6 +315,12 @@ static int hub_master_remove(struct device *dev)
 	fsi_slave_release_range(hub->upstream->slave, hub->addr, hub->size);
 	of_node_put(hub->master.dev.of_node);
 
+	/*
+	 * master.dev will likely be ->release()ed after this, which free()s
+	 * the hub
+	 */
+	put_device(&hub->master.dev);
+
 	return 0;
 }
 
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 18bd4ad79356..ee0b46086026 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -37,6 +37,21 @@ struct fsi_master {
 
 #define dev_to_fsi_master(d) container_of(d, struct fsi_master, dev)
 
+/**
+ * fsi_master registration & lifetime: the fsi_master_register() and
+ * fsi_master_unregister() functions will take ownership of the master, and
+ * ->dev in particular. The registration path performs a get_device(), which
+ * takes the first reference on the device. Similarly, the unregistration path
+ * performs a put_device(), which may well drop the last reference.
+ *
+ * This means that master implementations *may* need to hold their own
+ * reference (via get_device()) on master->dev. In particular, if the device's
+ * ->release callback frees the fsi_master, then fsi_master_unregister will
+ * invoke this free if no other reference is held.
+ *
+ * The same applies for the error path of fsi_master_register; if the call
+ * fails, dev->release will have been invoked.
+ */
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
 
-- 
2.15.1
