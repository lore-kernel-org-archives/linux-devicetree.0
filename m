From: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Mon, 27 Jul 2015 15:10:23 +0800
Message-ID: <CAN1oZWx1z0vq_8csMx3bs70ULfhR03CgX=NtTBj1HiLA8FdZjg@mail.gmail.com>
References: <1433316644-3748-1-git-send-email-vndao@altera.com>
	<20150724183749.GI8876@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150724183749.GI8876-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks Brian for your reply!

On Sat, Jul 25, 2015 at 2:37 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jun 03, 2015 at 12:30:44AM -0700, vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
>> From: VIET NGA DAO <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>
>> Altera Quad SPI Controller is a soft IP which enables access to
>> Altera EPCS, EPCQ and Mircon flash chips. This patch adds driver
>> for these devices.
>>
>> Signed-off-by: VIET NGA DAO <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> v4:
>> - Add more flash devices support ( EPCQL and Micron)
>
> ^^ Unfortunately, I think you've added yourself another burden with this
> one. Most of the rest actually is looking pretty good, so it's sad to
> see this hold your driver back. Comments below.
>
>> - Remove redundant messages
>> - Change EPCQ_OPCODE_ID to NON_EPCS_OPCODE_ID
>> - Replace get_flash_name to altera_quadspi_scan
>> - Remove clk related parts
>> - Remove altera_quadspi_plat
>> - Change device tree reg name and remove opcode-id
>>
>> v3:
>> - Change altera_epcq driver name to altera_quadspi for more generic name
>> - Implement flash name searching in altera_quadspi.c instead of spi-nor
>> - Edit the altra quadspi info table in spi-nor
>> - Remove wait_til_ready in all read,write, erase, lock, unlock functions
>> - Merge .h and .c into 1 file
>>
>> v2:
>> - Change to spi_nor structure
>> - Add lock and unlock functions for spi_nor
>> - Simplify the altera_epcq_lock function
>> - Replace reg by compatible in device tree
>> ---
>>  .../devicetree/bindings/mtd/altera-quadspi.txt     |   49 ++
>>  drivers/mtd/spi-nor/Kconfig                        |    8 +
>>  drivers/mtd/spi-nor/Makefile                       |    1 +
>>  drivers/mtd/spi-nor/altera-quadspi.c               |  568 ++++++++++++++++++++
>>  drivers/mtd/spi-nor/spi-nor.c                      |   30 +
>>  5 files changed, 656 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-quadspi.txt
>>  create mode 100644 drivers/mtd/spi-nor/altera-quadspi.c
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/altera-quadspi.txt b/Documentation/devicetree/bindings/mtd/altera-quadspi.txt
>> new file mode 100644
>> index 0000000..2873319
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/altera-quadspi.txt
>> @@ -0,0 +1,49 @@
>> +* MTD Altera QUADSPI driver
>> +
>> +Required properties:
>> +- compatible: Should be "altr,quadspi-1.0"
>> +- reg: Address and length of the register set  for the device. It contains
>> +  the information of registers in the same order as described by reg-names
>> +- reg-names: Should contain the reg names
>> +  "avl_csr": Should contain the register configuration base address
>> +  "avl_mem": Should contain the data base address
>> +- #address-cells: Must be <1>.
>> +- #size-cells: Must be <0>.
>> +- flash device tree subnode, there must be a node with the following fields:
>> +     - compatible: Should contain the flash name:
>> +       1. EPCS:   epcs16, epcs64, epcs128
>> +       2. EPCQ:   epcq16, epcq32, epcq64, epcq128, epcq256, epcq512, epcq1024
>> +       3. EPCQ-L: epcql256, epcql512, epcql1024
>> +       4. Mircon: n25q016-nonjedec, n25q032-nonjedec, n25q064-nonjedec,
>> +                  n25q128a13-nonjedec, n25q128a11-nonjedec, n25q256a-nonjedec,
>> +                  n25q256a11-nonjedec, n25q512a-nonjedec, n25q512ax3-nonjedec,
>> +                  mt25ql512-nonjedec, n25q00-nonjedec, n25q00a11-nonjedec
>
> OK, so you're adding a bunch of Micron flashes which already have
> support via standard DT bindings and spi-nor library code, except now
> you're adding "-nonjedec" to all of them. You better have a *really*
> good reason for this. Are these flash not compatible with the JEDEC READ
> ID opcode, by which every other system identifies these parts? Or are
> you adding these names because of limitations in your controller? For
> the former, I might be able to understand the need, but for the latter,
> I'm much disinclined to support this. There's got to be a better way.
>

