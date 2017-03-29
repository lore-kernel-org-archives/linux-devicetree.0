From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH v4 03/23] drivers/fsi: Add empty master scan
Date: Wed, 29 Mar 2017 12:43:20 -0500
Message-ID: <20170329174340.89109-4-cbostic@linux.vnet.ibm.com>
References: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, rostedt@goodmis.org, mingo@redhat.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Chris Bostic <cbostic@linux.vnet.ibm.com>, andrew@aj.id.au, alistair@popple.id.au, linux-kernel@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>, benh@kernel.crashing.org, joel@jms.id.au
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

When a new fsi master is added, we will need to scan its links, and
slaves attached to those links. This change introduces a little shell to
iterate the links, which we will populate with the actual slave scan in
a later change.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-core.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 2f19509..e90d45d 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -32,7 +32,25 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+/* FSI slave support */
+static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
+{
+	/* todo: initialise slave device, perform engine scan */
+
+	return -ENODEV;
+}
+
 /* FSI master support */
+static int fsi_master_scan(struct fsi_master *master)
+{
+	int link;
+
+	for (link = 0; link < master->n_links; link++)
+		fsi_slave_init(master, link, 0);
+
+	return 0;
+}
+
 int fsi_master_register(struct fsi_master *master)
 {
 	int rc;
@@ -44,10 +62,13 @@ int fsi_master_register(struct fsi_master *master)
 	dev_set_name(&master->dev, "fsi%d", master->idx);
 
 	rc = device_register(&master->dev);
-	if (rc)
+	if (rc) {
 		ida_simple_remove(&master_ida, master->idx);
+		return rc;
+	}
 
-	return rc;
+	fsi_master_scan(master);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
 
-- 
1.8.2.2
