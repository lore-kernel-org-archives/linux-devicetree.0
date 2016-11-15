From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
Date: Tue, 15 Nov 2016 21:52:40 +0100
Message-ID: <b1420e9d-b6a1-7fe8-4381-e32e0bc7dd53@gmail.com>
References: <1478855766-151673-1-git-send-email-shawn.lin@rock-chips.com>
 <1478855766-151673-3-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478855766-151673-3-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/11/2016 10:16 AM, Shawn Lin wrote:
> Add rockchip serial flash controller driver
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>


[...]

> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 4a682ee..48c5e0e 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -65,6 +65,13 @@ config SPI_HISI_SFC
>  	help
>  	  This enables support for hisilicon SPI-NOR flash controller.
>  
> +config SPI_ROCKCHIP_SFC

Keep this list sorted please.

> +	tristate "Rockchip Serial Flash Controller(SFC)"
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on HAS_IOMEM && HAS_DMA
> +	help
> +	  This enables support for rockchip serial flash controller.
> +
>  config SPI_NXP_SPIFI
>  	tristate "NXP SPI Flash Interface (SPIFI)"
>  	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)


[...]

> +/* Interrypt mask */

Interrupt :)

> +#define SFC_IMR				0x4
> +#define  SFC_IMR_RX_FULL		BIT(0)
> +#define  SFC_IMR_RX_UFLOW		BIT(1)
> +#define  SFC_IMR_TX_OFLOW		BIT(2)
> +#define  SFC_IMR_TX_EMPTY		BIT(3)
> +#define  SFC_IMR_TRAN_FINISH		BIT(4)
> +#define  SFC_IMR_BUS_ERR		BIT(5)
> +#define  SFC_IMR_NSPI_ERR		BIT(6)
> +#define  SFC_IMR_DMA			BIT(7)


[...]

