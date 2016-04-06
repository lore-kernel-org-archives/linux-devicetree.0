From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Wed, 06 Apr 2016 21:30:27 +0200
Message-ID: <570563D3.9080704@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de> <1452486886-8049-2-git-send-email-marex@denx.de> <57053F81.70204@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080709050400060109030307"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57053F81.70204-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------080709050400060109030307
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 04/06/2016 06:55 PM, R, Vignesh wrote:
> Hi Marek,

Hi!

> I encountered a issue with this driver while testing.

Try with the attached patches, I am planning to use them for V11
submission. I think you're hitting the problem with missing buslock.

> On 1/11/2016 10:04 AM, Marek Vasut wrote:
>> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> Add support for the Cadence QSPI controller. This controller is
>> present in the Altera SoCFPGA SoCs and this driver has been tested
>> on the Cyclone V SoC.
> 
> 
>> +static void cqspi_switch_cs(struct spi_nor *nor)
>> +{
>> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
>> +	struct cqspi_st *cqspi = f_pdata->cqspi;
>> +	void __iomem *iobase = cqspi->iobase;
>> +	unsigned int reg;
>> +
>> +	cqspi_controller_enable(cqspi, 0);
>> +
>> +	/* configure page size and block size. */
>> +	reg = readl(iobase + CQSPI_REG_SIZE);
>> +	reg &= ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_LSB);
>> +	reg &= ~(CQSPI_REG_SIZE_BLOCK_MASK << CQSPI_REG_SIZE_BLOCK_LSB);
>> +	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
>> +	reg |= (nor->page_size << CQSPI_REG_SIZE_PAGE_LSB);
>> +	reg |= (ilog2(nor->mtd.erasesize) << CQSPI_REG_SIZE_BLOCK_LSB);
>> +	reg |= (nor->addr_width - 1);
>> +	writel(reg, iobase + CQSPI_REG_SIZE);
>> +
> 
> Page size and block size are configured here...
> 
>> +	/* configure the chip select */
>> +	cqspi_chipselect(nor);
>> +
>> +	cqspi_controller_enable(cqspi, 1);
>> +}
>> +
>> +static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>> +{
>> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
>> +	struct cqspi_st *cqspi = f_pdata->cqspi;
>> +	const unsigned int sclk = f_pdata->clk_rate;
>> +
>> +	/* Switch chip select. */
>> +	if (cqspi->current_cs != f_pdata->cs) {
>> +		cqspi->current_cs = f_pdata->cs;
>> +		cqspi_switch_cs(nor);
> 
> cqspi_switch_cs(nor) is called from cqspi_prep(). And is called only
> once for a given slave (assuming only one slave on the QSPI bus)
> 
>> +	}
>> +
>> +	/* Setup baudrate divisor and delays */
>> +	if (cqspi->sclk != sclk) {
>> +		cqspi->sclk = sclk;
>> +		cqspi_controller_enable(cqspi, 0);
>> +		cqspi_config_baudrate_div(cqspi, sclk);
>> +		cqspi_delay(nor, sclk);
>> +		cqspi_readdata_capture(cqspi, 1, f_pdata->read_delay);
>> +		cqspi_controller_enable(cqspi, 1);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int cqspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>> +{
>> +	int ret;
>> +
>> +	ret = cqspi_set_protocol(nor, nor->reg_proto);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cqspi_prep(nor, SPI_NOR_OPS_READ);
> 
> cqspi_read_reg() is first called to read JEDEC ID, this calls
> cqspi_prep() for first time. But nor->page_size, nor->mtd.erasesize are
> not yet populated. Therefore cqspi_switch_cs() will not populate
> CQSPI_REG_SIZE with correct values.
> I think its better to configure this register each time during
> read/write ops.
> 
> Regards
> Vignesh
> 


-- 
Best regards,
Marek Vasut

--------------080709050400060109030307
Content-Type: text/x-patch;
 name="0001-mtd-spi-nor-cqspi-Reinit-completion-during-indirect-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-mtd-spi-nor-cqspi-Reinit-completion-during-indirect-.pa";
 filename*1="tch"

>From 6a649c8263149b06d29a3acc91b63fb0c1728deb Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Date: Wed, 23 Mar 2016 08:26:46 +0100
Subject: [PATCH 1/3] mtd: spi-nor: cqspi: Reinit completion during indirect
 read and write

Reinit the completion structures when performing indirect I/O. This
does not manifest as a bug, but is necessary to make the code fully
correct.

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index d9a7a67..a4d246c 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -527,6 +527,9 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor,
 			remaining -= bytes_to_read;
 			bytes_to_read = cqspi_get_rd_sram_level(cqspi);
 		}
+
+		if (remaining > 0)
+			reinit_completion(&cqspi->transfer_complete);
 	}
 
 	/* Check indirect done status */
@@ -616,6 +619,9 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor,
 
 		txbuf += write_bytes;
 		remaining -= write_bytes;
+
+		if (remaining > 0)
+			reinit_completion(&cqspi->transfer_complete);
 	}
 
 	/* Check indirect done status */
-- 
2.7.0


--------------080709050400060109030307
Content-Type: text/x-patch;
 name="0002-mtd-spi-nor-cqspi-Optimize-the-control-reconfigurati.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-mtd-spi-nor-cqspi-Optimize-the-control-reconfigurati.pa";
 filename*1="tch"

>From 30391427f34193d9229e70bf62794cbcb733b047 Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Date: Wed, 23 Mar 2016 08:27:50 +0100
Subject: [PATCH 2/3] mtd: spi-nor: cqspi: Optimize the control reconfiguration

