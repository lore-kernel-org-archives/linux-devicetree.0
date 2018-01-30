From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/2] fsi: core: Add check for master property no-scan-on-init
Date: Tue, 30 Jan 2018 16:21:16 +1030
Message-ID: <20180130055116.17411-3-joel@jms.id.au>
References: <20180130055116.17411-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180130055116.17411-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>, Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Prior to scanning a master check if the optional property
no-scan-on-init is present.  If it is then avoid scanning.  This is
necessary in cases where a master scan could interfere with another
FSI master on the same bus.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Acked-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8d8b25809452..4c03d6933646 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -901,6 +901,7 @@ static DEVICE_ATTR(break, 0200, NULL, master_break_store);
 int fsi_master_register(struct fsi_master *master)
 {
 	int rc;
+	struct device_node *np;
 
 	if (!master)
 		return -EINVAL;
@@ -928,7 +929,9 @@ int fsi_master_register(struct fsi_master *master)
 		return rc;
 	}
 
-	fsi_master_scan(master);
+	np = dev_of_node(&master->dev);
+	if (!of_property_read_bool(np, "no-scan-on-init"))
+		fsi_master_scan(master);
 
 	return 0;
 }
-- 
2.15.1
