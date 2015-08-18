From: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Mon, 17 Aug 2015 19:34:53 -0700
Message-ID: <55D299CD.2070809@st.com>
References: <1439522892-7524-1-git-send-email-marex@denx.de> <1439522892-7524-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439522892-7524-2-git-send-email-marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On 08/13/2015 08:28 PM, Marek Vasut wrote:
> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add support for the Cadence QSPI controller. This controller is
> present in the Altera SoCFPGA SoCs and this driver has been tested
> on the Cyclone V SoC.
> 
> Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>
> Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/mtd/spi-nor/Kconfig           |    6 +
>  drivers/mtd/spi-nor/Makefile          |    1 +
>  drivers/mtd/spi-nor/cadence-quadspi.c | 1266 +++++++++++++++++++++++++++++++++
>  3 files changed, 1273 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c
> 
> V2: use NULL instead of modalias in spi_nor_scan call
> V3: Use existing property is-decoded-cs instead of creating duplicate.
> V4: Support Micron quad mode by snooping command stream for EVCR command
>     and subsequently configuring Cadence controller for quad mode.
> V5: Clean up sparse and smatch complaints.  Remove snooping of Micron
>     quad mode.  Add comment on XIP mode bit and dummy clock cycles.  Set
>     up SRAM partition at 1:1 during init.
> V6: Remove dts patch that was included by mistake.  Incorporate Vikas's
>     comments regarding fifo width, SRAM partition setting, and trigger
>     address.  Trigger address was added as an unsigned int, as it is not
>     an IO resource per se, and does not need to be mapped. Also add
>     Marek Vasut's workaround for picking up OF properties on subnodes.
> V7: - Perform coding-style cleanup and type fixes. Remove ugly QSPI_*()
>       macros and replace them with functions. Get rid of unused variables.
>     - Implement support for nor->set_protocol() to handle Quad-command,
>       this patch now depends on the following patch:
>       mtd: spi-nor: notify (Q)SPI controller about protocol change
>     - Replace that cqspi_fifo_read() disaster with plain old readsl()
>       and cqspi_fifo_write() tentacle horror with pretty writesl().
>     - Remove CQSPI_SUPPORT_XIP_CHIPS, which is broken.
>     - Get rid of cqspi_find_chipselect() mess, instead just place the
>       struct cqspi_st and chipselect number into struct cqspi_flash_pdata
>       and set nor->priv to the struct cqspi_flash_pdata of that particular
>       chip.
>     - Replace the odd math in calculate_ticks_for_ns() with DIV_ROUND_UP().
>     - Make variables const where applicable.
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 64a4f0e..9485481 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -28,4 +28,10 @@ config SPI_FSL_QUADSPI
>           This enables support for the Quad SPI controller in master mode.
>           We only connect the NOR to this controller now.
> 
> +config SPI_CADENCE_QUADSPI
> +       tristate "Cadence Quad SPI controller"
> +       depends on ARCH_SOCFPGA

Remove the dependency on SOCFPGA.

> +       help
> +         This enables support for the Cadence Quad SPI controller and NOR flash.
> +
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 6a7ce14..372628c 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_MTD_SPI_NOR)      += spi-nor.o
> +obj-$(CONFIG_SPI_CADENCE_QUADSPI)      += cadence-quadspi.o
>  obj-$(CONFIG_SPI_FSL_QUADSPI)  += fsl-quadspi.o
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> new file mode 100644
> index 0000000..f59e286
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -0,0 +1,1266 @@
> +/*
> + * Driver for Cadence QSPI Controller
> + *
> + * Copyright Altera Corporation (C) 2012-2014. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/spi-nor.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched.h>
> +#include <linux/spi/spi.h>
> +#include <linux/timer.h>
> +
> +#define CQSPI_NAME                     "cadence-qspi"
> +#define CQSPI_MAX_CHIPSELECT           16
> +
> +struct cqspi_st;
> +
> +struct cqspi_flash_pdata {
> +       struct mtd_info mtd;
> +       struct spi_nor  nor;
> +       struct cqspi_st *cqspi;
> +       u32             clk_rate;
> +       u32             read_delay;
> +       u32             tshsl_ns;
> +       u32             tsd2d_ns;
> +       u32             tchsh_ns;
> +       u32             tslch_ns;
> +       u8              inst_width;
> +       u8              addr_width;
> +       u8              cs;
> +};
> +
> +struct cqspi_st {
> +       struct platform_device  *pdev;
> +
> +       struct clk              *clk;
> +       unsigned int            sclk;
> +
> +       void __iomem            *iobase;
> +       void __iomem            *ahb_base;
> +       struct completion       transfer_complete;
> +
> +       u32                     irq_mask;
> +       int                     current_cs;
> +       unsigned long           master_ref_clk_hz;
> +       bool                    is_decoded_cs;
> +       u32                     fifo_depth;
> +       u32                     fifo_width;
> +       u32                     trigger_address;
> +       struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
> +};
> +
> +/* Operation timeout value */
> +#define CQSPI_TIMEOUT_MS                       500
> +#define CQSPI_READ_TIMEOUT_MS                  10

