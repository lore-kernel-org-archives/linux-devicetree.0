From: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Fri, 13 Mar 2015 10:42:06 +0800
Message-ID: <CAN1oZWwxHi7wz0Z0YRSxYX8=j34NPiffoR72ZzYCmbVBMM4wAA@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
	<CAN1oZWwHsm1i2Ap6LJwd5u=1ySokzA6DZCFAqK6wkPCz_P3XMA@mail.gmail.com>
	<CAN1oZWyM8HVuXuCyVankDvZb7JGOg5ysuTz7YwTOGHL89vY9dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAN1oZWyM8HVuXuCyVankDvZb7JGOg5ysuTz7YwTOGHL89vY9dg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,
Could anyone please help me review the lock, unlock modification part
i did in spi-nor?
Thanks,
Viet Nga

On Mon, Feb 23, 2015 at 9:30 AM, Viet Nga Dao <vndao@altera.com> wrote:
> Hi,
> It has been nearly 2 weeks since i submitted this patch.  Could you
> please help to review?
> Thanks,
>
> On Tue, Feb 17, 2015 at 9:33 AM, Viet Nga Dao <vndao@altera.com> wrote:
>> Hi Brian,
>> Could you please help me to review through this 2nd version?
>>
>> On Wed, Feb 11, 2015 at 12:53 PM, Viet Nga Dao <vndao@altera.com> wrote:
>>> From: Viet Nga Dao <vndao@altera.com>
>>>
>>> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
>>> EPCS flash chips. This patch adds driver for these devices.
>>>
>>> Signed-off-by: VIET NGA DAO <vndao@altera.com>
>>>
>>> ---
>>> v2:
>>> - Change to spi_nor structure
>>> - Add lock and unlock functions for spi_nor
>>> - Simplify the altera_epcq_lock function
>>> - Replace reg by compatible in device tree
>>> ---
>>>  .../devicetree/bindings/mtd/altera_epcq.txt        |   45 ++
>>>  drivers/mtd/spi-nor/Kconfig                        |   12 +
>>>  drivers/mtd/spi-nor/Makefile                       |    1 +
>>>  drivers/mtd/spi-nor/altera_epcq.c                  |  507 ++++++++++++++++++++
>>>  drivers/mtd/spi-nor/altera_epcq.h                  |  116 +++++
>>>  drivers/mtd/spi-nor/spi-nor.c                      |   86 ++++-
>>>  include/linux/mtd/spi-nor.h                        |    3 +-
>>>  7 files changed, 764 insertions(+), 6 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/altera_epcq.txt
>>>  create mode 100644 drivers/mtd/spi-nor/altera_epcq.c
>>>  create mode 100644 drivers/mtd/spi-nor/altera_epcq.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/altera_epcq.txt
>>> b/Documentation/devicetree/bindings/mtd/altera_epcq.txt
>>> new file mode 100644
>>> index 0000000..b6b5e61
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/altera_epcq.txt
>>> @@ -0,0 +1,45 @@
>>> +* MTD Altera EPCQ driver
>>> +
>>> +Required properties:
>>> +- compatible: Should be "altr,epcq-1.0"
>>> +- reg: Address and length of the register set  for the device. It contains
>>> +  the information of registers in the same order as described by reg-names
>>> +- reg-names: Should contain the reg names
>>> +  "csr_base": Should contain the register configuration base address
>>> +  "data_base": Should contain the data base address
>>> +- is-epcs: boolean type.
>>> +        If present, the device contains EPCS flashes.
>>> +        Otherwise, it contains EPCQ flashes.
>>> +- #address-cells: Must be <1>.
>>> +- #size-cells: Must be <0>.
>>> +- flash device tree subnode, there must be a node with the following fields:
>>> +    - compatible: Should contain the flash name
>>> +    - #address-cells: please refer to /mtd/partition.txt
>>> +    - #size-cells: please refer to /mtd/partition.txt
>>> +    For partitions inside each flash, please refer to /mtd/partition.txt
>>> +
>>> +Example:
>>> +
>>> +            epcq_controller_0: epcq@0x000000000 {
>>> +                compatible = "altr,epcq-1.0";
>>> +                reg = <0x00000001 0x00000000 0x00000020>,
>>> +                    <0x00000000 0x00000000 0x02000000>;
>>> +                reg-names = "csr_base", "data_base";
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +                flash0: epcq256@0 {
>>> +                    compatible = "epcq256";
>>> +                    #address-cells = <1>;
>>> +                    #size-cells = <1>;
>>> +                    partition@0 {
>>> +                        /* 16 MB for raw data. */
>>> +                        label = "EPCQ Flash 0 raw data";
>>> +                        reg = <0x0 0x1000000>;
>>> +                    };
>>> +                    partition@1000000 {
>>> +                        /* 16 MB for jffs2 data. */
>>> +                        label = "EPCQ Flash 0 JFFS 2";
>>> +                        reg = <0x1000000 0x1000000>;
>>> +                    };
>>> +                };
>>> +            }; //end epcq@0x000000000 (epcq_controller_0)
>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>>> index 64a4f0e..83178b9 100644
>>> --- a/drivers/mtd/spi-nor/Kconfig
>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>> @@ -28,4 +28,16 @@ config SPI_FSL_QUADSPI
>>>        This enables support for the Quad SPI controller in master mode.
>>>        We only connect the NOR to this controller now.
>>>
>>> +config SPI_ALTERA_EPCQ
>>> +    tristate "Support Altera EPCQ/EPCS Flash chips"
>>> +    depends on OF
>>> +    help
>>> +      This enables access to Altera EPCQ/EPCS flash chips, used for data
>>> +      storage. See the driver source for the current list,
>>> +      or to add other chips.
>>> +
>>> +      If you want to compile this driver as a module ( = code which can be
>>> +      inserted in and removed from the running kernel whenever you want),
>>> +      say M here and read <file:Documentation/kbuild/modules.txt>.
>>> +
>>>  endif # MTD_SPI_NOR
>>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>>> index 6a7ce14..ff9437b 100644
>>> --- a/drivers/mtd/spi-nor/Makefile
>>> +++ b/drivers/mtd/spi-nor/Makefile
>>> @@ -1,2 +1,3 @@
>>>  obj-$(CONFIG_MTD_SPI_NOR)    += spi-nor.o
>>>  obj-$(CONFIG_SPI_FSL_QUADSPI)    += fsl-quadspi.o
>>> +obj-$(CONFIG_SPI_ALTERA_EPCQ)        += altera_epcq.o
>>> diff --git a/drivers/mtd/spi-nor/altera_epcq.c
>>> b/drivers/mtd/spi-nor/altera_epcq.c
>>> new file mode 100644
>>> index 0000000..9db0d05
>>> --- /dev/null
>>> +++ b/drivers/mtd/spi-nor/altera_epcq.c
>>> @@ -0,0 +1,507 @@
>>> +/*
>>> + * Copyright (C) 2014 Altera Corporation. All rights reserved
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify it
>>> + * under the terms and conditions of the GNU General Public License,
>>> + * version 2, as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>> + * more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License along with
>>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/ioport.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/log2.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/mtd/mtd.h>
>>> +#include <linux/mtd/partitions.h>
>>> +#include <linux/mtd/spi-nor.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/sched.h>
>>> +
>>> +#include "altera_epcq.h"
>>> +
>>> +static int altera_epcq_write_reg(struct spi_nor *nor, u8 opcode, u8 *val,
>>> +                 int len, int wr_en)
>>> +{
>>> +    return 0;
>>> +}
>>> +
>>> +static int altera_epcq_read_reg(struct spi_nor *nor, u8 opcode, u8 *val,
>>> +                int len)
>>> +{
>>> +    struct altera_epcq_flash *flash = nor->priv;
>>> +    struct altera_epcq *dev = flash->priv;
>>> +    u32 data = 0;
>>> +    u8 id[5];
>>> +
>>> +    switch (opcode) {
>>> +    case SPINOR_OP_RDSR:
>>> +        data = readl(dev->csr_base + EPCQ_SR_REG);
>>> +        *val = (u8)data & EPCQ_SR_MASK;
>>> +        break;
>>> +    case SPINOR_OP_RDID:
>>> +        /* opcode id */
>>> +        if (dev->is_epcs) {
>>> +            data = readl(dev->csr_base + EPCQ_SID_REG);
>>> +            id[4] = EPCS_OPCODE_ID;
>>> +        } else {
>>> +            data = readl(dev->csr_base + EPCQ_RDID_REG);
>>> +            id[4] = EPCQ_OPCODE_ID;
>>> +        }
>>> +        id[0] = 0xFF;    /* non standard jedec id */
>>> +        id[1] = 0xFF;    /* non standard jedec id */
>>> +        id[2] = 0xFF;    /* non standard jedec id */
>>> +        id[3] = (u8)data & EPCQ_ID_MASK; /* device id */
>>> +        memcpy(val, &id, 5);
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static int altera_epcq_write_erase_check(struct spi_nor *nor,
>>> +                     bool write_erase)
>>> +{
>>> +    struct altera_epcq_flash *flash = nor->priv;
>>> +    struct altera_epcq *dev = flash->priv;
>>> +    u32 val;
>>> +    u32 mask;
>>> +
>>> +    if (write_erase)
>>> +        mask = EPCQ_ISR_ILLEGAL_WRITE_MASK;
>>> +    else
>>> +        mask = EPCQ_ISR_ILLEGAL_ERASE_MASK;
>>> +
>>> +    val = readl(dev->csr_base + EPCQ_ISR_REG);
>>> +    if (val & mask) {
>>> +        dev_err(nor->dev,
>>> +            "write/erase failed, sector might be protected\n");
>>> +        /* clear this status for next use */
>>> +        writel(val, dev->csr_base + EPCQ_ISR_REG);
>>> +        return -EIO;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static int altera_epcq_addr_to_sector(struct mtd_info *mtd, int offset)
>>> +{
>>> +    if (mtd->erasesize_shift)
>>> +        return offset >> mtd->erasesize_shift;
>>> +    do_div(offset, mtd->erasesize);
>>> +    return offset;
>>> +}
>>> +
>>> +static int altera_epcq_erase(struct spi_nor *nor, loff_t offset)
>>> +{
>>> +
>>> +    struct altera_epcq_flash *flash = nor->priv;
>>> +    struct altera_epcq *dev = flash->priv;
>>> +    struct mtd_info *mtd = &flash->mtd;
>>> +    u32 val;
>>> +    int ret;
>>> +    int sector_value;
>>> +
>>> +    ret = nor->wait_till_ready(nor);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    sector_value = altera_epcq_addr_to_sector(mtd, offset);
>>> +    /* sanity check that block_offset is a valid sector number */
>>> +    if (sector_value < 0)
>>> +        return -EINVAL;
>>> +
>>> +    /* sector value should occupy bits 17:8 */
>>> +    val = (sector_value << 8) & EPCQ_MEM_OP_SECTOR_VALUE_MASK;
>>> +
>>> +    /* sector erase commands occupies lower 2 bits */
>>> +    val |= EPCQ_MEM_OP_SECTOR_ERASE_CMD;
>>> +
>>> +    /* write sector erase command to EPCQ_MEM_OP register */
>>> +    writel(val, dev->csr_base + EPCQ_MEM_OP_REG);
>>> +
>>> +    /* wait the erase command is done then check whether
>>> +     * write triggered a illegal write interrupt
>>> +     */
>>> +    ret = nor->wait_till_ready(nor);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = altera_epcq_write_erase_check(nor, 0);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int altera_epcq_read(struct spi_nor *nor, loff_t from, size_t len,
>>> +                size_t *retlen, u_char *buf)
>>> +{
>>> +    struct altera_epcq_flash *flash = nor->priv;
>>> +    struct altera_epcq *dev = flash->priv;
>>> +    int ret = 0;
>>> +
>>> +    mutex_lock(&flash->lock);
>>> +    /* wait till previous write/erase is done. */
>>> +    ret = nor->wait_till_ready(nor);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    memcpy_fromio(buf, dev->data_base + from, len);
>>> +    *retlen = len;
>>> +
>>> +err:
>>> +    mutex_unlock(&flash->lock);
>>> +    return ret;
>>> +}
>>> +
>>> +static void altera_epcq_write(struct spi_nor *nor, loff_t to, size_t len,
>>> +                 size_t *retlen, const u_char *buf)
>>> +{
>>> +    struct altera_epcq_flash *flash = nor->priv;
>>> +    struct altera_epcq *dev = flash->priv;
>>> +    int ret = 0;
>>> +
>>> +    mutex_lock(&flash->lock);
>>> +
>>> +    /* wait until finished previous write command */
>>> +    ret = nor->wait_till_ready(nor);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    memcpy_toio(dev->data_base + to, buf, len);
>>> +    *retlen += len;
>>> +
>>> +    /* wait until finished write command then
>>> +     * check whether write triggered a illegal write interrupt
>>> +     */
>>> +    ret = nor->wait_till_ready(nor);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    ret = altera_epcq_write_erase_check(nor, 1);
>>> +    if (ret < 0)
>>> +        goto err;
>>> +
>>> +err:
>>> +    mutex_unlock(&flash->lock);
>>> +}
>>> +
>>> +static int altera_epcq_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>>> +{
>>> +    struct altera_epcq_flash *flash = nor->priv;
>>> +    struct altera_epcq *dev = flash->priv;
>>> +    struct mtd_info *mtd = &flash->mtd;
>>> +    uint32_t offset = ofs;
>>> +    int ret = 0;
>>> +    u32 sector_start, sector_end;
>>> +    u32 num_sectors;
>>> +    u32 mem_op;
>>> +    u32 sr_bp;
>>> +    u32 sr_tb;
>>> +
>>> +    sector_start = offset;
>>> +    sector_end = altera_epcq_addr_to_sector(mtd, offset + len);
>>> +    num_sectors = mtd->size;
>>> +    do_div(num_sectors, mtd->erasesize);
>>> +
>>> +    dev_dbg(nor->dev, "%s: sector start is %u,sector end is %u\n",
>>> +        __func__, sector_start, sector_end);
>>> +
>>> +    mutex_lock(&flash->lock);
>>> +    /* wait until finished previous write command. */
>>> +    ret = nor->wait_till_ready(nor);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    if (sector_start >= num_sectors / 2) {
>>> +        sr_bp = fls(num_sectors - 1 - sector_start) + 1;
>>> +        sr_tb = 0;
>>> +    } else if ((sector_end < num_sectors / 2) && ~dev->is_epcs) {
>>> +        sr_bp = fls(sector_end) + 1;
>>> +        sr_tb = 1;
>>> +    } else {
>>> +        sr_bp = 16;
>>> +        sr_tb = 0;
>>> +    }
>>> +
>>> +    mem_op = (sr_tb << 12) | (sr_bp << 8);
>>> +    mem_op &= EPCQ_MEM_OP_SECTOR_PROTECT_VALUE_MASK;
>>> +    mem_op |= EPCQ_MEM_OP_SECTOR_PROTECT_CMD;
>>> +    writel(mem_op, dev->csr_base + EPCQ_MEM_OP_REG);
>>> +
>>> +err:
>>> +    mutex_unlock(&flash->lock);
>>> +    return ret;
>>> +}
>>> +
>>> +static int altera_epcq_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>>> +{
>>> +    struct altera_epcq_flash *flash = nor->priv;
>>> +    struct altera_epcq *dev = flash->priv;
>>> +    int ret = 0;
>>> +    u32 mem_op;
>>> +
>>> +    mutex_lock(&flash->lock);
>>> +    /* wait until finished previous write command. */
>>> +    ret = nor->wait_till_ready(nor);
>>> +    if (ret)
>>> +        goto err;
>>> +    dev_info(nor->dev, "Unlock all protected area\n");
>>> +    mem_op = 0;
>>> +    mem_op &= EPCQ_MEM_OP_SECTOR_PROTECT_VALUE_MASK;
>>> +    mem_op |= EPCQ_MEM_OP_SECTOR_PROTECT_CMD;
>>> +    writel(mem_op, dev->csr_base + EPCQ_MEM_OP_REG);
>>> +
>>> +err:
>>> +    mutex_unlock(&flash->lock);
>>> +    return ret;
>>> +}
>>> +
>>> +static void altera_epcq_chip_select(struct altera_epcq *dev, u32 bank)
>>> +{
>>> +    u32 val = 0;
>>> +
>>> +    switch (bank) {
>>> +    case 0:
>>> +        val = EPCQ_CHIP_SELECT_0;
>>> +        break;
>>> +    case 1:
>>> +        val = EPCQ_CHIP_SELECT_1;
>>> +        break;
>>> +    case 2:
>>> +        val = EPCQ_CHIP_SELECT_2;
>>> +        break;
>>> +    default:
>>> +        return;
>>> +    }
>>> +    writel(val, dev->csr_base + EPCQ_CHIP_SELECT_REG);
>>> +}
>>> +
>>> +
>>> +static int altera_epcq_probe_config_dt(struct platform_device *pdev,
>>> +                       struct device_node *np,
>>> +                       struct altera_epcq_plat_data *pdata)
>>> +{
>>> +    struct device_node *pp = NULL;
>>> +    struct resource *epcq_res;
>>> +    int i = 0;
>>> +
>>> +    pdata->is_epcs = of_property_read_bool(np, "is-epcs");
>>> +
>>> +    epcq_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> +                        "csr_base");
>>> +    pdata->csr_base = devm_ioremap_resource(&pdev->dev, epcq_res);
>>> +    if (IS_ERR(pdata->csr_base)) {
>>> +        dev_err(&pdev->dev, "%s: ERROR: failed to map csr base\n",
>>> +            __func__);
>>> +        return PTR_ERR(pdata->csr_base);
>>> +    }
>>> +
>>> +    epcq_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> +                        "data_base");
>>> +    pdata->data_base = devm_ioremap_resource(&pdev->dev, epcq_res);
>>> +    if (IS_ERR(pdata->data_base)) {
>>> +        dev_err(&pdev->dev, "%s: ERROR: failed to map data base\n",
>>> +            __func__);
>>> +        return PTR_ERR(pdata->data_base);
>>> +    }
>>> +
>>> +    /* Fill structs for each subnode (flash device) */
>>> +    for_each_available_child_of_node(np, pp) {
>>> +        /* Read bank id from DT */
>>> +        pdata->np[i] = pp;
>>> +        i++;
>>> +    }
>>> +    pdata->num_flashes = i;
>>> +    return 0;
>>> +}
>>> +
>>> +static int altera_epcq_setup_banks(struct platform_device *pdev,
>>> +                   u32 bank, struct device_node *np)
>>> +{
>>> +    struct altera_epcq *dev = platform_get_drvdata(pdev);
>>> +    struct mtd_part_parser_data ppdata = {};
>>> +    struct altera_epcq_flash *flash;
>>> +    struct spi_nor *nor;
>>> +    int ret = 0;
>>> +    char modalias[40];
>>> +
>>> +    altera_epcq_chip_select(dev, bank);
>>> +
>>> +    if (bank > dev->num_flashes - 1)
>>> +        return -EINVAL;
>>> +
>>> +    flash = devm_kzalloc(&pdev->dev, sizeof(*flash), GFP_KERNEL);
>>> +    if (!flash)
>>> +        return -ENOMEM;
>>> +
>>> +    mutex_init(&flash->lock);
>>> +
>>> +    dev->flash[bank] = flash;
>>> +    nor = &flash->nor;
>>> +    nor->mtd = &flash->mtd;
>>> +    nor->dev = &pdev->dev;
>>> +    nor->priv = flash;
>>> +    flash->mtd.priv = nor;
>>> +    flash->priv = dev;
>>> +
>>> +    /* spi nor framework*/
>>> +    nor->read_reg = altera_epcq_read_reg;
>>> +    nor->write_reg = altera_epcq_write_reg;
>>> +    nor->read = altera_epcq_read;
>>> +    nor->write = altera_epcq_write;
>>> +    nor->erase = altera_epcq_erase;
>>> +    nor->_lock = altera_epcq_lock;
>>> +    nor->_unlock = altera_epcq_unlock;
>>> +
>>> +    if (of_modalias_node(np, modalias, sizeof(modalias)) < 0)
>>> +        return -EINVAL;
>>> +
>>> +    ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
>>> +    if (ret)
>>> +        return ret;
>>> +    ppdata.of_node = np;
>>> +
>>> +    return mtd_device_parse_register(&flash->mtd, NULL, &ppdata, NULL, 0);
>>> +}
>>> +
>>> +static int altera_epcq_probe(struct platform_device *pdev)
>>> +{
>>> +    struct device_node *np = pdev->dev.of_node;
>>> +    struct altera_epcq_plat_data *pdata = NULL;
>>> +    struct altera_epcq *dev;
>>> +    int ret = 0;
>>> +    int i;
>>> +
>>> +    if (!np) {
>>> +        ret = -ENODEV;
>>> +        dev_err(&pdev->dev, "no device found\n");
>>> +        goto err;
>>> +    }
>>> +
>>> +    pdata = devm_kzalloc(&pdev->dev,
>>> +                 sizeof(struct altera_epcq_plat_data),
>>> +                 GFP_KERNEL);
>>> +
>>> +    if (!pdata) {
>>> +        ret = -ENOMEM;
>>> +        goto err;
>>> +    }
>>> +
>>> +    ret = altera_epcq_probe_config_dt(pdev, np, pdata);
>>> +    if (ret) {
>>> +        ret = -ENODEV;
>>> +        dev_err(&pdev->dev, "probe fail\n");
>>> +        goto err;
>>> +    }
>>> +
>>> +    dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_ATOMIC);
>>> +    if (!dev) {
>>> +        ret = -ENOMEM;
>>> +        goto err;
>>> +    }
>>> +    mutex_init(&dev->lock);
>>> +    dev->is_epcs = pdata->is_epcs;
>>> +    dev->csr_base = pdata->csr_base;
>>> +    dev->data_base = pdata->data_base;
>>> +
>>> +    /* check number of flashes */
>>> +    dev->num_flashes = pdata->num_flashes;
>>> +    if (dev->num_flashes > MAX_NUM_FLASH_CHIP) {
>>> +        dev_err(&pdev->dev, "exceeding max number of flashes\n");
>>> +        dev->num_flashes = MAX_NUM_FLASH_CHIP;
>>> +    }
>>> +
>>> +    /* check clock */
>>> +    dev->clk = devm_clk_get(&pdev->dev, NULL);
>>> +    if (IS_ERR(dev->clk)) {
>>> +        ret = PTR_ERR(dev->clk);
>>> +        goto err;
>>> +    }
>>> +    ret = clk_prepare_enable(dev->clk);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    platform_set_drvdata(pdev, dev);
>>> +
>>> +    /* loop for each flash which is connected to epcq */
>>> +    for (i = 0; i < dev->num_flashes; i++) {
>>> +        ret = altera_epcq_setup_banks(pdev, i, pdata->np[i]);
>>> +        if (ret) {
>>> +            dev_err(&pdev->dev, "bank setup failed\n");
>>> +            goto err_bank_setup;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +err_bank_setup:
>>> +    clk_disable_unprepare(dev->clk);
>>> +err:
>>> +    return ret;
>>> +}
>>> +
>>> +static int altera_epcq_remove(struct platform_device *pdev)
>>> +{
>>> +    struct altera_epcq *dev;
>>> +    struct altera_epcq_flash *flash;
>>> +    int ret, i;
>>> +
>>> +    dev = platform_get_drvdata(pdev);
>>> +
>>> +    /* clean up for all nor flash */
>>> +    for (i = 0; i < dev->num_flashes; i++) {
>>> +        flash = dev->flash[i];
>>> +        if (!flash)
>>> +            continue;
>>> +
>>> +        /* clean up mtd stuff */
>>> +        ret = mtd_device_unregister(&flash->mtd);
>>> +        if (ret)
>>> +            dev_err(&pdev->dev, "error removing mtd\n");
>>> +    }
>>> +
>>> +    clk_disable_unprepare(dev->clk);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct of_device_id altera_epcq_id_table[] = {
>>> +    { .compatible = "altr,epcq-1.0" },
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, altera_epcq_id_table);
>>> +
>>> +static struct platform_driver altera_epcq_driver = {
>>> +    .driver = {
>>> +        .name = ALTERA_EPCQ_RESOURCE_NAME,
>>> +        .bus = &platform_bus_type,
>>> +        .of_match_table = altera_epcq_id_table,
>>> +    },
>>> +    .probe = altera_epcq_probe,
>>> +    .remove = altera_epcq_remove,
>>> +};
>>> +module_platform_driver(altera_epcq_driver);
>>> +
>>> +MODULE_AUTHOR("Viet Nga Dao <vndao@altera.com>");
>>> +MODULE_DESCRIPTION("Altera EPCQ Driver");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/mtd/spi-nor/altera_epcq.h
>>> b/drivers/mtd/spi-nor/altera_epcq.h
>>> new file mode 100644
>>> index 0000000..bc29f65
>>> --- /dev/null
>>> +++ b/drivers/mtd/spi-nor/altera_epcq.h
>>> @@ -0,0 +1,116 @@
>>> +/*
>>> + * Copyright (C) 2014 Altera Corporation. All rights reserved
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify it
>>> + * under the terms and conditions of the GNU General Public License,
>>> + * version 2, as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>> + * more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License along with
>>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#ifndef __ALTERA_ECPQ_H
>>> +#define __ALTERA_ECPQ_H
>>> +
>>> +#define ALTERA_EPCQ_RESOURCE_NAME        "altera_epcq"
>>> +/* max possible slots for serial flash chip in the EPCQ controller */
>>> +#define MAX_NUM_FLASH_CHIP    3
>>> +#define EPCS_OPCODE_ID        1
>>> +#define EPCQ_OPCODE_ID        2
>>> +
>>> +struct altera_epcq_plat_data {
>>> +    void __iomem *csr_base;
>>> +    void __iomem *data_base;
>>> +    bool is_epcs;
>>> +    u32 num_flashes;
>>> +    struct device_node *np[MAX_NUM_FLASH_CHIP];
>>> +};
>>> +
>>> +struct altera_epcq {
>>> +    struct clk *clk;
>>> +    bool is_epcs;
>>> +    struct mutex lock;    /*device lock*/
>>> +    void __iomem *csr_base;
>>> +    void __iomem *data_base;
>>> +    u32 num_flashes;
>>> +    struct altera_epcq_flash *flash[MAX_NUM_FLASH_CHIP];
>>> +};
>>> +
>>> +struct altera_epcq_flash {
>>> +    struct mutex lock;    /*flash lock*/
>>> +    struct mtd_info mtd;
>>> +    struct spi_nor nor;
>>> +    void *priv;
>>> +};
>>> +
>>> +/* Define max times to check status register before we give up. */
>>> +#define EPCQ_MAX_TIME_OUT            (40 * HZ)
>>> +
>>> +/* defines for status register */
>>> +#define EPCQ_SR_REG                0x0
>>> +#define EPCQ_SR_WIP_MASK            0x00000001
>>> +#define EPCQ_SR_WIP                0x1
>>> +#define EPCQ_SR_WEL                0x2
>>> +#define EPCQ_SR_BP0                0x4
>>> +#define EPCQ_SR_BP1                0x8
>>> +#define EPCQ_SR_BP2                0x10
>>> +#define EPCQ_SR_BP3                0x40
>>> +#define EPCQ_SR_TB                0x20
>>> +#define EPCQ_SR_MASK                0x0000000F
>>> +
>>> +/* defines for device id register */
>>> +#define EPCQ_SID_REG                0x4
>>> +#define EPCQ_RDID_REG                0x8
>>> +#define EPCQ_ID_MASK                0x000000FF
>>> +
>>> +/*
>>> + * EPCQ_MEM_OP register offset
>>> + *
>>> + * The EPCQ_MEM_OP register is used to do memory protect and erase operations
>>> + *
>>> + */
>>> +#define EPCQ_MEM_OP_REG                0xC
>>> +
>>> +#define EPCQ_MEM_OP_CMD_MASK            0x00000003
>>> +#define EPCQ_MEM_OP_BULK_ERASE_CMD        0x00000001
>>> +#define EPCQ_MEM_OP_SECTOR_ERASE_CMD        0x00000002
>>> +#define EPCQ_MEM_OP_SECTOR_PROTECT_CMD        0x00000003
>>> +#define EPCQ_MEM_OP_SECTOR_VALUE_MASK        0x0003FF00
>>> +#define EPCQ_MEM_OP_SECTOR_PROTECT_VALUE_MASK    0x00001F00
>>> +#define EPCQ_MEM_OP_SECTOR_PROTECT_SHIFT    8
>>> +/*
>>> + * EPCQ_ISR register offset
>>> + *
>>> + * The EPCQ_ISR register is used to determine whether an invalid write or erase
>>> + * operation trigerred an interrupt
>>> + *
>>> + */
>>> +#define EPCQ_ISR_REG                0x10
>>> +
>>> +#define EPCQ_ISR_ILLEGAL_ERASE_MASK        0x00000001
>>> +#define EPCQ_ISR_ILLEGAL_WRITE_MASK        0x00000002
>>> +
>>> +/*
>>> + * EPCQ_IMR register offset
>>> + *
>>> + * The EPCQ_IMR register is used to mask the invalid erase or the invalid write
>>> + * interrupts.
>>> + *
>>> + */
>>> +#define EPCQ_IMR_REG                0x14
>>> +#define EPCQ_IMR_ILLEGAL_ERASE_MASK        0x00000001
>>> +
>>> +#define EPCQ_IMR_ILLEGAL_WRITE_MASK        0x00000002
>>> +
>>> +#define EPCQ_CHIP_SELECT_REG            0x18
>>> +#define EPCQ_CHIP_SELECT_MASK            0x00000007
>>> +#define EPCQ_CHIP_SELECT_0            0x00000001
>>> +#define EPCQ_CHIP_SELECT_1            0x00000002
>>> +#define EPCQ_CHIP_SELECT_2            0x00000004
>>> +
>>> +#endif /* __ALTERA_ECPQ_H */
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index 3b8a411..bfbb274 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -330,7 +330,7 @@ erase_err:
>>>      return ret;
>>>  }
>>>
>>> -static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>> +static int stmicro_spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>>  {
>>>      struct spi_nor *nor = mtd_to_spi_nor(mtd);
>>>      uint32_t offset = ofs;
>>> @@ -377,7 +377,8 @@ err:
>>>      return ret;
>>>  }
>>>
>>> -static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>> +static int stmicro_spi_nor_unlock(struct mtd_info *mtd, loff_t ofs,
>>> +                  uint64_t len)
>>>  {
>>>      struct spi_nor *nor = mtd_to_spi_nor(mtd);
>>>      uint32_t offset = ofs;
>>> @@ -424,6 +425,48 @@ err:
>>>      return ret;
>>>  }
>>>
>>> +static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>> +{
>>> +    struct spi_nor *nor = mtd_to_spi_nor(mtd);
>>> +    int ret = 0;
>>> +
>>> +    ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Wait until finished previous command */
>>> +    ret = wait_till_ready(nor);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    ret = nor->_lock(nor, ofs, len);
>>> +
>>> +err:
>>> +    spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
>>> +    return ret;
>>> +}
>>> +
>>> +static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>> +{
>>> +    struct spi_nor *nor = mtd_to_spi_nor(mtd);
>>> +    int ret = 0;
>>> +
>>> +    ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Wait until finished previous command */
>>> +    ret = wait_till_ready(nor);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    ret = nor->_unlock(nor, ofs, len);
>>> +
>>> +err:
>>> +    spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
>>> +    return ret;
>>> +}
>>> +
>>>  struct flash_info {
>>>      /* JEDEC id zero means "no ID" (most older chips); otherwise it has
>>>       * a high byte of zero plus three data bytes: the manufacturer id,
>>> @@ -442,6 +485,7 @@ struct flash_info {
>>>      u16        addr_width;
>>>
>>>      u16        flags;
>>> +    u8        altera_flash_opcode_id;
>>>  #define    SECT_4K            0x01    /* SPINOR_OP_BE_4K works uniformly */
>>>  #define    SPI_NOR_NO_ERASE    0x02    /* No erase command needed */
>>>  #define    SST_WRITE        0x04    /* use SST byte programming */
>>> @@ -471,6 +515,16 @@ struct flash_info {
>>>          .flags = (_flags),                    \
>>>      })
>>>
>>> +
>>> +#define EPCQ_INFO(_opcode_id, _ext_id, _sector_size, _n_sectors, _page_size) \
>>> +    ((kernel_ulong_t)&(struct flash_info) {                \
>>> +        .altera_flash_opcode_id = (_opcode_id),            \
>>> +        .ext_id = (_ext_id),                    \
>>> +        .sector_size = (_sector_size),                \
>>> +        .n_sectors = (_n_sectors),                \
>>> +        .page_size = (_page_size),                \
>>> +    })
>>> +
>>>  /* NOTE: double check command sets and memory organization when you add
>>>   * more nor chips.  This current list focusses on newer chips, which
>>>   * have been converging on command sets which including JEDEC ID.
>>> @@ -637,6 +691,17 @@ static const struct spi_device_id spi_nor_ids[] = {
>>>      { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE |
>>> SPI_NOR_NO_FR) },
>>>      { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE |
>>> SPI_NOR_NO_FR) },
>>>      { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE |
>>> SPI_NOR_NO_FR) },
>>> +
>>> +    /* Altera EPCQ/EPCS Flashes */
>>> +    { "epcq16"  , EPCQ_INFO(2, 0x15, 0x10000, 32,   0x100) },
>>> +    { "epcq32"  , EPCQ_INFO(2, 0x16, 0x10000, 64,   0x100) },
>>> +    { "epcq64"  , EPCQ_INFO(2, 0x17, 0x10000, 128,  0x100) },
>>> +    { "epcq128" , EPCQ_INFO(2, 0x18, 0x10000, 256,  0x100) },
>>> +    { "epcq256" , EPCQ_INFO(2, 0x19, 0x10000, 512,  0x100) },
>>> +    { "epcq512" , EPCQ_INFO(2, 0x20, 0x10000, 1024, 0x100) },
>>> +    { "epcs16"  , EPCQ_INFO(1, 0x14, 0x10000, 32,   0x100) },
>>> +    { "epcs64"  , EPCQ_INFO(1, 0x16, 0x10000, 128,  0x100) },
>>> +    { "epcs128" , EPCQ_INFO(1, 0x18, 0x40000, 256,  0x100) },
>>>      { },
>>>  };
>>>
>>> @@ -666,6 +731,14 @@ static const struct spi_device_id
>>> *spi_nor_read_id(struct spi_nor *nor)
>>>          if (info->jedec_id == jedec) {
>>>              if (info->ext_id == 0 || info->ext_id == ext_jedec)
>>>                  return &spi_nor_ids[tmp];
>>> +
>>> +        /* altera epcq which is non jedec device
>>> +         * use id[4] as opcode id to differentiate
>>> +         * epcs and epcq devices
>>> +         */
>>> +        } else if (info->altera_flash_opcode_id == id[4] &&
>>> +              info->ext_id == id[3]) {
>>> +                return &spi_nor_ids[tmp];
>>>          }
>>>      }
>>>      dev_err(nor->dev, "unrecognized JEDEC id %06x\n", jedec);
>>> @@ -904,7 +977,8 @@ static void spi_nor_shutdown(struct spi_nor *nor)
>>>  static int spi_nor_check(struct spi_nor *nor)
>>>  {
>>>      if (!nor->dev || !nor->read || !nor->write ||
>>> -        !nor->read_reg || !nor->write_reg || !nor->erase) {
>>> +        !nor->read_reg || !nor->write_reg || !nor->erase ||
>>> +        !nor->_lock || !nor->_unlock) {
>>>          pr_err("spi-nor: please fill all the necessary fields!\n");
>>>          return -EINVAL;
>>>      }
>>> @@ -939,9 +1013,8 @@ int spi_nor_scan(struct spi_nor *nor, const char
>>> *name, enum read_mode mode)
>>>
>>>      info = (void *)id->driver_data;
>>>
>>> -    if (info->jedec_id) {
>>> +    if (info->jedec_id || info->altera_flash_opcode_id) {
>>>          const struct spi_device_id *jid;
>>> -
>>>          jid = nor->read_id(nor);
>>>          if (IS_ERR(jid)) {
>>>              return PTR_ERR(jid);
>>> @@ -987,6 +1060,9 @@ int spi_nor_scan(struct spi_nor *nor, const char
>>> *name, enum read_mode mode)
>>>
>>>      /* nor protection support for STmicro chips */
>>>      if (JEDEC_MFR(info->jedec_id) == CFI_MFR_ST) {
>>> +        mtd->_lock = stmicro_spi_nor_lock;
>>> +        mtd->_unlock = stmicro_spi_nor_unlock;
>>> +    } else {
>>>          mtd->_lock = spi_nor_lock;
>>>          mtd->_unlock = spi_nor_unlock;
>>>      }
>>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>>> index 29d1a0d..042bed2 100644
>>> --- a/include/linux/mtd/spi-nor.h
>>> +++ b/include/linux/mtd/spi-nor.h
>>> @@ -183,7 +183,8 @@ struct spi_nor {
>>>      void (*write)(struct spi_nor *nor, loff_t to,
>>>              size_t len, size_t *retlen, const u_char *write_buf);
>>>      int (*erase)(struct spi_nor *nor, loff_t offs);
>>> -
>>> +    int (*_lock)(struct spi_nor *nor, loff_t offs, uint64_t len);
>>> +    int (*_unlock)(struct spi_nor *nor, loff_t offs, uint64_t len);
>>>      void *priv;
>>>  };
>>>
>>> --
>>> 1.7.7.4
