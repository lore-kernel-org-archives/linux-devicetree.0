From: Han Xu <xhnjupt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] fsl-quadspi: fix QUAD read, add NORMAL, DUAL and
 FAST reads
Date: Thu, 29 Sep 2016 04:06:52 +0800
Message-ID: <20160928200652.GA31901@shlinux2>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160927055957.427-1-albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Albert ARIBAUD (3ADEV)" <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2016 at 07:59:56AM +0200, Albert ARIBAUD (3ADEV) wrote:
> Fix QUAD read LUT sequence missing JMP_ON_CS which caused
> read corruptions with non-1K-size reads on BK4R1 machine.
> 
> Add NORMAL, DUAL and FAST read sequences.
> 
> Introduce spi-bus-width property for bus subnodes, to
> specify per-bus capability to use NORMAL, FAST, DUAL,
> and/or QUAD reads.
> 
> Also:
> 
> Simplify ioremap/memcpy usage.
> 
> Make controller clock frequency equal to the lowest of
> subnode max frequencies instead of the last one.
> 
> Limit Vybrid to use only half its RX fifo, using more will
> cause corrupt reads.
> 

Too much changes in one patch, need to split to several patches.

> Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 204 ++++++++++++++++++++++++++++----------
>  1 file changed, 152 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 5c82e4e..9811cf2 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -41,6 +41,8 @@
>  #define QUADSPI_QUIRK_TKT253890		(1 << 2)
>  /* Controller cannot wake up from wait mode, TKT245618 */
>  #define QUADSPI_QUIRK_TKT245618         (1 << 3)
> +/* Controller can only read half a rx fifo through AHB */
> +#define QUADSPI_QUIRK_AHB_READ_HALF_FIFO  (1 << 4)
>  
>  /* The registers */
>  #define QUADSPI_MCR			0x00
> @@ -117,6 +119,10 @@
>  #define QUADSPI_FR			0x160
>  #define QUADSPI_FR_TFF_MASK		0x1
>  
> +#define QUADSPI_SPTRCLR			0x15c
> +#define QUADSPI_SPTRCLR_BFPTRC_SHIFT		0
> +#define QUADSPI_SPTRCLR_BFPTRC_MASK		(0x1 << QUADSPI_SPTRCLR_BFPTRC_SHIFT)
> +

offset 0x15c is SR register for i.MX, not sure where does SPTRCLR come from

>  #define QUADSPI_SFA1AD			0x180
>  #define QUADSPI_SFA2AD			0x184
>  #define QUADSPI_SFB1AD			0x188
> @@ -193,7 +199,7 @@
>  #define QUADSPI_LUT_NUM		64
>  
>  /* SEQID -- we can have 16 seqids at most. */
> -#define SEQID_QUAD_READ		0
> +#define SEQID_READ		0
>  #define SEQID_WREN		1
>  #define SEQID_WRDI		2
>  #define SEQID_RDSR		3
> @@ -205,6 +211,9 @@
>  #define SEQID_RDCR		9
>  #define SEQID_EN4B		10
>  #define SEQID_BRWR		11
> +#define SEQID_FAST_READ		12
> +#define SEQID_DUAL_READ		13
> +#define SEQID_QUAD_READ		14
>  
>  #define QUADSPI_MIN_IOMAP SZ_4M
>  
> @@ -229,7 +238,8 @@ static struct fsl_qspi_devtype_data vybrid_data = {
>  	.rxfifo = 128,
>  	.txfifo = 64,
>  	.ahb_buf_size = 1024,
> -	.driver_data = QUADSPI_QUIRK_SWAP_ENDIAN,
> +	.driver_data = QUADSPI_QUIRK_SWAP_ENDIAN
> +		       | QUADSPI_QUIRK_AHB_READ_HALF_FIFO,
>  };
>  
>  static struct fsl_qspi_devtype_data imx6sx_data = {
> @@ -309,6 +319,11 @@ static inline int needs_wakeup_wait_mode(struct fsl_qspi *q)
>  	return q->devtype_data->driver_data & QUADSPI_QUIRK_TKT245618;
>  }
>  
> +static inline int needs_half_fifo(struct fsl_qspi *q)
> +{
> +	return q->devtype_data->driver_data & QUADSPI_QUIRK_AHB_READ_HALF_FIFO;
> +}
> +
>  /*
>   * R/W functions for big- or little-endian registers:
>   * The qSPI controller's endian is independent of the CPU core's endian.
> @@ -373,8 +388,20 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	void __iomem *base = q->iobase;
>  	int rxfifo = q->devtype_data->rxfifo;
>  	u32 lut_base;
> -	u8 cmd, addrlen, dummy;
> +	u8 cmd, addrlen;
>  	int i;
> +	/* use 8 dummy cycles for all fast operations */
> +	const int dummy = 8;
> +
> +	/* use only half fifo if controller needs that */
> +	if (needs_half_fifo(q))
> +		rxfifo /= 2;
> +
> +    /* use 24-bit addresses for up to 16MB, 32-bit above 16MB */
> +	if (q->nor_size <= SZ_16M)
> +		addrlen = ADDR24BIT;
> +	else
> +		addrlen = ADDR32BIT;