> +enum rockchip_sfc_iftype {
> +	IF_TYPE_STD,
> +	IF_TYPE_DUAL,
> +	IF_TYPE_QUAD,
> +};
> +
> +struct rockchip_sfc {
> +	struct device *dev;
> +	struct mutex lock;
> +	void __iomem *regbase;
> +	struct clk *hclk;
> +	struct clk *clk;
> +	void *buffer;
> +	dma_addr_t dma_buffer;

The naming (buffer) could use some improvement or comment for clarification.

> +	struct completion cp;
> +	struct spi_nor	*nor[SFC_MAX_CHIP_NUM];

Should be MAX_CHIPSELECT_NUM , for clarity.

> +	u32 num_chip;

u8

> +	bool use_dma;
> +	bool negative_edge;

Negative edge ... of what ?

> +};
> +
> +struct rockchip_sfc_priv {
> +	u32 cs;

Doesn't this board support only 4 CS ? Use u8 :-)

> +	u32 clk_rate;
> +	struct rockchip_sfc *sfc;
> +};
> +
> +static int get_if_type(enum read_mode flash_read)
> +{
> +	enum rockchip_sfc_iftype if_type;
> +
> +	switch (flash_read) {
> +	case SPI_NOR_DUAL:
> +		if_type = IF_TYPE_DUAL;
> +		break;
> +	case SPI_NOR_QUAD:
> +		if_type = IF_TYPE_QUAD;
> +		break;
> +	case SPI_NOR_NORMAL:
> +	case SPI_NOR_FAST:
> +	default:

Should the default case really fall back to 1-bit mode or should it
rather report error ?

> +		if_type = IF_TYPE_STD;
> +		break;
> +	}
> +
> +	return if_type;
> +}
> +
> +static int rockchip_sfc_reset(struct rockchip_sfc *sfc)
> +{
> +	unsigned long timeout = jiffies + HZ;
> +	int err = -ETIMEDOUT;
> +	u32 status;
> +
> +	writel_relaxed(SFC_RCVR_RESET, sfc->regbase + SFC_RCVR);
> +
> +	while (time_before(jiffies, timeout)) {

Would readl_poll_*() from include/linux/iopoll.h help here ?

> +		status = readl_relaxed(sfc->regbase + SFC_RCVR);
> +		if (!(status & SFC_RCVR_RESET)) {
> +			err = 0;
> +			break;
> +		}
> +		msleep(20);
> +	}
> +
> +	if (err)
> +		dev_err(sfc->dev, "SFC reset never finished\n");

Should the writel() below be executed if an error happened ?

> +	writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
> +		       SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
> +		       SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
> +		       SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
> +		       sfc->regbase + SFC_ICLR);
> +	return err;
> +}
> +
> +static int rockchip_sfc_init(struct rockchip_sfc *sfc)
> +{
> +	int err;
> +
> +	err = rockchip_sfc_reset(sfc);
> +	if (err)
> +		return err;
> +
> +	/* Mask all eight interrupts */
> +	writel_relaxed(0xff, sfc->regbase + SFC_IMR);
> +	/* Phase configure */

What phase ? Please clarify the comment. Also, don't you have to
configure the register if sfc->negative_edge == 0 too ?

> +	if (sfc->negative_edge)
> +		writel_relaxed(SFC_CTRL_PHASE_SEL_NEGETIVE <<
> +			       SFC_CTRL_PHASE_SEL_SHIFT,
> +			       sfc->regbase + SFC_CTRL);
> +	return 0;
> +}
> +
> +static int rockchip_sfc_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	int ret;
> +
> +	mutex_lock(&sfc->lock);
> +
> +	ret = clk_set_rate(sfc->clk, priv->clk_rate);
> +	if (ret)
> +		goto out;
> +
> +	ret = clk_prepare_enable(sfc->clk);
> +	if (ret)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	mutex_unlock(&sfc->lock);
> +	return ret;
> +}
> +
> +static void rockchip_sfc_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +
> +	clk_disable_unprepare(sfc->clk);
> +	mutex_unlock(&sfc->lock);
> +}
> +
> +static int rockchip_sfc_wait_op_finish(struct rockchip_sfc *sfc)
> +{
> +	unsigned long timeout = jiffies + 2 * HZ;
> +	int err = -ETIMEDOUT;
> +	u32 status;
> +
> +	/*
> +	 * Note: tx and rx share the same fifo, so the rx's water level
> +	 * is the same as rx's, which means this function could be reused
> +	 * for checking the read operations as well.
> +	 */
> +	while (time_before(jiffies, timeout)) {

readl_poll_*() ?

> +		status = readl_relaxed(sfc->regbase + SFC_FSR);
> +		if (((status >> SFC_FSR_TX_EMPTY_SHIFT) &
> +		     SFC_FSR_TX_EMPTY_MASK) == SFC_FSR_TX_IS_EMPTY) {
> +			err = 0;
> +			break;
> +		}
> +		msleep(20);
> +	}
> +
> +	if (err)
> +		dev_err(sfc->dev, "SFC tx never empty\n");
> +
> +	return err;
> +}
> +
> +static int rockchip_sfc_op_reg(struct spi_nor *nor,
> +				u8 opcode, int len, u8 optype)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	u32 reg;
> +
> +	if (((readl_relaxed(sfc->regbase + SFC_FSR) >> SFC_FSR_TX_EMPTY_SHIFT) &
> +	      SFC_FSR_TX_EMPTY_MASK) != SFC_FSR_TX_IS_EMPTY ||
> +	     ((readl_relaxed(sfc->regbase + SFC_FSR) >>
> +	       SFC_FSR_RX_EMPTY_SHIFT) &
> +	      SFC_FSR_RX_EMPTY_MASK) != SFC_FSR_RX_IS_EMPTY ||
> +	     (readl_relaxed(sfc->regbase + SFC_SR) == SFC_SR_IS_BUSY))
> +		rockchip_sfc_reset(sfc);

This is chaos, please fix this condition so it's actually readable. You
can ie. read the FSR into a variable, do your shifting/anding magic and
then do if (var1 || var2 || var3) {} .

