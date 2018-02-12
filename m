From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 07/10] fsi: core: Reduce console output during normal scan
Date: Mon, 12 Feb 2018 15:45:46 +1030
Message-ID: <20180212051549.8575-8-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212051549.8575-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

To reduce amount of console output during boot / power up make
all normal path scan related messages debug type.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Acked-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-core.c       | 4 ++--
 drivers/fsi/fsi-master-hub.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1069cb402bd3..8d8b25809452 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -207,7 +207,7 @@ static int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 	if (rc)
 		return rc;
 
-	dev_info(&slave->dev, "status: 0x%08x, sisc: 0x%08x\n",
+	dev_dbg(&slave->dev, "status: 0x%08x, sisc: 0x%08x\n",
 			be32_to_cpu(stat), be32_to_cpu(irq));
 
 	/* clear interrupts */
@@ -687,7 +687,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 		return -EIO;
 	}
 
-	dev_info(&master->dev, "fsi: found chip %08x at %02x:%02x:%02x\n",
+	dev_dbg(&master->dev, "fsi: found chip %08x at %02x:%02x:%02x\n",
 			chip_id, master->idx, link, id);
 
 	rc = fsi_slave_set_smode(master, link, id);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 3223a671a0ef..5e4cd3134bc0 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -254,7 +254,7 @@ static int hub_master_probe(struct device *dev)
 
 	reg = be32_to_cpu(__reg);
 	links = (reg >> 8) & 0xff;
-	dev_info(dev, "hub version %08x (%d links)\n", reg, links);
+	dev_dbg(dev, "hub version %08x (%d links)\n", reg, links);
 
 	rc = fsi_slave_claim_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
 			FSI_HUB_LINK_SIZE * links);
-- 
2.15.1
