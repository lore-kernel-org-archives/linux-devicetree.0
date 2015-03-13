From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Fri, 13 Mar 2015 00:38:29 -0700
Message-ID: <20150313073829.GH12966@brian-ubuntu>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viet Nga Dao <vndao@altera.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Viet,

On Wed, Feb 11, 2015 at 12:53:00PM +0800, Viet Nga Dao wrote:
> From: Viet Nga Dao <vndao@altera.com>
> 
> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
> EPCS flash chips. This patch adds driver for these devices.
> 
> Signed-off-by: VIET NGA DAO <vndao@altera.com>
> 
> ---
> v2:
> - Change to spi_nor structure
> - Add lock and unlock functions for spi_nor
> - Simplify the altera_epcq_lock function
> - Replace reg by compatible in device tree
> ---
>  .../devicetree/bindings/mtd/altera_epcq.txt        |   45 ++
>  drivers/mtd/spi-nor/Kconfig                        |   12 +
>  drivers/mtd/spi-nor/Makefile                       |    1 +
>  drivers/mtd/spi-nor/altera_epcq.c                  |  507 ++++++++++++++++++++
>  drivers/mtd/spi-nor/altera_epcq.h                  |  116 +++++
>  drivers/mtd/spi-nor/spi-nor.c                      |   86 ++++-
>  include/linux/mtd/spi-nor.h                        |    3 +-
>  7 files changed, 764 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/altera_epcq.txt
>  create mode 100644 drivers/mtd/spi-nor/altera_epcq.c
>  create mode 100644 drivers/mtd/spi-nor/altera_epcq.h

Please split this up into at least 2 patches, if not 3. One or more for
the spi-nor changes, split logically; one for your new driver; and maybe
a separate one for the binding documentation.

Also, as Rafal noted, your patche is whitespace damaged, so I can't
apply or build it.

Please make sure you can apply, build, and run your patch on top of
l2-mtd.git:

  http://git.infradead.org/l2-mtd.git
  git://git.infradead.org/l2-mtd.git

...
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 64a4f0e..83178b9 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -28,4 +28,16 @@ config SPI_FSL_QUADSPI
>        This enables support for the Quad SPI controller in master mode.
>        We only connect the NOR to this controller now.
> 
> +config SPI_ALTERA_EPCQ
> +    tristate "Support Altera EPCQ/EPCS Flash chips"
> +    depends on OF
> +    help
> +      This enables access to Altera EPCQ/EPCS flash chips, used for data
> +      storage. See the driver source for the current list,
> +      or to add other chips.
> +
> +      If you want to compile this driver as a module ( = code which can be
> +      inserted in and removed from the running kernel whenever you want),
> +      say M here and read <file:Documentation/kbuild/modules.txt>.

I don't think you need to explain what a module is here. Look at other
Kconfig entries as examples, but I think you can just drop that last
paragraph.

> +
>  endif # MTD_SPI_NOR
...
> diff --git a/drivers/mtd/spi-nor/altera_epcq.c
> b/drivers/mtd/spi-nor/altera_epcq.c
> new file mode 100644
> index 0000000..9db0d05
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/altera_epcq.c
> @@ -0,0 +1,507 @@
> +/*
> + * Copyright (C) 2014 Altera Corporation. All rights reserved
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
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
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/log2.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/spi-nor.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched.h>
> +
> +#include "altera_epcq.h"
> +
> +static int altera_epcq_write_reg(struct spi_nor *nor, u8 opcode, u8 *val,
> +                 int len, int wr_en)
> +{
> +    return 0;
> +}
> +
> +static int altera_epcq_read_reg(struct spi_nor *nor, u8 opcode, u8 *val,
> +                int len)
> +{
> +    struct altera_epcq_flash *flash = nor->priv;
> +    struct altera_epcq *dev = flash->priv;
> +    u32 data = 0;
> +    u8 id[5];
> +
> +    switch (opcode) {
> +    case SPINOR_OP_RDSR:
> +        data = readl(dev->csr_base + EPCQ_SR_REG);
> +        *val = (u8)data & EPCQ_SR_MASK;
> +        break;
> +    case SPINOR_OP_RDID:
> +        /* opcode id */
> +        if (dev->is_epcs) {
> +            data = readl(dev->csr_base + EPCQ_SID_REG);
> +            id[4] = EPCS_OPCODE_ID;
> +        } else {
> +            data = readl(dev->csr_base + EPCQ_RDID_REG);
> +            id[4] = EPCQ_OPCODE_ID;
> +        }

