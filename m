From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v4 06/11] mtd: brcmnand: add extra SoC support to library
Date: Tue, 12 May 2015 17:53:39 -0700
Message-ID: <1431478424-29230-7-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>, Jonathan Richardson <jonathar@broadcom.com>, Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
List-Id: devicetree@vger.kernel.org

There are a few small hooks required for chips like BCM63138 and the
iProc family. Let's introduce those now.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
---
v4: refactored along with the library-ization

 drivers/mtd/nand/brcmnand/brcmnand.c | 61 +++++++++++++++++++++++++++++++++---
 drivers/mtd/nand/brcmnand/brcmnand.h | 15 +++++++++
 2 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index fb81aac8d4ef..a780768fe5e0 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -119,6 +119,9 @@ struct brcmnand_controller {
 	unsigned int		dma_irq;
 	int			nand_version;
 
+	/* Some SoCs provide custom interrupt status register(s) */
+	struct brcmnand_soc	*soc;
+
 	int			cmd_pending;
 	bool			dma_pending;
 	struct completion	done;
@@ -965,6 +968,17 @@ static irqreturn_t brcmnand_ctlrdy_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/* Handle SoC-specific interrupt hardware */
+static irqreturn_t brcmnand_irq(int irq, void *data)
+{
+	struct brcmnand_controller *ctrl = data;
+
+	if (ctrl->soc->ctlrdy_ack(ctrl->soc))
+		return brcmnand_ctlrdy_irq(irq, data);
+
+	return IRQ_NONE;
+}
+
 static irqreturn_t brcmnand_dma_irq(int irq, void *data)
 {
 	struct brcmnand_controller *ctrl = data;
@@ -1153,12 +1167,18 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	if (native_cmd == CMD_PARAMETER_READ ||
 			native_cmd == CMD_PARAMETER_CHANGE_COL) {
 		int i;
+
+		brcmnand_soc_data_bus_prepare(ctrl->soc);
+
 		/*
 		 * Must cache the FLASH_CACHE now, since changes in
 		 * SECTOR_SIZE_1K may invalidate it
 		 */
 		for (i = 0; i < FC_WORDS; i++)
 			ctrl->flash_cache[i] = brcmnand_read_fc(ctrl, i);
+
+		brcmnand_soc_data_bus_unprepare(ctrl->soc);
+
 		/* Cleanup from HW quirk: restore SECTOR_SIZE_1K */
 		if (host->hwcfg.sector_size_1k)
 			brcmnand_set_sector_size_1k(host,
@@ -1371,10 +1391,15 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 		brcmnand_send_cmd(host, CMD_PAGE_READ);
 		brcmnand_waitfunc(mtd, chip);
 
-		if (likely(buf))
+		if (likely(buf)) {
+			brcmnand_soc_data_bus_prepare(ctrl->soc);
+
 			for (j = 0; j < FC_WORDS; j++, buf++)
 				*buf = brcmnand_read_fc(ctrl, j);
 
+			brcmnand_soc_data_bus_unprepare(ctrl->soc);
+		}
+
 		if (oob)
 			oob += read_oob_from_regs(ctrl, i, oob,
 					mtd->oobsize / trans,
@@ -1546,12 +1571,17 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 				   lower_32_bits(addr));
 		(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
 
-		if (buf)
+		if (buf) {
+			brcmnand_soc_data_bus_prepare(ctrl->soc);
+
 			for (j = 0; j < FC_WORDS; j++, buf++)
 				brcmnand_write_fc(ctrl, j, *buf);
-		else if (oob)
+
+			brcmnand_soc_data_bus_unprepare(ctrl->soc);
+		} else if (oob) {
 			for (j = 0; j < FC_WORDS; j++)
 				brcmnand_write_fc(ctrl, j, 0xffffffff);
+		}
 
 		if (oob) {
 			oob += write_oob_to_regs(ctrl, i, oob,
@@ -1995,6 +2025,11 @@ static int brcmnand_resume(struct device *dev)
 	brcmnand_write_reg(ctrl, BRCMNAND_CS_XOR, ctrl->nand_cs_nand_xor);
 	brcmnand_write_reg(ctrl, BRCMNAND_CORR_THRESHOLD,
 			ctrl->corr_stat_threshold);
+	if (ctrl->soc) {
+		/* Clear/re-enable interrupt */
+		ctrl->soc->ctlrdy_ack(ctrl->soc);
+		ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
+	}
 
 	list_for_each_entry(host, &ctrl->host_list, node) {
 		struct mtd_info *mtd = &host->mtd;
@@ -2139,8 +2174,24 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		return -ENODEV;
 	}
 
-	ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
-			DRV_NAME, ctrl);
+	/*
+	 * Some SoCs integrate this controller (e.g., its interrupt bits) in
+	 * interesting ways
+	 */
+	if (soc) {
+		ctrl->soc = soc;
+
+		ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
+				       DRV_NAME, ctrl);
+
+		/* Enable interrupt */
+		ctrl->soc->ctlrdy_ack(ctrl->soc);
+		ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
+	} else {
+		/* Use standard interrupt infrastructure */
+		ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
+				       DRV_NAME, ctrl);
+	}
 	if (ret < 0) {
 		dev_err(dev, "can't allocate IRQ %d: error %d\n",
 			ctrl->irq, ret);
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
index 5118b29555f0..a20c73630b7b 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/brcmnand/brcmnand.h
@@ -23,8 +23,23 @@ struct dev_pm_ops;
 struct brcmnand_soc {
 	struct platform_device *pdev;
 	void *priv;
+	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
+	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
+	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
 };
 
+static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc)
+{
+	if (soc && soc->prepare_data_bus)
+		soc->prepare_data_bus(soc, true);
+}
+
+static inline void brcmnand_soc_data_bus_unprepare(struct brcmnand_soc *soc)
+{
+	if (soc && soc->prepare_data_bus)
+		soc->prepare_data_bus(soc, false);
+}
+
 static inline u32 brcmnand_readl(void __iomem *addr)
 {
 	/*
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