Always disable and re-enable the controller only once when switching
the chipselect and bus speed instead of doing so twice.

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index a4d246c..ee309cb 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -905,8 +905,6 @@ static void cqspi_switch_cs(struct spi_nor *nor)
 	void __iomem *iobase = cqspi->iobase;
 	unsigned int reg;
 
-	cqspi_controller_enable(cqspi, 0);
-
 	/* configure page size and block size. */
 	reg = readl(iobase + CQSPI_REG_SIZE);
 	reg &= ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_LSB);
@@ -919,8 +917,6 @@ static void cqspi_switch_cs(struct spi_nor *nor)
 
 	/* configure the chip select */
 	cqspi_chipselect(nor);
-
-	cqspi_controller_enable(cqspi, 1);
 }
 
 static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
@@ -928,23 +924,29 @@ static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	struct cqspi_flash_pdata *f_pdata = nor->priv;
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	const unsigned int sclk = f_pdata->clk_rate;
+	const int switch_cs = (cqspi->current_cs != f_pdata->cs);
+	const int switch_ck = (cqspi->sclk != sclk);
+
+	if (switch_cs || switch_ck)
+		cqspi_controller_enable(cqspi, 0);
 
 	/* Switch chip select. */
-	if (cqspi->current_cs != f_pdata->cs) {
+	if (switch_cs) {
 		cqspi->current_cs = f_pdata->cs;
 		cqspi_switch_cs(nor);
 	}
 
 	/* Setup baudrate divisor and delays */
-	if (cqspi->sclk != sclk) {
+	if (switch_ck) {
 		cqspi->sclk = sclk;
-		cqspi_controller_enable(cqspi, 0);
 		cqspi_config_baudrate_div(cqspi, sclk);
 		cqspi_delay(nor, sclk);
 		cqspi_readdata_capture(cqspi, 1, f_pdata->read_delay);
-		cqspi_controller_enable(cqspi, 1);
 	}
 
+	if (switch_cs || switch_ck)
+		cqspi_controller_enable(cqspi, 1);
+
 	return 0;
 }
 
-- 
2.7.0


--------------080709050400060109030307
Content-Type: text/x-patch;
 name="0003-mtd-spi-nor-cqspi-Add-bus-lock.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0003-mtd-spi-nor-cqspi-Add-bus-lock.patch"

>From e680fa497cf0e2f41fe1b56c7d6b868596d8e420 Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Date: Wed, 23 Mar 2016 08:30:47 +0100
Subject: [PATCH 3/3] mtd: spi-nor: cqspi: Add bus lock

Lock the whole bus in .prepare callback and unlock the whole bus
in the .unprepare callback. This is necessary to prevent a race
condition when accessing two flashes, each of which has it's own
instance of struct spi_nor, in parallel. The SPI NOR framework
only locks the mutex in struct spi_nor and therefore the locking
happens with per-flash granularity, which is not enough to prevent
concurrent access to the SPI NOR controller registers.

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index ee309cb..b086609 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -63,6 +63,7 @@ struct cqspi_st {
 	void __iomem		*iobase;
 	void __iomem		*ahb_base;
 	struct completion	transfer_complete;
+	struct mutex		bus_mutex;
 
 	int			current_cs;
 	unsigned long		master_ref_clk_hz;
@@ -919,7 +920,7 @@ static void cqspi_switch_cs(struct spi_nor *nor)
 	cqspi_chipselect(nor);
 }
 
-static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
+static int cqspi_prep_unlocked(struct spi_nor *nor, enum spi_nor_ops ops)
 {
 	struct cqspi_flash_pdata *f_pdata = nor->priv;
 	struct cqspi_st *cqspi = f_pdata->cqspi;
@@ -950,31 +951,51 @@ static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	return 0;
 }
 
+static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
+{
+	struct cqspi_flash_pdata *f_pdata = nor->priv;
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+
+	mutex_lock(&cqspi->bus_mutex);
+
+	return cqspi_prep_unlocked(nor, ops);
+}
+
+static void cqspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
+{
+	struct cqspi_flash_pdata *f_pdata = nor->priv;
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+
+	mutex_unlock(&cqspi->bus_mutex);
+}
+
 static int cqspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
 	int ret;
 
 	ret = cqspi_set_protocol(nor, nor->reg_proto);
 	if (ret)
-		return ret;
+		goto exit;
 
-	cqspi_prep(nor, SPI_NOR_OPS_READ);
+	cqspi_prep_unlocked(nor, SPI_NOR_OPS_READ);
 
 	ret = cqspi_command_read(nor, &opcode, 1, buf, len);
+exit:
 	return ret;
 }
 
 static int cqspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
-	int ret = 0;
+	int ret;
 
 	ret = cqspi_set_protocol(nor, nor->reg_proto);
 	if (ret)
-		return ret;
+		goto exit;
 
-	cqspi_prep(nor, SPI_NOR_OPS_WRITE);
+	cqspi_prep_unlocked(nor, SPI_NOR_OPS_WRITE);
 
 	ret = cqspi_command_write(nor, opcode, buf, len);
+exit:
 	return ret;
 }
 
@@ -1113,6 +1134,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 		nor->write = cqspi_write;
 		nor->erase = cqspi_erase;
 		nor->prepare = cqspi_prep;
+		nor->unprepare = cqspi_unprep;
 
 		mtd->name = kasprintf(GFP_KERNEL, "%s.%d", dev_name(dev), cs);
 		if (!mtd->name) {
@@ -1154,6 +1176,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	if (!cqspi)
 		return -ENOMEM;
 
+	mutex_init(&cqspi->bus_mutex);
 	cqspi->pdev = pdev;
 	platform_set_drvdata(pdev, cqspi);
 
-- 
2.7.0


--------------080709050400060109030307--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
