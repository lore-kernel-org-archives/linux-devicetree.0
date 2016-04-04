From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v9] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Date: Sun, 3 Apr 2016 23:44:18 -0700
Message-ID: <20160404064418.GC13995@localhost>
References: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
 <56F73BC9.5000300@gmail.com>
 <56F8F630.5050008@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56F8F630.5050008-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jiancheng,

Looking good. In addition to Marek's comments, I have just a few small
comments. I'll post a small diff at the end, and a few inline comments.

On Mon, Mar 28, 2016 at 05:15:28PM +0800, Jiancheng Xue wrote:
> Hi Marek,
>     Firstly, thank you very much for your comments.
> 
> On 2016/3/27 9:47, Marek Vasut wrote:
> > On 03/26/2016 09:11 AM, Jiancheng Xue wrote:
> >> Add hisilicon spi-nor flash controller driver
> >>
> >> Signed-off-by: Binquan Peng <pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> >> Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Reviewed-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> >> Reviewed-by: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
> >> ---
> >> change log
> >> v9:
> >> Fixed issues pointed by Jagan Teki.
> > 
> > It'd be really great if you could list which exact issues you fixed.
> > 
> 
> OK. I'll describe the history log more detailed in next version.
> 
> >> v8:
> >> Fixed issues pointed by Ezequiel Garcia and Brian Norris.
> >> Moved dts binding file to mtd directory.
> >> Changed the compatible string more specific.
> > 
> > [...]

^^ You were using <linux/of_device.h> in here, even though you don't
need any of its contents. You just wanted <linux/of.h> and
<linux/platform_device.h>.