please add some comment about the timeouts value selection.

> +#define CQSPI_POLL_IDLE_RETRY                  3
> +
> +#define CQSPI_REG_SRAM_RESV_WORDS              2
> +#define CQSPI_REG_SRAM_PARTITION_WR            1

remove unused macros.

> +#define CQSPI_REG_SRAM_THRESHOLD_BYTES         50

the macro is used only for write sram watermark, something like ...WR_THRESH_BYTES would be better.
Infact instead of magic number like 50, it should be based on sram_depth similar to read watermark configuration.

> +
> +/* Instruction type */
> +#define CQSPI_INST_TYPE_SINGLE                 0
> +#define CQSPI_INST_TYPE_DUAL                   1
> +#define CQSPI_INST_TYPE_QUAD                   2
> +
> +#define CQSPI_DUMMY_CLKS_MAX                   31
> +
> +#define CQSPI_STIG_DATA_LEN_MAX                        8
> +
> +/* Register map */
> +#define CQSPI_REG_CONFIG                       0x00
> +#define CQSPI_REG_CONFIG_ENABLE_MASK           BIT(0)
> +#define CQSPI_REG_CONFIG_DECODE_MASK           BIT(9)
> +#define CQSPI_REG_CONFIG_CHIPSELECT_LSB                10
> +#define CQSPI_REG_CONFIG_DMA_MASK              BIT(15)
> +#define CQSPI_REG_CONFIG_BAUD_LSB              19
> +#define CQSPI_REG_CONFIG_IDLE_LSB              31

To be consistent, it would be good to use BIT(nr) for all bit positions.

