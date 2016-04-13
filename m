From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Wed, 13 Apr 2016 17:06:52 +0200
Message-ID: <570E608C.1030901@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de> <1452486886-8049-2-git-send-email-marex@denx.de> <57053F81.70204@ti.com> <570563D3.9080704@denx.de> <5705E858.3050700@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090601060807080702050507"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5705E858.3050700-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------090601060807080702050507
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 04/07/2016 06:55 AM, Vignesh R wrote:
> 
> 
> On 04/07/2016 01:00 AM, Marek Vasut wrote:
>> On 04/06/2016 06:55 PM, R, Vignesh wrote:
>>> Hi Marek,
>>
>> Hi!
>>
>>> I encountered a issue with this driver while testing.
>>
>> Try with the attached patches, I am planning to use them for V11
>> submission. I think you're hitting the problem with missing buslock.
>>
> 
> Thanks for the patches.
> But I am pretty sure that's not the problem at my end, because I have
> only one flash device on QSPI bus.
> 
> The problem is cqspi_switch_cs() is called only once ie when JEDEC ID is
> being read(during autodetect of chip), but at that instance,
> nor->page_size and nor->mtd.erasesize are not yet initialized (They are
> initialized only after JEDEC ID is looked up in the table and page_size
> and erasesize are known).
> Therefore if nor->page_size is printed during cqspi_switch_cs() then its
> zero. But nor->page_size reports 256 when printed in cqspi_flash_setup()
> after spi_nor_scan(). Therefore CQSPI_REG_SIZE register has to be
> configured only after spi_nor struct is fully populated (i.e after
> spi_nor_scan() has recognized the slave after JEDEC ID read).

Got it and I have a patch for this. Nice find, thanks! It gave me 60%
read performance boost on my machine :-)

I am now caching the page_size, erasesize, addr_width values, so I can
avoid reconfiguring the controller if there is no need for it, but
reconfigure it if there is a need. The patch is attached, but it's quite
big, so I also pushed a git branch with this driver for your convenience
(based on linux-next, expect rebases):

https://git.kernel.org/cgit/linux/kernel/git/marex/linux-2.6.git/log/?h=next/cadence-qspi

-- 
Best regards,
Marek Vasut

--------------090601060807080702050507
Content-Type: text/x-patch;
 name="qspi.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="qspi.patch"

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 7e61fba..331e7d1 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -66,6 +66,9 @@ struct cqspi_st {
 	struct mutex		bus_mutex;
 
 	int			current_cs;
+	int			current_page_size;
+	int			current_erase_size;
+	int			current_addr_width;
 	unsigned long		master_ref_clk_hz;
 	bool			is_decoded_cs;
 	u32			fifo_depth;
@@ -654,109 +657,60 @@ failwr:
 	return ret;
 }
 