A better patch fetch info from nor structure, refer to
https://patchwork.ozlabs.org/patch/613429/
>  
>  	fsl_qspi_unlock_lut(q);
>  
> @@ -382,24 +409,12 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	for (i = 0; i < QUADSPI_LUT_NUM; i++)
>  		qspi_writel(q, 0, base + QUADSPI_LUT_BASE + i * 4);
>  
> -	/* Quad Read */
> -	lut_base = SEQID_QUAD_READ * 4;
> -
> -	if (q->nor_size <= SZ_16M) {
> -		cmd = SPINOR_OP_READ_1_1_4;
> -		addrlen = ADDR24BIT;
> -		dummy = 8;
> -	} else {
> -		/* use the 4-byte address */
> -		cmd = SPINOR_OP_READ_1_1_4;
> -		addrlen = ADDR32BIT;
> -		dummy = 8;
> -	}
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
> -			base + QUADSPI_LUT(lut_base));
> -	qspi_writel(q, LUT0(DUMMY, PAD1, dummy) | LUT1(FSL_READ, PAD4, rxfifo),
> -			base + QUADSPI_LUT(lut_base + 1));
> +	/* Read */
> +	lut_base = SEQID_READ * 4;
> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_READ) | LUT1(ADDR, PAD1, addrlen),
> +		base + QUADSPI_LUT(lut_base));
> +	qspi_writel(q, LUT0(FSL_READ, PAD1, rxfifo) | LUT1(JMP_ON_CS, PAD1, SEQID_READ * 8),
> +		base + QUADSPI_LUT(lut_base + 1));
>  
>  	/* Write enable */
>  	lut_base = SEQID_WREN * 4;
> @@ -409,16 +424,7 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	/* Page Program */
>  	lut_base = SEQID_PP * 4;
>  
> -	if (q->nor_size <= SZ_16M) {
> -		cmd = SPINOR_OP_PP;
> -		addrlen = ADDR24BIT;
> -	} else {
> -		/* use the 4-byte address */
> -		cmd = SPINOR_OP_PP;
> -		addrlen = ADDR32BIT;
> -	}
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_PP) | LUT1(ADDR, PAD1, addrlen),
>  			base + QUADSPI_LUT(lut_base));
>  	qspi_writel(q, LUT0(FSL_WRITE, PAD1, 0),
>  			base + QUADSPI_LUT(lut_base + 1));
> @@ -431,7 +437,6 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  
>  	/* Erase a sector */
>  	lut_base = SEQID_SE * 4;
> -
>  	cmd = q->nor[0].erase_opcode;
>  	addrlen = q->nor_size <= SZ_16M ? ADDR24BIT : ADDR32BIT;
>  
> @@ -476,6 +481,33 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_BRWR),
>  			base + QUADSPI_LUT(lut_base));
>  
> +	/* Fast Read */
> +	lut_base = SEQID_FAST_READ * 4;
> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_READ_FAST) | LUT1(ADDR, PAD1, addrlen),
> +		base + QUADSPI_LUT(lut_base));
> +	qspi_writel(q, LUT0(DUMMY, PAD1, dummy) | LUT1(FSL_READ, PAD1, rxfifo),
> +		base + QUADSPI_LUT(lut_base + 1));
> +	qspi_writel(q, LUT0(JMP_ON_CS, PAD1, SEQID_FAST_READ * 8),
> +		base + QUADSPI_LUT(lut_base + 2));
> +
> +	/* Dual Read */
> +	lut_base = SEQID_DUAL_READ * 4;
> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_READ_1_1_2) | LUT1(ADDR, PAD1, addrlen),
> +		base + QUADSPI_LUT(lut_base));
> +	qspi_writel(q, LUT0(DUMMY, PAD1, dummy) | LUT1(FSL_READ, PAD2, rxfifo),
> +		base + QUADSPI_LUT(lut_base + 1));
> +	qspi_writel(q, LUT0(JMP_ON_CS, PAD1, SEQID_DUAL_READ * 8),
> +		base + QUADSPI_LUT(lut_base + 2));
> +
> +	/* Quad Read */
> +	lut_base = SEQID_QUAD_READ * 4;
> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_READ_1_1_4) | LUT1(ADDR, PAD1, addrlen),
> +		base + QUADSPI_LUT(lut_base));
> +	qspi_writel(q, LUT0(DUMMY, PAD1, dummy) | LUT1(FSL_READ, PAD4, rxfifo),
> +		base + QUADSPI_LUT(lut_base + 1));
> +	qspi_writel(q, LUT0(JMP_ON_CS, PAD1, SEQID_QUAD_READ * 8),
> +		base + QUADSPI_LUT(lut_base + 2));
> +
>  	fsl_qspi_lock_lut(q);
>  }
>  
> @@ -483,8 +515,8 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
>  {
>  	switch (cmd) {
> -	case SPINOR_OP_READ_1_1_4:
> -		return SEQID_QUAD_READ;
> +	case SPINOR_OP_READ:
> +		return SEQID_READ;
>  	case SPINOR_OP_WREN:
>  		return SEQID_WREN;
>  	case SPINOR_OP_WRDI:
> @@ -507,6 +539,12 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
>  		return SEQID_EN4B;
>  	case SPINOR_OP_BRWR:
>  		return SEQID_BRWR;
> +	case SPINOR_OP_READ_FAST:
> +		return SEQID_FAST_READ;
> +	case SPINOR_OP_READ_1_1_2:
> +		return SEQID_DUAL_READ;
> +	case SPINOR_OP_READ_1_1_4:
> +		return SEQID_QUAD_READ;
>  	default:
>  		if (cmd == q->nor[0].erase_opcode)
>  			return SEQID_SE;
> @@ -676,11 +714,16 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
>   * the memcpy to read the data directly. A "missed" access to the buffer
>   * causes the controller to clear the buffer, and use the sequence pointed
>   * by the QUADSPI_BFGENCR[SEQID] to initiate a read from the flash.
> + *
> + * When using two ports, the SEQID to use for one port might differ from
> + * the one to use for the other (e.g., if one port can do 4-pad reads but
> + * the other cannot). So we set up a basic mode here (SEQID_READ) and we
> + * will set up the proper SEQID for the port right before doing the AHB
> + * access(es).
>   */

It's rare to find this use case, considering the amount of lut is only 16,
please don't add two many luts in this way. I will send a patch soon for
dynamic lut change, please add these extra luts in dynamic lut list.

>  static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
>  {
>  	void __iomem *base = q->iobase;
> -	int seqid;
>  
>  	/* AHB configuration for access buffer 0/1/2 .*/
>  	qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF0CR);
> @@ -688,11 +731,13 @@ static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
>  	qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF2CR);
>  	/*
>  	 * Set ADATSZ with the maximum AHB buffer size to improve the
> -	 * read performance.
> +	 * read performance, except when the controller should not use
> +	 * more than half its RX fifo in AHB reads, in which case read
> +	 * size is given in the LUT FSL_READ instructions.
>  	 */
>  	qspi_writel(q, QUADSPI_BUF3CR_ALLMST_MASK |
> -			((q->devtype_data->ahb_buf_size / 8)
> -			<< QUADSPI_BUF3CR_ADATSZ_SHIFT),
> +			(needs_half_fifo(q)? 0 : q->devtype_data->ahb_buf_size / 8)
> +	        << QUADSPI_BUF3CR_ADATSZ_SHIFT,
>  			base + QUADSPI_BUF3CR);
>  
>  	/* We only use the buffer3 */
> @@ -700,9 +745,8 @@ static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
>  	qspi_writel(q, 0, base + QUADSPI_BUF1IND);
>  	qspi_writel(q, 0, base + QUADSPI_BUF2IND);
>  
> -	/* Set the default lut sequence for AHB Read. */
> -	seqid = fsl_qspi_get_seqid(q, q->nor[0].read_opcode);
> -	qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
> +	/* Set the default lut sequence for AHB Read to READ. */
> +	qspi_writel(q, SEQID_READ << QUADSPI_BFGENCR_SEQID_SHIFT,
>  		q->iobase + QUADSPI_BFGENCR);
>  }
>  
> @@ -841,6 +885,7 @@ static int fsl_qspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>  		return ret;
>  
>  	fsl_qspi_read_data(q, len, buf);
> +
>  	return 0;
>  }
>  
> @@ -887,11 +932,27 @@ static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
>  {
>  	struct fsl_qspi *q = nor->priv;
>  	u8 cmd = nor->read_opcode;
> +	uint32_t seqid;
> +	size_t qlen = q->nor_size * 4;
> +	int nor_idx = nor - q->nor;
> +	size_t nor_ofs = q->nor_size * nor_idx;
> +
> +	/* Set the actual lut sequence for AHB Read from the considered nor. */
> +	seqid = fsl_qspi_get_seqid(q, nor->read_opcode);
> +	qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
> +		q->iobase + QUADSPI_BFGENCR);
> +	/* Reset the AHB sequence pointer */
> +	qspi_writel(q, QUADSPI_SPTRCLR_BFPTRC_MASK, q->iobase + QUADSPI_SPTRCLR);
> +    /* make sure the Rx buffer is read through AHB, not IP */
> +	qspi_writel(q, QUADSPI_RBCT_WMRK_MASK, q->iobase + QUADSPI_RBCT);
> +
> +	/* set the chip address for READID */
> +	fsl_qspi_set_base_addr(q, q->nor);
>  
>  	/* if necessary,ioremap buffer before AHB read, */
>  	if (!q->ahb_addr) {
> -		q->memmap_offs = q->chip_base_addr + from;
> -		q->memmap_len = len > QUADSPI_MIN_IOMAP ? len : QUADSPI_MIN_IOMAP;
> +		q->memmap_offs = q->chip_base_addr;
> +		q->memmap_len = qlen > QUADSPI_MIN_IOMAP ? qlen : QUADSPI_MIN_IOMAP;
>  
>  		q->ahb_addr = ioremap_nocache(
>  				q->memmap_phy + q->memmap_offs,
> @@ -906,8 +967,8 @@ static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
>  			q->memmap_offs + q->memmap_len) {
>  		iounmap(q->ahb_addr);
>  
> -		q->memmap_offs = q->chip_base_addr + from;
> -		q->memmap_len = len > QUADSPI_MIN_IOMAP ? len : QUADSPI_MIN_IOMAP;
> +		q->memmap_offs = q->chip_base_addr;
> +		q->memmap_len = qlen > QUADSPI_MIN_IOMAP ? qlen : QUADSPI_MIN_IOMAP;
>  		q->ahb_addr = ioremap_nocache(
>  				q->memmap_phy + q->memmap_offs,
>  				q->memmap_len);
> @@ -917,13 +978,11 @@ static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
>  		}
>  	}
>  
> -	dev_dbg(q->dev, "cmd [%x],read from %p, len:%zd\n",
> -		cmd, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
> -		len);
> +	dev_dbg(q->dev, "cmd [%x], read from %p, len:%zd\n",
> +		cmd, q->ahb_addr + nor_ofs + from, len);
>  
>  	/* Read out the data directly from the AHB buffer.*/
> -	memcpy(buf, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
> -		len);
> +	memcpy(buf, q->ahb_addr + nor_ofs + from, len);