> +	reg = (opcode & SFC_CMD_IDX_MASK) << SFC_CMD_IDX_SHIFT;
> +	reg |= (len & SFC_CMD_TRAN_BYTES_MASK) << SFC_CMD_TRAN_BYTES_SHIFT;
> +	reg |= (priv->cs & SFC_CMD_CS_MASK) << SFC_CMD_CS_SHIFT;
> +	reg |= (optype & SFC_CMD_DIR_MASK) << SFC_CMD_DIR_SHIFT;
> +
> +	writel_relaxed(reg, sfc->regbase + SFC_CMD);
> +
> +	return rockchip_sfc_wait_op_finish(sfc);
> +}
> +
> +static int rockchip_sfc_read_reg(struct spi_nor *nor, u8 opcode,
> +				 u8 *buf, int len)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	int ret;
> +	u32 tmp;
> +	u32 i;
> +
> +	ret = rockchip_sfc_op_reg(nor, opcode, len, SFC_CMD_DIR_RD);
> +	if (ret)
> +		return ret;
> +
> +	while (len > 0) {
> +		tmp = readl_relaxed(sfc->regbase + SFC_DATA);
> +		for (i = 0; i < len; i++)
> +			*buf++ = (u8)((tmp >> (i * 8)) & 0xff);

Won't this fail for len > 4 ?

Also, you can use ioread32_rep() here, but (!) that won't work for
unaligned reads, which I dunno if they can happen here, but please do
double-check.

> +		len = len - 4;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rockchip_sfc_write_reg(struct spi_nor *nor, u8 opcode,
> +				  u8 *buf, int len)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	u32 words, i;
> +
> +	/* Align bytes to words */
> +	words = (len + 3) >> 2;
> +
> +	for (i = 0; i < words; i++)
> +		writel_relaxed(*(buf + 4 * i), sfc->regbase + SFC_DATA);

See above about the ioread32_rep()/iowrite32_rep(), but careful about
unaligned (len % 4 != 0) case.

> +	return rockchip_sfc_op_reg(nor, opcode, len, SFC_CMD_DIR_WR);
> +}
> +
> +static int rockchip_sfc_dma_transfer(struct spi_nor *nor, loff_t from_to,
> +				     dma_addr_t dma_buf, size_t len, u8 op_type)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	u32 reg;
> +	u8 if_type = 0;
> +
> +	init_completion(&sfc->cp);
> +
> +	writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
> +		       SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
> +		       SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
> +		       SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
> +		       sfc->regbase + SFC_ICLR);
> +
> +	/* Enable transfer complete interrupt */
> +	reg = readl_relaxed(sfc->regbase + SFC_IMR);
> +	reg &= ~SFC_IMR_TRAN_FINISH;
> +	writel_relaxed(reg, sfc->regbase + SFC_IMR);
> +
> +	if (op_type == SFC_CMD_DIR_WR)
> +		reg = (SFC_CMD_DIR_WR << SFC_CMD_DIR_SHIFT) |
> +		      ((nor->program_opcode & SFC_CMD_IDX_MASK) <<
> +		       SFC_CMD_IDX_SHIFT);
> +	else
> +		reg = (SFC_CMD_DIR_RD << SFC_CMD_DIR_SHIFT) |
> +		      ((nor->read_opcode & SFC_CMD_IDX_MASK) <<
> +		       SFC_CMD_IDX_SHIFT);

reg = nor->read_opcode & SFC_CMD_IDX_MASK) << SFC_CMD_IDX_SHIFT;
reg |= op_type << SFC_CMD_DIR_SHIFT;

> +	reg |= ((nor->addr_width == 4) ? SFC_CMD_ADDR_32BITS
> +		: SFC_CMD_ADDR_24BITS) << SFC_CMD_ADDR_SHIFT;

Why don't you just define those SFC_CMD_ADDR_24BITS and co. with the
shift in those bitfields already ? Then you wouldn't have to riddle this
driver with FOO << BAR, but you'd only have FOO all over the place.