-static int cqspi_set_protocol(struct spi_nor *nor, enum spi_nor_protocol proto)
+static void cqspi_chipselect(struct spi_nor *nor)
 {
 	struct cqspi_flash_pdata *f_pdata = nor->priv;
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+	void __iomem *reg_base = cqspi->iobase;
+	unsigned int chip_select = f_pdata->cs;
+	unsigned int reg;
 
-	switch (proto) {
-	case SNOR_PROTO_1_1_1:
-	case SNOR_PROTO_1_1_2:
-	case SNOR_PROTO_1_1_4:
-	case SNOR_PROTO_1_2_2:
-	case SNOR_PROTO_1_4_4:
-		f_pdata->inst_width = CQSPI_INST_TYPE_SINGLE;
-		break;
-	case SNOR_PROTO_2_2_2:
-		f_pdata->inst_width = CQSPI_INST_TYPE_DUAL;
-		break;
-	case SNOR_PROTO_4_4_4:
-		f_pdata->inst_width = CQSPI_INST_TYPE_QUAD;
-		break;
-	default:
-		return -EINVAL;
-	}
+	reg = readl(reg_base + CQSPI_REG_CONFIG);
+	if (cqspi->is_decoded_cs) {
+		reg |= CQSPI_REG_CONFIG_DECODE_MASK;
+	} else {
+		reg &= ~CQSPI_REG_CONFIG_DECODE_MASK;
 
-	switch (proto) {
-	case SNOR_PROTO_1_1_1:
-	case SNOR_PROTO_1_1_2:
-	case SNOR_PROTO_1_1_4:
-		f_pdata->addr_width = CQSPI_INST_TYPE_SINGLE;
-		break;
-	case SNOR_PROTO_1_2_2:
-	case SNOR_PROTO_2_2_2:
-		f_pdata->addr_width = CQSPI_INST_TYPE_DUAL;
-		break;
-	case SNOR_PROTO_1_4_4:
-	case SNOR_PROTO_4_4_4:
-		f_pdata->addr_width = CQSPI_INST_TYPE_QUAD;
-		break;
-	default:
-		return -EINVAL;
+		/* Convert CS if without decoder.
+		 * CS0 to 4b'1110
+		 * CS1 to 4b'1101
+		 * CS2 to 4b'1011
+		 * CS3 to 4b'0111
+		 */
+		chip_select = 0xF & ~(1 << chip_select);
 	}
 
-	return 0;
-}
-
-static void cqspi_write(struct spi_nor *nor, loff_t to,
-			size_t len, size_t *retlen, const u_char *buf)
-{
-	int ret;
-
-	ret = cqspi_set_protocol(nor, nor->write_proto);
-	if (ret)
-		return;
-
-	ret = cqspi_indirect_write_setup(nor, to);
-	if (ret)
-		return;
-
-	ret = cqspi_indirect_write_execute(nor, buf, len);
-	if (ret)
-		return;
-
-	*retlen += len;
-}
-
-static int cqspi_read(struct spi_nor *nor, loff_t from,
-		      size_t len, size_t *retlen, u_char *buf)
-{
-	int ret;
-
-	ret = cqspi_set_protocol(nor, nor->read_proto);
-	if (ret)
-		return ret;
-
-	ret = cqspi_indirect_read_setup(nor, from);
-	if (ret)
-		return ret;
-
-	ret = cqspi_indirect_read_execute(nor, buf, len);
-	if (ret)
-		return ret;
-
-	*retlen += len;
-	return ret;
+	reg &= ~(CQSPI_REG_CONFIG_CHIPSELECT_MASK
+		 << CQSPI_REG_CONFIG_CHIPSELECT_LSB);
+	reg |= (chip_select & CQSPI_REG_CONFIG_CHIPSELECT_MASK)
+	    << CQSPI_REG_CONFIG_CHIPSELECT_LSB;
+	writel(reg, reg_base + CQSPI_REG_CONFIG);
 }
 
-static int cqspi_erase(struct spi_nor *nor, loff_t offs)
+static void cqspi_configure_cs_and_sizes(struct spi_nor *nor)
 {
-	int ret;
-
-	ret = cqspi_set_protocol(nor, nor->erase_proto);
-	if (ret)
-		return ret;
+	struct cqspi_flash_pdata *f_pdata = nor->priv;
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+	void __iomem *iobase = cqspi->iobase;
+	unsigned int reg;
 
-	/* Send write enable, then erase commands. */
-	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
-	if (ret)
-		return ret;
+	/* configure page size and block size. */
+	reg = readl(iobase + CQSPI_REG_SIZE);
+	reg &= ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_LSB);
+	reg &= ~(CQSPI_REG_SIZE_BLOCK_MASK << CQSPI_REG_SIZE_BLOCK_LSB);
+	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
+	reg |= (nor->page_size << CQSPI_REG_SIZE_PAGE_LSB);
+	reg |= (ilog2(nor->mtd.erasesize) << CQSPI_REG_SIZE_BLOCK_LSB);
+	reg |= (nor->addr_width - 1);
+	writel(reg, iobase + CQSPI_REG_SIZE);
 
-	/* Set up command buffer. */
-	ret = cqspi_command_write_addr(nor, nor->erase_opcode, offs);
-	if (ret)
-		return ret;
+	/* configure the chip select */
+	cqspi_chipselect(nor);
 
-	return 0;
+	/* Store the new configuration of the controller */
+	cqspi->current_page_size = nor->page_size;
+	cqspi->current_erase_size = nor->mtd.erasesize;
+	cqspi->current_addr_width = nor->addr_width;
 }
 
 static unsigned int calculate_ticks_for_ns(const unsigned int ref_clk_hz,
@@ -854,36 +808,6 @@ static void cqspi_readdata_capture(struct cqspi_st *cqspi,
 	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
 }
 
-static void cqspi_chipselect(struct spi_nor *nor)
-{
-	struct cqspi_flash_pdata *f_pdata = nor->priv;
-	struct cqspi_st *cqspi = f_pdata->cqspi;
-	void __iomem *reg_base = cqspi->iobase;
-	unsigned int chip_select = f_pdata->cs;
-	unsigned int reg;
-
-	reg = readl(reg_base + CQSPI_REG_CONFIG);
-	if (cqspi->is_decoded_cs) {
-		reg |= CQSPI_REG_CONFIG_DECODE_MASK;
-	} else {
-		reg &= ~CQSPI_REG_CONFIG_DECODE_MASK;
-
-		/* Convert CS if without decoder.
-		 * CS0 to 4b'1110
-		 * CS1 to 4b'1101
-		 * CS2 to 4b'1011
-		 * CS3 to 4b'0111
-		 */
-		chip_select = 0xF & ~(1 << chip_select);
-	}
-
-	reg &= ~(CQSPI_REG_CONFIG_CHIPSELECT_MASK
-		 << CQSPI_REG_CONFIG_CHIPSELECT_LSB);
-	reg |= (chip_select & CQSPI_REG_CONFIG_CHIPSELECT_MASK)
-	    << CQSPI_REG_CONFIG_CHIPSELECT_LSB;
-	writel(reg, reg_base + CQSPI_REG_CONFIG);
-}
-
 static void cqspi_controller_enable(struct cqspi_st *cqspi, bool enable)
 {
 	void __iomem *reg_base = cqspi->iobase;
@@ -899,34 +823,18 @@ static void cqspi_controller_enable(struct cqspi_st *cqspi, bool enable)
 	writel(reg, reg_base + CQSPI_REG_CONFIG);
 }
 
-static void cqspi_switch_cs(struct spi_nor *nor)
-{
-	struct cqspi_flash_pdata *f_pdata = nor->priv;
-	struct cqspi_st *cqspi = f_pdata->cqspi;
-	void __iomem *iobase = cqspi->iobase;
-	unsigned int reg;
-
-	/* configure page size and block size. */
-	reg = readl(iobase + CQSPI_REG_SIZE);
-	reg &= ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_LSB);
-	reg &= ~(CQSPI_REG_SIZE_BLOCK_MASK << CQSPI_REG_SIZE_BLOCK_LSB);
-	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
-	reg |= (nor->page_size << CQSPI_REG_SIZE_PAGE_LSB);
-	reg |= (ilog2(nor->mtd.erasesize) << CQSPI_REG_SIZE_BLOCK_LSB);
-	reg |= (nor->addr_width - 1);
-	writel(reg, iobase + CQSPI_REG_SIZE);
-
-	/* configure the chip select */
-	cqspi_chipselect(nor);
-}
-
-static int cqspi_prep_unlocked(struct spi_nor *nor, enum spi_nor_ops ops)
+static void cqspi_configure(struct spi_nor *nor)
 {
 	struct cqspi_flash_pdata *f_pdata = nor->priv;
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	const unsigned int sclk = f_pdata->clk_rate;
-	const int switch_cs = (cqspi->current_cs != f_pdata->cs);
-	const int switch_ck = (cqspi->sclk != sclk);
+	int switch_cs = (cqspi->current_cs != f_pdata->cs);
+	int switch_ck = (cqspi->sclk != sclk);
+
+	if ((cqspi->current_page_size != nor->page_size) ||
+	    (cqspi->current_erase_size != nor->mtd.erasesize) ||
+	    (cqspi->current_addr_width != nor->addr_width))
+		switch_cs = 1;
 
 	if (switch_cs || switch_ck)
 		cqspi_controller_enable(cqspi, 0);
@@ -934,7 +842,7 @@ static int cqspi_prep_unlocked(struct spi_nor *nor, enum spi_nor_ops ops)
 	/* Switch chip select. */
 	if (switch_cs) {
 		cqspi->current_cs = f_pdata->cs;
-		cqspi_switch_cs(nor);
+		cqspi_configure_cs_and_sizes(nor);
 	}
 
 	/* Setup baudrate divisor and delays */
@@ -947,6 +855,111 @@ static int cqspi_prep_unlocked(struct spi_nor *nor, enum spi_nor_ops ops)
 
 	if (switch_cs || switch_ck)
 		cqspi_controller_enable(cqspi, 1);
+}
+
+static int cqspi_set_protocol(struct spi_nor *nor, enum spi_nor_protocol proto)
+{
+	struct cqspi_flash_pdata *f_pdata = nor->priv;
+
+	switch (proto) {
+	case SNOR_PROTO_1_1_1:
+	case SNOR_PROTO_1_1_2:
+	case SNOR_PROTO_1_1_4:
+	case SNOR_PROTO_1_2_2:
+	case SNOR_PROTO_1_4_4:
+		f_pdata->inst_width = CQSPI_INST_TYPE_SINGLE;
+		break;
+	case SNOR_PROTO_2_2_2:
+		f_pdata->inst_width = CQSPI_INST_TYPE_DUAL;
+		break;
+	case SNOR_PROTO_4_4_4:
+		f_pdata->inst_width = CQSPI_INST_TYPE_QUAD;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (proto) {
+	case SNOR_PROTO_1_1_1:
+	case SNOR_PROTO_1_1_2:
+	case SNOR_PROTO_1_1_4:
+		f_pdata->addr_width = CQSPI_INST_TYPE_SINGLE;
+		break;
+	case SNOR_PROTO_1_2_2:
+	case SNOR_PROTO_2_2_2:
+		f_pdata->addr_width = CQSPI_INST_TYPE_DUAL;
+		break;
+	case SNOR_PROTO_1_4_4:
+	case SNOR_PROTO_4_4_4:
+		f_pdata->addr_width = CQSPI_INST_TYPE_QUAD;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	cqspi_configure(nor);
+
+	return 0;
+}
+
+static void cqspi_write(struct spi_nor *nor, loff_t to,
+			size_t len, size_t *retlen, const u_char *buf)
+{
+	int ret;
+
+	ret = cqspi_set_protocol(nor, nor->write_proto);
+	if (ret)
+		return;
+
+	ret = cqspi_indirect_write_setup(nor, to);
+	if (ret)
+		return;
+
+	ret = cqspi_indirect_write_execute(nor, buf, len);
+	if (ret)
+		return;
+
+	*retlen += len;
+}
+
+static int cqspi_read(struct spi_nor *nor, loff_t from,
+		      size_t len, size_t *retlen, u_char *buf)
+{
+	int ret;
+
+	ret = cqspi_set_protocol(nor, nor->read_proto);
+	if (ret)
+		return ret;
+
+	ret = cqspi_indirect_read_setup(nor, from);
+	if (ret)
+		return ret;
+
+	ret = cqspi_indirect_read_execute(nor, buf, len);
+	if (ret)
+		return ret;
+
+	*retlen += len;
+	return ret;
+}
+
+static int cqspi_erase(struct spi_nor *nor, loff_t offs)
+{
+	int ret;
+
+	ret = cqspi_set_protocol(nor, nor->erase_proto);
+	if (ret)
+		return ret;
+
+	/* Send write enable, then erase commands. */
+	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
+	if (ret)
+		return ret;
+
+	/* Set up command buffer. */
+	ret = cqspi_command_write_addr(nor, nor->erase_opcode, offs);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -958,7 +971,7 @@ static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 
 	mutex_lock(&cqspi->bus_mutex);
 
-	return cqspi_prep_unlocked(nor, ops);
+	return 0;
 }
 
 static void cqspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
@@ -974,13 +987,9 @@ static int cqspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	int ret;
 
 	ret = cqspi_set_protocol(nor, nor->reg_proto);
-	if (ret)
-		goto exit;
-
-	cqspi_prep_unlocked(nor, SPI_NOR_OPS_READ);
+	if (!ret)
+		ret = cqspi_command_read(nor, &opcode, 1, buf, len);
 
-	ret = cqspi_command_read(nor, &opcode, 1, buf, len);
-exit:
 	return ret;
 }
 
@@ -989,13 +998,9 @@ static int cqspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	int ret;
 
 	ret = cqspi_set_protocol(nor, nor->reg_proto);
-	if (ret)
-		goto exit;
-
-	cqspi_prep_unlocked(nor, SPI_NOR_OPS_WRITE);
+	if (!ret)
+		ret = cqspi_command_write(nor, opcode, buf, len);
 
-	ret = cqspi_command_write(nor, opcode, buf, len);
-exit:
 	return ret;
 }
 

--------------090601060807080702050507--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