Hi Brian,
It is really unfortunate that this controller is not able to read full
JEDEC ID. It only can provide 1 byte ID. I did discuss with IP
designer about this, but it is really unfortunate that they are not
able to fix that issue. Hence it requires software to make changes.

>> +     - #address-cells: please refer to /mtd/partition.txt
>> +     - #size-cells: please refer to /mtd/partition.txt
>> +     For partitions inside each flash, please refer to /mtd/partition.txt
>> +
>> +Example:
>> +
>> +                     quadspi_controller_0: quadspi@0x180014a0 {
>> +                             compatible = "altr,quadspi-1.0";
>> +                             reg = <0x180014a0 0x00000020>,
>> +                                   <0x14000000 0x04000000>;
>> +                             reg-names = "avl_csr", "avl_mem";
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +                             flash0: epcq256@0 {
>> +                                     compatible = "altr,epcq256";
>> +                                     #address-cells = <1>;
>> +                                     #size-cells = <1>;
>> +                                     partition@0 {
>> +                                             /* 16 MB for raw data. */
>> +                                             label = "EPCQ Flash 0 raw data";
>> +                                             reg = <0x0 0x1000000>;
>> +                                     };
>> +                                     partition@1000000 {
>> +                                             /* 16 MB for jffs2 data. */
>> +                                             label = "EPCQ Flash 0 JFFS 2";
>> +                                             reg = <0x1000000 0x1000000>;
>> +                                     };
>> +                             };
>> +                     }; //end quadspi@0x180014a0 (quadspi_controller_0)
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 64a4f0e..678dbe3 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -28,4 +28,12 @@ config SPI_FSL_QUADSPI
>>         This enables support for the Quad SPI controller in master mode.
>>         We only connect the NOR to this controller now.
>>
>> +config SPI_ALTERA_QUADSPI
>> +     tristate "Altera Generic Quad SPI Controller"
>> +     depends on OF
>> +     help
>> +       This enables access to Altera EPCQ/EPCS/Micron flash chips,
>> +       used for data storage. See the driver source for the current list,
>> +       or to add other chips.
>> +
>>  endif # MTD_SPI_NOR
>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>> index 6a7ce14..4e700df 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -1,2 +1,3 @@
>>  obj-$(CONFIG_MTD_SPI_NOR)    += spi-nor.o
>>  obj-$(CONFIG_SPI_FSL_QUADSPI)        += fsl-quadspi.o
>> +obj-$(CONFIG_SPI_ALTERA_QUADSPI) += altera-quadspi.o
>> diff --git a/drivers/mtd/spi-nor/altera-quadspi.c b/drivers/mtd/spi-nor/altera-quadspi.c
>> new file mode 100644
>> index 0000000..8b113df
>> --- /dev/null
>> +++ b/drivers/mtd/spi-nor/altera-quadspi.c
>> @@ -0,0 +1,568 @@
>> +/*
>> + * Copyright (C) 2014 Altera Corporation. All rights reserved
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/ioport.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/kernel.h>
>> +#include <linux/log2.h>
>> +#include <linux/module.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/mtd/spi-nor.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/sched.h>
>> +
>> +#define ALTERA_QUADSPI_RESOURCE_NAME                 "altera_quadspi"
>> +
>> +/* max possible slots for serial flash chip in the QUADSPI controller */
>> +#define MAX_NUM_FLASH_CHIP                           3
>> +
>> +#define EPCS_OPCODE_ID                                       1
>> +#define NON_EPCS_OPCODE_ID                           2
>> +
>> +#define WRITE_CHECK                                  1
>> +#define ERASE_CHECK                                  0
>> +
>> +/* Define max times to check status register before we give up. */
>> +#define QUADSPI_MAX_TIME_OUT                         (40 * HZ)
>> +
>> +/* defines for status register */
>> +#define QUADSPI_SR_REG                                       0x0
>> +#define QUADSPI_SR_WIP_MASK                          0x00000001
>> +#define QUADSPI_SR_WIP                                       0x1
>> +#define QUADSPI_SR_WEL                                       0x2
>> +#define QUADSPI_SR_BP0                                       0x4
>> +#define QUADSPI_SR_BP1                                       0x8
>> +#define QUADSPI_SR_BP2                                       0x10
>> +#define QUADSPI_SR_BP3                                       0x40
>> +#define QUADSPI_SR_TB                                        0x20
>> +#define QUADSPI_SR_MASK                                      0x0000000F
>> +
>> +/* defines for device id register */
>> +#define QUADSPI_SID_REG                                      0x4
>> +#define QUADSPI_RDID_REG                             0x8
>> +#define QUADSPI_ID_MASK                                      0x000000FF
>> +
>> +/*
>> + * QUADSPI_MEM_OP register offset
>> + *
>> + * The QUADSPI_MEM_OP register is used to do memory protect and erase operations
>> + *
>> + */
>> +#define QUADSPI_MEM_OP_REG                           0xC
>> +
>> +#define QUADSPI_MEM_OP_CMD_MASK                              0x00000003
>> +#define QUADSPI_MEM_OP_BULK_ERASE_CMD                        0x00000001
>> +#define QUADSPI_MEM_OP_SECTOR_ERASE_CMD                      0x00000002
>> +#define QUADSPI_MEM_OP_SECTOR_PROTECT_CMD            0x00000003
>> +#define QUADSPI_MEM_OP_SECTOR_VALUE_MASK             0x0003FF00
>> +#define QUADSPI_MEM_OP_SECTOR_PROTECT_VALUE_MASK     0x00001F00
>> +#define QUADSPI_MEM_OP_SECTOR_PROTECT_SHIFT          8
>> +/*
>> + * QUADSPI_ISR register offset
>> + *
>> + * The QUADSPI_ISR register is used to determine whether an invalid write or
>> + * erase operation trigerred an interrupt
>> + *
>> + */
>> +#define QUADSPI_ISR_REG                                      0x10
>> +
>> +#define QUADSPI_ISR_ILLEGAL_ERASE_MASK                       0x00000001
>> +#define QUADSPI_ISR_ILLEGAL_WRITE_MASK                       0x00000002
>> +
>> +/*
>> + * QUADSPI_IMR register offset
>> + *
>> + * The QUADSPI_IMR register is used to mask the invalid erase or the invalid
>> + * write interrupts.
>> + *
>> + */
>> +#define QUADSPI_IMR_REG                                      0x14
>> +#define QUADSPI_IMR_ILLEGAL_ERASE_MASK                       0x00000001
>> +
>> +#define QUADSPI_IMR_ILLEGAL_WRITE_MASK                       0x00000002
>> +
>> +#define QUADSPI_CHIP_SELECT_REG                              0x18
>> +#define QUADSPI_CHIP_SELECT_MASK                     0x00000007
>> +#define QUADSPI_CHIP_SELECT_0                                0x00000001
>> +#define QUADSPI_CHIP_SELECT_1                                0x00000002
>> +#define QUADSPI_CHIP_SELECT_2                                0x00000004
>> +
>> +struct altera_quadspi {
>> +     u32 opcode_id;
>> +     void __iomem *csr_base;
>> +     void __iomem *data_base;
>> +     u32 num_flashes;
>> +     struct device *dev;
>> +     struct altera_quadspi_flash *flash[MAX_NUM_FLASH_CHIP];
>> +     struct device_node *np[MAX_NUM_FLASH_CHIP];
>> +};
>> +
>> +struct altera_quadspi_flash {
>> +     struct mtd_info mtd;
>> +     struct spi_nor nor;
>> +     struct altera_quadspi *q;
>> +};
>> +
>> +struct flash_device {
>> +     char *name;
>> +     u32 opcode_id;
>> +     u32 device_id;
>> +};
>> +
>> +#define FLASH_ID(_n, _opcode_id, _id)        \
>> +{                                    \
>> +     .name = (_n),                   \
>> +     .opcode_id = (_opcode_id),      \
>> +     .device_id = (_id),             \
>> +}
>> +
>> +static struct flash_device flash_devices[] = {
>> +     FLASH_ID("epcs16",              EPCS_OPCODE_ID,     0x14),
>> +     FLASH_ID("epcs64",              EPCS_OPCODE_ID,     0x16),
>> +     FLASH_ID("epcs128",             EPCS_OPCODE_ID,     0x18),
>> +
>> +     FLASH_ID("epcq16",              NON_EPCS_OPCODE_ID, 0x15),
>> +     FLASH_ID("epcq32",              NON_EPCS_OPCODE_ID, 0x16),
>> +     FLASH_ID("epcq64",              NON_EPCS_OPCODE_ID, 0x17),
>> +     FLASH_ID("epcq128",             NON_EPCS_OPCODE_ID, 0x18),
>> +     FLASH_ID("epcq256",             NON_EPCS_OPCODE_ID, 0x19),
>> +     FLASH_ID("epcq512",             NON_EPCS_OPCODE_ID, 0x20),
>> +     FLASH_ID("epcq1024",            NON_EPCS_OPCODE_ID, 0x21),
>> +
>> +     FLASH_ID("epcql256",            NON_EPCS_OPCODE_ID, 0x19),
>> +     FLASH_ID("epcql512",            NON_EPCS_OPCODE_ID, 0x20),
>> +     FLASH_ID("epcql1024",           NON_EPCS_OPCODE_ID, 0x21),
>> +
>
> My complaints for this table start here:
>
>> +     FLASH_ID("n25q016-nonjedec",    NON_EPCS_OPCODE_ID, 0x15),
>> +     FLASH_ID("n25q032-nonjedec",    NON_EPCS_OPCODE_ID, 0x16),
>> +     FLASH_ID("n25q064-nonjedec",    NON_EPCS_OPCODE_ID, 0x17),
>> +     FLASH_ID("n25q128a13-nonjedec", NON_EPCS_OPCODE_ID, 0x18),
>> +     FLASH_ID("n25q128a11-nonjedec", NON_EPCS_OPCODE_ID, 0x18),
>> +     FLASH_ID("n25q256a-nonjedec",   NON_EPCS_OPCODE_ID, 0x19),
>> +     FLASH_ID("n25q256a11-nonjedec", NON_EPCS_OPCODE_ID, 0x19),
>> +     FLASH_ID("n25q512a-nonjedec",   NON_EPCS_OPCODE_ID, 0x20),
>> +     FLASH_ID("n25q512ax3-nonjedec", NON_EPCS_OPCODE_ID, 0x20),
>> +     FLASH_ID("mt25ql512-nonjedec",  NON_EPCS_OPCODE_ID, 0x20),
>> +     FLASH_ID("n25q00-nonjedec",     NON_EPCS_OPCODE_ID, 0x21),
>> +     FLASH_ID("n25q00a11-nonjedec",  NON_EPCS_OPCODE_ID, 0x21),
>> +
>
> There's next to zero chance that I'll let you duplicate the spi-nor.c
> table here locally. For Altera-specific parts that have funky
> identification schemes and (from what I can tell) are limited to use by
> this Altera SPI controller, maybe, but you've got to figure out
> something better for other commodity parts (e.g., from Micron).
>
> Anyway, it looks like you're just stealing the 3rd byte from the actual
> JEDEC ID string already found in spi-nor.c and the datasheets. Can your
> controller really not read the full ID string?
>

Yes, this controller really cant read the full ID string. I was very
unhappy when i know about this additional device support and its
limitation.

>> +};
>> +
>> +static int altera_quadspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *val,
>> +                                 int len, int wr_en)
>> +{
>> +     return 0;
>> +}
>> +
>> +static int altera_quadspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *val,
>> +                                int len)
>> +{
>> +     struct altera_quadspi_flash *flash = nor->priv;
>> +     struct altera_quadspi *q = flash->q;
>> +     u32 data = 0;
>> +
>> +     memset(val, 0, len);
>> +
>> +     switch (opcode) {
>> +     case SPINOR_OP_RDSR:
>> +             data = readl(q->csr_base + QUADSPI_SR_REG);
>> +             *val = (u8)data & QUADSPI_SR_MASK;
>> +             break;
>> +     case SPINOR_OP_RDID:
>> +             if (q->opcode_id == EPCS_OPCODE_ID)
>> +                     data = readl(q->csr_base + QUADSPI_SID_REG);
>> +             else
>> +                     data = readl(q->csr_base + QUADSPI_RDID_REG);
>> +
>> +             *val = (u8)data & QUADSPI_ID_MASK; /* device id */
>> +             break;
>> +     default:
>> +             *val = 0;
>> +             break;
>> +     }
>> +     return 0;
>> +}
>> +
>> +static int altera_quadspi_write_erase_check(struct spi_nor *nor,
>> +                                         bool write_erase)
>> +{
>> +     struct altera_quadspi_flash *flash = nor->priv;
>> +     struct altera_quadspi *q = flash->q;
>> +     u32 val;
>> +     u32 mask;
>> +
>> +     if (write_erase)
>> +             mask = QUADSPI_ISR_ILLEGAL_WRITE_MASK;
>> +     else
>> +             mask = QUADSPI_ISR_ILLEGAL_ERASE_MASK;
>> +
>> +     val = readl(q->csr_base + QUADSPI_ISR_REG);
>> +     if (val & mask) {
>> +             dev_err(nor->dev,
>> +                     "write/erase failed, sector might be protected\n");
>> +             /* clear this status for next use */
>> +             writel(val, q->csr_base + QUADSPI_ISR_REG);
>> +             return -EIO;
>> +     }
>> +     return 0;
>> +}
>> +
>> +static int altera_quadspi_addr_to_sector(struct mtd_info *mtd, uint64_t offset)
>> +{
>> +     if (mtd->erasesize_shift)
>> +             return offset >> mtd->erasesize_shift;
>> +     do_div(offset, mtd->erasesize);
>> +     return offset;
>> +}
>> +
>> +static int altera_quadspi_erase(struct spi_nor *nor, loff_t offset)
>> +{
>> +     struct altera_quadspi_flash *flash = nor->priv;
>> +     struct altera_quadspi *q = flash->q;
>> +     struct mtd_info *mtd = &flash->mtd;
>> +     u32 val;
>> +     int sector_value;
>> +
>> +     sector_value = altera_quadspi_addr_to_sector(mtd, offset);
>> +     /* sanity check that block_offset is a valid sector number */
>> +     if (sector_value < 0)
>> +             return -EINVAL;
>> +
>> +     /* sector value should occupy bits 17:8 */
>> +     val = (sector_value << 8) & QUADSPI_MEM_OP_SECTOR_VALUE_MASK;
>> +
>> +     /* sector erase commands occupies lower 2 bits */
>> +     val |= QUADSPI_MEM_OP_SECTOR_ERASE_CMD;
>> +
>> +     /* write sector erase command to QUADSPI_MEM_OP register */
>> +     writel(val, q->csr_base + QUADSPI_MEM_OP_REG);
>> +
>> +     return altera_quadspi_write_erase_check(nor, ERASE_CHECK);
>> +}
>> +
>> +static int altera_quadspi_read(struct spi_nor *nor, loff_t from, size_t len,
>> +                            size_t *retlen, u_char *buf)
>> +{
>> +     struct altera_quadspi_flash *flash = nor->priv;
>> +     struct altera_quadspi *q = flash->q;
>> +
>> +     memcpy_fromio(buf, q->data_base + from, len);
>> +     *retlen = len;
>> +
>> +     return 0;
>> +}
>> +
>> +static void altera_quadspi_write(struct spi_nor *nor, loff_t to, size_t len,
>> +                              size_t *retlen, const u_char *buf)
>> +{
>> +     struct altera_quadspi_flash *flash = nor->priv;
>> +     struct altera_quadspi *q = flash->q;
>> +
>> +     memcpy_toio(q->data_base + to, buf, len);
>> +     *retlen += len;
>> +
>> +     /* check whether write triggered a illegal write interrupt */
>> +     altera_quadspi_write_erase_check(nor, WRITE_CHECK);
>> +}
>> +
>> +static int altera_quadspi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>> +{
>> +     struct altera_quadspi_flash *flash = nor->priv;
>> +     struct altera_quadspi *q = flash->q;
>> +     struct mtd_info *mtd = &flash->mtd;
>> +     uint32_t offset = ofs;
>> +     u32 sector_start, sector_end;
>> +     uint64_t num_sectors;
>> +     u32 mem_op;
>> +     u32 sr_bp;
>> +     u32 sr_tb;
>> +
>> +     sector_start = offset;
>> +     sector_end = altera_quadspi_addr_to_sector(mtd, offset + len);
>> +     num_sectors = mtd->size;
>> +     do_div(num_sectors, mtd->erasesize);
>> +
>> +     dev_dbg(nor->dev, "%s: sector start is %u,sector end is %u\n",
>> +             __func__, sector_start, sector_end);
>> +
>> +     if (sector_start >= num_sectors / 2) {
>> +             sr_bp = fls(num_sectors - 1 - sector_start) + 1;
>> +             sr_tb = 0;
>> +     } else if ((sector_end < num_sectors / 2) &&
>> +               (q->opcode_id != EPCS_OPCODE_ID)) {
>> +             sr_bp = fls(sector_end) + 1;
>> +             sr_tb = 1;
>> +     } else {
>> +             sr_bp = 16;
>> +             sr_tb = 0;
>> +     }
>> +
>> +     mem_op = (sr_tb << 12) | (sr_bp << 8);
>> +     mem_op &= QUADSPI_MEM_OP_SECTOR_PROTECT_VALUE_MASK;
>> +     mem_op |= QUADSPI_MEM_OP_SECTOR_PROTECT_CMD;
>> +     writel(mem_op, q->csr_base + QUADSPI_MEM_OP_REG);
>> +
>> +     return 0;
>> +}
>> +
>> +static int altera_quadspi_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>> +{
>> +     struct altera_quadspi_flash *flash = nor->priv;
>> +     struct altera_quadspi *q = flash->q;
>> +     u32 mem_op;
>> +
>> +     dev_dbg(nor->dev, "Unlock all protected area\n");
>> +     mem_op = QUADSPI_MEM_OP_SECTOR_PROTECT_CMD;
>> +     writel(mem_op, q->csr_base + QUADSPI_MEM_OP_REG);
>> +
>> +     return 0;
>> +}
>> +
>> +static void altera_quadspi_chip_select(struct altera_quadspi *q, u32 bank)
>> +{
>> +     u32 val = 0;
>> +
>> +     switch (bank) {
>> +     case 0:
>> +             val = QUADSPI_CHIP_SELECT_0;
>> +             break;
>> +     case 1:
>> +             val = QUADSPI_CHIP_SELECT_1;
>> +             break;
>> +     case 2:
>> +             val = QUADSPI_CHIP_SELECT_2;
>> +             break;
>> +     default:
>> +             dev_err(q->dev, "invalid bank\n");
>> +             return;
>> +     }
>> +     writel(val, q->csr_base + QUADSPI_CHIP_SELECT_REG);
>> +}
>> +
>> +static int altera_quadspi_probe_config_dt(struct platform_device *pdev,
>> +                                       struct device_node *np,
>> +                                       struct altera_quadspi *q)
>> +{
>> +     struct device_node *pp;
>> +     struct resource *quadspi_res;
>> +     int i = 0;
>> +
>> +     quadspi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +                                                "avl_csr");
>> +     q->csr_base = devm_ioremap_resource(&pdev->dev, quadspi_res);
>> +     if (IS_ERR(q->csr_base)) {
>> +             dev_err(&pdev->dev, "%s: ERROR: failed to map csr base\n",
>> +                     __func__);
>> +             return PTR_ERR(q->csr_base);
>> +     }
>> +
>> +     quadspi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +                                                "avl_mem");
>> +     q->data_base = devm_ioremap_resource(&pdev->dev, quadspi_res);
>> +     if (IS_ERR(q->data_base)) {
>> +             dev_err(&pdev->dev, "%s: ERROR: failed to map data base\n",
>> +                     __func__);
>> +             return PTR_ERR(q->data_base);
>> +     }
>> +
>> +     /* Fill structs for each subnode (flash device) */
>> +     for_each_available_child_of_node(np, pp) {
>> +             /* Read bank id from DT */
>> +             q->np[i] = pp;
>> +             i++;
>> +     }
>> +     q->num_flashes = i;
>> +     return 0;
>> +}
>> +
>> +static int altera_quadspi_scan(struct spi_nor *nor, const char *name)
>> +{
>> +     struct altera_quadspi_flash *flash = nor->priv;
>> +     struct altera_quadspi *q = flash->q;
>> +     int index;
>> +     int ret;
>> +     u8 id = 0;
>> +
>> +     ret = nor->read_reg(nor, SPINOR_OP_RDID, &id, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     for (index = 0; index < ARRAY_SIZE(flash_devices); index++) {
>> +             if (flash_devices[index].device_id == id &&
>> +                 strcmp(name, flash_devices[index].name) == 0) {
>> +                     q->opcode_id = flash_devices[index].opcode_id;
>> +                     return 0;
>> +             }
>> +     }
>> +
>> +     /* Memory chip is not listed and not supported */
>> +     return -EINVAL;
>> +}
>> +
>> +static int altera_quadspi_setup_banks(struct platform_device *pdev,
>> +                                   u32 bank, struct device_node *np)
>> +{
>> +     struct altera_quadspi *q = platform_get_drvdata(pdev);
>> +     struct mtd_part_parser_data ppdata = {};
>> +     struct altera_quadspi_flash *flash;
>> +     struct spi_nor *nor;
>> +     int ret = 0;
>> +     char modalias[40];
>> +
>> +     if (bank > q->num_flashes - 1)
>> +             return -EINVAL;
>> +
>> +     altera_quadspi_chip_select(q, bank);
>> +
>> +     flash = devm_kzalloc(q->dev, sizeof(*flash), GFP_KERNEL);
>> +     if (!flash)
>> +             return -ENOMEM;
>> +
>> +     q->flash[bank] = flash;
>> +     nor = &flash->nor;
>> +     nor->mtd = &flash->mtd;
>> +     nor->dev = &pdev->dev;
>> +     nor->priv = flash;
>> +     flash->mtd.priv = nor;
>> +     flash->q = q;
>> +
>> +     /* spi nor framework*/
>> +     nor->read_reg = altera_quadspi_read_reg;
>> +     nor->write_reg = altera_quadspi_write_reg;
>> +     nor->read = altera_quadspi_read;
>> +     nor->write = altera_quadspi_write;
>> +     nor->erase = altera_quadspi_erase;
>> +     nor->flash_lock = altera_quadspi_lock;
>> +     nor->flash_unlock = altera_quadspi_unlock;
>> +
>> +     /* scanning flash and checking dev id */
>> +     if (of_modalias_node(np, modalias, sizeof(modalias)) < 0)
>> +             return -EINVAL;
>> +
>> +     ret = altera_quadspi_scan(nor, modalias);
>> +     if (ret) {
>> +             dev_err(nor->dev, "flash not found\n");
>> +             return ret;
>> +     }
>> +
>> +     ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ppdata.of_node = np;
>> +
>> +     return mtd_device_parse_register(&flash->mtd, NULL, &ppdata, NULL, 0);
>> +}
>> +
>> +static int altera_quadspi_probe(struct platform_device *pdev)
>> +{
>> +     struct device_node *np = pdev->dev.of_node;
>> +     struct device *dev = &pdev->dev;
>> +     struct altera_quadspi *q;
>> +     int ret = 0;
>> +     int i;
>> +
>> +     if (!np) {
>> +             dev_err(dev, "no device found\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>> +     if (!q)
>> +             return -ENOMEM;
>> +
>> +     ret = altera_quadspi_probe_config_dt(pdev, np, q);
>> +     if (ret) {
>> +             dev_err(dev, "probe device tree failed\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     q->dev = dev;
>> +
>> +     /* check number of flashes */
>> +     if (q->num_flashes > MAX_NUM_FLASH_CHIP) {
>> +             dev_err(dev, "exceeding max number of flashes\n");
>> +             q->num_flashes = MAX_NUM_FLASH_CHIP;
>> +     }
>> +
>> +     platform_set_drvdata(pdev, q);
>> +
>> +     /* loop for each serial flash which is connected to quadspi */
>> +     for (i = 0; i < q->num_flashes; i++) {
>> +             ret = altera_quadspi_setup_banks(pdev, i, q->np[i]);
>> +             if (ret) {
>> +                     dev_err(dev, "bank setup failed\n");
>> +                     return ret;
>
> Your error handling still really sucks here. If you succeed at probing
> the first flash, but fail at another, the driver probe fails, but you've
> still left one or more MTD registered. Is that intended?
>

>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int altera_quadspi_remove(struct platform_device *pdev)
>> +{
>> +     struct altera_quadspi *q = platform_get_drvdata(pdev);
>> +     struct altera_quadspi_flash *flash;
>> +     int i;
>> +     int ret = 0;
>> +
>> +     /* clean up for all nor flash */
>> +     for (i = 0; i < q->num_flashes; i++) {
>> +             flash = q->flash[i];
>> +             if (!flash)
>> +                     continue;
>> +
>> +             /* clean up mtd stuff */
>> +             ret = mtd_device_unregister(&flash->mtd);
>> +             if (ret) {
>> +                     dev_err(&pdev->dev, "error removing mtd\n");
>> +                     return ret;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct of_device_id altera_quadspi_id_table[] = {
>> +     { .compatible = "altr,quadspi-1.0" },
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(of, altera_quadspi_id_table);
>> +
>> +static struct platform_driver altera_quadspi_driver = {
>> +     .driver = {
>> +             .name = ALTERA_QUADSPI_RESOURCE_NAME,
>> +             .of_match_table = altera_quadspi_id_table,
>> +     },
>> +     .probe = altera_quadspi_probe,
>> +     .remove = altera_quadspi_remove,
>> +};
>> +module_platform_driver(altera_quadspi_driver);
>> +
>> +MODULE_AUTHOR("Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>");
>> +MODULE_DESCRIPTION("Altera QuadSPI Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 14a5d23..818ac01 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -687,6 +687,36 @@ static const struct spi_device_id spi_nor_ids[] = {
>>       { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>       { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>       { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +
>> +     /* Altera EPCQ/EPCS Flashes are non-JEDEC */
>> +     { "epcs16",   INFO(0, 0, 0x10000, 32,   0) },
>> +     { "epcs64",   INFO(0, 0, 0x10000, 128,  0) },
>> +     { "epcs128",  INFO(0, 0, 0x40000, 256,  0) },
>> +
>> +     { "epcq16",   INFO(0, 0, 0x10000, 32,   0) },
>> +     { "epcq32",   INFO(0, 0, 0x10000, 64,   0) },
>> +     { "epcq64",   INFO(0, 0, 0x10000, 128,  0) },
>> +     { "epcq128",  INFO(0, 0, 0x10000, 256,  0) },
>> +     { "epcq256",  INFO(0, 0, 0x10000, 512,  0) },
>> +     { "epcq512",  INFO(0, 0, 0x10000, 1024, 0) },
>> +     { "epcq1024", INFO(0, 0, 0x10000, 2048, 0) },
>> +
>> +     { "epcql256",  INFO(0, 0, 0x10000, 512,  0) },
>> +     { "epcql512",  INFO(0, 0, 0x10000, 1024, 0) },
>> +     { "epcql1024", INFO(0, 0, 0x10000, 2048, 0) },
>> +
>
> Starting here:
>
>> +     /* Micron non-JEDEC supported by Altera Quad SPI Controller */
>> +     { "n25q016-nonjedec",     INFO(0, 0, 64 * 1024,   32, 0) },
>> +     { "n25q032-nonjedec",     INFO(0, 0, 64 * 1024,   64, 0) },
>> +     { "n25q064-nonjedec",     INFO(0, 0, 64 * 1024,  128, 0) },
>> +     { "n25q128a13-nonjedec",  INFO(0, 0, 64 * 1024,  256, 0) },
>> +     { "n25q256a-nonjedec",    INFO(0, 0, 64 * 1024,  512, 0) },
>> +     { "n25q256a11-nonjedec",  INFO(0, 0, 64 * 1024,  512, 0) },
>> +     { "n25q512a-nonjedec",    INFO(0, 0, 64 * 1024, 1024, 0) },
>> +     { "n25q512ax3-nonjedec",  INFO(0, 0, 64 * 1024, 1024, 0) },
>> +     { "mt25ql512-nonjedec",   INFO(0, 0, 64 * 1024, 1024, 0) },
>> +     { "n25q00a11-nonjedec",   INFO(0, 0, 64 * 1024, 2048, 0) },
>
> Ending here: NAK, unless you can give a really good explanation of why.
>
>> +
>>       { },
>>  };
>>
>
> Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