> +#define CQSPI_REG_CONFIG_CHIPSELECT_MASK       0xF
> +#define CQSPI_REG_CONFIG_BAUD_MASK             0xF
> +
> +#define CQSPI_REG_RD_INSTR                     0x04
> +#define CQSPI_REG_RD_INSTR_OPCODE_LSB          0
> +#define CQSPI_REG_RD_INSTR_TYPE_INSTR_LSB      8
> +#define CQSPI_REG_RD_INSTR_TYPE_ADDR_LSB       12
> +#define CQSPI_REG_RD_INSTR_TYPE_DATA_LSB       16
> +#define CQSPI_REG_RD_INSTR_MODE_EN_LSB         20
> +#define CQSPI_REG_RD_INSTR_DUMMY_LSB           24
> +#define CQSPI_REG_RD_INSTR_TYPE_INSTR_MASK     0x3
> +#define CQSPI_REG_RD_INSTR_TYPE_ADDR_MASK      0x3
> +#define CQSPI_REG_RD_INSTR_TYPE_DATA_MASK      0x3
> +#define CQSPI_REG_RD_INSTR_DUMMY_MASK          0x1F
> +
> +#define CQSPI_REG_WR_INSTR                     0x08
> +#define CQSPI_REG_WR_INSTR_OPCODE_LSB          0
> +#define CQSPI_REG_WR_INSTR_TYPE_ADDR_LSB       12
> +#define CQSPI_REG_WR_INSTR_TYPE_DATA_LSB       16
> +
> +#define CQSPI_REG_DELAY                                0x0C
> +#define CQSPI_REG_DELAY_TSLCH_LSB              0
> +#define CQSPI_REG_DELAY_TCHSH_LSB              8
> +#define CQSPI_REG_DELAY_TSD2D_LSB              16
> +#define CQSPI_REG_DELAY_TSHSL_LSB              24
> +#define CQSPI_REG_DELAY_TSLCH_MASK             0xFF
> +#define CQSPI_REG_DELAY_TCHSH_MASK             0xFF
> +#define CQSPI_REG_DELAY_TSD2D_MASK             0xFF
> +#define CQSPI_REG_DELAY_TSHSL_MASK             0xFF
> +
> +#define CQSPI_REG_READCAPTURE                  0x10
> +#define CQSPI_REG_READCAPTURE_BYPASS_LSB       0
> +#define CQSPI_REG_READCAPTURE_DELAY_LSB                1
> +#define CQSPI_REG_READCAPTURE_DELAY_MASK       0xF
> +
> +#define CQSPI_REG_SIZE                         0x14
> +#define CQSPI_REG_SIZE_ADDRESS_LSB             0
> +#define CQSPI_REG_SIZE_PAGE_LSB                        4
> +#define CQSPI_REG_SIZE_BLOCK_LSB               16
> +#define CQSPI_REG_SIZE_ADDRESS_MASK            0xF
> +#define CQSPI_REG_SIZE_PAGE_MASK               0xFFF
> +#define CQSPI_REG_SIZE_BLOCK_MASK              0x3F
> +
> +#define CQSPI_REG_SRAMPARTITION                        0x18
> +#define CQSPI_REG_INDIRECTTRIGGER              0x1C
> +
> +#define CQSPI_REG_DMA                          0x20
> +#define CQSPI_REG_DMA_SINGLE_LSB               0
> +#define CQSPI_REG_DMA_BURST_LSB                        8
> +#define CQSPI_REG_DMA_SINGLE_MASK              0xFF
> +#define CQSPI_REG_DMA_BURST_MASK               0xFF
> +
> +#define CQSPI_REG_REMAP                                0x24
> +#define CQSPI_REG_MODE_BIT                     0x28
> +
> +#define CQSPI_REG_SDRAMLEVEL                   0x2C
> +#define CQSPI_REG_SDRAMLEVEL_RD_LSB            0
> +#define CQSPI_REG_SDRAMLEVEL_WR_LSB            16
> +#define CQSPI_REG_SDRAMLEVEL_RD_MASK           0xFFFF
> +#define CQSPI_REG_SDRAMLEVEL_WR_MASK           0xFFFF
> +
> +#define CQSPI_REG_IRQSTATUS                    0x40
> +#define CQSPI_REG_IRQMASK                      0x44
> +
> +#define CQSPI_REG_INDIRECTRD                   0x60
> +#define CQSPI_REG_INDIRECTRD_START_MASK                BIT(0)
> +#define CQSPI_REG_INDIRECTRD_CANCEL_MASK       BIT(1)
> +#define CQSPI_REG_INDIRECTRD_DONE_MASK         BIT(5)
> +
> +#define CQSPI_REG_INDIRECTRDWATERMARK          0x64
> +#define CQSPI_REG_INDIRECTRDSTARTADDR          0x68
> +#define CQSPI_REG_INDIRECTRDBYTES              0x6C
> +
> +#define CQSPI_REG_CMDCTRL                      0x90
> +#define CQSPI_REG_CMDCTRL_EXECUTE_MASK         BIT(0)
> +#define CQSPI_REG_CMDCTRL_INPROGRESS_MASK      BIT(1)
> +#define CQSPI_REG_CMDCTRL_WR_BYTES_LSB         12
> +#define CQSPI_REG_CMDCTRL_WR_EN_LSB            15
> +#define CQSPI_REG_CMDCTRL_ADD_BYTES_LSB                16
> +#define CQSPI_REG_CMDCTRL_ADDR_EN_LSB          19
> +#define CQSPI_REG_CMDCTRL_RD_BYTES_LSB         20
> +#define CQSPI_REG_CMDCTRL_RD_EN_LSB            23
> +#define CQSPI_REG_CMDCTRL_OPCODE_LSB           24
> +#define CQSPI_REG_CMDCTRL_WR_BYTES_MASK                0x7
> +#define CQSPI_REG_CMDCTRL_ADD_BYTES_MASK       0x3
> +#define CQSPI_REG_CMDCTRL_RD_BYTES_MASK                0x7
> +
> +#define CQSPI_REG_INDIRECTWR                   0x70
> +#define CQSPI_REG_INDIRECTWR_START_MASK                BIT(0)
> +#define CQSPI_REG_INDIRECTWR_CANCEL_MASK       BIT(1)
> +#define CQSPI_REG_INDIRECTWR_DONE_MASK         BIT(5)
> +
> +#define CQSPI_REG_INDIRECTWRWATERMARK          0x74
> +#define CQSPI_REG_INDIRECTWRSTARTADDR          0x78
> +#define CQSPI_REG_INDIRECTWRBYTES              0x7C
> +
> +#define CQSPI_REG_CMDADDRESS                   0x94
> +#define CQSPI_REG_CMDREADDATALOWER             0xA0
> +#define CQSPI_REG_CMDREADDATAUPPER             0xA4
> +#define CQSPI_REG_CMDWRITEDATALOWER            0xA8
> +#define CQSPI_REG_CMDWRITEDATAUPPER            0xAC