> +	if_type = get_if_type(nor->flash_read);
> +	writel_relaxed(if_type << SFC_CTRL_DATA_BITS_SHIFT |
> +		       if_type << SFC_CTRL_ADDR_BITS_SHIFT |
> +		       if_type << SFC_CTRL_CMD_BITS_SHIFT |

Parenthesis missing around the statements ,
(if_type << FOO) | (... << bar)

> +		       sfc->negative_edge ?
> +		       SFC_CTRL_PHASE_SEL_NEGETIVE << SFC_CTRL_PHASE_SEL_SHIFT :
> +		       SFC_CTRL_PHASE_SEL_POSITIVE << SFC_CTRL_PHASE_SEL_SHIFT,
> +		       sfc->regbase + SFC_CTRL);
> +
> +	reg |= (priv->cs & SFC_CMD_CS_MASK) << SFC_CMD_CS_SHIFT;
> +	reg |= (len & SFC_CMD_TRAN_BYTES_MASK) << SFC_CMD_TRAN_BYTES_SHIFT;
> +
> +	if (op_type == SFC_CMD_DIR_RD)
> +		reg |= (nor->read_dummy & SFC_CMD_DUMMY_MASK) <<
> +			SFC_CMD_DUMMY_SHIFT;

Just define SFC_CMD_DUMMY(x) \
 (((x) & SFC_CMD_DUMMY_MASK) << SFC_CMD_DUMMY_SHIFT)

And then use it ... reg |= SFC_CMD_DUMMY(nor->read_dummy);

> +	/* Should minus one as 0x0 means 1 bit flash address */
> +	writel_relaxed(nor->addr_width * 8 - 1, sfc->regbase + SFC_ABIT);
> +	writel_relaxed(reg, sfc->regbase + SFC_CMD);
> +	writel_relaxed(from_to, sfc->regbase + SFC_ADDR);
> +	writel_relaxed(dma_buf, sfc->regbase + SFC_DMA_ADDR);

I hope the DMA buffer management is implemented correctly and you're not
running into any weird cache issues.

