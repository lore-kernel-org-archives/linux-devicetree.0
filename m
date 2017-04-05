From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH v5 02/23] drivers/fsi: Add slave definition
Date: Tue,  4 Apr 2017 21:05:46 -0500
Message-ID: <20170405020607.79939-3-cbostic@linux.vnet.ibm.com>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, rostedt@goodmis.org, mingo@redhat.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org, Chris Bostic <cbostic@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

Add the initial fsi slave device, which is private to the core code.
This will be a child of the master, and parent to endpoint devices.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ca02913..2f19509 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -22,6 +22,16 @@
 
 static DEFINE_IDA(master_ida);
 
+struct fsi_slave {
+	struct device		dev;
+	struct fsi_master	*master;
+	int			id;
+	int			link;
+	uint32_t		size;	/* size of slave address space */
+};
+
+#define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
+
 /* FSI master support */
 int fsi_master_register(struct fsi_master *master)
 {
-- 
1.8.2.2