I think Rafal had some suggestions on changing how you match
IDs/devices. This, at least, doesn't look very good; you're faking a
particular ID, then matching it in spi-nor.c?

You might be better off doing something like the *-nonjedec entries in
spi-nor.c, and just match a string, similar to what Rafal mentioned I
think.

> +        id[0] = 0xFF;    /* non standard jedec id */
> +        id[1] = 0xFF;    /* non standard jedec id */
> +        id[2] = 0xFF;    /* non standard jedec id */
> +        id[3] = (u8)data & EPCQ_ID_MASK; /* device id */
> +        memcpy(val, &id, 5);
> +        break;
> +    default:

Is it dangerous to return indeterminate data here? Might want to at
least zero it out.

> +        break;
> +    }
> +    return 0;
> +}
> +
> +static int altera_epcq_write_erase_check(struct spi_nor *nor,
> +                     bool write_erase)
> +{
> +    struct altera_epcq_flash *flash = nor->priv;
> +    struct altera_epcq *dev = flash->priv;
> +    u32 val;
> +    u32 mask;
> +
> +    if (write_erase)
> +        mask = EPCQ_ISR_ILLEGAL_WRITE_MASK;
> +    else
> +        mask = EPCQ_ISR_ILLEGAL_ERASE_MASK;
> +
> +    val = readl(dev->csr_base + EPCQ_ISR_REG);
> +    if (val & mask) {
> +        dev_err(nor->dev,
> +            "write/erase failed, sector might be protected\n");
> +        /* clear this status for next use */
> +        writel(val, dev->csr_base + EPCQ_ISR_REG);
> +        return -EIO;
> +    }
> +    return 0;
> +}
> +
> +static int altera_epcq_addr_to_sector(struct mtd_info *mtd, int offset)
> +{
> +    if (mtd->erasesize_shift)

Is mtd->erasesize_shift ever zero for you?

> +        return offset >> mtd->erasesize_shift;
> +    do_div(offset, mtd->erasesize);
> +    return offset;
> +}
> +
> +static int altera_epcq_erase(struct spi_nor *nor, loff_t offset)
> +{
> +
> +    struct altera_epcq_flash *flash = nor->priv;
> +    struct altera_epcq *dev = flash->priv;
> +    struct mtd_info *mtd = &flash->mtd;
> +    u32 val;
> +    int ret;
> +    int sector_value;
> +
> +    ret = nor->wait_till_ready(nor);

wait_till_ready() doesn't exist any more. And you shouldn't need to call
it here.

> +    if (ret)
> +        return ret;
> +
> +    sector_value = altera_epcq_addr_to_sector(mtd, offset);
> +    /* sanity check that block_offset is a valid sector number */
> +    if (sector_value < 0)
> +        return -EINVAL;
> +
> +    /* sector value should occupy bits 17:8 */
> +    val = (sector_value << 8) & EPCQ_MEM_OP_SECTOR_VALUE_MASK;
> +
> +    /* sector erase commands occupies lower 2 bits */
> +    val |= EPCQ_MEM_OP_SECTOR_ERASE_CMD;
> +
> +    /* write sector erase command to EPCQ_MEM_OP register */
> +    writel(val, dev->csr_base + EPCQ_MEM_OP_REG);
> +
> +    /* wait the erase command is done then check whether
> +     * write triggered a illegal write interrupt
> +     */
> +    ret = nor->wait_till_ready(nor);
> +    if (ret)
> +        return ret;
> +
> +    ret = altera_epcq_write_erase_check(nor, 0);

This function looks like it's doing interrupt-based error reporting.
Do you have an IRQ you should be requesting for this driver? It seems
like you should be doing the following sequence:

1. begin write/erase
2. wait for an interrupt to signal completion
3. check interrupt status register for erase/write failure (e.g., locked
block)
4. return to spi-nor layer, which will read the flash status register

That way, you don't have to use the spi-nor "wait till ready" helpers,
which really aren't suited for this.

> +    if (ret < 0)
> +        return ret;
> +
> +    return 0;
> +}
> +
> +static int altera_epcq_read(struct spi_nor *nor, loff_t from, size_t len,
> +                size_t *retlen, u_char *buf)
> +{
> +    struct altera_epcq_flash *flash = nor->priv;
> +    struct altera_epcq *dev = flash->priv;
> +    int ret = 0;
> +
> +    mutex_lock(&flash->lock);

Hmm, why do you need this lock? I think spi-nor.c will do the per-flash
locking for you, so you can remove flash->lock throughout this driver.

> +    /* wait till previous write/erase is done. */
> +    ret = nor->wait_till_ready(nor);

Drop this.

> +    if (ret)
> +        goto err;
> +
> +    memcpy_fromio(buf, dev->data_base + from, len);
> +    *retlen = len;
> +
> +err:
> +    mutex_unlock(&flash->lock);
> +    return ret;
> +}
> +
> +static void altera_epcq_write(struct spi_nor *nor, loff_t to, size_t len,
> +                 size_t *retlen, const u_char *buf)
> +{
> +    struct altera_epcq_flash *flash = nor->priv;
> +    struct altera_epcq *dev = flash->priv;
> +    int ret = 0;
> +
> +    mutex_lock(&flash->lock);
> +
> +    /* wait until finished previous write command */
> +    ret = nor->wait_till_ready(nor);

Drop this. (Same throughout. I'll probably stop commenting.)

> +    if (ret)
> +        goto err;
> +
> +    memcpy_toio(dev->data_base + to, buf, len);
> +    *retlen += len;
> +
> +    /* wait until finished write command then
> +     * check whether write triggered a illegal write interrupt
> +     */
> +    ret = nor->wait_till_ready(nor);
> +    if (ret)
> +        goto err;
> +
> +    ret = altera_epcq_write_erase_check(nor, 1);

Same comments as in the erase function. You probably need to do some
sort of interrupt handling, or else you'll need to handle the above
"wait_till_ready()" some other way.

> +    if (ret < 0)
> +        goto err;
> +
> +err:
> +    mutex_unlock(&flash->lock);
> +}
> +
> +static int altera_epcq_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +    struct altera_epcq_flash *flash = nor->priv;
> +    struct altera_epcq *dev = flash->priv;
> +    struct mtd_info *mtd = &flash->mtd;
> +    uint32_t offset = ofs;
> +    int ret = 0;
> +    u32 sector_start, sector_end;
> +    u32 num_sectors;
> +    u32 mem_op;
> +    u32 sr_bp;
> +    u32 sr_tb;
> +
> +    sector_start = offset;
> +    sector_end = altera_epcq_addr_to_sector(mtd, offset + len);
> +    num_sectors = mtd->size;
> +    do_div(num_sectors, mtd->erasesize);
> +
> +    dev_dbg(nor->dev, "%s: sector start is %u,sector end is %u\n",
> +        __func__, sector_start, sector_end);
> +
> +    mutex_lock(&flash->lock);
> +    /* wait until finished previous write command. */
> +    ret = nor->wait_till_ready(nor);
> +    if (ret)
> +        goto err;
> +
> +    if (sector_start >= num_sectors / 2) {
> +        sr_bp = fls(num_sectors - 1 - sector_start) + 1;
> +        sr_tb = 0;
> +    } else if ((sector_end < num_sectors / 2) && ~dev->is_epcs) {
> +        sr_bp = fls(sector_end) + 1;
> +        sr_tb = 1;
> +    } else {
> +        sr_bp = 16;
> +        sr_tb = 0;
> +    }
> +
> +    mem_op = (sr_tb << 12) | (sr_bp << 8);
> +    mem_op &= EPCQ_MEM_OP_SECTOR_PROTECT_VALUE_MASK;
> +    mem_op |= EPCQ_MEM_OP_SECTOR_PROTECT_CMD;
> +    writel(mem_op, dev->csr_base + EPCQ_MEM_OP_REG);
> +
> +err:
> +    mutex_unlock(&flash->lock);
> +    return ret;
> +}
> +
> +static int altera_epcq_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +    struct altera_epcq_flash *flash = nor->priv;
> +    struct altera_epcq *dev = flash->priv;
> +    int ret = 0;
> +    u32 mem_op;
> +
> +    mutex_lock(&flash->lock);
> +    /* wait until finished previous write command. */
> +    ret = nor->wait_till_ready(nor);
> +    if (ret)
> +        goto err;
> +    dev_info(nor->dev, "Unlock all protected area\n");
> +    mem_op = 0;
> +    mem_op &= EPCQ_MEM_OP_SECTOR_PROTECT_VALUE_MASK;
> +    mem_op |= EPCQ_MEM_OP_SECTOR_PROTECT_CMD;
> +    writel(mem_op, dev->csr_base + EPCQ_MEM_OP_REG);
> +
> +err:
> +    mutex_unlock(&flash->lock);
> +    return ret;
> +}
> +
> +static void altera_epcq_chip_select(struct altera_epcq *dev, u32 bank)
> +{
> +    u32 val = 0;
> +
> +    switch (bank) {
> +    case 0:
> +        val = EPCQ_CHIP_SELECT_0;
> +        break;
> +    case 1:
> +        val = EPCQ_CHIP_SELECT_1;
> +        break;
> +    case 2:
> +        val = EPCQ_CHIP_SELECT_2;
> +        break;
> +    default:
> +        return;
> +    }
> +    writel(val, dev->csr_base + EPCQ_CHIP_SELECT_REG);
> +}
> +
> +
> +static int altera_epcq_probe_config_dt(struct platform_device *pdev,
> +                       struct device_node *np,
> +                       struct altera_epcq_plat_data *pdata)
> +{
> +    struct device_node *pp = NULL;
> +    struct resource *epcq_res;
> +    int i = 0;
> +
> +    pdata->is_epcs = of_property_read_bool(np, "is-epcs");
> +
> +    epcq_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                        "csr_base");
> +    pdata->csr_base = devm_ioremap_resource(&pdev->dev, epcq_res);
> +    if (IS_ERR(pdata->csr_base)) {
> +        dev_err(&pdev->dev, "%s: ERROR: failed to map csr base\n",
> +            __func__);
> +        return PTR_ERR(pdata->csr_base);
> +    }
> +
> +    epcq_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                        "data_base");
> +    pdata->data_base = devm_ioremap_resource(&pdev->dev, epcq_res);
> +    if (IS_ERR(pdata->data_base)) {
> +        dev_err(&pdev->dev, "%s: ERROR: failed to map data base\n",
> +            __func__);
> +        return PTR_ERR(pdata->data_base);
> +    }
> +
> +    /* Fill structs for each subnode (flash device) */
> +    for_each_available_child_of_node(np, pp) {
> +        /* Read bank id from DT */
> +        pdata->np[i] = pp;
> +        i++;
> +    }
> +    pdata->num_flashes = i;
> +    return 0;
> +}
> +
> +static int altera_epcq_setup_banks(struct platform_device *pdev,
> +                   u32 bank, struct device_node *np)
> +{
> +    struct altera_epcq *dev = platform_get_drvdata(pdev);
> +    struct mtd_part_parser_data ppdata = {};
> +    struct altera_epcq_flash *flash;
> +    struct spi_nor *nor;
> +    int ret = 0;
> +    char modalias[40];
> +
> +    altera_epcq_chip_select(dev, bank);
> +
> +    if (bank > dev->num_flashes - 1)
> +        return -EINVAL;
> +
> +    flash = devm_kzalloc(&pdev->dev, sizeof(*flash), GFP_KERNEL);
> +    if (!flash)
> +        return -ENOMEM;
> +
> +    mutex_init(&flash->lock);
> +
> +    dev->flash[bank] = flash;
> +    nor = &flash->nor;
> +    nor->mtd = &flash->mtd;
> +    nor->dev = &pdev->dev;
> +    nor->priv = flash;
> +    flash->mtd.priv = nor;
> +    flash->priv = dev;
> +
> +    /* spi nor framework*/
> +    nor->read_reg = altera_epcq_read_reg;
> +    nor->write_reg = altera_epcq_write_reg;
> +    nor->read = altera_epcq_read;
> +    nor->write = altera_epcq_write;
> +    nor->erase = altera_epcq_erase;
> +    nor->_lock = altera_epcq_lock;
> +    nor->_unlock = altera_epcq_unlock;
> +
> +    if (of_modalias_node(np, modalias, sizeof(modalias)) < 0)
> +        return -EINVAL;
> +
> +    ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
> +    if (ret)
> +        return ret;
> +    ppdata.of_node = np;
> +
> +    return mtd_device_parse_register(&flash->mtd, NULL, &ppdata, NULL, 0);
> +}
> +
> +static int altera_epcq_probe(struct platform_device *pdev)
> +{
> +    struct device_node *np = pdev->dev.of_node;
> +    struct altera_epcq_plat_data *pdata = NULL;
> +    struct altera_epcq *dev;
> +    int ret = 0;
> +    int i;
> +
> +    if (!np) {
> +        ret = -ENODEV;
> +        dev_err(&pdev->dev, "no device found\n");
> +        goto err;
> +    }
> +
> +    pdata = devm_kzalloc(&pdev->dev,
> +                 sizeof(struct altera_epcq_plat_data),
> +                 GFP_KERNEL);
> +
> +    if (!pdata) {
> +        ret = -ENOMEM;
> +        goto err;
> +    }
> +
> +    ret = altera_epcq_probe_config_dt(pdev, np, pdata);
> +    if (ret) {
> +        ret = -ENODEV;
> +        dev_err(&pdev->dev, "probe fail\n");
> +        goto err;
> +    }
> +
> +    dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_ATOMIC);
> +    if (!dev) {
> +        ret = -ENOMEM;
> +        goto err;
> +    }
> +    mutex_init(&dev->lock);
> +    dev->is_epcs = pdata->is_epcs;
> +    dev->csr_base = pdata->csr_base;
> +    dev->data_base = pdata->data_base;
> +
> +    /* check number of flashes */
> +    dev->num_flashes = pdata->num_flashes;
> +    if (dev->num_flashes > MAX_NUM_FLASH_CHIP) {
> +        dev_err(&pdev->dev, "exceeding max number of flashes\n");
> +        dev->num_flashes = MAX_NUM_FLASH_CHIP;
> +    }
> +
> +    /* check clock */
> +    dev->clk = devm_clk_get(&pdev->dev, NULL);
> +    if (IS_ERR(dev->clk)) {
> +        ret = PTR_ERR(dev->clk);
> +        goto err;
> +    }
> +    ret = clk_prepare_enable(dev->clk);
> +    if (ret)
> +        goto err;
> +
> +    platform_set_drvdata(pdev, dev);
> +
> +    /* loop for each flash which is connected to epcq */
> +    for (i = 0; i < dev->num_flashes; i++) {

I'm curious: are you doing any tests with multiple flashes
simultaneously?

> +        ret = altera_epcq_setup_banks(pdev, i, pdata->np[i]);
> +        if (ret) {
> +            dev_err(&pdev->dev, "bank setup failed\n");
> +            goto err_bank_setup;
> +        }
> +    }
> +
> +    return 0;
> +
> +err_bank_setup:
> +    clk_disable_unprepare(dev->clk);
> +err:
> +    return ret;
> +}
> +
> +static int altera_epcq_remove(struct platform_device *pdev)
> +{
> +    struct altera_epcq *dev;
> +    struct altera_epcq_flash *flash;
> +    int ret, i;
> +
> +    dev = platform_get_drvdata(pdev);
> +
> +    /* clean up for all nor flash */
> +    for (i = 0; i < dev->num_flashes; i++) {
> +        flash = dev->flash[i];
> +        if (!flash)
> +            continue;
> +
> +        /* clean up mtd stuff */
> +        ret = mtd_device_unregister(&flash->mtd);
> +        if (ret)
> +            dev_err(&pdev->dev, "error removing mtd\n");
> +    }
> +
> +    clk_disable_unprepare(dev->clk);
> +
> +    return 0;
> +}
> +
> +static const struct of_device_id altera_epcq_id_table[] = {
> +    { .compatible = "altr,epcq-1.0" },
> +    {}
> +};
> +MODULE_DEVICE_TABLE(of, altera_epcq_id_table);
> +
> +static struct platform_driver altera_epcq_driver = {
> +    .driver = {
> +        .name = ALTERA_EPCQ_RESOURCE_NAME,
> +        .bus = &platform_bus_type,
> +        .of_match_table = altera_epcq_id_table,
> +    },
> +    .probe = altera_epcq_probe,
> +    .remove = altera_epcq_remove,
> +};
> +module_platform_driver(altera_epcq_driver);
> +
> +MODULE_AUTHOR("Viet Nga Dao <vndao@altera.com>");
> +MODULE_DESCRIPTION("Altera EPCQ Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mtd/spi-nor/altera_epcq.h
> b/drivers/mtd/spi-nor/altera_epcq.h
> new file mode 100644
> index 0000000..bc29f65
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/altera_epcq.h

Do you need this to be a separate header? From what I can tell, it's all
private to the driver. So it may be better to merge the two.

[snip]

> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 3b8a411..bfbb274 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -330,7 +330,7 @@ erase_err:
>      return ret;
>  }
> 
> -static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +static int stmicro_spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>      struct spi_nor *nor = mtd_to_spi_nor(mtd);
>      uint32_t offset = ofs;
> @@ -377,7 +377,8 @@ err:
>      return ret;
>  }
> 
> -static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +static int stmicro_spi_nor_unlock(struct mtd_info *mtd, loff_t ofs,
> +                  uint64_t len)
>  {
>      struct spi_nor *nor = mtd_to_spi_nor(mtd);
>      uint32_t offset = ofs;
> @@ -424,6 +425,48 @@ err:
>      return ret;
>  }
> 
> +static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> +    struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +    int ret = 0;
> +
> +    ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
> +    if (ret)
> +        return ret;
> +
> +    /* Wait until finished previous command */
> +    ret = wait_till_ready(nor);
> +    if (ret)
> +        goto err;
> +
> +    ret = nor->_lock(nor, ofs, len);
> +
> +err:
> +    spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
> +    return ret;
> +}
> +
> +static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> +    struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +    int ret = 0;
> +
> +    ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
> +    if (ret)
> +        return ret;
> +
> +    /* Wait until finished previous command */
> +    ret = wait_till_ready(nor);
> +    if (ret)
> +        goto err;
> +
> +    ret = nor->_unlock(nor, ofs, len);
> +
> +err:
> +    spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
> +    return ret;
> +}
> +
>  struct flash_info {
>      /* JEDEC id zero means "no ID" (most older chips); otherwise it has
>       * a high byte of zero plus three data bytes: the manufacturer id,
...
> @@ -904,7 +977,8 @@ static void spi_nor_shutdown(struct spi_nor *nor)
>  static int spi_nor_check(struct spi_nor *nor)
>  {
>      if (!nor->dev || !nor->read || !nor->write ||
> -        !nor->read_reg || !nor->write_reg || !nor->erase) {
> +        !nor->read_reg || !nor->write_reg || !nor->erase ||
> +        !nor->_lock || !nor->_unlock) {

No, lock() and unlock() are optional and should not be required here.

>          pr_err("spi-nor: please fill all the necessary fields!\n");
>          return -EINVAL;
>      }
[...]
> @@ -987,6 +1060,9 @@ int spi_nor_scan(struct spi_nor *nor, const char
> *name, enum read_mode mode)
> 
>      /* nor protection support for STmicro chips */
>      if (JEDEC_MFR(info->jedec_id) == CFI_MFR_ST) {
> +        mtd->_lock = stmicro_spi_nor_lock;
> +        mtd->_unlock = stmicro_spi_nor_unlock;
> +    } else {
>          mtd->_lock = spi_nor_lock;
>          mtd->_unlock = spi_nor_unlock;
>      }

No, you can't just magically create a lock() and unlock() function for
all non-ST flash here. You need to only assign this when you *know* the
flash supports lock/unlock.

> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 29d1a0d..042bed2 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -183,7 +183,8 @@ struct spi_nor {
>      void (*write)(struct spi_nor *nor, loff_t to,
>              size_t len, size_t *retlen, const u_char *write_buf);
>      int (*erase)(struct spi_nor *nor, loff_t offs);
> -
> +    int (*_lock)(struct spi_nor *nor, loff_t offs, uint64_t len);
> +    int (*_unlock)(struct spi_nor *nor, loff_t offs, uint64_t len);

You need to document new fields in the comments.

>      void *priv;
>  };
> 

All in all, I think your spi-nor lock/unlock changes should be rewritten
a bit to be safer (i.e., apply only to flash that support it) and to
require less duplication (particularly on the locking). How about the
following? I've only compile-tested it, but it should now allow you to
supply nor->flash_lock() and nor->flash_unlock() implementations in your
driver.

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b6a5a0c269e1..60bf3caf1ead 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -369,17 +369,13 @@ erase_err:
 	return ret;
 }
 
