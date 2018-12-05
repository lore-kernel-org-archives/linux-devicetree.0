From: Rob Herring <robh@kernel.org>
Subject: [PATCH] scsi: qlogicpti: Use of_node_name_eq for node name comparisons
Date: Wed,  5 Dec 2018 13:50:40 -0600
Message-ID: <20181205195050.4759-24-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert string compares of DT node names to use of_node_name_eq helper
instead. This removes direct access to the node name pointer.

As prom_name is not used for anything else, remove it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/scsi/qlogicpti.c | 3 +--
 drivers/scsi/qlogicpti.h | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index 9d09228eee28..4f14963c4270 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -1315,8 +1315,7 @@ static int qpti_sbus_probe(struct platform_device *op)
 	qpti->qhost = host;
 	qpti->op = op;
 	qpti->qpti_id = nqptis;
-	strcpy(qpti->prom_name, op->dev.of_node->name);
-	qpti->is_pti = strcmp(qpti->prom_name, "QLGC,isp");
+	qpti->is_pti = !of_node_name_eq(op->dev.of_node, "QLGC,isp");
 
 	if (qpti_map_regs(qpti) < 0)
 		goto fail_unlink;
diff --git a/drivers/scsi/qlogicpti.h b/drivers/scsi/qlogicpti.h
index 884ad72ade57..2b6374e08a7d 100644
--- a/drivers/scsi/qlogicpti.h
+++ b/drivers/scsi/qlogicpti.h
@@ -364,7 +364,6 @@ struct qlogicpti {
 	int                       qpti_id;
 	int                       scsi_id;
 	int                       prom_node;
-	char                      prom_name[64];
 	int                       irq;
 	char                      differential, ultra, clock;
 	unsigned char             bursts;
@@ -379,7 +378,7 @@ struct qlogicpti {
 #define SREG_IMASK                0x0c   /* Interrupt level            */
 #define SREG_SPMASK               0x03   /* Mask for switch pack       */
 	unsigned char             swsreg;
-	unsigned int	
+	unsigned int
 		gotirq	:	1,	/* this instance got an irq */
 		is_pti	: 	1;	/* Non-zero if this is a PTI board. */
 };
-- 
2.19.1