> > 
> >> +/* Hardware register offsets and field definitions */
> >> +#define FMC_CFG				0x00
> >> +#define SPI_NOR_ADDR_MODE		BIT(10)
> >> +#define FMC_GLOBAL_CFG			0x04
> >> +#define FMC_GLOBAL_CFG_WP_ENABLE	BIT(6)
> >> +#define FMC_SPI_TIMING_CFG		0x08
> >> +#define TIMING_CFG_TCSH(nr)		(((nr) & 0xf) << 8)
> >> +#define TIMING_CFG_TCSS(nr)		(((nr) & 0xf) << 4)
> >> +#define TIMING_CFG_TSHSL(nr)		((nr) & 0xf)
> >> +#define CS_HOLD_TIME			0x6
> >> +#define CS_SETUP_TIME			0x6
> >> +#define CS_DESELECT_TIME		0xf
> >> +#define FMC_INT				0x18
> >> +#define FMC_INT_OP_DONE			BIT(0)
> >> +#define FMC_INT_CLR			0x20
> >> +#define FMC_CMD				0x24
> >> +#define FMC_CMD_CMD1(_cmd)		((_cmd) & 0xff)
> > 
> > Drop the underscores in the argument names.
> > 
> OK.
> >> +#define FMC_ADDRL			0x2c
> >> +#define FMC_OP_CFG			0x30
> >> +#define OP_CFG_FM_CS(_cs)		((_cs) << 11)
> >> +#define OP_CFG_MEM_IF_TYPE(_type)	(((_type) & 0x7) << 7)
> >> +#define OP_CFG_ADDR_NUM(_addr)		(((_addr) & 0x7) << 4)
> >> +#define OP_CFG_DUMMY_NUM(_dummy)	((_dummy) & 0xf)
> >> +#define FMC_DATA_NUM			0x38
> >> +#define FMC_DATA_NUM_CNT(_n)		((_n) & 0x3fff)
> >> +#define FMC_OP				0x3c
> >> +#define FMC_OP_DUMMY_EN			BIT(8)
> >> +#define FMC_OP_CMD1_EN			BIT(7)
> >> +#define FMC_OP_ADDR_EN			BIT(6)
> >> +#define FMC_OP_WRITE_DATA_EN		BIT(5)
> >> +#define FMC_OP_READ_DATA_EN		BIT(2)
> >> +#define FMC_OP_READ_STATUS_EN		BIT(1)
> >> +#define FMC_OP_REG_OP_START		BIT(0)
> > 
> > [...]
> > 
> >> +enum hifmc_iftype {
> >> +	IF_TYPE_STD,
> >> +	IF_TYPE_DUAL,
> >> +	IF_TYPE_DIO,
> >> +	IF_TYPE_QUAD,
> >> +	IF_TYPE_QIO,
> >> +};
> >> +
> >> +struct hifmc_priv {
> >> +	int chipselect;
> > 
> > Can chipselect be set to < 0 values ?
> > 
> The type will be changed to u32.
> 
> >> +	u32 clkrate;
> >> +	struct hifmc_host *host;
> >> +};
> >> +
> >> +#define HIFMC_MAX_CHIP_NUM		2
> > 
> > This does not scale very well, use dynamic allocation.
> > 
> OK. Dynamic allocation will be used in next version.
> >> +struct hifmc_host {
> >> +	struct device *dev;
> >> +	struct mutex lock;
> >> +
> >> +	void __iomem *regbase;
> >> +	void __iomem *iobase;
> >> +	struct clk *clk;
> >> +	void *buffer;
> >> +	dma_addr_t dma_buffer;
> >> +
> >> +	struct spi_nor	nor[HIFMC_MAX_CHIP_NUM];
> >> +	struct hifmc_priv priv[HIFMC_MAX_CHIP_NUM];
> >> +	int num_chip;
> >> +};
> >> +
> >> +static inline int wait_op_finish(struct hifmc_host *host)
> >> +{
> >> +	unsigned int reg;
> >> +
> >> +	return readl_poll_timeout(host->regbase + FMC_INT, reg,
> >> +		(reg & FMC_INT_OP_DONE), 0, FMC_WAIT_TIMEOUT);
> >> +}
> >> +
> >> +static int get_if_type(enum read_mode flash_read)
> >> +{
> >> +	enum hifmc_iftype if_type;
> >> +
> >> +	switch (flash_read) {
> >> +	case SPI_NOR_DUAL:
> >> +		if_type = IF_TYPE_DUAL;
> >> +		break;
> >> +	case SPI_NOR_QUAD:
> >> +		if_type = IF_TYPE_QUAD;
> >> +		break;
> >> +	case SPI_NOR_NORMAL:
> >> +	case SPI_NOR_FAST:
> >> +	default:
> >> +		if_type = IF_TYPE_STD;
> >> +		break;
> >> +	}
> >> +
> >> +	return if_type;
> >> +}
> >> +
> >> +static void hisi_spi_nor_init(struct hifmc_host *host)
> >> +{
> >> +	unsigned int reg;
> > 
> > Should be u32 here.
> > 
> OK.
> >> +	reg = TIMING_CFG_TCSH(CS_HOLD_TIME)
> >> +		| TIMING_CFG_TCSS(CS_SETUP_TIME)
> >> +		| TIMING_CFG_TSHSL(CS_DESELECT_TIME);
> >> +	writel(reg, host->regbase + FMC_SPI_TIMING_CFG);
> >> +}
> >> +
> >> +static int hisi_spi_nor_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> >> +{
> >> +	struct hifmc_priv *priv = nor->priv;
> >> +	struct hifmc_host *host = priv->host;
> >> +	int ret;
> >> +
> >> +	mutex_lock(&host->lock);
> > 
> > Why do you need the mutex lock here ? Let me guess -- SPI NOR framework
> > locks a mutex in struct spi_nor , but that's not enough if you have
> > multiple SPI NORs on the same bus, because concurrent access to multiple
> > SPI NOR flashes needs locking on the controller level, right ?
> > 
> Yes, you are quite right. The controller can connect with two SPI NOR flashes
> on one board. This lock is used on the controller level.

Yeah... we should probably implement some common controller logic in the
core eventually. But the mutex is necessary for now.

> >> +	ret = clk_set_rate(host->clk, priv->clkrate);
> >> +	if (ret)
> >> +		goto out;
> >> +
> >> +	ret = clk_prepare_enable(host->clk);
> >> +	if (ret)
> >> +		goto out;
> >> +
> >> +	return 0;
> >> +
> >> +out:
> >> +	mutex_unlock(&host->lock);
> >> +	return ret;
> >> +}
> >> +
> >> +static void hisi_spi_nor_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
> >> +{
> >> +	struct hifmc_priv *priv = nor->priv;
> >> +	struct hifmc_host *host = priv->host;
> >> +
> >> +	clk_disable_unprepare(host->clk);
> >> +	mutex_unlock(&host->lock);
> >> +}
> >> +
> >> +static void hisi_spi_nor_cmd_prepare(struct hifmc_host *host, u8 cmd,
> >> +		u32 *opcfg)
> >> +{
> >> +	u32 reg;
> >> +
> >> +	*opcfg |= FMC_OP_CMD1_EN;
> >> +	switch (cmd) {
> >> +	case SPINOR_OP_RDID:
> >> +	case SPINOR_OP_RDSR:
> >> +	case SPINOR_OP_RDCR:
> >> +		*opcfg |= FMC_OP_READ_DATA_EN;
> >> +		break;
> >> +	case SPINOR_OP_WREN:
> >> +		reg = readl(host->regbase + FMC_GLOBAL_CFG);
> >> +		if (reg & FMC_GLOBAL_CFG_WP_ENABLE) {
> >> +			reg &= ~FMC_GLOBAL_CFG_WP_ENABLE;
> >> +			writel(reg, host->regbase + FMC_GLOBAL_CFG);
> >> +		}
> >> +		break;
> >> +	case SPINOR_OP_WRSR:
> >> +		*opcfg |= FMC_OP_WRITE_DATA_EN;
> >> +		break;
> >> +	case SPINOR_OP_BE_4K:
> >> +	case SPINOR_OP_BE_4K_PMC:
> >> +	case SPINOR_OP_SE_4B:
> >> +	case SPINOR_OP_SE:
> >> +		*opcfg |= FMC_OP_ADDR_EN;
> >> +		break;
> >> +	case SPINOR_OP_EN4B:
> >> +		reg = readl(host->regbase + FMC_CFG);
> >> +		reg |= SPI_NOR_ADDR_MODE;
> >> +		writel(reg, host->regbase + FMC_CFG);
> >> +		break;
> >> +	case SPINOR_OP_EX4B:
> >> +		reg = readl(host->regbase + FMC_CFG);
> >> +		reg &= ~SPI_NOR_ADDR_MODE;
> >> +		writel(reg, host->regbase + FMC_CFG);
> >> +		break;
> >> +	case SPINOR_OP_CHIP_ERASE:
> >> +	default:
> >> +		break;
> >> +	}
> > 
> > Won't the driver fail if we add new instructions into the SPI NOR core
> > which are not handled by this huge switch statement ?
> > 
> Only some of commands are needed to process in this stage for the controller.
> Others have no needs. So this function won't return failure.

It's not ideal to have this sort of function if we can avoid it (since
it's hard to figure out how to extend this for new opcodes). But it
looks necessary for now.

> I'll combine SPINOR_OP_CHIP_ERASE into the default case in next version.
> 
> >> +}
> > 
> > [...]
> > 
> >> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
> >> +			size_t len, size_t *retlen, const u_char *write_buf)
> >> +{
> >> +	struct hifmc_priv *priv = nor->priv;
> >> +	struct hifmc_host *host = priv->host;
> >> +	const unsigned char *ptr = write_buf;
> >> +	size_t actual_len;
> >> +
> >> +	*retlen = 0;
> >> +	while (len > 0) {
> >> +		if (to & HIFMC_DMA_MASK)
> >> +			actual_len = (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK))
> >> +				>= len	? len
> >> +				: (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK));
> > 
> > Rewrite this as something like the following snippet, for the sake of
> > readability:
> > 
> > actual_len = HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK);
> > if (actual_len >= len)
> >    actual_len = len;
> > 
> OK. Thank you.
> >> +		else
> >> +			actual_len = (len >= HIFMC_DMA_MAX_LEN)
> >> +				? HIFMC_DMA_MAX_LEN : len;