I am not sure if there is any recommended way but instread of register macros with offset, isn't it better
to use something like struct cdns_qspi { 
					u32 config,
					u32 rd_instn,
					....
				};
& then configuring the pointer to this structure to the peripheral's (qspi controller in this case) base address.

It helps in debugging also as you can have all registers under one structure, easy/clean access of register like cdsn_qspi_ptr->config
instead of adding offset for every access & also clean picture of all peripheral registers.

> +
> +/* Interrupt status bits */
> +#define CQSPI_REG_IRQ_MODE_ERR                 BIT(0)
> +#define CQSPI_REG_IRQ_UNDERFLOW                        BIT(1)
> +#define CQSPI_REG_IRQ_IND_COMP                 BIT(2)
> +#define CQSPI_REG_IRQ_IND_RD_REJECT            BIT(3)
> +#define CQSPI_REG_IRQ_WR_PROTECTED_ERR         BIT(4)
> +#define CQSPI_REG_IRQ_ILLEGAL_AHB_ERR          BIT(5)
> +#define CQSPI_REG_IRQ_WATERMARK                        BIT(6)
> +#define CQSPI_REG_IRQ_IND_RD_OVERFLOW          BIT(12)
> +
> +#define CQSPI_IRQ_STATUS_ERR           (CQSPI_REG_IRQ_MODE_ERR         | \
> +                                        CQSPI_REG_IRQ_IND_RD_REJECT    | \
> +                                        CQSPI_REG_IRQ_WR_PROTECTED_ERR | \
> +                                        CQSPI_REG_IRQ_ILLEGAL_AHB_ERR)
> +
> +#define CQSPI_IRQ_MASK_RD              (CQSPI_REG_IRQ_WATERMARK        | \
> +                                        CQSPI_REG_IRQ_IND_RD_OVERFLOW  | \
> +                                        CQSPI_REG_IRQ_IND_COMP)
> +
> +#define CQSPI_IRQ_MASK_WR              (CQSPI_REG_IRQ_IND_COMP         | \
> +                                        CQSPI_REG_IRQ_WATERMARK        | \
> +                                        CQSPI_REG_IRQ_UNDERFLOW)
> +
> +#define CQSPI_IRQ_STATUS_MASK          0x1FFFF
> +
> +static unsigned int cqspi_init_timeout(const unsigned long timeout_in_ms)
> +{
> +       return jiffies + msecs_to_jiffies(timeout_in_ms);
> +}

unnecessary function, msecs_to_jiffies can be used directly in cqspi_check_timeout function.

> +
> +static unsigned int cqspi_check_timeout(const unsigned long timeout)
> +{
> +       return time_before(jiffies, timeout);
> +}

try to replace using blocking jiffies check using kernel timeout function.