No much diff from the previous implementation
>  
>  	return len;
>  }
> @@ -980,6 +1039,11 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
>  	int ret, i = 0;
> +	const struct of_device_id *of_id =
> +			of_match_device(fsl_qspi_dt_ids, &pdev->dev);
> +	enum read_mode readmode;
> +	unsigned int buswidth;
> +	u32 qspimaxfreq, spimaxfreq;
>  
>  	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>  	if (!q)
> @@ -1050,6 +1114,9 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  
>  	mutex_init(&q->lock);
>  
> +	/* Running MIN of all "spi-max-frequency' values present in subnodes */
> +	qspimaxfreq = INT_MAX;
> +
>  	/* iterate the subnodes. */
>  	for_each_available_child_of_node(dev->of_node, np) {
>  		/* skip the holes */
> @@ -1073,15 +1140,44 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		nor->prepare = fsl_qspi_prep;
>  		nor->unprepare = fsl_qspi_unprep;
>  
> +		/* Update running MIN of subnode max frequencies */
>  		ret = of_property_read_u32(np, "spi-max-frequency",
> -				&q->clk_rate);
> +				&spimaxfreq);
>  		if (ret < 0)
>  			goto mutex_failed;
> +		qspimaxfreq = (qspimaxfreq > spimaxfreq) ? spimaxfreq: qspimaxfreq;
>  
>  		/* set the chip address for READID */
>  		fsl_qspi_set_base_addr(q, nor);
>  
> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		/* scan using the proper read mode for this subnode */
> +		if (of_property_read_u32(np, "spi-bus-width", &buswidth)<0) {
> +			nor->read_opcode = SPINOR_OP_READ;
> +			readmode = SPI_NOR_NORMAL;
> +		} else {
> +			switch (buswidth) {
> +			case 4:
> +				nor->read_opcode = SPINOR_OP_READ_1_1_4;
> +				readmode = SPI_NOR_QUAD;
> +				break;
> +			case 2:
> +				nor->read_opcode = SPINOR_OP_READ_1_1_2;
> +				readmode = SPI_NOR_DUAL;
> +				break;
> +			case 1:
> +				nor->read_opcode = SPINOR_OP_READ_FAST;
> +				readmode = SPI_NOR_FAST;
> +				break;
> +			default:
> +				dev_warn(q->dev,
> +					"ignoring spi-bus-width=%d (should be 1, 2 or 4)",
> +					buswidth);
> +				nor->read_opcode = SPINOR_OP_READ;
> +				readmode = SPI_NOR_NORMAL;
> +			}
> +		}
> +
> +		ret = spi_nor_scan(nor, NULL, readmode);

Not necessary, can fetch info from nor structure
https://patchwork.ozlabs.org/patch/613429/

>  		if (ret)
>  			goto mutex_failed;
>  
> @@ -1112,6 +1208,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		i++;
>  	}
>  
> +	/* If we know the lowest subnode frequency, override driver default. */
> +	if (qspimaxfreq<INT_MAX)
> +		q->clk_rate = qspimaxfreq;
> +
>  	/* finish the rest init. */
>  	ret = fsl_qspi_nor_setup_last(q);
>  	if (ret)
> -- 
> 2.9.3
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