-static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
-	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct mtd_info *mtd = nor->mtd;
 	uint32_t offset = ofs;
 	uint8_t status_old, status_new;
 	int ret = 0;
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
-	if (ret)
-		return ret;
-
 	status_old = read_sr(nor);
 
 	if (offset < mtd->size - (mtd->size / 2))
@@ -402,26 +398,18 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 				(status_old & (SR_BP2 | SR_BP1 | SR_BP0))) {
 		write_enable(nor);
 		ret = write_sr(nor, status_new);
-		if (ret)
-			goto err;
 	}
 
-err:
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
 	return ret;
 }
 
-static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
-	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct mtd_info *mtd = nor->mtd;
 	uint32_t offset = ofs;
 	uint8_t status_old, status_new;
 	int ret = 0;
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
-	if (ret)
-		return ret;
-
 	status_old = read_sr(nor);
 
 	if (offset+len > mtd->size - (mtd->size / 64))
@@ -444,15 +432,41 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 				(status_old & (SR_BP2 | SR_BP1 | SR_BP0))) {
 		write_enable(nor);
 		ret = write_sr(nor, status_new);
-		if (ret)
-			goto err;
 	}
 
-err:
+	return ret;
+}
+
+static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret;
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
+	if (ret)
+		return ret;
+
+	ret = nor->flash_lock(nor, ofs, len);
+
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_UNLOCK);
 	return ret;
 }
 
+static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret;
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
+	if (ret)
+		return ret;
+
+	ret = nor->flash_unlock(nor, ofs, len);
+
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
+	return ret;
+}
+
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
 	((kernel_ulong_t)&(struct flash_info) {				\
@@ -1045,6 +1059,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	/* nor protection support for STmicro chips */
 	if (JEDEC_MFR(info) == CFI_MFR_ST) {
+		nor->flash_lock = stm_lock;
+		nor->flash_unlock = stm_unlock;
+	}
+
+	if (nor->flash_lock && nor->flash_unlock) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
 	}
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4720b86ee73d..e5409524bb0a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -155,6 +155,8 @@ enum spi_nor_option_flags {
  * @write:		[DRIVER-SPECIFIC] write data to the SPI NOR
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
  *			at the offset @offs
+ * @lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
+ * @unlock:		[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @priv:		the private data
  */
 struct spi_nor {
@@ -189,6 +191,9 @@ struct spi_nor {
 			size_t len, size_t *retlen, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
+	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+
 	void *priv;
 };
 