> +
> +static bool cqspi_is_idle(struct cqspi_st *cqspi)
> +{
> +       u32 reg = readl(cqspi->iobase + CQSPI_REG_CONFIG);
> +
> +       return reg & (1 << CQSPI_REG_CONFIG_IDLE_LSB);
> +}
> +
> +static u32 cqspi_get_rd_sram_level(struct cqspi_st *cqspi)
> +{
> +       u32 reg = readl(cqspi->iobase + CQSPI_REG_SDRAMLEVEL);
> +
> +       reg >>= CQSPI_REG_SDRAMLEVEL_RD_LSB;
> +       return reg & CQSPI_REG_SDRAMLEVEL_RD_MASK;
> +}
> +
> +static irqreturn_t cqspi_irq_handler(int this_irq, void *dev)
> +{
> +       struct cqspi_st *cqspi = dev;
> +       unsigned int irq_status;
> +
> +       /* Read interrupt status */
> +       irq_status = readl(cqspi->iobase + CQSPI_REG_IRQSTATUS);
> +
> +       /* Clear interrupt */
> +       writel(irq_status, cqspi->iobase + CQSPI_REG_IRQSTATUS);
> +
> +       if (irq_status & cqspi->irq_mask)
> +               complete(&cqspi->transfer_complete);
> +
> +       return IRQ_HANDLED;
> +}
> +

[...]

> +
> +static int cqspi_indirect_read_execute(struct spi_nor *nor,
> +                                      u8 *rxbuf, const unsigned n_rx)
> +{
> +       struct cqspi_flash_pdata *f_pdata = nor->priv;
> +       struct cqspi_st *cqspi = f_pdata->cqspi;
> +       void __iomem *reg_base = cqspi->iobase;
> +       void __iomem *ahb_base = cqspi->ahb_base;
> +       unsigned int remaining = n_rx;
> +       unsigned int reg = 0;
> +       unsigned int bytes_to_read = 0;
> +       unsigned int timeout;
> +       int ret = 0;
> +
> +       writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
> +
> +       /* Clear all interrupts. */
> +       writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
> +
> +       cqspi->irq_mask = CQSPI_IRQ_MASK_RD;
> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);

here interrupt mask is being configured for every read, better would be to move it in init.

> +
> +       reinit_completion(&cqspi->transfer_complete);
> +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
> +              reg_base + CQSPI_REG_INDIRECTRD);
> +
> +       while (remaining > 0) {
> +               ret = wait_for_completion_timeout(&cqspi->transfer_complete,
> +                                                 msecs_to_jiffies
> +                                                 (CQSPI_READ_TIMEOUT_MS));
> +
> +               bytes_to_read = cqspi_get_rd_sram_level(cqspi);
> +
> +               if (!ret && bytes_to_read == 0) {
> +                       dev_err(nor->dev, "Indirect read timeout, no bytes\n");
> +                       ret = -ETIMEDOUT;
> +                       goto failrd;
> +               }
> +
> +               while (bytes_to_read != 0) {
> +                       bytes_to_read *= cqspi->fifo_width;
> +                       bytes_to_read = bytes_to_read > remaining ?
> +                                       remaining : bytes_to_read;
> +                       readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
> +                       rxbuf += bytes_to_read;
> +                       remaining -= bytes_to_read;
> +                       bytes_to_read = cqspi_get_rd_sram_level(cqspi);
> +               }
> +       }
> +
> +       /* Check indirect done status */
> +       timeout = cqspi_init_timeout(CQSPI_TIMEOUT_MS);
> +       while (cqspi_check_timeout(timeout)) {
> +               reg = readl(reg_base + CQSPI_REG_INDIRECTRD);
> +               if (reg & CQSPI_REG_INDIRECTRD_DONE_MASK)
> +                       break;
> +       }
> +
> +       if (!(reg & CQSPI_REG_INDIRECTRD_DONE_MASK)) {
> +               dev_err(nor->dev,
> +                       "Indirect read completion error 0x%08x\n", reg);
> +               ret = -ETIMEDOUT;
> +               goto failrd;
> +       }
> +
> +       /* Disable interrupt */
> +       writel(0, reg_base + CQSPI_REG_IRQMASK);
> +
> +       /* Clear indirect completion status */
> +       writel(CQSPI_REG_INDIRECTRD_DONE_MASK, reg_base + CQSPI_REG_INDIRECTRD);
> +
> +       return 0;
> +
> + failrd:
> +       /* Disable interrupt */
> +       writel(0, reg_base + CQSPI_REG_IRQMASK);
> +
> +       /* Cancel the indirect read */
> +       writel(CQSPI_REG_INDIRECTWR_CANCEL_MASK,
> +              reg_base + CQSPI_REG_INDIRECTRD);
> +       return ret;
> +}
> +
> +static int cqspi_indirect_write_setup(struct spi_nor *nor,
> +                                     const unsigned int to_addr)
> +{
> +       unsigned int reg;
> +       struct cqspi_flash_pdata *f_pdata = nor->priv;
> +       struct cqspi_st *cqspi = f_pdata->cqspi;
> +       void __iomem *reg_base = cqspi->iobase;
> +
> +       /* Set opcode. */
> +       reg = nor->program_opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
> +       writel(reg, reg_base + CQSPI_REG_WR_INSTR);
> +       reg = cqspi_calc_rdreg(nor, nor->program_opcode);
> +       writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> +
> +       writel(to_addr, reg_base + CQSPI_REG_INDIRECTWRSTARTADDR);
> +
> +       reg = readl(reg_base + CQSPI_REG_SIZE);
> +       reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
> +       reg |= (nor->addr_width - 1);
> +       writel(reg, reg_base + CQSPI_REG_SIZE);
> +       return 0;
> +}
> +
> +static int cqspi_indirect_write_execute(struct spi_nor *nor,
> +                                       const u8 *txbuf, const unsigned n_tx)
> +{
> +       const unsigned int page_size = nor->page_size;
> +       struct cqspi_flash_pdata *f_pdata = nor->priv;
> +       struct cqspi_st *cqspi = f_pdata->cqspi;
> +       void __iomem *reg_base = cqspi->iobase;
> +       unsigned int remaining = n_tx;
> +       unsigned int timeout;
> +       unsigned int reg = 0;
> +       unsigned int write_bytes;
> +       int ret;
> +
> +       writel(remaining, reg_base + CQSPI_REG_INDIRECTWRBYTES);
> +
> +       /* Clear all interrupts. */
> +       writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
> +
> +       cqspi->irq_mask = CQSPI_IRQ_MASK_WR;
> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);

