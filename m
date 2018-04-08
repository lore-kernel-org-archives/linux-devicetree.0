Return-Path: <SRS0=rQ6/=G5=gmail.com=andyshrk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
References: <1518091958-3672-1-git-send-email-andy.yan@rock-chips.com> <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
From: Andy Yan <andyshrk@gmail.com>
Date: Sun, 8 Apr 2018 20:08:45 +0800
Message-ID: <CANbgqARrCfFV-Jh8kYVVFcpockECURHzBwPgHa2icngVtevCfA@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] mtd: spi-nor: add rockchip serial flash controller driver
Content-Type: multipart/alternative; boundary="001a11427730b9498005695526e9"
To: Andy Yan <andy.yan@rock-chips.com>
Cc: cyrille.pitchen@wedev4u.fr, mchehab@kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com
List-ID: <devicetree@vger.kernel.org>

--001a11427730b9498005695526e9
Content-Type: text/plain; charset="UTF-8"

ping

2018-02-08 20:18 GMT+08:00 Andy Yan <andy.yan@rock-chips.com>:

> From: Shawn Lin <shawn.lin@rock-chips.com>
>
> Add Rockchip SFC(serial flash controller) driver.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
>
> ---
>
> Changes in v8:
> - remove unused macro SFC_CMD_TRAN_BYTES_MASK
> - set max transfer length to 15.5KB
> - remove unnecessary buffer align check
> - remove the duplicate logic what spi-nor.c already does for spi_nor_write
> - add spi_nor_erase, as the SFC should get the erase address.
>
> Changes in v7:
> - correct the fifo status check in pio read/write mode.
> - copy data from user buffer to dma buffer
>
> Changes in v6:
> - fold in Andy's improvement for checking fifo level
>   before pio read
> - rename the controller to rv1108 since offically it's
>   renamed and acked by Rob.
> - use dma_coerce_mask_and_coherent suggested by Andy.
>
> Changes in v5:
> - check if the buf is aligned to 32bit
> - check if the buf for dma comes from vmalloc
> - fix to use 1-1-n according to the current framework
> - avoid bytes cnt overflow
>
> Changes in v4:
> - use uppercase DMA for description
> - simplify the code of get_if_type
> - use dma_dir to simplify the code
> - simplify the rockchip_sfc_do_rd_wr
> - some minor improvements
> - add reset controller when doing resume
>
> Changes in v3:
> - use io{read32,write32}_rep to simplify the corner cases
> - remove more unnecessary bit definitions
> - some minor comment fixes and improvement
> - fix wrong unregister function
> - unify more code
> - use nor to avoid constantly replicating the whole
>   sfc->flash[sfc->num_chip].nor
> - add email for MODULE_AUTHOR
> - remove #if 1 --- #endif
> - extract DMA code to imporve the code structure
> - reset all when failing to do dma
> - pass sfc to get_if_type
> - rename sfc-no-dma to sfc-no-DMA
>
> Changes in v2:
> - fix typos
> - add some comment for buffer and others operations
> - rename SFC_MAX_CHIP_NUM to MAX_CHIPSELECT_NUM
> - use u8 for cs
> - return -EINVAL for default case of get_if_type
> - use readl_poll_*() to check timeout cases
> - simplify and clarify some condition checks
> - rework the bitshifts to simplify the code
> - define SFC_CMD_DUMMY(x)
> - fix ummap for dma read path and finish all the
>   cache maintenance.
> - rename to rockchip_sfc_chip_priv and embed struct spi_nor
>   in it.
> - add MODULE_AUTHOR
> - add runtime PM and general PM support.
> - Thanks for Marek's comments. Link:
>   http://lists.infradead.org/pipermail/linux-mtd/2016-November/070321.html
>
>  MAINTAINERS                        |   9 +
>  drivers/mtd/spi-nor/Kconfig        |   7 +
>  drivers/mtd/spi-nor/Makefile       |   1 +
>  drivers/mtd/spi-nor/rockchip-sfc.c | 942 ++++++++++++++++++++++++++++++
> +++++++
>  4 files changed, 959 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/rockchip-sfc.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa71ab52f..0718bc0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11704,6 +11704,15 @@ F:     drivers/gpio/gpio-bd9571mwv.c
>  F:     include/linux/mfd/bd9571mwv.h
>  F:     Documentation/devicetree/bindings/mfd/bd9571mwv.txt
>
> +ROCKCHIP SERIAL FLASH CONTROLLER DRIVER
> +M:     Shawn Lin <shawn.lin@rock-chips.com>
> +M:     Andy Yan <andy.yan@rock-chips.com>
> +L:     linux-mtd@lists.infradead.org
> +L:     linux-rockchip@lists.infradead.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
> +F:     drivers/mtd/spi-nor/rockchip-sfc.c
> +
>  ROSE NETWORK LAYER
>  M:     Ralf Baechle <ralf@linux-mips.org>
>  L:     linux-hams@vger.kernel.org
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 89da88e..f2898ea 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -129,4 +129,11 @@ config SPI_STM32_QUADSPI
>           This enables support for the STM32 Quad SPI controller.
>           We only connect the NOR to this controller.
>
> +config SPI_ROCKCHIP_SFC
> +       tristate "Rockchip Serial Flash Controller(SFC)"
> +       depends on ARCH_ROCKCHIP || COMPILE_TEST
> +       depends on HAS_IOMEM && HAS_DMA
> +       help
> +         This enables support for rockchip serial flash controller.
> +
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index f4c61d2..c294156 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -11,3 +11,4 @@ obj-$(CONFIG_SPI_INTEL_SPI)   += intel-spi.o
>  obj-$(CONFIG_SPI_INTEL_SPI_PCI)        += intel-spi-pci.o
>  obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)   += intel-spi-platform.o
>  obj-$(CONFIG_SPI_STM32_QUADSPI)        += stm32-quadspi.o
> +obj-$(CONFIG_SPI_ROCKCHIP_SFC) += rockchip-sfc.o
> diff --git a/drivers/mtd/spi-nor/rockchip-sfc.c b/drivers/mtd/spi-nor/
> rockchip-sfc.c
> new file mode 100644
> index 0000000..6037101
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/rockchip-sfc.c
> @@ -0,0 +1,942 @@
> +/*
> + * Rockchip Serial Flash Controller Driver
> + *
> + * Copyright (c) 2017, Rockchip Inc.
> + * Author: Shawn Lin <shawn.lin@rock-chips.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iopoll.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/spi-nor.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +/* System control */
> +#define SFC_CTRL                       0x0
> +#define  SFC_CTRL_COMMON_BITS_1                0x0
> +#define  SFC_CTRL_COMMON_BITS_2                0x1
> +#define  SFC_CTRL_COMMON_BITS_4                0x2
> +#define  SFC_CTRL_DATA_BITS_SHIFT      12
> +#define  SFC_CTRL_ADDR_BITS_SHIFT      10
> +#define  SFC_CTRL_CMD_BITS_SHIFT       8
> +#define  SFC_CTRL_PHASE_SEL_NEGETIVE   BIT(1)
> +
> +/* Interrupt mask */
> +#define SFC_IMR                                0x4
> +#define  SFC_IMR_RX_FULL               BIT(0)
> +#define  SFC_IMR_RX_UFLOW              BIT(1)
> +#define  SFC_IMR_TX_OFLOW              BIT(2)
> +#define  SFC_IMR_TX_EMPTY              BIT(3)
> +#define  SFC_IMR_TRAN_FINISH           BIT(4)
> +#define  SFC_IMR_BUS_ERR               BIT(5)
> +#define  SFC_IMR_NSPI_ERR              BIT(6)
> +#define  SFC_IMR_DMA                   BIT(7)
> +
> +/* Interrupt clear */
> +#define SFC_ICLR                       0x8
> +#define  SFC_ICLR_RX_FULL              BIT(0)
> +#define  SFC_ICLR_RX_UFLOW             BIT(1)
> +#define  SFC_ICLR_TX_OFLOW             BIT(2)
> +#define  SFC_ICLR_TX_EMPTY             BIT(3)
> +#define  SFC_ICLR_TRAN_FINISH          BIT(4)
> +#define  SFC_ICLR_BUS_ERR              BIT(5)
> +#define  SFC_ICLR_NSPI_ERR             BIT(6)
> +#define  SFC_ICLR_DMA                  BIT(7)
> +
> +/* FIFO threshold level */
> +#define SFC_FTLR                       0xc
> +#define  SFC_FTLR_TX_SHIFT             0
> +#define  SFC_FTLR_TX_MASK              0x1f
> +#define  SFC_FTLR_RX_SHIFT             8
> +#define  SFC_FTLR_RX_MASK              0x1f
> +
> +/* Reset FSM and FIFO */
> +#define SFC_RCVR                       0x10
> +#define  SFC_RCVR_RESET                        BIT(0)
> +
> +/* Enhanced mode */
> +#define SFC_AX                         0x14
> +
> +/* Address Bit number */
> +#define SFC_ABIT                       0x18
> +
> +/* Interrupt status */
> +#define SFC_ISR                                0x1c
> +#define  SFC_ISR_RX_FULL_SHIFT         BIT(0)
> +#define  SFC_ISR_RX_UFLOW_SHIFT                BIT(1)
> +#define  SFC_ISR_TX_OFLOW_SHIFT                BIT(2)
> +#define  SFC_ISR_TX_EMPTY_SHIFT                BIT(3)
> +#define  SFC_ISR_TX_FINISH_SHIFT       BIT(4)
> +#define  SFC_ISR_BUS_ERR_SHIFT         BIT(5)
> +#define  SFC_ISR_NSPI_ERR_SHIFT                BIT(6)
> +#define  SFC_ISR_DMA_SHIFT             BIT(7)
> +
> +/* FIFO status */
> +#define SFC_FSR                                0x20
> +#define  SFC_FSR_TX_IS_FULL            BIT(0)
> +#define  SFC_FSR_TX_IS_EMPTY           BIT(1)
> +#define  SFC_FSR_RX_IS_EMPTY           BIT(2)
> +#define  SFC_FSR_RX_IS_FULL            BIT(3)
> +#define  SFC_FSR_TXLV_MASK             GENMASK(12, 8)
> +#define  SFC_FSR_TXLV_SHIFT            8
> +#define  SFC_FSR_RXLV_MASK             GENMASK(20, 16)
> +#define  SFC_FSR_RXLV_SHIFT            16
> +
> +/* FSM status */
> +#define SFC_SR                         0x24
> +#define  SFC_SR_IS_IDLE                        0x0
> +#define  SFC_SR_IS_BUSY                        0x1
> +
> +/* Raw interrupt status */
> +#define SFC_RISR                       0x28
> +#define  SFC_RISR_RX_FULL              BIT(0)
> +#define  SFC_RISR_RX_UNDERFLOW         BIT(1)
> +#define  SFC_RISR_TX_OVERFLOW          BIT(2)
> +#define  SFC_RISR_TX_EMPTY             BIT(3)
> +#define  SFC_RISR_TRAN_FINISH          BIT(4)
> +#define  SFC_RISR_BUS_ERR              BIT(5)
> +#define  SFC_RISR_NSPI_ERR             BIT(6)
> +#define  SFC_RISR_DMA                  BIT(7)
> +
> +/* Master trigger */
> +#define SFC_DMA_TRIGGER                        0x80
> +
> +/* Src or Dst addr for master */
> +#define SFC_DMA_ADDR                   0x84
> +
> +/* Command */
> +#define SFC_CMD                                0x100
> +#define  SFC_CMD_IDX_SHIFT             0
> +#define  SFC_CMD_DUMMY_SHIFT           8
> +#define  SFC_CMD_DIR_RD                        0
> +#define  SFC_CMD_DIR_WR                        1
> +#define  SFC_CMD_DIR_SHIFT             12
> +#define  SFC_CMD_ADDR_ZERO             (0x0 << 14)
> +#define  SFC_CMD_ADDR_24BITS           (0x1 << 14)
> +#define  SFC_CMD_ADDR_32BITS           (0x2 << 14)
> +#define  SFC_CMD_ADDR_FRS              (0x3 << 14)
> +#define  SFC_CMD_TRAN_BYTES_SHIFT      16
> +#define  SFC_CMD_CS_SHIFT              30
> +
> +/* Address */
> +#define SFC_ADDR                       0x104
> +
> +/* Data */
> +#define SFC_DATA                       0x108
> +
> +#define SFC_MAX_CHIPSELECT_NUM         4
> +
> +/* The SFC can transfer max 16KB - 1 at one time
> + * we set it to 15.5KB here for alignment.
> + */
> +#define SFC_MAX_TRANS_BYTES            (512 * 31)
> +
> +#define SFC_CMD_DUMMY(x) \
> +       ((x) << SFC_CMD_DUMMY_SHIFT)
> +
> +enum rockchip_sfc_iftype {
> +       IF_TYPE_STD,
> +       IF_TYPE_DUAL,
> +       IF_TYPE_QUAD,
> +};
> +
> +struct rockchip_sfc;
> +struct rockchip_sfc_chip_priv {
> +       u8 cs;
> +       u32 clk_rate;
> +       struct spi_nor nor;
> +       struct rockchip_sfc *sfc;
> +};
> +
> +struct rockchip_sfc {
> +       struct device *dev;
> +       struct mutex lock;
> +       void __iomem *regbase;
> +       struct clk *hclk;
> +       struct clk *clk;
> +       /* virtual mapped addr for dma_buffer */
> +       void *buffer;
> +       dma_addr_t dma_buffer;
> +       struct completion cp;
> +       struct rockchip_sfc_chip_priv flash[SFC_MAX_CHIPSELECT_NUM];
> +       u32 num_chip;
> +       bool use_dma;
> +};
> +
> +static int get_if_type(struct rockchip_sfc *sfc, enum spi_nor_protocol
> proto)
> +{
> +       if (proto == SNOR_PROTO_1_1_2)
> +               return IF_TYPE_DUAL;
> +       else if (proto == SNOR_PROTO_1_1_4)
> +               return IF_TYPE_QUAD;
> +       else if (proto == SNOR_PROTO_1_1_1)
> +               return IF_TYPE_STD;
> +
> +       dev_err(sfc->dev, "unsupported SPI read mode\n");
> +
> +       return -EINVAL;
> +}
> +
> +static int rockchip_sfc_reset(struct rockchip_sfc *sfc)
> +{
> +       int err;
> +       u32 status;
> +
> +       writel_relaxed(SFC_RCVR_RESET, sfc->regbase + SFC_RCVR);
> +
> +       err = readl_poll_timeout(sfc->regbase + SFC_RCVR, status,
> +                                !(status & SFC_RCVR_RESET), 20,
> +                                jiffies_to_usecs(HZ));
> +       if (err)
> +               dev_err(sfc->dev, "SFC reset never finished\n");
> +
> +       /* Still need to clear the masked interrupt from RISR */
> +       writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
> +                      SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
> +                      SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
> +                      SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
> +                      sfc->regbase + SFC_ICLR);
> +
> +       dev_info(sfc->dev, "reset\n");
> +
> +       return err;
> +}
> +
> +static int rockchip_sfc_init(struct rockchip_sfc *sfc)
> +{
> +       int err;
> +
> +       err = rockchip_sfc_reset(sfc);
> +       if (err)
> +               return err;
> +
> +       /* Mask all eight interrupts */
> +       writel_relaxed(0xff, sfc->regbase + SFC_IMR);
> +
> +       writel_relaxed(SFC_CTRL_PHASE_SEL_NEGETIVE, sfc->regbase +
> SFC_CTRL);
> +
> +       return 0;
> +}
> +
> +static int rockchip_sfc_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       int ret;
> +
> +       mutex_lock(&sfc->lock);
> +       pm_runtime_get_sync(sfc->dev);
> +
> +       ret = clk_set_rate(sfc->clk, priv->clk_rate);
> +       if (ret)
> +               goto out;
> +
> +       ret = clk_prepare_enable(sfc->clk);
> +       if (ret)
> +               goto out;
> +
> +       return 0;
> +
> +out:
> +       mutex_unlock(&sfc->lock);
> +       return ret;
> +}
> +
> +static void rockchip_sfc_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +
> +       clk_disable_unprepare(sfc->clk);
> +       mutex_unlock(&sfc->lock);
> +       pm_runtime_mark_last_busy(sfc->dev);
> +       pm_runtime_put_autosuspend(sfc->dev);
> +}
> +
> +static inline int rockchip_sfc_get_fifo_level(struct rockchip_sfc *sfc,
> int wr)
> +{
> +       u32 fsr = readl_relaxed(sfc->regbase + SFC_FSR);
> +       int level;
> +
> +       if (wr)
> +               level = (fsr & SFC_FSR_TXLV_MASK) >> SFC_FSR_TXLV_SHIFT;
> +       else
> +               level = (fsr & SFC_FSR_RXLV_MASK) >> SFC_FSR_RXLV_SHIFT;
> +
> +       return level;
> +}
> +
> +static int rockchip_sfc_wait_fifo_ready(struct rockchip_sfc *sfc, int
> wr, u32 timeout)
> +{
> +       unsigned long deadline = jiffies + timeout;
> +       int level;
> +
> +       while (!(level = rockchip_sfc_get_fifo_level(sfc, wr))) {
> +               if (time_after_eq(jiffies, deadline)) {
> +                       dev_warn(sfc->dev, "%s fifo timeout\n", wr ?
> "write" : "read");
> +                       return -ETIMEDOUT;
> +               }
> +               udelay(1);
> +       }
> +
> +       return level;
> +}
> +
> +/* The SFC_CTRL register is a global control register,
> + * when the controller is in busy state(SFC_SR),
> + * SFC_CTRL cannot be set.
> + */
> +static void rockchip_sfc_wait_idle(struct rockchip_sfc *sfc, u32
> timeout_us)
> +{
> +       u32 status;
> +       int ret;
> +
> +       ret = readl_poll_timeout(sfc->regbase + SFC_SR, status,
> +                               !(status & SFC_SR_IS_BUSY),
> +                               20, timeout_us);
> +       if (ret) {
> +               dev_err(sfc->dev, "wait sfc idle timeout\n");
> +               rockchip_sfc_reset(sfc);
> +       }
> +}
> +
> +static void rockchip_sfc_setup_ctrl(struct rockchip_sfc *sfc)
> +{
> +       u32 reg;
> +
> +       reg = IF_TYPE_STD << SFC_CTRL_DATA_BITS_SHIFT;
> +       reg |= IF_TYPE_STD << SFC_CTRL_ADDR_BITS_SHIFT;
> +       reg |= IF_TYPE_STD << SFC_CTRL_CMD_BITS_SHIFT;
> +       reg |= SFC_CTRL_PHASE_SEL_NEGETIVE;
> +
> +       rockchip_sfc_wait_idle(sfc, 10000);
> +
> +       writel_relaxed(reg, sfc->regbase + SFC_CTRL);
> +}
> +static int rockchip_sfc_op_reg(struct spi_nor *nor,
> +                              u8 opcode, int len, u8 optype)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       u32 reg;
> +
> +       rockchip_sfc_setup_ctrl(sfc);
> +
> +       reg = opcode << SFC_CMD_IDX_SHIFT;
> +       reg |= len << SFC_CMD_TRAN_BYTES_SHIFT;
> +       reg |= priv->cs << SFC_CMD_CS_SHIFT;
> +       reg |= optype << SFC_CMD_DIR_SHIFT;
> +       writel_relaxed(reg, sfc->regbase + SFC_CMD);
> +
> +       return 0;
> +}
> +
> +static int rockchip_sfc_write_fifo(struct rockchip_sfc *sfc, u8 *buf, int
> len)
> +{
> +       u8 bytes = len & 0x3;
> +       u32 dwords;
> +       int tx_level;
> +       u32 write_words;
> +       u32 tmp = 0;
> +
> +       if (len >= 4) {
> +               dwords = len >> 2;
> +               while (dwords) {
> +                       tx_level = rockchip_sfc_wait_fifo_ready(sfc,
> SFC_CMD_DIR_WR, HZ);
> +                       if (tx_level < 0)
> +                               return tx_level;
> +                       write_words = min_t(u32, tx_level, dwords);
> +                       iowrite32_rep(sfc->regbase + SFC_DATA, buf,
> write_words);
> +                       buf += write_words << 2;
> +                       dwords -= write_words;
> +               }
> +       }
> +
> +       /* write the rest non word aligned bytes */
> +       if (bytes) {
> +               tx_level = rockchip_sfc_wait_fifo_ready(sfc,
> SFC_CMD_DIR_WR, HZ);
> +               if (tx_level < 0)
> +                       return tx_level;
> +               memcpy(&tmp, buf, bytes);
> +               writel_relaxed(tmp, sfc->regbase + SFC_DATA);
> +       }
> +
> +       return len;
> +}
> +
> +static int rockchip_sfc_read_fifo(struct rockchip_sfc *sfc, u8 *buf, int
> len)
> +{
> +       u8 bytes = len & 0x3;
> +       u32 dwords;
> +       u8 read_words;
> +       int rx_level;
> +       int tmp;
> +
> +       /* word aligned access only */
> +       if (len >= 4) {
> +               dwords = len >> 2;
> +               while (dwords) {
> +                       rx_level = rockchip_sfc_wait_fifo_ready(sfc,
> SFC_CMD_DIR_RD, HZ);
> +                       if (rx_level < 0)
> +                               return rx_level;
> +                       read_words = min_t(u32, rx_level, dwords);
> +                       ioread32_rep(sfc->regbase + SFC_DATA, buf,
> read_words);
> +                       buf += read_words << 2;
> +                       dwords -= read_words;
> +               }
> +       }
> +
> +       /* read the rest non word aligned bytes */
> +       if (bytes) {
> +               rx_level = rockchip_sfc_wait_fifo_ready(sfc,
> SFC_CMD_DIR_RD, HZ);
> +               if (rx_level < 0)
> +                       return rx_level;
> +               tmp = readl_relaxed(sfc->regbase + SFC_DATA);
> +               memcpy(buf, &tmp, bytes);
> +       }
> +
> +       return len;
> +}
> +
> +static int rockchip_sfc_read_reg(struct spi_nor *nor, u8 opcode,
> +                                u8 *buf, int len)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       int ret;
> +       int trans;
> +
> +       trans = min_t(int, len, SFC_MAX_TRANS_BYTES);
> +       ret = rockchip_sfc_op_reg(nor, opcode, trans, SFC_CMD_DIR_RD);
> +       if (ret)
> +               return ret;
> +
> +       ret = rockchip_sfc_read_fifo(sfc, buf, trans);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int rockchip_sfc_write_reg(struct spi_nor *nor, u8 opcode,
> +                                 u8 *buf, int len)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       int ret;
> +
> +       ret = rockchip_sfc_op_reg(nor, opcode, len, SFC_CMD_DIR_WR);
> +       if (ret)
> +               return ret;
> +       ret = rockchip_sfc_write_fifo(sfc, buf, len);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int rockchip_sfc_erase(struct spi_nor *nor, loff_t offs)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       u32 reg;
> +
> +       rockchip_sfc_setup_ctrl(sfc);
> +
> +       reg = nor->erase_opcode << SFC_CMD_IDX_SHIFT;
> +       reg |= (nor->addr_width == 4) ?
> +               SFC_CMD_ADDR_32BITS : SFC_CMD_ADDR_24BITS;
> +       reg |= priv->cs << SFC_CMD_CS_SHIFT;
> +       reg |= SFC_CMD_DIR_WR << SFC_CMD_DIR_SHIFT;
> +
> +       writel_relaxed(reg, sfc->regbase + SFC_CMD);
> +
> +       writel_relaxed(offs, sfc->regbase + SFC_ADDR);
> +
> +       return 0;
> +}
> +
> +static int rockchip_sfc_setup_transfer(struct spi_nor *nor,
> +                                              loff_t from_to,
> +                                              size_t len, u8 op_type)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       u8 if_type = IF_TYPE_STD;
> +       u32 reg;
> +
> +       if (op_type == SFC_CMD_DIR_RD)
> +               if_type = get_if_type(sfc, nor->read_proto);
> +
> +       rockchip_sfc_wait_idle(sfc, 10000);
> +
> +       writel_relaxed((if_type << SFC_CTRL_DATA_BITS_SHIFT) |
> +                      (IF_TYPE_STD << SFC_CTRL_ADDR_BITS_SHIFT) |
> +                      (IF_TYPE_STD << SFC_CTRL_CMD_BITS_SHIFT) |
> +                      SFC_CTRL_PHASE_SEL_NEGETIVE,
> +                      sfc->regbase + SFC_CTRL);
> +
> +       if (op_type == SFC_CMD_DIR_WR)
> +               reg = nor->program_opcode << SFC_CMD_IDX_SHIFT;
> +       else
> +               reg = nor->read_opcode << SFC_CMD_IDX_SHIFT;
> +
> +       reg |= op_type << SFC_CMD_DIR_SHIFT;
> +       reg |= (nor->addr_width == 4) ?
> +               SFC_CMD_ADDR_32BITS : SFC_CMD_ADDR_24BITS;
> +
> +       reg |= priv->cs << SFC_CMD_CS_SHIFT;
> +       reg |= len << SFC_CMD_TRAN_BYTES_SHIFT;
> +
> +       if (op_type == SFC_CMD_DIR_RD)
> +               reg |= SFC_CMD_DUMMY(nor->read_dummy);
> +
> +       writel_relaxed(reg, sfc->regbase + SFC_CMD);
> +       writel_relaxed(from_to, sfc->regbase + SFC_ADDR);
> +
> +       return 0;
> +}
> +
> +static int rockchip_sfc_do_dma_transfer(struct spi_nor *nor, loff_t
> from_to,
> +                                       dma_addr_t dma_buf, size_t len,
> +                                       u8 op_type)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       u32 reg;
> +       int err = 0;
> +
> +       init_completion(&sfc->cp);
> +
> +       writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
> +                      SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
> +                      SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
> +                      SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
> +                      sfc->regbase + SFC_ICLR);
> +
> +       /* Enable transfer complete interrupt */
> +       reg = readl_relaxed(sfc->regbase + SFC_IMR);
> +       reg &= ~SFC_IMR_TRAN_FINISH;
> +       writel_relaxed(reg, sfc->regbase + SFC_IMR);
> +
> +       err = rockchip_sfc_setup_transfer(nor, from_to, len, op_type);
> +       if (err < 0)
> +               return err;
> +
> +       writel_relaxed(dma_buf, sfc->regbase + SFC_DMA_ADDR);
> +
> +       /*
> +        * Start dma but note that the sfc->dma_buffer is derived from
> +        * dmam_alloc_coherent so we don't actually need any sync
> operations
> +        * for coherent dma memory.
> +        */
> +       writel_relaxed(0x1, sfc->regbase + SFC_DMA_TRIGGER);
> +
> +       /* Wait for the interrupt. */
> +       if (!wait_for_completion_timeout(&sfc->cp,
> msecs_to_jiffies(2000))) {
> +               dev_err(sfc->dev, "DMA wait for transfer finish
> timeout\n");
> +               err = -ETIMEDOUT;
> +       }
> +
> +       writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
> +                      SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
> +                      SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
> +                      SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
> +                      sfc->regbase + SFC_ICLR);
> +       /* Disable transfer finish interrupt */
> +       reg = readl_relaxed(sfc->regbase + SFC_IMR);
> +       reg |= SFC_IMR_TRAN_FINISH;
> +       writel_relaxed(reg, sfc->regbase + SFC_IMR);
> +
> +       if (err) {
> +               rockchip_sfc_reset(sfc);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static inline int rockchip_sfc_pio_write(struct rockchip_sfc *sfc, u_char
> *buf,
> +                                        size_t len)
> +{
> +       return rockchip_sfc_write_fifo(sfc, buf, len);
> +}
> +
> +static inline int rockchip_sfc_pio_read(struct rockchip_sfc *sfc, u_char
> *buf,
> +                                       size_t len)
> +{
> +       return rockchip_sfc_read_fifo(sfc, buf, len);
> +}
> +
> +static int rockchip_sfc_pio_transfer(struct spi_nor *nor, loff_t from_to,
> +                                    size_t len, u_char *buf, u8 op_type)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       size_t trans;
> +       int ret;
> +
> +       trans = min_t(size_t, SFC_MAX_TRANS_BYTES, len);
> +       ret = rockchip_sfc_setup_transfer(nor, from_to, trans, op_type);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (op_type == SFC_CMD_DIR_WR)
> +               ret = rockchip_sfc_pio_write(sfc, buf, trans);
> +       else
> +               ret = rockchip_sfc_pio_read(sfc, buf, trans);
> +
> +       return ret;
> +}
> +
> +static int rockchip_sfc_dma_transfer(struct spi_nor *nor, loff_t from_to,
> +                                    size_t len, u_char *buf, u8 op_type)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +       size_t trans;
> +       int ret;
> +
> +       trans = min_t(size_t, SFC_MAX_TRANS_BYTES, len);
> +
> +       if (op_type == SFC_CMD_DIR_WR)
> +               memcpy(sfc->buffer, buf, trans);
> +
> +       ret = rockchip_sfc_do_dma_transfer(nor, from_to, sfc->dma_buffer,
> +                                          trans, op_type);
> +       if (ret) {
> +               dev_warn(nor->dev, "DMA timeout\n");
> +               return ret;
> +       }
> +
> +       if (op_type == SFC_CMD_DIR_RD)
> +               memcpy(buf, sfc->buffer, trans);
> +
> +       return trans;
> +}
> +
> +static ssize_t rockchip_sfc_do_rd_wr(struct spi_nor *nor, loff_t from_to,
> +                                    size_t len, u_char *buf, u32 op_type)
> +{
> +       struct rockchip_sfc_chip_priv *priv = nor->priv;
> +       struct rockchip_sfc *sfc = priv->sfc;
> +
> +       /* DMA can only handle word anligned transfer chunks */
> +       if (likely(sfc->use_dma) && !(len & 0x3))
> +               return rockchip_sfc_dma_transfer(nor, from_to, len, buf,
> op_type);
> +       else
> +               return rockchip_sfc_pio_transfer(nor, from_to, len,
> +                                                (u_char *)buf, op_type);
> +}
> +
> +static ssize_t rockchip_sfc_read(struct spi_nor *nor, loff_t from,
> +                                size_t len, u_char *read_buf)
> +{
> +       return rockchip_sfc_do_rd_wr(nor, from, len,
> +                                    read_buf, SFC_CMD_DIR_RD);
> +}
> +
> +static ssize_t rockchip_sfc_write(struct spi_nor *nor, loff_t to,
> +                                 size_t len, const u_char *write_buf)
> +{
> +       return rockchip_sfc_do_rd_wr(nor, to, len,
> +                                    (u_char *)write_buf,
> +                                    SFC_CMD_DIR_WR);
> +}
> +
> +static int rockchip_sfc_register(struct device_node *np,
> +                                struct rockchip_sfc *sfc)
> +{
> +       const struct spi_nor_hwcaps hwcaps = {
> +               .mask = SNOR_HWCAPS_READ |
> +                       SNOR_HWCAPS_READ_FAST |
> +                       SNOR_HWCAPS_READ_1_1_2 |
> +                       SNOR_HWCAPS_READ_1_1_4 |
> +                       SNOR_HWCAPS_PP,
> +       };
> +       struct device *dev = sfc->dev;
> +       struct mtd_info *mtd;
> +       struct spi_nor *nor;
> +       int ret;
> +
> +       nor = &sfc->flash[sfc->num_chip].nor;
> +       nor->dev = dev;
> +       spi_nor_set_flash_node(nor, np);
> +
> +       ret = of_property_read_u8(np, "reg", &sfc->flash[sfc->num_chip].cs)
> ;
> +       if (ret) {
> +               dev_err(dev, "No reg property for %s\n",
> +                       np->full_name);
> +               return ret;
> +       }
> +
> +       ret = of_property_read_u32(np, "spi-max-frequency",
> +                                  &sfc->flash[sfc->num_chip].clk_rate);
> +       if (ret) {
> +               dev_err(dev, "No spi-max-frequency property for %s\n",
> +                       np->full_name);
> +               return ret;
> +       }
> +
> +       sfc->flash[sfc->num_chip].sfc = sfc;
> +       nor->priv = &sfc->flash[sfc->num_chip];
> +
> +       nor->prepare = rockchip_sfc_prep;
> +       nor->unprepare = rockchip_sfc_unprep;
> +       nor->read_reg = rockchip_sfc_read_reg;
> +       nor->write_reg = rockchip_sfc_write_reg;
> +       nor->read = rockchip_sfc_read;
> +       nor->write = rockchip_sfc_write;
> +       nor->erase = rockchip_sfc_erase;
> +       ret = spi_nor_scan(nor, NULL, &hwcaps);
> +       if (ret)
> +               return ret;
> +
> +       mtd = &nor->mtd;
> +       mtd->name = np->name;
> +       ret = mtd_device_register(mtd, NULL, 0);
> +       if (ret)
> +               return ret;
> +
> +       sfc->num_chip++;
> +       return 0;
> +}
> +
> +static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
> +{
> +       int i;
> +
> +       for (i = 0; i < sfc->num_chip; i++)
> +               mtd_device_unregister(&sfc->flash[i].nor.mtd);
> +}
> +
> +static int rockchip_sfc_register_all(struct rockchip_sfc *sfc)
> +{
> +       struct device *dev = sfc->dev;
> +       struct device_node *np;
> +       int ret;
> +
> +       for_each_available_child_of_node(dev->of_node, np) {
> +               ret = rockchip_sfc_register(np, sfc);
> +               if (ret)
> +                       goto fail;
> +
> +               if (sfc->num_chip == SFC_MAX_CHIPSELECT_NUM) {
> +                       dev_warn(dev, "Exceeds the max cs limitation\n");
> +                       break;
> +               }
> +       }
> +
> +       return 0;
> +
> +fail:
> +       dev_err(dev, "Failed to register all chips\n");
> +       /* Unregister all the _registered_ nor flash */
> +       rockchip_sfc_unregister_all(sfc);
> +       return ret;
> +}
> +
> +static irqreturn_t rockchip_sfc_irq_handler(int irq, void *dev_id)
> +{
> +       struct rockchip_sfc *sfc = dev_id;
> +       u32 reg;
> +
> +       reg = readl_relaxed(sfc->regbase + SFC_RISR);
> +
> +       /* Clear interrupt */
> +       writel_relaxed(reg, sfc->regbase + SFC_ICLR);
> +
> +       if (reg & SFC_RISR_TRAN_FINISH)
> +               complete(&sfc->cp);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int rockchip_sfc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct resource *res;
> +       struct rockchip_sfc *sfc;
> +       int ret;
> +
> +       sfc = devm_kzalloc(dev, sizeof(*sfc), GFP_KERNEL);
> +       if (!sfc)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, sfc);
> +       sfc->dev = dev;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       sfc->regbase = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(sfc->regbase))
> +               return PTR_ERR(sfc->regbase);
> +
> +       sfc->clk = devm_clk_get(&pdev->dev, "sfc");
> +       if (IS_ERR(sfc->clk)) {
> +               dev_err(&pdev->dev, "Failed to get sfc interface clk\n");
> +               return PTR_ERR(sfc->clk);
> +       }
> +
> +       sfc->hclk = devm_clk_get(&pdev->dev, "hsfc");
> +       if (IS_ERR(sfc->hclk)) {
> +               dev_err(&pdev->dev, "Failed to get sfc ahp clk\n");
> +               return PTR_ERR(sfc->hclk);
> +       }
> +
> +       ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +       if (ret) {
> +               dev_warn(dev, "Unable to set dma mask\n");
> +               return ret;
> +       }
> +
> +       sfc->buffer = dmam_alloc_coherent(dev, SFC_MAX_TRANS_BYTES,
> +                                         &sfc->dma_buffer,
> +                                         GFP_KERNEL);
> +       if (!sfc->buffer)
> +               return -ENOMEM;
> +
> +       mutex_init(&sfc->lock);
> +
> +       ret = clk_prepare_enable(sfc->hclk);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to enable hclk\n");
> +               goto err_hclk;
> +       }
> +
> +       ret = clk_prepare_enable(sfc->clk);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to enable clk\n");
> +               goto err_clk;
> +       }
> +
> +       sfc->use_dma = !of_property_read_bool(sfc->dev->of_node,
> +                                             "rockchip,sfc-no-dma");
> +
> +       /* Find the irq */
> +       ret = platform_get_irq(pdev, 0);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to get the irq\n");
> +               goto err_irq;
> +       }
> +
> +       ret = devm_request_irq(dev, ret, rockchip_sfc_irq_handler,
> +                              0, pdev->name, sfc);
> +       if (ret) {
> +               dev_err(dev, "Failed to request irq\n");
> +               goto err_irq;
> +       }
> +
> +       sfc->num_chip = 0;
> +       ret = rockchip_sfc_init(sfc);
> +       if (ret)
> +               goto err_irq;
> +
> +       pm_runtime_get_noresume(&pdev->dev);
> +       pm_runtime_set_active(&pdev->dev);
> +       pm_runtime_enable(&pdev->dev);
> +       pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
> +       pm_runtime_use_autosuspend(&pdev->dev);
> +
> +       ret = rockchip_sfc_register_all(sfc);
> +       if (ret)
> +               goto err_register;
> +
> +       clk_disable_unprepare(sfc->clk);
> +       pm_runtime_put_autosuspend(&pdev->dev);
> +
> +       return 0;
> +
> +err_register:
> +       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_set_suspended(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);
> +err_irq:
> +       clk_disable_unprepare(sfc->clk);
> +err_clk:
> +       clk_disable_unprepare(sfc->hclk);
> +err_hclk:
> +       mutex_destroy(&sfc->lock);
> +       return ret;
> +}
> +
> +static int rockchip_sfc_remove(struct platform_device *pdev)
> +{
> +       struct rockchip_sfc *sfc = platform_get_drvdata(pdev);
> +
> +       pm_runtime_get_sync(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);
> +
> +       rockchip_sfc_unregister_all(sfc);
> +       mutex_destroy(&sfc->lock);
> +       clk_disable_unprepare(sfc->clk);
> +       clk_disable_unprepare(sfc->hclk);
> +       return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +int rockchip_sfc_runtime_suspend(struct device *dev)
> +{
> +       struct rockchip_sfc *sfc = dev_get_drvdata(dev);
> +
> +       clk_disable_unprepare(sfc->hclk);
> +       return 0;
> +}
> +
> +int rockchip_sfc_runtime_resume(struct device *dev)
> +{
> +       struct rockchip_sfc *sfc = dev_get_drvdata(dev);
> +
> +       clk_prepare_enable(sfc->hclk);
> +       return rockchip_sfc_reset(sfc);
> +}
> +#endif /* CONFIG_PM */
> +
> +static const struct of_device_id rockchip_sfc_dt_ids[] = {
> +       { .compatible = "rockchip,sfc"},
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rockchip_sfc_dt_ids);
> +
> +static const struct dev_pm_ops rockchip_sfc_dev_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
> +       SET_RUNTIME_PM_OPS(rockchip_sfc_runtime_suspend,
> +                          rockchip_sfc_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver rockchip_sfc_driver = {
> +       .driver = {
> +               .name   = "rockchip-sfc",
> +               .of_match_table = rockchip_sfc_dt_ids,
> +               .pm = &rockchip_sfc_dev_pm_ops,
> +       },
> +       .probe  = rockchip_sfc_probe,
> +       .remove = rockchip_sfc_remove,
> +};
> +module_platform_driver(rockchip_sfc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Rockchip Serial Flash Controller Driver");
> +MODULE_AUTHOR("Shawn Lin <shawn.lin@rock-chips.com>");
> --
> 2.7.4
>
>
>

--001a11427730b9498005695526e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2018-02-08 20:18 GMT+08:00 Andy Yan <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:andy.yan@rock-chips.com" target=3D"_blank">andy.yan@rock-chips.com</a>=
&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">From: Shawn Lin &lt;<a href=
=3D"mailto:shawn.lin@rock-chips.com">shawn.lin@rock-chips.com</a>&gt;<br>
<br>
Add Rockchip SFC(serial flash controller) driver.<br>
<br>
Signed-off-by: Shawn Lin &lt;<a href=3D"mailto:shawn.lin@rock-chips.com">sh=
awn.lin@rock-chips.com</a>&gt;<br>
Signed-off-by: Andy Yan &lt;<a href=3D"mailto:andy.yan@rock-chips.com">andy=
.yan@rock-chips.com</a>&gt;<br>
Acked-by: Marek Vasut &lt;<a href=3D"mailto:marek.vasut@gmail.com">marek.va=
sut@gmail.com</a>&gt;<br>
<br>
---<br>
<br>
Changes in v8:<br>
- remove unused macro SFC_CMD_TRAN_BYTES_MASK<br>
- set max transfer length to 15.5KB<br>
- remove unnecessary buffer align check<br>
- remove the duplicate logic what spi-nor.c already does for spi_nor_write<=
br>
- add spi_nor_erase, as the SFC should get the erase address.<br>
<br>
Changes in v7:<br>
- correct the fifo status check in pio read/write mode.<br>
- copy data from user buffer to dma buffer<br>
<br>
Changes in v6:<br>
- fold in Andy&#39;s improvement for checking fifo level<br>
=C2=A0 before pio read<br>
- rename the controller to rv1108 since offically it&#39;s<br>
=C2=A0 renamed and acked by Rob.<br>
- use dma_coerce_mask_and_coherent suggested by Andy.<br>
<br>
Changes in v5:<br>
- check if the buf is aligned to 32bit<br>
- check if the buf for dma comes from vmalloc<br>
- fix to use 1-1-n according to the current framework<br>
- avoid bytes cnt overflow<br>
<br>
Changes in v4:<br>
- use uppercase DMA for description<br>
- simplify the code of get_if_type<br>
- use dma_dir to simplify the code<br>
- simplify the rockchip_sfc_do_rd_wr<br>
- some minor improvements<br>
- add reset controller when doing resume<br>
<br>
Changes in v3:<br>
- use io{read32,write32}_rep to simplify the corner cases<br>
- remove more unnecessary bit definitions<br>
- some minor comment fixes and improvement<br>
- fix wrong unregister function<br>
- unify more code<br>
- use nor to avoid constantly replicating the whole<br>
=C2=A0 sfc-&gt;flash[sfc-&gt;num_chip].nor<br>
- add email for MODULE_AUTHOR<br>
- remove #if 1 --- #endif<br>
- extract DMA code to imporve the code structure<br>
- reset all when failing to do dma<br>
- pass sfc to get_if_type<br>
- rename sfc-no-dma to sfc-no-DMA<br>
<br>
Changes in v2:<br>
- fix typos<br>
- add some comment for buffer and others operations<br>
- rename SFC_MAX_CHIP_NUM to MAX_CHIPSELECT_NUM<br>
- use u8 for cs<br>
- return -EINVAL for default case of get_if_type<br>
- use readl_poll_*() to check timeout cases<br>
- simplify and clarify some condition checks<br>
- rework the bitshifts to simplify the code<br>
- define SFC_CMD_DUMMY(x)<br>
- fix ummap for dma read path and finish all the<br>
=C2=A0 cache maintenance.<br>
- rename to rockchip_sfc_chip_priv and embed struct spi_nor<br>
=C2=A0 in it.<br>
- add MODULE_AUTHOR<br>
- add runtime PM and general PM support.<br>
- Thanks for Marek&#39;s comments. Link:<br>
=C2=A0 <a href=3D"http://lists.infradead.org/pipermail/linux-mtd/2016-Novem=
ber/070321.html" rel=3D"noreferrer" target=3D"_blank">http://lists.infradea=
d.org/<wbr>pipermail/linux-mtd/2016-<wbr>November/070321.html</a><br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
=C2=A0drivers/mtd/spi-nor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
7 +<br>
=C2=A0drivers/mtd/spi-nor/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
=C2=A0drivers/mtd/spi-nor/rockchip-<wbr>sfc.c | 942 +++++++++++++++++++++++=
+++++++<wbr>+++++++<br>
=C2=A04 files changed, 959 insertions(+)<br>
=C2=A0create mode 100644 drivers/mtd/spi-nor/rockchip-<wbr>sfc.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index aa71ab52f..0718bc0 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -11704,6 +11704,15 @@ F:=C2=A0 =C2=A0 =C2=A0drivers/gpio/gpio-bd9571mwv.=
c<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0include/linux/mfd/bd9571mwv.h<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/mfd/bd95=
71mwv.txt<br>
<br>
+ROCKCHIP SERIAL FLASH CONTROLLER DRIVER<br>
+M:=C2=A0 =C2=A0 =C2=A0Shawn Lin &lt;<a href=3D"mailto:shawn.lin@rock-chips=
.com">shawn.lin@rock-chips.com</a>&gt;<br>
+M:=C2=A0 =C2=A0 =C2=A0Andy Yan &lt;<a href=3D"mailto:andy.yan@rock-chips.c=
om">andy.yan@rock-chips.com</a>&gt;<br>
+L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-mtd@lists.infradead.org">lin=
ux-mtd@lists.infradead.org</a><br>
+L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-rockchip@lists.infradead.org=
">linux-rockchip@lists.<wbr>infradead.org</a><br>
+S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
+F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/mtd/rockchip-=
sfc.txt<br>
+F:=C2=A0 =C2=A0 =C2=A0drivers/mtd/spi-nor/rockchip-<wbr>sfc.c<br>
+<br>
=C2=A0ROSE NETWORK LAYER<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Ralf Baechle &lt;<a href=3D"mailto:ralf@linux-m=
ips.org">ralf@linux-mips.org</a>&gt;<br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-hams@vger.kernel.org">l=
inux-hams@vger.kernel.org</a><br>
diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig<br>
index 89da88e..f2898ea 100644<br>
--- a/drivers/mtd/spi-nor/Kconfig<br>
+++ b/drivers/mtd/spi-nor/Kconfig<br>
@@ -129,4 +129,11 @@ config SPI_STM32_QUADSPI<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This enables support for the STM32 Quad =
SPI controller.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 We only connect the NOR to this controll=
er.<br>
<br>
+config SPI_ROCKCHIP_SFC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Rockchip Serial Flash Controller=
(SFC)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_ROCKCHIP || COMPILE_TEST<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on HAS_IOMEM &amp;&amp; HAS_DMA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This enables support for rockchip serial=
 flash controller.<br>
+<br>
=C2=A0endif # MTD_SPI_NOR<br>
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile<br=
>
index f4c61d2..c294156 100644<br>
--- a/drivers/mtd/spi-nor/Makefile<br>
+++ b/drivers/mtd/spi-nor/Makefile<br>
@@ -11,3 +11,4 @@ obj-$(CONFIG_SPI_INTEL_SPI)=C2=A0 =C2=A0+=3D intel-spi.o<=
br>
=C2=A0obj-$(CONFIG_SPI_INTEL_SPI_<wbr>PCI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D =
intel-spi-pci.o<br>
=C2=A0obj-$(CONFIG_SPI_INTEL_SPI_<wbr>PLATFORM)=C2=A0 =C2=A0+=3D intel-spi-=
platform.o<br>
=C2=A0obj-$(CONFIG_SPI_STM32_<wbr>QUADSPI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D =
stm32-quadspi.o<br>
+obj-$(CONFIG_SPI_ROCKCHIP_<wbr>SFC) +=3D rockchip-sfc.o<br>
diff --git a/drivers/mtd/spi-nor/<wbr>rockchip-sfc.c b/drivers/mtd/spi-nor/=
<wbr>rockchip-sfc.c<br>
new file mode 100644<br>
index 0000000..6037101<br>
--- /dev/null<br>
+++ b/drivers/mtd/spi-nor/<wbr>rockchip-sfc.c<br>
@@ -0,0 +1,942 @@<br>
+/*<br>
+ * Rockchip Serial Flash Controller Driver<br>
+ *<br>
+ * Copyright (c) 2017, Rockchip Inc.<br>
+ * Author: Shawn Lin &lt;<a href=3D"mailto:shawn.lin@rock-chips.com">shawn=
.lin@rock-chips.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program. If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;<wbr>.<br>
+ */<br>
+<br>
+#include &lt;linux/bitops.h&gt;<br>
+#include &lt;linux/clk.h&gt;<br>
+#include &lt;linux/completion.h&gt;<br>
+#include &lt;linux/dma-mapping.h&gt;<br>
+#include &lt;linux/iopoll.h&gt;<br>
+#include &lt;linux/mm.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/mtd/mtd.h&gt;<br>
+#include &lt;linux/mtd/spi-nor.h&gt;<br>
+#include &lt;linux/of.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/pm_runtime.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
+<br>
+/* System control */<br>
+#define SFC_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>
+#define=C2=A0 SFC_CTRL_COMMON_BITS_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x0<br>
+#define=C2=A0 SFC_CTRL_COMMON_BITS_2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x1<br>
+#define=C2=A0 SFC_CTRL_COMMON_BITS_4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x2<br>
+#define=C2=A0 SFC_CTRL_DATA_BITS_SHIFT=C2=A0 =C2=A0 =C2=A0 12<br>
+#define=C2=A0 SFC_CTRL_ADDR_BITS_SHIFT=C2=A0 =C2=A0 =C2=A0 10<br>
+#define=C2=A0 SFC_CTRL_CMD_BITS_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
+#define=C2=A0 SFC_CTRL_PHASE_SEL_NEGETIVE=C2=A0 =C2=A0BIT(1)<br>
+<br>
+/* Interrupt mask */<br>
+#define SFC_IMR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4<br>
+#define=C2=A0 SFC_IMR_RX_FULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(0)<br>
+#define=C2=A0 SFC_IMR_RX_UFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(1)<br>
+#define=C2=A0 SFC_IMR_TX_OFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(2)<br>
+#define=C2=A0 SFC_IMR_TX_EMPTY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(3)<br>
+#define=C2=A0 SFC_IMR_TRAN_FINISH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(4)<br>
+#define=C2=A0 SFC_IMR_BUS_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(5)<br>
+#define=C2=A0 SFC_IMR_NSPI_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(6)<br>
+#define=C2=A0 SFC_IMR_DMA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0BIT(7)<br>
+<br>
+/* Interrupt clear */<br>
+#define SFC_ICLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x8<br>
+#define=C2=A0 SFC_ICLR_RX_FULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(0)<br>
+#define=C2=A0 SFC_ICLR_RX_UFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(1)<br>
+#define=C2=A0 SFC_ICLR_TX_OFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(2)<br>
+#define=C2=A0 SFC_ICLR_TX_EMPTY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(3)<br>
+#define=C2=A0 SFC_ICLR_TRAN_FINISH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4=
)<br>
+#define=C2=A0 SFC_ICLR_BUS_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(5)<br>
+#define=C2=A0 SFC_ICLR_NSPI_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(6)<br>
+#define=C2=A0 SFC_ICLR_DMA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 BIT(7)<br>
+<br>
+/* FIFO threshold level */<br>
+#define SFC_FTLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00xc<br>
+#define=C2=A0 SFC_FTLR_TX_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00<br>
+#define=C2=A0 SFC_FTLR_TX_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x1f<br>
+#define=C2=A0 SFC_FTLR_RX_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A08<br>
+#define=C2=A0 SFC_FTLR_RX_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x1f<br>
+<br>
+/* Reset FSM and FIFO */<br>
+#define SFC_RCVR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x10<br>
+#define=C2=A0 SFC_RCVR_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
+<br>
+/* Enhanced mode */<br>
+#define SFC_AX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x14<br>
+<br>
+/* Address Bit number */<br>
+#define SFC_ABIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x18<br>
+<br>
+/* Interrupt status */<br>
+#define SFC_ISR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1c<br>
+#define=C2=A0 SFC_ISR_RX_FULL_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0=
)<br>
+#define=C2=A0 SFC_ISR_RX_UFLOW_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(1)<br>
+#define=C2=A0 SFC_ISR_TX_OFLOW_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(2)<br>
+#define=C2=A0 SFC_ISR_TX_EMPTY_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(3)<br>
+#define=C2=A0 SFC_ISR_TX_FINISH_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(4)<br>
+#define=C2=A0 SFC_ISR_BUS_ERR_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(5=
)<br>
+#define=C2=A0 SFC_ISR_NSPI_ERR_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(6)<br>
+#define=C2=A0 SFC_ISR_DMA_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(7)<br>
+<br>
+/* FIFO status */<br>
+#define SFC_FSR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x20<br>
+#define=C2=A0 SFC_FSR_TX_IS_FULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
BIT(0)<br>
+#define=C2=A0 SFC_FSR_TX_IS_EMPTY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(1)<br>
+#define=C2=A0 SFC_FSR_RX_IS_EMPTY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(2)<br>
+#define=C2=A0 SFC_FSR_RX_IS_FULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
BIT(3)<br>
+#define=C2=A0 SFC_FSR_TXLV_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GENMASK(12, 8)<br>
+#define=C2=A0 SFC_FSR_TXLV_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
8<br>
+#define=C2=A0 SFC_FSR_RXLV_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GENMASK(20, 16)<br>
+#define=C2=A0 SFC_FSR_RXLV_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
16<br>
+<br>
+/* FSM status */<br>
+#define SFC_SR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x24<br>
+#define=C2=A0 SFC_SR_IS_IDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0<br>
+#define=C2=A0 SFC_SR_IS_BUSY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1<br>
+<br>
+/* Raw interrupt status */<br>
+#define SFC_RISR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x28<br>
+#define=C2=A0 SFC_RISR_RX_FULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(0)<br>
+#define=C2=A0 SFC_RISR_RX_UNDERFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(1=
)<br>
+#define=C2=A0 SFC_RISR_TX_OVERFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(2=
)<br>
+#define=C2=A0 SFC_RISR_TX_EMPTY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(3)<br>
+#define=C2=A0 SFC_RISR_TRAN_FINISH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4=
)<br>
+#define=C2=A0 SFC_RISR_BUS_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(5)<br>
+#define=C2=A0 SFC_RISR_NSPI_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(6)<br>
+#define=C2=A0 SFC_RISR_DMA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 BIT(7)<br>
+<br>
+/* Master trigger */<br>
+#define SFC_DMA_TRIGGER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x80<br>
+<br>
+/* Src or Dst addr for master */<br>
+#define SFC_DMA_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x84<br>
+<br>
+/* Command */<br>
+#define SFC_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x100<br>
+#define=C2=A0 SFC_CMD_IDX_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00<br>
+#define=C2=A0 SFC_CMD_DUMMY_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
8<br>
+#define=C2=A0 SFC_CMD_DIR_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+#define=C2=A0 SFC_CMD_DIR_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
+#define=C2=A0 SFC_CMD_DIR_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A012<br>
+#define=C2=A0 SFC_CMD_ADDR_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x0 &lt;&lt; 14)<br>
+#define=C2=A0 SFC_CMD_ADDR_24BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x1 &lt;&lt; 14)<br>
+#define=C2=A0 SFC_CMD_ADDR_32BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x2 &lt;&lt; 14)<br>
+#define=C2=A0 SFC_CMD_ADDR_FRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x3 &lt;&lt; 14)<br>
+#define=C2=A0 SFC_CMD_TRAN_BYTES_SHIFT=C2=A0 =C2=A0 =C2=A0 16<br>
+#define=C2=A0 SFC_CMD_CS_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 30<br>
+<br>
+/* Address */<br>
+#define SFC_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x104<br>
+<br>
+/* Data */<br>
+#define SFC_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x108<br>
+<br>
+#define SFC_MAX_CHIPSELECT_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
+<br>
+/* The SFC can transfer max 16KB - 1 at one time<br>
+ * we set it to 15.5KB here for alignment.<br>
+ */<br>
+#define SFC_MAX_TRANS_BYTES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (512 =
* 31)<br>
+<br>
+#define SFC_CMD_DUMMY(x) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0((x) &lt;&lt; SFC_CMD_DUMMY_SHIFT)<br>
+<br>
+enum rockchip_sfc_iftype {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IF_TYPE_STD,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IF_TYPE_DUAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IF_TYPE_QUAD,<br>
+};<br>
+<br>
+struct rockchip_sfc;<br>
+struct rockchip_sfc_chip_priv {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 cs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clk_rate;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spi_nor nor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc;<br>
+};<br>
+<br>
+struct rockchip_sfc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex lock;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *regbase;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *hclk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* virtual mapped addr for dma_buffer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *buffer;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_buffer;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct completion cp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv flash[SFC_MAX_CHI=
PSELECT_NUM];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 num_chip;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool use_dma;<br>
+};<br>
+<br>
+static int get_if_type(struct rockchip_sfc *sfc, enum spi_nor_protocol pro=
to)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (proto =3D=3D SNOR_PROTO_1_1_2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IF_TYPE_DUAL=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (proto =3D=3D SNOR_PROTO_1_1_4)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IF_TYPE_QUAD=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (proto =3D=3D SNOR_PROTO_1_1_1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IF_TYPE_STD;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(sfc-&gt;dev, &quot;unsupported SPI read=
 mode\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+}<br>
+<br>
+static int rockchip_sfc_reset(struct rockchip_sfc *sfc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 status;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(SFC_RCVR_RESET, sfc-&gt;regbase =
+ SFC_RCVR);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D readl_poll_timeout(sfc-&gt;<wbr>regbase=
 + SFC_RCVR, status,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(status &amp; SFC_RCVR_RESET), 20,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jiffies_to_usecs(HZ));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(sfc-&gt;dev=
, &quot;SFC reset never finished\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Still need to clear the masked interrupt fro=
m RISR */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(SFC_ICLR_RX_<wbr>FULL | SFC_ICLR=
_RX_UFLOW |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sfc-&gt;regbase + SFC_ICLR);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(sfc-&gt;dev, &quot;reset\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+}<br>
+<br>
+static int rockchip_sfc_init(struct rockchip_sfc *sfc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D rockchip_sfc_reset(sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Mask all eight interrupts */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(0xff, sfc-&gt;regbase + SFC_IMR)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(SFC_CTRL_PHASE_<wbr>SEL_NEGETIVE=
, sfc-&gt;regbase + SFC_CTRL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int rockchip_sfc_prep(struct spi_nor *nor, enum spi_nor_ops ops)<br=
>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;sfc-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync(sfc-&gt;dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_set_rate(sfc-&gt;clk, priv-&gt;clk_=
rate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(sfc-&gt;clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+out:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;sfc-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static void rockchip_sfc_unprep(struct spi_nor *nor, enum spi_nor_ops ops)=
<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(sfc-&gt;<wbr>clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;sfc-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy(sfc-<wbr>&gt;dev);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_autosuspend(<wbr>sfc-&gt;dev);<b=
r>
+}<br>
+<br>
+static inline int rockchip_sfc_get_fifo_level(<wbr>struct rockchip_sfc *sf=
c, int wr)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 fsr =3D readl_relaxed(sfc-&gt;regbase + SFC=
_FSR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int level;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wr)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0level =3D (fsr &amp=
; SFC_FSR_TXLV_MASK) &gt;&gt; SFC_FSR_TXLV_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0level =3D (fsr &amp=
; SFC_FSR_RXLV_MASK) &gt;&gt; SFC_FSR_RXLV_SHIFT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return level;<br>
+}<br>
+<br>
+static int rockchip_sfc_wait_fifo_ready(<wbr>struct rockchip_sfc *sfc, int=
 wr, u32 timeout)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long deadline =3D jiffies + timeout;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int level;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!(level =3D rockchip_sfc_get_fifo_level(=
<wbr>sfc, wr))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (time_after_eq(j=
iffies, deadline)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_warn(sfc-&gt;dev, &quot;%s fifo timeout\n&quot;, wr ? &quot;w=
rite&quot; : &quot;read&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ETIMEDOUT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return level;<br>
+}<br>
+<br>
+/* The SFC_CTRL register is a global control register,<br>
+ * when the controller is in busy state(SFC_SR),<br>
+ * SFC_CTRL cannot be set.<br>
+ */<br>
+static void rockchip_sfc_wait_idle(struct rockchip_sfc *sfc, u32 timeout_u=
s)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 status;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D readl_poll_timeout(sfc-&gt;<wbr>regbase=
 + SFC_SR, status,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(status &amp; SFC_SR_IS_BUSY),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020, timeout_us);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(sfc-&gt;dev=
, &quot;wait sfc idle timeout\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip_sfc_reset(=
sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static void rockchip_sfc_setup_ctrl(struct rockchip_sfc *sfc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D IF_TYPE_STD &lt;&lt; SFC_CTRL_DATA_BITS=
_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D IF_TYPE_STD &lt;&lt; SFC_CTRL_ADDR_BIT=
S_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D IF_TYPE_STD &lt;&lt; SFC_CTRL_CMD_BITS=
_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D SFC_CTRL_PHASE_SEL_NEGETIVE;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip_sfc_wait_idle(sfc, 10000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(reg, sfc-&gt;regbase + SFC_CTRL)=
;<br>
+}<br>
+static int rockchip_sfc_op_reg(struct spi_nor *nor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 opcode, int len, u8 optype)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip_sfc_setup_ctrl(sfc);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D opcode &lt;&lt; SFC_CMD_IDX_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D len &lt;&lt; SFC_CMD_TRAN_BYTES_SHIFT;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D priv-&gt;cs &lt;&lt; SFC_CMD_CS_SHIFT;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D optype &lt;&lt; SFC_CMD_DIR_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(reg, sfc-&gt;regbase + SFC_CMD);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int rockchip_sfc_write_fifo(struct rockchip_sfc *sfc, u8 *buf, int =
len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 bytes =3D len &amp; 0x3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dwords;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int tx_level;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 write_words;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt;=3D 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dwords =3D len &gt;=
&gt; 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (dwords) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tx_level =3D rockchip_sfc_wait_fifo_ready(<wbr>sfc, SFC_CMD_DIR_W=
R, HZ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (tx_level &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tx_level;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_words =3D min_t(u32, tx_level, dwords);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0iowrite32_rep(sfc-&gt;regbase + SFC_DATA, buf, write_words);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf +=3D write_words &lt;&lt; 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dwords -=3D write_words;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* write the rest non word aligned bytes */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bytes) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tx_level =3D rockch=
ip_sfc_wait_fifo_ready(<wbr>sfc, SFC_CMD_DIR_WR, HZ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tx_level &lt; 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return tx_level;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;tmp, bu=
f, bytes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(tmp,=
 sfc-&gt;regbase + SFC_DATA);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static int rockchip_sfc_read_fifo(struct rockchip_sfc *sfc, u8 *buf, int l=
en)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 bytes =3D len &amp; 0x3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dwords;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 read_words;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rx_level;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int tmp;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* word aligned access only */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt;=3D 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dwords =3D len &gt;=
&gt; 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (dwords) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rx_level =3D rockchip_sfc_wait_fifo_ready(<wbr>sfc, SFC_CMD_DIR_R=
D, HZ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (rx_level &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rx_level;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0read_words =3D min_t(u32, rx_level, dwords);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ioread32_rep(sfc-&gt;regbase + SFC_DATA, buf, read_words);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf +=3D read_words &lt;&lt; 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dwords -=3D read_words;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* read the rest non word aligned bytes */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bytes) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rx_level =3D rockch=
ip_sfc_wait_fifo_ready(<wbr>sfc, SFC_CMD_DIR_RD, HZ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rx_level &lt; 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return rx_level;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D readl_relax=
ed(sfc-&gt;regbase + SFC_DATA);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(buf, &amp;tm=
p, bytes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static int rockchip_sfc_read_reg(struct spi_nor *nor, u8 opcode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 *buf, int len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int trans;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0trans =3D min_t(int, len, SFC_MAX_TRANS_BYTES);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sfc_op_reg(nor, opcode, trans,=
 SFC_CMD_DIR_RD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sfc_read_fifo(sfc, buf, trans)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int rockchip_sfc_write_reg(struct spi_nor *nor, u8 opcode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf, int len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sfc_op_reg(nor, opcode, len, S=
FC_CMD_DIR_WR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sfc_write_fifo(sfc, buf, len);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int rockchip_sfc_erase(struct spi_nor *nor, loff_t offs)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip_sfc_setup_ctrl(sfc);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D nor-&gt;erase_opcode &lt;&lt; SFC_CMD_I=
DX_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D (nor-&gt;addr_width =3D=3D 4) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SFC_CMD_ADDR_32BITS=
 : SFC_CMD_ADDR_24BITS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D priv-&gt;cs &lt;&lt; SFC_CMD_CS_SHIFT;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D SFC_CMD_DIR_WR &lt;&lt; SFC_CMD_DIR_SH=
IFT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(reg, sfc-&gt;regbase + SFC_CMD);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(offs, sfc-&gt;regbase + SFC_ADDR=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int rockchip_sfc_setup_transfer(<wbr>struct spi_nor *nor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 loff_t from_to,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 size_t len, u8 op_type)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 if_type =3D IF_TYPE_STD;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (op_type =3D=3D SFC_CMD_DIR_RD)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_type =3D get_if_=
type(sfc, nor-&gt;read_proto);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip_sfc_wait_idle(sfc, 10000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed((if_type &lt;&lt; SFC_CTRL_DATA_=
BITS_SHIFT) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (IF_TYPE_STD &lt;&lt; SFC_CTRL_ADDR_BITS_SHIFT) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (IF_TYPE_STD &lt;&lt; SFC_CTRL_CMD_BITS_SHIFT) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_CTRL_PHASE_SEL_NEGETIVE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sfc-&gt;regbase + SFC_CTRL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (op_type =3D=3D SFC_CMD_DIR_WR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D nor-&gt;pro=
gram_opcode &lt;&lt; SFC_CMD_IDX_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D nor-&gt;rea=
d_opcode &lt;&lt; SFC_CMD_IDX_SHIFT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D op_type &lt;&lt; SFC_CMD_DIR_SHIFT;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D (nor-&gt;addr_width =3D=3D 4) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SFC_CMD_ADDR_32BITS=
 : SFC_CMD_ADDR_24BITS;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D priv-&gt;cs &lt;&lt; SFC_CMD_CS_SHIFT;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D len &lt;&lt; SFC_CMD_TRAN_BYTES_SHIFT;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (op_type =3D=3D SFC_CMD_DIR_RD)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D SFC_CMD_DU=
MMY(nor-&gt;read_dummy)<wbr>;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(reg, sfc-&gt;regbase + SFC_CMD);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(from_to, sfc-&gt;regbase + SFC_A=
DDR);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int rockchip_sfc_do_dma_transfer(<wbr>struct spi_nor *nor, loff_t f=
rom_to,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_=
t dma_buf, size_t len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 op_typ=
e)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init_completion(&amp;sfc-&gt;cp);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(SFC_ICLR_RX_<wbr>FULL | SFC_ICLR=
_RX_UFLOW |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sfc-&gt;regbase + SFC_ICLR);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable transfer complete interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readl_relaxed(sfc-&gt;regbase + SFC_IMR=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg &amp;=3D ~SFC_IMR_TRAN_FINISH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(reg, sfc-&gt;regbase + SFC_IMR);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D rockchip_sfc_setup_transfer(<wbr>nor, f=
rom_to, len, op_type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(dma_buf, sfc-&gt;regbase + SFC_D=
MA_ADDR);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Start dma but note that the sfc-&gt;dma_buff=
er is derived from<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * dmam_alloc_coherent so we don&#39;t actually=
 need any sync operations<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * for coherent dma memory.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(0x1, sfc-&gt;regbase + SFC_DMA_T=
RIGGER);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for the interrupt. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wait_for_completion_timeout(<wbr>&amp;sfc-=
&gt;cp, msecs_to_jiffies(2000))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(sfc-&gt;dev=
, &quot;DMA wait for transfer finish timeout\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ETIMEDOUT;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(SFC_ICLR_RX_<wbr>FULL | SFC_ICLR=
_RX_UFLOW |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sfc-&gt;regbase + SFC_ICLR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable transfer finish interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readl_relaxed(sfc-&gt;regbase + SFC_IMR=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D SFC_IMR_TRAN_FINISH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(reg, sfc-&gt;regbase + SFC_IMR);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip_sfc_reset(=
sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static inline int rockchip_sfc_pio_write(struct rockchip_sfc *sfc, u_char =
*buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t l=
en)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rockchip_sfc_write_fifo(sfc, buf, len);<=
br>
+}<br>
+<br>
+static inline int rockchip_sfc_pio_read(struct rockchip_sfc *sfc, u_char *=
buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t le=
n)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rockchip_sfc_read_fifo(sfc, buf, len);<b=
r>
+}<br>
+<br>
+static int rockchip_sfc_pio_transfer(<wbr>struct spi_nor *nor, loff_t from=
_to,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len, u_char *bu=
f, u8 op_type)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t trans;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0trans =3D min_t(size_t, SFC_MAX_TRANS_BYTES, le=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sfc_setup_transfer(<wbr>nor, f=
rom_to, trans, op_type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (op_type =3D=3D SFC_CMD_DIR_WR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sf=
c_pio_write(sfc, buf, trans);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sf=
c_pio_read(sfc, buf, trans);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static int rockchip_sfc_dma_transfer(<wbr>struct spi_nor *nor, loff_t from=
_to,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len, u_char *bu=
f, u8 op_type)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t trans;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0trans =3D min_t(size_t, SFC_MAX_TRANS_BYTES, le=
n);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (op_type =3D=3D SFC_CMD_DIR_WR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(sfc-&gt;buff=
er, buf, trans);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sfc_do_dma_transfer(<wbr>nor, =
from_to, sfc-&gt;dma_buffer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rans, op_type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(nor-&gt;de=
v, &quot;DMA timeout\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (op_type =3D=3D SFC_CMD_DIR_RD)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(buf, sfc-&gt=
;buffer, trans);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return trans;<br>
+}<br>
+<br>
+static ssize_t rockchip_sfc_do_rd_wr(struct spi_nor *nor, loff_t from_to,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len, u_char *bu=
f, u32 op_type)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc_chip_priv *priv =3D nor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D priv-&gt;sfc;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* DMA can only handle word anligned transfer c=
hunks */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (likely(sfc-&gt;use_dma) &amp;&amp; !(len &a=
mp; 0x3))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rockchip_sfc=
_dma_transfer(nor, from_to, len, buf, op_type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rockchip_sfc=
_pio_transfer(nor, from_to, len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (u_char *)buf, op_type);<br>
+}<br>
+<br>
+static ssize_t rockchip_sfc_read(struct spi_nor *nor, loff_t from,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len, u_char *read_buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rockchip_sfc_do_rd_wr(nor, from, len,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_buf, SFC_CMD_DIR_=
RD);<br>
+}<br>
+<br>
+static ssize_t rockchip_sfc_write(struct spi_nor *nor, loff_t to,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len, const u_char *writ=
e_buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rockchip_sfc_do_rd_wr(nor, to, len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (u_char *)write_buf,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SFC_CMD_DIR_WR);<br>
+}<br>
+<br>
+static int rockchip_sfc_register(struct device_node *np,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rockchip_sfc *sfc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct spi_nor_hwcaps hwcaps =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mask =3D SNOR_HWCA=
PS_READ |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SNOR_HWCAPS_READ_FAST |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SNOR_HWCAPS_READ_1_1_2 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SNOR_HWCAPS_READ_1_1_4 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SNOR_HWCAPS_PP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D sfc-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spi_nor *nor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor =3D &amp;sfc-&gt;flash[sfc-&gt;num_chip].<w=
br>nor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;dev =3D dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spi_nor_set_flash_node(nor, np);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u8(np, &quot;reg&quot;=
, &amp;sfc-&gt;flash[sfc-&gt;num_chip].cs)<wbr>;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
No reg property for %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0np-&gt;full_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(np, &quot;spi-max-=
frequency&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sfc-&gt;flash[sfc-&gt;nu=
m_chip].<wbr>clk_rate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
No spi-max-frequency property for %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0np-&gt;full_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;flash[sfc-&gt;num_chip].sfc =3D sfc;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;priv =3D &amp;sfc-&gt;flash[sfc-&gt;num=
_chip];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;prepare =3D rockchip_sfc_prep;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;unprepare =3D rockchip_sfc_unprep;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;read_reg =3D rockchip_sfc_read_reg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;write_reg =3D rockchip_sfc_write_reg;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;read =3D rockchip_sfc_read;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;write =3D rockchip_sfc_write;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nor-&gt;erase =3D rockchip_sfc_erase;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D spi_nor_scan(nor, NULL, &amp;hwcaps);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd =3D &amp;nor-&gt;mtd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;name =3D np-&gt;name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mtd_device_register(mtd, NULL, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;num_chip++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static void rockchip_sfc_unregister_all(<wbr>struct rockchip_sfc *sfc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; sfc-&gt;num_chip; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd_device_unregist=
er(&amp;sfc-&gt;<wbr>flash[i].nor.mtd);<br>
+}<br>
+<br>
+static int rockchip_sfc_register_all(<wbr>struct rockchip_sfc *sfc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D sfc-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_available_child_of_<wbr>node(dev-&gt;o=
f_node, np) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sf=
c_register(np, sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sfc-&gt;num_chi=
p =3D=3D SFC_MAX_CHIPSELECT_NUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_warn(dev, &quot;Exceeds the max cs limitation\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+fail:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Failed to register all chips=
\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unregister all the _registered_ nor flash */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip_sfc_unregister_all(<wbr>sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static irqreturn_t rockchip_sfc_irq_handler(int irq, void *dev_id)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D dev_id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readl_relaxed(sfc-&gt;regbase + SFC_RIS=
R);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(reg, sfc-&gt;regbase + SFC_ICLR)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg &amp; SFC_RISR_TRAN_FINISH)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0complete(&amp;sfc-&=
gt;cp);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
+}<br>
+<br>
+static int rockchip_sfc_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc =3D devm_kzalloc(dev, sizeof(*sfc), GFP_KER=
NEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sfc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;dev =3D dev;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;regbase =3D devm_ioremap_resource(dev, =
res);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sfc-&gt;regbase))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sfc-=
&gt;regbase);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;clk =3D devm_clk_get(&amp;pdev-&gt;dev,=
 &quot;sfc&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sfc-&gt;clk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;Failed to get sfc interface clk\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sfc-=
&gt;clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;hclk =3D devm_clk_get(&amp;pdev-&gt;dev=
, &quot;hsfc&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sfc-&gt;hclk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;Failed to get sfc ahp clk\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sfc-=
&gt;hclk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_coerce_mask_and_coherent(<wbr>dev, =
DMA_BIT_MASK(32));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot=
;Unable to set dma mask\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;buffer =3D dmam_alloc_coherent(dev, SFC=
_MAX_TRANS_BYTES,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;sfc-&gt;dma_buffer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GF=
P_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sfc-&gt;buffer)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;sfc-&gt;lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(sfc-&gt;hclk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;Failed to enable hclk\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_hclk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(sfc-&gt;clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;Failed to enable clk\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_clk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;use_dma =3D !of_property_read_bool(sfc-=
&gt;<wbr>dev-&gt;of_node,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;rockchip,sfc-no-dma&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find the irq */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D platform_get_irq(pdev, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
Failed to get the irq\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(dev, ret, rockchip_sfc=
_irq_handler,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, pdev-&gt;name, sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
Failed to request irq\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfc-&gt;num_chip =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sfc_init(sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_irq;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get_noresume(&amp;pdev-<wbr>&gt;dev)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_set_active(&amp;pdev-&gt;<wbr>dev);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_enable(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_set_autosuspend_<wbr>delay(&amp;pdev=
-&gt;dev, 50);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_use_autosuspend(&amp;<wbr>pdev-&gt;d=
ev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_sfc_register_all(sfc)<wbr>;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_register;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(sfc-&gt;<wbr>clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_autosuspend(&amp;<wbr>pdev-&gt;d=
ev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+err_register:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(&amp;pdev-&gt;dev)<wbr>;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_set_suspended(&amp;<wbr>pdev-&gt;dev=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_noidle(&amp;pdev-&gt;<wbr>dev);<=
br>
+err_irq:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(sfc-&gt;<wbr>clk);<br>
+err_clk:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(sfc-&gt;<wbr>hclk);<br>
+err_hclk:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;sfc-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static int rockchip_sfc_remove(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D platform_get_drvda=
ta(pdev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync(&amp;pdev-&gt;<wbr>dev);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(&amp;pdev-&gt;dev)<wbr>;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_noidle(&amp;pdev-&gt;<wbr>dev);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip_sfc_unregister_all(<wbr>sfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;sfc-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(sfc-&gt;<wbr>clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(sfc-&gt;<wbr>hclk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+#ifdef CONFIG_PM<br>
+int rockchip_sfc_runtime_suspend(<wbr>struct device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D dev_get_drvdata(de=
v);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(sfc-&gt;<wbr>hclk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+int rockchip_sfc_runtime_resume(<wbr>struct device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_sfc *sfc =3D dev_get_drvdata(de=
v);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_prepare_enable(sfc-&gt;hclk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rockchip_sfc_reset(sfc);<br>
+}<br>
+#endif /* CONFIG_PM */<br>
+<br>
+static const struct of_device_id rockchip_sfc_dt_ids[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;rockchip,sfc&quot;},<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
+};<br>
+MODULE_DEVICE_TABLE(of, rockchip_sfc_dt_ids);<br>
+<br>
+static const struct dev_pm_ops rockchip_sfc_dev_pm_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SET_SYSTEM_SLEEP_PM_OPS(pm_<wbr>runtime_force_s=
uspend,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_force_resume)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SET_RUNTIME_PM_OPS(rockchip_<wbr>sfc_runtime_su=
spend,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 rockchip_sfc_runtime_resume, NULL)<br>
+};<br>
+<br>
+static struct platform_driver rockchip_sfc_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0=
=3D &quot;rockchip-sfc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 rockchip_sfc_dt_ids,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &amp;rockch=
ip_sfc_dev_pm_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =3D rockchip_sfc_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D rockchip_sfc_remove,<br>
+};<br>
+module_platform_driver(<wbr>rockchip_sfc_driver);<br>
+<br>
+MODULE_LICENSE(&quot;GPL v2&quot;);<br>
+MODULE_DESCRIPTION(&quot;Rockchip Serial Flash Controller Driver&quot;);<b=
r>
+MODULE_AUTHOR(&quot;Shawn Lin &lt;<a href=3D"mailto:shawn.lin@rock-chips.c=
om">shawn.lin@rock-chips.com</a>&gt;&quot;);<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11427730b9498005695526e9--