Wait, why do you need the else case? Isn't this just equivalent to the
first case? I'd suggest consolidating these two blocks, and dropping the
?: entirely, since (like Marek said) it's hurting readability. So:

		/* Don't cross HIFMC_DMA_MAX_LEN alignment boundaries */
		if ((HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK)) >= len)
			actual_len = len;
		else
			actual_len = HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK);

> >> +		memcpy(host->buffer, ptr, actual_len);
> >> +		hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, actual_len,
> >> +				FMC_OP_WRITE);
> >> +		to += actual_len;
> >> +		ptr += actual_len;
> >> +		len -= actual_len;
> >> +		*retlen += actual_len;
> >> +	}
> >> +}

[...]

Here's my diff:

diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index e974c92a0a25..0c58fd3b8790 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -16,13 +16,15 @@
  * You should have received a copy of the GNU General Public License
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
+
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 /* Hardware register offsets and field definitions */
@@ -343,13 +345,11 @@ static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
 
 	*retlen = 0;
 	while (len > 0) {
-		if (to & HIFMC_DMA_MASK)
-			actual_len = (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK))
-				>= len	? len
-				: (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK));
+		/* Don't cross HIFMC_DMA_MAX_LEN alignment boundaries */
+		if ((HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK)) >= len)
+			actual_len = len;
 		else
-			actual_len = (len >= HIFMC_DMA_MAX_LEN)
-				? HIFMC_DMA_MAX_LEN : len;
+			actual_len = HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK);
 		memcpy(host->buffer, ptr, actual_len);
 		hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, actual_len,
 				FMC_OP_WRITE);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