same like read, it should be moved to init.

> +
> +       reinit_completion(&cqspi->transfer_complete);
> +       writel(CQSPI_REG_INDIRECTWR_START_MASK,
> +              reg_base + CQSPI_REG_INDIRECTWR);
> +
> +       while (remaining > 0) {
> +               write_bytes = remaining > page_size ? page_size : remaining;
> +               writesl(cqspi->ahb_base, txbuf, DIV_ROUND_UP(write_bytes, 4));
> +
> +               ret = wait_for_completion_timeout(&cqspi->transfer_complete,
> +                                                 msecs_to_jiffies
> +                                                 (CQSPI_TIMEOUT_MS));
> +               if (!ret) {
> +                       dev_err(nor->dev, "Indirect write timeout\n");
> +                       ret = -ETIMEDOUT;
> +                       goto failwr;
> +               }
> +
> +               txbuf += write_bytes;
> +               remaining -= write_bytes;
> +       }
> +
> +       ret = wait_for_completion_timeout(&cqspi->transfer_complete,
> +                                         msecs_to_jiffies(CQSPI_TIMEOUT_MS));
> +       if (!ret) {
> +               dev_err(nor->dev, "Indirect write timeout\n");
> +               ret = -ETIMEDOUT;
> +               goto failwr;
> +       }
> +
> +       /* Check indirect done status */
> +       timeout = cqspi_init_timeout(CQSPI_TIMEOUT_MS);
> +       while (cqspi_check_timeout(timeout)) {
> +               reg = readl(reg_base + CQSPI_REG_INDIRECTWR);
> +               if (reg & CQSPI_REG_INDIRECTWR_DONE_MASK)
> +                       break;
> +       }
> +
> +       if (!(reg & CQSPI_REG_INDIRECTWR_DONE_MASK)) {
> +               dev_err(nor->dev,
> +                       "Indirect write completion error 0x%08x\n", reg);
> +               ret = -ETIMEDOUT;
> +               goto failwr;
> +       }
> +
> +       /* Disable interrupt. */
> +       writel(0, reg_base + CQSPI_REG_IRQMASK);
> +
> +       /* Clear indirect completion status */
> +       writel(CQSPI_REG_INDIRECTWR_DONE_MASK, reg_base + CQSPI_REG_INDIRECTWR);
> +
> +       cqspi_wait_idle(cqspi);
> +
> +       return 0;
> +
> + failwr:
> +       /* Disable interrupt. */
> +       writel(0, reg_base + CQSPI_REG_IRQMASK);
> +
> +       /* Cancel the indirect write */
> +       writel(CQSPI_REG_INDIRECTWR_CANCEL_MASK,
> +              reg_base + CQSPI_REG_INDIRECTWR);
> +       return ret;
> +}
> +