> +	/* Start dma */
> +	writel_relaxed(0x1, sfc->regbase + SFC_DMA_TRIGGER);
> +
> +	/* Wait for the interrupt. */
> +	if (!wait_for_completion_timeout(&sfc->cp, msecs_to_jiffies(2000))) {
> +		dev_err(sfc->dev, "DMA wait for transfer finish timeout.");
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* Disable transfer finish interrupt */
> +	reg = readl_relaxed(sfc->regbase + SFC_IMR);
> +	reg |= SFC_IMR_TRAN_FINISH;
> +	writel_relaxed(reg, sfc->regbase + SFC_IMR);
> +
> +	return rockchip_sfc_wait_op_finish(sfc);
> +}
> +
> +static inline int rockchip_sfc_pio_write(struct rockchip_sfc *sfc, u_char *buf,
> +					 size_t len)
> +{
> +	u32 words, tx_wl, count, i;
> +	unsigned long timeout;
> +	int ret = 0;
> +	u32 *tbuf = (u32 *)buf;
> +
> +	/* Align bytes to words */
> +	words = (len + 3) >> 2;
> +
> +	while (words) {

See iowrite32_rep() above, but I suspect you'll run into problems with
$len which is not multiple of 4 .

> +		tx_wl = (readl_relaxed(sfc->regbase + SFC_FSR) >>
> +			 SFC_FSR_TX_WATER_LVL_SHIFT) &
> +			 SFC_FSR_TX_WATER_LVL_MASK;
> +
> +		if (tx_wl > 0) {
> +			count = min_t(u32, words, tx_wl);
> +			for (i = 0; i < count; i++) {
> +				writel_relaxed(*tbuf++,
> +					       sfc->regbase + SFC_DATA);
> +				words--;
> +			}
> +
> +			if (words == 0)
> +				break;
> +			timeout = 0;
> +		} else {
> +			mdelay(1);
> +			if (timeout++ > SFC_MAX_IDLE_RETRY) {
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (ret)
> +		return ret;
> +	else
> +		return rockchip_sfc_wait_op_finish(sfc);
> +}
> +
> +static inline int rockchip_sfc_pio_read(struct rockchip_sfc *sfc, u_char *buf,
> +					size_t len)
> +{
> +	u32 words, rx_wl, count, i;
> +	unsigned long timeout;
> +	int ret = 0;
> +	u32 tmp;
> +	u32 *tbuf = (u32 *)buf;
> +	u_char *tbuf2;
> +
> +	words = len >> 2;
> +	/* Get the remained bytes */
> +	len = len & 0x3;

See above.

> +	while (words) {
> +		rx_wl = (readl_relaxed(sfc->regbase + SFC_FSR) >>
> +			 SFC_FSR_RX_WATER_LVL_SHIFT) &
> +			 SFC_FSR_RX_WATER_LVL_MASK;
> +
> +		if (rx_wl > 0) {
> +			count = min_t(u32, words, rx_wl);
> +			for (i = 0; i < count; i++) {
> +				*tbuf++ = readl_relaxed(sfc->regbase +
> +							SFC_DATA);
> +				words--;
> +			}
> +
> +			if (words == 0)
> +				break;
> +			timeout = 0;
> +		} else {
> +			mdelay(1);
> +			if (timeout++ > SFC_MAX_IDLE_RETRY) {
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Read the remained bytes */
> +	timeout = 0;
> +	tbuf2 = (u_char *)tbuf;
> +	while (len) {
> +		rx_wl = (readl_relaxed(sfc->regbase + SFC_FSR) >>
> +			 SFC_FSR_RX_WATER_LVL_SHIFT) &
> +			 SFC_FSR_RX_WATER_LVL_MASK;
> +		if (rx_wl > 0) {
> +			tmp = readl_relaxed(sfc->regbase + SFC_DATA);
> +			for (i = 0; i < len; i++)
> +				tbuf2[i] = (u8)((tmp >> (i * 8)) & 0xff);
> +			goto done;
> +		} else {
> +			mdelay(1);
> +			if (timeout++ > SFC_MAX_IDLE_RETRY) {
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +		}
> +	}
> +done:
> +	if (ret)
> +		return ret;
> +	else
> +		return rockchip_sfc_wait_op_finish(sfc);
> +}
> +
> +static int rockchip_sfc_pio_transfer(struct spi_nor *nor, loff_t from_to,
> +				     size_t len, u_char *buf, u8 op_type)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	u32 reg;
> +	u8 if_type = 0;
> +
> +	if (op_type == SFC_CMD_DIR_WR)
> +		reg = (SFC_CMD_DIR_WR << SFC_CMD_DIR_SHIFT) |
> +		      ((nor->program_opcode & SFC_CMD_IDX_MASK) <<
> +		       SFC_CMD_IDX_SHIFT);
> +	else
> +		reg = (SFC_CMD_DIR_RD << SFC_CMD_DIR_SHIFT) |
> +		      ((nor->read_opcode & SFC_CMD_IDX_MASK) <<
> +		       SFC_CMD_IDX_SHIFT);

See above regarding this condition. I think you can factor out this
common code too. Also nuke the bitshifts , see my comments on
rockchip_sfc_dma_transfer .

> +	reg |= ((nor->addr_width == 4) ? SFC_CMD_ADDR_32BITS
> +		: SFC_CMD_ADDR_24BITS) << SFC_CMD_ADDR_SHIFT;
> +
> +	if_type = get_if_type(nor->flash_read);
> +	writel_relaxed(if_type << SFC_CTRL_DATA_BITS_SHIFT |
> +		       if_type << SFC_CTRL_ADDR_BITS_SHIFT |
> +		       if_type << SFC_CTRL_CMD_BITS_SHIFT |
> +		       sfc->negative_edge ?
> +		       SFC_CTRL_PHASE_SEL_NEGETIVE << SFC_CTRL_PHASE_SEL_SHIFT :
> +		       SFC_CTRL_PHASE_SEL_POSITIVE << SFC_CTRL_PHASE_SEL_SHIFT,
> +		       sfc->regbase + SFC_CTRL);
> +
> +	reg |= (priv->cs & SFC_CMD_CS_MASK) << SFC_CMD_CS_SHIFT;
> +	reg |= (len & SFC_CMD_TRAN_BYTES_MASK) << SFC_CMD_TRAN_BYTES_SHIFT;
> +
> +	if (op_type == SFC_CMD_DIR_RD)
> +		reg |= (nor->read_dummy & SFC_CMD_DUMMY_MASK) <<
> +			SFC_CMD_DUMMY_SHIFT;
> +
> +	/* Should minus one as 0x0 means 1 bit flash address */
> +	writel_relaxed(nor->addr_width * 8 - 1, sfc->regbase + SFC_ABIT);
> +	writel_relaxed(reg, sfc->regbase + SFC_CMD);
> +	writel_relaxed(from_to, sfc->regbase + SFC_ADDR);
> +
> +	if (op_type == SFC_CMD_DIR_WR)
> +		return rockchip_sfc_pio_write(sfc, buf, len);
> +	else
> +		return rockchip_sfc_pio_read(sfc, buf, len);
> +}
> +
> +static ssize_t rockchip_sfc_read(struct spi_nor *nor, loff_t from, size_t len,
> +				 u_char *read_buf)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	size_t offset;
> +	int ret;
> +	dma_addr_t dma_addr = 0;
> +
> +	if (!sfc->use_dma)
> +		goto no_dma;
> +
> +	for (offset = 0; offset < len; offset += SFC_DMA_MAX_LEN) {
> +		size_t trans = min_t(size_t, SFC_DMA_MAX_LEN, len - offset);
> +
> +		dma_addr = dma_map_single(NULL, (void *)read_buf,
> +					  trans, DMA_FROM_DEVICE);
> +		if (dma_mapping_error(sfc->dev, dma_addr))
> +			dma_addr = 0;
> +
> +		/* Fail to map dma, use pre-allocated area instead */
> +		ret = rockchip_sfc_dma_transfer(nor, from + offset,
> +						dma_addr ? dma_addr :
> +						sfc->dma_buffer,
> +						trans, SFC_CMD_DIR_RD);
> +		if (ret) {
> +			dev_warn(nor->dev, "DMA read timeout\n");
> +			return ret;
> +		}
> +		if (!dma_addr)
> +			memcpy(read_buf + offset, sfc->buffer, trans);
> +	}
> +
> +	return len;
> +
> +no_dma:
> +	ret = rockchip_sfc_pio_transfer(nor, from, len,
> +					read_buf, SFC_CMD_DIR_RD);
> +	if (ret) {
> +		dev_warn(nor->dev, "PIO read timeout\n");
> +		return ret;
> +	}
> +	return len;
> +}
> +
> +static ssize_t rockchip_sfc_write(struct spi_nor *nor, loff_t to,
> +				  size_t len, const u_char *write_buf)
> +{
> +	struct rockchip_sfc_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	size_t offset;
> +	int ret;
> +	dma_addr_t dma_addr = 0;
> +
> +	if (!sfc->use_dma)
> +		goto no_dma;

Seems like there's a lot of similarity between read/write .

> +	for (offset = 0; offset < len; offset += SFC_DMA_MAX_LEN) {
> +		size_t trans = min_t(size_t, SFC_DMA_MAX_LEN, len - offset);
> +
> +		dma_addr = dma_map_single(NULL, (void *)write_buf,
> +					  trans, DMA_TO_DEVICE);
> +		if (dma_mapping_error(sfc->dev, dma_addr)) {
> +			dma_addr = 0;
> +			memcpy(sfc->buffer, write_buf + offset, trans);
> +		}
> +
> +		/* Fail to map dma, use pre-allocated area instead */
> +		ret = rockchip_sfc_dma_transfer(nor, to + offset,
> +						dma_addr ? dma_addr :
> +						sfc->dma_buffer,
> +						trans, SFC_CMD_DIR_WR);
> +		if (dma_addr)
> +			dma_unmap_single(NULL, dma_addr,
> +					 trans, DMA_TO_DEVICE);
> +		if (ret) {
> +			dev_warn(nor->dev, "DMA write timeout\n");
> +			return ret;
> +		}
> +	}
> +
> +	return len;
> +no_dma:
> +	ret = rockchip_sfc_pio_transfer(nor, to, len,
> +					(u_char *)write_buf, SFC_CMD_DIR_WR);
> +	if (ret) {
> +		dev_warn(nor->dev, "PIO write timeout\n");
> +		return ret;
> +	}
> +	return len;
> +}
> +
> +/**
> + * Get spi flash device information and register it as a mtd device.
> + */
> +static int rockchip_sfc_register(struct device_node *np,
> +				 struct rockchip_sfc *sfc)
> +{
> +	struct device *dev = sfc->dev;
> +	struct spi_nor *nor;
> +	struct rockchip_sfc_priv *priv;
> +	struct mtd_info *mtd;
> +	int ret;
> +
> +	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
> +	if (!nor)
> +		return -ENOMEM;

You can embed struct spi_nor in struct rockchip_sfc_priv and drop this
allocation . Also it'd be a good idea to rename rockchip_sfc_priv to
something like rockchip_sfc_chip_priv to make it explicit this is a
per-chip private data -- which you can even pre-allocate in rockchi_sfc
structure as a static array of (four) such structures (see cadence qspi
driver for how this is done there).

> +	nor->dev = dev;
> +	spi_nor_set_flash_node(nor, np);
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(np, "reg", &priv->cs);
> +	if (ret) {
> +		dev_err(dev, "No reg property for %s\n",
> +			np->full_name);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(np, "spi-max-frequency",
> +			&priv->clk_rate);
> +	if (ret) {
> +		dev_err(dev, "No spi-max-frequency property for %s\n",
> +			np->full_name);
> +		return ret;
> +	}
> +
> +	priv->sfc = sfc;
> +	nor->priv = priv;
> +
> +	nor->prepare = rockchip_sfc_prep;
> +	nor->unprepare = rockchip_sfc_unprep;
> +	nor->read_reg = rockchip_sfc_read_reg;
> +	nor->write_reg = rockchip_sfc_write_reg;
> +	nor->read = rockchip_sfc_read;
> +	nor->write = rockchip_sfc_write;
> +	nor->erase = NULL;
> +	ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +	if (ret)
> +		return ret;
> +
> +	mtd = &nor->mtd;
> +	mtd->name = np->name;
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	sfc->nor[sfc->num_chip] = nor;
> +	sfc->num_chip++;
> +	return 0;
> +}
> +
> +static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
> +{
> +	int i;
> +
> +	for (i = 0; i < sfc->num_chip; i++)
> +		mtd_device_unregister(&sfc->nor[i]->mtd);
> +}
> +
> +static int rockchip_sfc_register_all(struct rockchip_sfc *sfc)
> +{
> +	struct device *dev = sfc->dev;
> +	struct device_node *np;
> +	int ret;
> +
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		ret = rockchip_sfc_register(np, sfc);
> +		if (ret)
> +			goto fail;
> +
> +		if (sfc->num_chip == SFC_MAX_CHIP_NUM) {
> +			dev_warn(dev, "Exceeds the max cs limitation\n");
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +
> +fail:
> +	dev_err(dev, "Failed to register all chip\n");
> +	rockchip_sfc_unregister_all(sfc);

See cadence qspi where we only unregister the registered flashes.
Implement it the same way here.

> +	return ret;
> +}
> +
> +static irqreturn_t rockchip_sfc_irq_handler(int irq, void *dev_id)
> +{
> +	struct rockchip_sfc *sfc = dev_id;
> +	u32 reg;
> +
> +	reg = readl_relaxed(sfc->regbase + SFC_RISR);
> +	dev_dbg(sfc->dev, "Get irq: 0x%x\n", reg);
> +
> +	/* Clear interrupt */
> +	writel_relaxed(reg, sfc->regbase + SFC_ICLR);
> +
> +	if (reg & SFC_IRQ_TRAN_FINISH)
> +		complete(&sfc->cp);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int rockchip_sfc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct rockchip_sfc *sfc;
> +	int ret;
> +
> +	sfc = devm_kzalloc(dev, sizeof(*sfc), GFP_KERNEL);
> +	if (!sfc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, sfc);
> +	sfc->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	sfc->regbase = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(sfc->regbase))
> +		return PTR_ERR(sfc->regbase);
> +
> +	sfc->clk = devm_clk_get(&pdev->dev, "sfc");
> +	if (IS_ERR(sfc->clk)) {
> +		dev_err(&pdev->dev, "Failed to get sfc interface clk\n");
> +		return PTR_ERR(sfc->clk);
> +	}
> +
> +	sfc->hclk = devm_clk_get(&pdev->dev, "hsfc");
> +	if (IS_ERR(sfc->hclk)) {
> +		dev_err(&pdev->dev, "Failed to get sfc ahp clk\n");
> +		return PTR_ERR(sfc->hclk);
> +	}
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_warn(dev, "Unable to set dma mask\n");
> +		return ret;
> +	}
> +
> +	sfc->buffer = dmam_alloc_coherent(dev, SFC_DMA_MAX_LEN,
> +			&sfc->dma_buffer, GFP_KERNEL);
> +	if (!sfc->buffer)
> +		return -ENOMEM;
> +
> +	mutex_init(&sfc->lock);
> +
> +	ret = clk_prepare_enable(sfc->hclk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to enable hclk\n");
> +		goto err_hclk;
> +	}
> +
> +	ret = clk_prepare_enable(sfc->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to enable clk\n");
> +		goto err_clk;
> +	}
> +
> +	if (of_property_read_bool(sfc->dev->of_node, "rockchip,sfc-no-dma"))
> +		sfc->use_dma = false;
> +	else
> +		sfc->use_dma = true;

sfc->use_dma = !of_property_read_bool(sfc->dev->of_node,
                                      "rockchip,sfc-no-dma");

> +	if (of_device_is_compatible(sfc->dev->of_node,
> +				    "rockchip,rk1108-sfc"))
> +		sfc->negative_edge = true;
> +	else
> +		sfc->negative_edge = false;

See above

> +	/* Find the irq */
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get the irq\n");
> +		goto err_irq;
> +	}
> +
> +	ret = devm_request_irq(dev, ret, rockchip_sfc_irq_handler,
> +			       0, pdev->name, sfc);
> +	if (ret) {
> +		dev_err(dev, "Failed to request irq\n");
> +		goto err_irq;
> +	}
> +
> +	ret = rockchip_sfc_init(sfc);
> +	if (ret)
> +		goto err_init;
> +
> +	ret = rockchip_sfc_register_all(sfc);
> +	if (ret)
> +		goto err_init;
> +
> +	clk_disable_unprepare(sfc->clk);
> +	return 0;
> +
> +err_irq:
> +err_init:

Drop the err_irq: label unless you plan to handle the error (which you
should).

> +	clk_disable_unprepare(sfc->clk);
> +err_clk:
> +	clk_disable_unprepare(sfc->hclk);
> +err_hclk:
> +	mutex_destroy(&sfc->lock);
> +	return ret;
> +}
> +
> +static int rockchip_sfc_remove(struct platform_device *pdev)
> +{
> +	struct rockchip_sfc *sfc = platform_get_drvdata(pdev);
> +
> +	rockchip_sfc_unregister_all(sfc);
> +	mutex_destroy(&sfc->lock);
> +	clk_disable_unprepare(sfc->clk);
> +	clk_disable_unprepare(sfc->hclk);
> +	return 0;
> +}
> +
> +static const struct of_device_id rockchip_sfc_dt_ids[] = {
> +	{ .compatible = "rockchip,sfc"},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rockchip_sfc_dt_ids);
> +
> +static struct platform_driver rockchip_sfc_driver = {
> +	.driver = {
> +		.name	= "rockchip-sfc",
> +		.of_match_table = rockchip_sfc_dt_ids,
> +	},
> +	.probe	= rockchip_sfc_probe,
> +	.remove	= rockchip_sfc_remove,
> +};
> +module_platform_driver(rockchip_sfc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Rockchip Serial Flash Controller Driver");

MODULE_AUTHOR is missing



-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
