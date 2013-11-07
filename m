From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 22/31] mtd: nand: pxa3xx: Split prepare_command_pool() in two stages
Date: Thu,  7 Nov 2013 12:17:26 -0300
Message-ID: <1383837455-30721-23-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383837455-30721-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit splits the prepare_command_pool() function into two
stages: prepare_start_command() / prepare_set_command().

This is a preparation patch without any functionality changes,
and is meant to allow support for multiple page reading/writing
operations.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/pxa3xx_nand.c | 44 ++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 552f92a..d3f3959 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -607,18 +607,8 @@ static void set_command_address(struct pxa3xx_nand_info *info,
 	}
 }
 
-static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
-		uint16_t column, int page_addr)
+static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 {
-	int addr_cycle, exec_cmd;
-	struct pxa3xx_nand_host *host;
-	struct mtd_info *mtd;
-
-	host = info->host[info->cs];
-	mtd = host->mtd;
-	addr_cycle = 0;
-	exec_cmd = 1;
-
 	/* reset data and oob column point to handle data */
 	info->buf_start		= 0;
 	info->buf_count		= 0;
@@ -627,10 +617,6 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	info->use_spare		= 1;
 	info->retcode		= ERR_NONE;
 	info->ndcb3		= 0;
-	if (info->cs != 0)
-		info->ndcb0 = NDCB0_CSEL;
-	else
-		info->ndcb0 = 0;
 
 	switch (command) {
 	case NAND_CMD_READ0:
@@ -642,14 +628,32 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	case NAND_CMD_PARAM:
 		info->use_spare = 0;
 		break;
-	case NAND_CMD_SEQIN:
-		exec_cmd = 0;
-		break;
 	default:
 		info->ndcb1 = 0;
 		info->ndcb2 = 0;
 		break;
 	}
+}
+
+static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
+		uint16_t column, int page_addr)
+{
+	int addr_cycle, exec_cmd;
+	struct pxa3xx_nand_host *host;
+	struct mtd_info *mtd;
+
+	host = info->host[info->cs];
+	mtd = host->mtd;
+	addr_cycle = 0;
+	exec_cmd = 1;
+
+	if (info->cs != 0)
+		info->ndcb0 = NDCB0_CSEL;
+	else
+		info->ndcb0 = 0;
+
+	if (command == NAND_CMD_SEQIN)
+		exec_cmd = 0;
 
 	addr_cycle = NDCB0_ADDR_CYC(host->row_addr_cycles
 				    + host->col_addr_cycles);
@@ -784,8 +788,10 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		nand_writel(info, NDTR1CS0, info->ndtr1cs0);
 	}
 
+	prepare_start_command(info, command);
+
 	info->state = STATE_PREPARED;
-	exec_cmd = prepare_command_pool(info, command, column, page_addr);
+	exec_cmd = prepare_set_command(info, command, column, page_addr);
 	if (exec_cmd) {
 		init_completion(&info->cmd_complete);
 		init_completion(&info->dev_ready);
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