[...]

> +static void cqspi_controller_init(struct cqspi_st *cqspi)
> +{
> +       cqspi_controller_disable(cqspi);
> +
> +       /* Configure the remap address register, no remap */
> +       writel(0, cqspi->iobase + CQSPI_REG_REMAP);
> +
> +       /* Disable all interrupts. */
> +       writel(0, cqspi->iobase + CQSPI_REG_IRQMASK);
> +
> +       /* Configure the SRAM split to 1:1 . */
> +       writel(cqspi->fifo_depth / 2, cqspi->iobase + CQSPI_REG_SRAMPARTITION);
> +
> +       /* Load indirect trigger address. */

almost all comments of this function seems unnecessary.

> +       writel(cqspi->trigger_address,
> +              cqspi->iobase + CQSPI_REG_INDIRECTTRIGGER);
> +
> +       /* Program read and write watermark. */
> +       writel(cqspi->fifo_depth * cqspi->fifo_width / 2,
> +              cqspi->iobase + CQSPI_REG_INDIRECTRDWATERMARK);
> +       writel(CQSPI_REG_SRAM_THRESHOLD_BYTES,
> +              cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);

better to configure indirect write watermark based on sram depth.

Rgds,
Vikas

> +
> +       cqspi_controller_enable(cqspi);
> +}
> +
> +static int cqspi_remove(struct platform_device *pdev)
> +{
> +       struct cqspi_st *cqspi = platform_get_drvdata(pdev);
> +       int i;
> +
> +       cqspi_controller_disable(cqspi);
> +
> +       for (i = 0; i < CQSPI_MAX_CHIPSELECT; i++)
> +               if (cqspi->f_pdata[i].mtd.name)
> +                       mtd_device_unregister(&cqspi->f_pdata[i].mtd);
> +
> +       return 0;
> +}
> +
> +static int cqspi_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct mtd_part_parser_data ppdata;
> +       struct device *dev = &pdev->dev;
> +       struct cqspi_st *cqspi;
> +       struct spi_nor *nor;
> +       struct mtd_info *mtd;
> +       struct resource *res;
> +       struct resource *res_ahb;
> +       int ret;
> +       int irq;
> +
> +       cqspi = devm_kzalloc(dev, sizeof(*cqspi), GFP_KERNEL);
> +       if (!cqspi)
> +               return -ENOMEM;
> +
> +       cqspi->pdev = pdev;
> +       platform_set_drvdata(pdev, cqspi);
> +
> +       /* Obtain configuration from OF. */
> +       ret = cqspi_of_get_pdata(pdev);
> +       if (ret) {
> +               dev_err(dev, "Cannot get mandatory OF data.\n");
> +               return -ENODEV;
> +       }
> +
> +       /* Obtain QSPI clock. */
> +       cqspi->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(cqspi->clk)) {
> +               dev_err(dev, "Cannot claim QSPI clock.\n");
> +               return PTR_ERR(cqspi->clk);
> +       }
> +
> +       cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
> +
> +       /* Obtain and remap controller address. */
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       cqspi->iobase = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(cqspi->iobase)) {
> +               dev_err(dev, "Cannot remap controller address.\n");
> +               return PTR_ERR(cqspi->iobase);
> +       }
> +
> +       /* Obtain and remap AHB address. */
> +       res_ahb = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +       cqspi->ahb_base = devm_ioremap_resource(dev, res_ahb);
> +       if (IS_ERR(cqspi->ahb_base)) {
> +               dev_err(dev, "Cannot remap AHB address.\n");
> +               return PTR_ERR(cqspi->ahb_base);
> +       }
> +
> +       init_completion(&cqspi->transfer_complete);
> +
> +       /* Obtain IRQ line. */
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0) {
> +               dev_err(dev, "Cannot obtain IRQ.\n");
> +               return -ENXIO;
> +       }
> +
> +       ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
> +                              pdev->name, cqspi);
> +       if (ret) {
> +               dev_err(dev, "Cannot request IRQ.\n");
> +               return ret;
> +       }
> +
> +       cqspi_wait_idle(cqspi);
> +       cqspi_controller_init(cqspi);
> +       cqspi->current_cs = -1;
> +       cqspi->sclk = 0;
> +
> +       /* Get flash device data */
> +       for_each_available_child_of_node(dev->of_node, np) {
> +               unsigned int cs;
> +               struct cqspi_flash_pdata *f_pdata;
> +
> +               if (of_property_read_u32(np, "reg", &cs)) {
> +                       dev_err(dev, "couldn't determine chip select\n");
> +                       return -ENXIO;
> +               }
> +
> +               if (cs >= CQSPI_MAX_CHIPSELECT) {
> +                       dev_err(dev, "chip select %d out of range\n", cs);
> +                       return -ENXIO;
> +               }
> +
> +               f_pdata = &cqspi->f_pdata[cs];
> +               f_pdata->cqspi = cqspi;
> +               f_pdata->cs = cs;
> +
> +               ret = cqspi_of_get_flash_pdata(pdev, f_pdata, np);
> +               if (ret)
> +                       goto probe_failed;
> +
> +               nor = &f_pdata->nor;
> +               mtd = &f_pdata->mtd;
> +
> +               nor->mtd = mtd;
> +               nor->dev = dev;
> +               nor->priv = f_pdata;
> +               mtd->priv = nor;
> +
> +               nor->read_reg = cqspi_read_reg;
> +               nor->write_reg = cqspi_write_reg;
> +               nor->read = cqspi_read;
> +               nor->write = cqspi_write;
> +               nor->erase = cqspi_erase;
> +               nor->set_protocol = cqspi_set_protocol;
> +
> +               nor->prepare = cqspi_prep;
> +
> +               /*
> +                * Here is a 'nasty hack' from Marek Vasut to pick
> +                * up OF properties from flash device subnode.
> +                */
> +               nor->dev->of_node = np;
> +
> +               ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +               if (ret)
> +                       goto probe_failed;
> +
> +               if (nor->read_dummy > CQSPI_DUMMY_CLKS_MAX)
> +                       nor->read_dummy = CQSPI_DUMMY_CLKS_MAX;
> +
> +               ppdata.of_node = np;
> +               ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
> +               if (ret)
> +                       goto probe_failed;
> +       }
> +
> +       dev_info(dev, "Cadence QSPI NOR flash driver\n");
> +       return 0;
> +
> +probe_failed:
> +       dev_err(dev, "Cadence QSPI NOR probe failed %d\n", ret);
> +       cqspi_remove(pdev);
> +       return ret;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int cqspi_suspend(struct device *dev)
> +{
> +       struct cqspi_st *cqspi = dev_get_drvdata(dev);
> +
> +       cqspi_controller_disable(cqspi);
> +       return 0;
> +}
> +
> +static int cqspi_resume(struct device *dev)
> +{
> +       struct cqspi_st *cqspi = dev_get_drvdata(dev);
> +
> +       cqspi_controller_enable(cqspi);
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops cqspi__dev_pm_ops = {
> +       .suspend = cqspi_suspend,
> +       .resume = cqspi_resume,
> +};
> +
> +#define CQSPI_DEV_PM_OPS       (&cqspi__dev_pm_ops)
> +#else
> +#define CQSPI_DEV_PM_OPS       NULL
> +#endif
> +
> +static struct of_device_id const cqspi_dt_ids[] = {
> +       {.compatible = "cdns,qspi-nor",},
> +       { /* end of table */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, cqspi_dt_ids);
> +
> +static struct platform_driver cqspi_platform_driver = {
> +       .probe = cqspi_probe,
> +       .remove = cqspi_remove,
> +       .driver = {
> +               .name = CQSPI_NAME,
> +               .pm = CQSPI_DEV_PM_OPS,
> +               .of_match_table = cqspi_dt_ids,
> +       },
> +};
> +
> +module_platform_driver(cqspi_platform_driver);
> +
> +MODULE_DESCRIPTION("Cadence QSPI Controller Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" CQSPI_NAME);
> +MODULE_AUTHOR("Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>");
> +MODULE_AUTHOR("Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>");
> --
> 2.1.4
> 
> .
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
