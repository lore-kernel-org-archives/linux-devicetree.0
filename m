From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Altera ASMI Parallel II IP Core
Date: Tue, 15 Aug 2017 22:08:50 +0200
Message-ID: <d3b174cc-69c8-41db-8d5d-79d9b4d7e517@wedev4u.fr>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1502043844-3626-3-git-send-email-matthew.gerlach@linux.intel.com>
 <e3c3f714-e8fd-a605-eb5a-c1b8a92ce0df@wedev4u.fr>
 <alpine.DEB.2.20.1708150841420.13425@mgerlach-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1708150841420.13425@mgerlach-VirtualBox>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 15/08/2017 à 19:20, matthew.gerlach@linux.intel.com a écrit :
> 
> Hi Cyrille,
> 
> Thanks for the great feedback.  See my comments inline.
> 
> Matthew Gerlach
> 
> On Fri, 11 Aug 2017, Cyrille Pitchen wrote:
> 
>> Hi Matthew,
>>
>> Le 06/08/2017 à 20:24, matthew.gerlach@linux.intel.com a écrit :
>>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>>
>>> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>> ---
>>>  MAINTAINERS                         |   7 +
>>>  drivers/mtd/spi-nor/Kconfig         |   6 +
>>>  drivers/mtd/spi-nor/Makefile        |   3 +-
>>>  drivers/mtd/spi-nor/altera-asmip2.c | 474
>>> ++++++++++++++++++++++++++++++++++++
>>>  include/linux/mtd/altera-asmip2.h   |  24 ++
>>>  5 files changed, 513 insertions(+), 1 deletion(-)
>>>  create mode 100644 drivers/mtd/spi-nor/altera-asmip2.c
>>>  create mode 100644 include/linux/mtd/altera-asmip2.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 672b5d5..9583c1a 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -644,6 +644,13 @@ ALPS PS/2 TOUCHPAD DRIVER
>>>  R:    Pali Rohár <pali.rohar@gmail.com>
>>>  F:    drivers/input/mouse/alps.*
>>>
>>> +ALTERA ASMI Parallel II Driver
>>> +M:      Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>> +L:      linux-mtd@lists.infradead.org
>>> +S:      Maintained
>>> +F:      drivers/mtd/spi-nor/altera-asmip2.c
>>> +F:      inclulde/linux/mtd/altera-asmip2.h
>>> +
>>>  ALTERA MAILBOX DRIVER
>>>  M:    Ley Foon Tan <lftan@altera.com>
>>>  L:    nios2-dev@lists.rocketboards.org (moderated for non-subscribers)
>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>>> index 69c638d..eb2c522 100644
>>> --- a/drivers/mtd/spi-nor/Kconfig
>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>> @@ -129,4 +129,10 @@ config SPI_STM32_QUADSPI
>>>        This enables support for the STM32 Quad SPI controller.
>>>        We only connect the NOR to this controller.
>>>
>>> +config SPI_ALTERA_ASMIP2
>>> +    tristate "Altera ASMI Parallel II IP"
>>> +    depends on OF && HAS_IOMEM
>>> +    help
>>> +      Enable support for Altera ASMI Parallel II.
>>> +
>>>  endif # MTD_SPI_NOR
>>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>>> index c5f171d..1c79324 100644
>>> --- a/drivers/mtd/spi-nor/Makefile
>>> +++ b/drivers/mtd/spi-nor/Makefile
>>> @@ -1,4 +1,5 @@
>>>  obj-$(CONFIG_MTD_SPI_NOR)    += spi-nor.o
>>> +obj-$(CONFIG_SPI_ALTERA_ASMIP2)    += altera-asmip2.o
>>>  obj-$(CONFIG_SPI_ASPEED_SMC)    += aspeed-smc.o
>>>  obj-$(CONFIG_SPI_ATMEL_QUADSPI)    += atmel-quadspi.o
>>>  obj-$(CONFIG_SPI_CADENCE_QUADSPI)    += cadence-quadspi.o
>>> @@ -9,4 +10,4 @@ obj-$(CONFIG_SPI_NXP_SPIFI)    += nxp-spifi.o
>>>  obj-$(CONFIG_SPI_INTEL_SPI)    += intel-spi.o
>>>  obj-$(CONFIG_SPI_INTEL_SPI_PCI)    += intel-spi-pci.o
>>>  obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)    += intel-spi-platform.o
>>> -obj-$(CONFIG_SPI_STM32_QUADSPI)    += stm32-quadspi.o
>>> \ No newline at end of file
>>> +obj-$(CONFIG_SPI_STM32_QUADSPI)    += stm32-quadspi.o
>>> diff --git a/drivers/mtd/spi-nor/altera-asmip2.c
>>> b/drivers/mtd/spi-nor/altera-asmip2.c
>>> new file mode 100644
>>> index 0000000..2095f2e
>>> --- /dev/null
>>> +++ b/drivers/mtd/spi-nor/altera-asmip2.c
>>> @@ -0,0 +1,474 @@
>>> +/*
>>> + * Copyright (C) 2017 Intel Corporation. All rights reserved.
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> modify it
>>> + * under the terms and conditions of the GNU General Public License,
>>> + * version 2, as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope it will be useful, but
>>> WITHOUT
>>> + * ANY WARRANTY; without even the implied warranty of
>>> MERCHANTABILITY or
>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
>>> License for
>>> + * more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> along with
>>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include <linux/iopoll.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mtd/altera-asmip2.h>
>>> +#include <linux/mtd/mtd.h>
>>> +#include <linux/mtd/spi-nor.h>
>>> +#include <linux/of_device.h>
>>> +
>>> +#define QSPI_ACTION_REG 0
>>> +#define QSPI_ACTION_RST BIT(0)
>>> +#define QSPI_ACTION_EN BIT(1)
>>> +#define QSPI_ACTION_SC BIT(2)
>>> +#define QSPI_ACTION_CHIP_SEL_SFT 4
>>> +#define QSPI_ACTION_DUMMY_SFT 8
>>> +#define QSPI_ACTION_READ_BACK_SFT 16
>>> +
>>> +#define QSPI_FIFO_CNT_REG 4
>>> +#define QSPI_FIFO_DEPTH 0x200
>>> +#define QSPI_FIFO_CNT_MSK 0x3ff
>>> +#define QSPI_FIFO_CNT_RX_SFT 0
>>> +#define QSPI_FIFO_CNT_TX_SFT 12
>>> +
>>> +#define QSPI_DATA_REG 0x8
>>> +
>>> +#define QSPI_POLL_TIMEOUT 10000000
>>> +#define QSPI_POLL_INTERVAL 5
>>> +
>>> +struct altera_asmip2 {
>>> +    void __iomem *csr_base;
>>> +    u32 num_flashes;
>>> +    struct device *dev;
>>> +    struct altera_asmip2_flash
>>> *flash[ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP];
>>> +    struct mutex bus_mutex;
>>> +};
>>> +
>>> +struct altera_asmip2_flash {
>>> +    struct spi_nor nor;
>>> +    struct altera_asmip2 *q;
>>> +    u32 bank;
>>> +};
>>> +
>>> +static int altera_asmip2_write_reg(struct spi_nor *nor, u8 opcode,
>>> u8 *val,
>>> +                    int len)
>>> +{
>>> +    struct altera_asmip2_flash *flash = nor->priv;
>>> +    struct altera_asmip2 *q = flash->q;
>>> +    u32 reg;
>>> +    int ret;
>>> +    int i;
>>> +
>>> +    if ((len + 1) > QSPI_FIFO_DEPTH) {
>>> +        dev_err(q->dev, "%s bad len %d > %d\n",
>>> +            __func__, len + 1, QSPI_FIFO_DEPTH);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    writel(opcode, q->csr_base + QSPI_DATA_REG);
>>> +
>>> +    for (i = 0; i < len; i++) {
>>> +        writel((u32)val[i], q->csr_base + QSPI_DATA_REG);
>>> +    }
>>> +
>>> +    reg = QSPI_ACTION_EN | QSPI_ACTION_SC;
>>> +
>>> +    writel(reg, q->csr_base + QSPI_ACTION_REG);
>>> +
>>> +    ret = readl_poll_timeout(q->csr_base + QSPI_FIFO_CNT_REG, reg,
>>> +                 (((reg >> QSPI_FIFO_CNT_TX_SFT) &
>>> +                 QSPI_FIFO_CNT_MSK) == 0), QSPI_POLL_INTERVAL,
>>> +                 QSPI_POLL_TIMEOUT);
>>> +    if (ret)
>>> +        dev_err(q->dev, "%s timed out\n", __func__);
>>> +
>>> +    reg = QSPI_ACTION_EN;
>>> +
>>> +    writel(reg, q->csr_base + QSPI_ACTION_REG);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int altera_asmip2_read_reg(struct spi_nor *nor, u8 opcode, u8
>>> *val,
>>> +                   int len)
>>> +{
>>> +    struct altera_asmip2_flash *flash = nor->priv;
>>> +    struct altera_asmip2 *q = flash->q;
>>> +    u32 reg;
>>> +    int ret;
>>> +    int i;
>>> +
>>> +    if (len > QSPI_FIFO_DEPTH) {
>>> +        dev_err(q->dev, "%s bad len %d > %d\n",
>>> +            __func__, len, QSPI_FIFO_DEPTH);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    writel(opcode, q->csr_base + QSPI_DATA_REG);
>>> +
>>> +    reg = QSPI_ACTION_EN | QSPI_ACTION_SC |
>>> +        (len << QSPI_ACTION_READ_BACK_SFT);
>>> +
>>> +    writel(reg, q->csr_base + QSPI_ACTION_REG);
>>> +
>>> +    ret = readl_poll_timeout(q->csr_base + QSPI_FIFO_CNT_REG, reg,
>>> +                 ((reg & QSPI_FIFO_CNT_MSK) == len),
>>> +                 QSPI_POLL_INTERVAL, QSPI_POLL_TIMEOUT);
>>> +
>>> +    if (!ret)
>>> +        for (i = 0; i < len; i++) {
>>> +            reg = readl(q->csr_base + QSPI_DATA_REG);
>>> +            val[i] = (u8)(reg & 0xff);
>>> +        }
>>> +    else
>>> +        dev_err(q->dev, "%s timeout\n", __func__);
>>> +
>>> +    writel(QSPI_ACTION_EN, q->csr_base + QSPI_ACTION_REG);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static ssize_t altera_asmip2_read(struct spi_nor *nor, loff_t from,
>>> size_t len,
>>> +                   u_char *buf)
>>> +{
>>> +    struct altera_asmip2_flash *flash = nor->priv;
>>> +    struct altera_asmip2 *q = flash->q;
>>> +    size_t bytes_to_read, i;
>>> +    u32 reg;
>>> +    int ret;
>>> +
>>> +    bytes_to_read = min_t(size_t, len, QSPI_FIFO_DEPTH);
>>> +
>>> +    writel(nor->read_opcode, q->csr_base + QSPI_DATA_REG);
>>> +
>>> +    writel((from & 0xff000000) >> 24, q->csr_base + QSPI_DATA_REG);
>>> +    writel((from & 0x00ff0000) >> 16, q->csr_base + QSPI_DATA_REG);
>>> +    writel((from & 0x0000ff00) >> 8, q->csr_base + QSPI_DATA_REG);
>>> +    writel((from & 0x000000ff), q->csr_base + QSPI_DATA_REG);
>>
>> Here it looks like you assume the address width is 32 bits. This is not
>> always the case, the address width is often 24 bits (almost always for
>> memory < 128Mib). Please check nor->addr_width to know the correct
>> number of address bytes to be used with the nor->read_opcode command.
> 
> I will be combining this suggestion with Marek's suggestion to use a for
> loop.
> 
>>
>>> +
>>> +    reg = QSPI_ACTION_EN | QSPI_ACTION_SC |
>>> +        (10 << QSPI_ACTION_DUMMY_SFT) |
>>
>> Here DUMMY_SFT suggests that you provide the number of dummy cycles to
>> be inserted between the address cycles and the data cycles.
>> If so, please fill this field based on nor->read_dummy: this is a number
>> of dummy CLOCK cycles. If you need to convert it into the number of byte
>> cycles you will have to take into account the number of I/O lines used
>> to transmit the address (+ dummy) clocks cycles:
>>
>> spi_nor_get_protocol_addr_nbits(nor->read_proto)
>>
>> This gives the 'y' in SPI x-y-z protocol. Should be 1, 2 or 4.
>>
>> Also could you tell us which SPI memory did you use to test your driver?
>> 10 is really strange as a number of dummy bytes or clock cycles
>> especially since this driver seems to support only Read (03h / 13h) and
>> Fast Read (0Bh / 0Ch) operations (see hwcaps below).
>>
>> Read doesn't use any dummy clock cycles whereas Fast Read uses 8 dummy
>> clock cycles for all SPI NOR memories I know.
> 
> 
> As it turns out, I tested this code with two Micron parts, "n25q00a" and
> "n25q512a".  To be honest, the formula for calculating dummy cycles is
> not clear to me.  This controller is instantiated in an fpga, and the fpga
> documentation states "The number of dummy cycles must be set to 12 for
> SPI flash operating in 3-byte addressing.  If the SPI flash operates
> in 4-byte addressing, the dummy cycles should be set to 4 for SPIx1 and
> 10 for SPIx4".
> 
> I'm not sure that (nor->read_dummy + spi_nor_get_protocol_addr_nbits())
> implements what is in the spec.
>

The number of dummy clock cycles to be inserted between address clock
cycles and data clock cycles is totally up to the SPI NOR memory. The
SPI controller has no other choice but to insert the exact number of
dummy clock cycles as expected by the memory.

You can find the number of dummy clock cycles in the *memory* datasheet.
Usually this number depends on the SPI x-y-z protocol used to read the
memory data.

x : number of I/O lines used during instruction op code clock cycles in
{0, 1, 2, 4, 8}. 0 for Continuous Read/XIP, when the instruction op code
is not sent at all: not supported by spi-nor, only relevant for XIP
application out of the scope of the MTD sub-system.

y : number of I/O lines used during address/mode/dummy clock cycles in
{1, 2, 4, 8}

z : number of I/O lines used during data clock cycles in {1, 2, 4, 8}.

Existing SPI x-y-z protocols respect the following patterns:
- (x <= y) && (y <= z)
- (x == y) || (y == z)

These are not formal rules but in practice all existing SPI protocols
match those patterns. Hence valid Quad SPI protocol are SPI 1-1-4, SPI
1-4-4 or SPI 4-4-4 (plus SPI 0-4-4 for Continuous Read/XIP).

The spi-nor.c driver doesn't enable the Micron Quad I/O mode which
forces the SPI 4-4-4 for ALL SPI commands. Micron Dual I/O mode is
neither used (it forces the SPI 2-2-2 protocols for ALL commands).

The spi-nor driver expects the Micron (or any SPI NOR) memory to still
be in its factory settings. For Micron, it means that neither the Quad
I/O nor the Dual I/O modes should be enabled.

Anyway, if one of those 2 modes were enabled before calling
spi_nor_scan(), this later function would fail to detect the Micron
memory since the Read JEDEC ID (9Fh) command is not supported by Micron
memories once in Quad or Dual I/O mode.

Read commands (03h / 13h) expect no dummy clock cycles whereas Fast Read
commands (0Bh / 0Ch) expect 8 dummy clock cycles, not 10.

10 dummy clock cycles are the Micron factory settings when you use some
SPI x-4-4 protocol, ie with address, mode and dummy sent on 4 I/O lines.
This won't be the case with this Altera driver since it claims to
support only Read (SPI 1-1-1) and Fast Read (SPI 1-1-1) operations.

The number of dummy clock cycles doesn't depend on whether we use a
3-byte address or a 4-byte address SPI command.


tl;dr

Your FPGA documentation seems to be all wrong, please just trust the
settings provided by the spi-nor.c driver and refer the *memory*
datasheet if the values chosen by spi-nor.c are not correct.

Also please refer to the m25p80_read() function in
drivers/mtd/device/m25p80.c to get the formula to convert the number of
dummy clock cycles ino the number of dummy bytes:

/* SPI x-y-z protocol */
u8 y = spi_not_get_protocol_addr_nbits(nor->read_proto);

/* nor->read_dummy is the number of dummy clock cycles */
unsigned int dummy_bytes = (nor->read_dummy * y) / 8;


Best regards,

Cyrille

>>
>>> +        (bytes_to_read << QSPI_ACTION_READ_BACK_SFT);
>>> +
>>> +    writel(reg, q->csr_base + QSPI_ACTION_REG);
>>> +
>>> +    ret = readl_poll_timeout(q->csr_base + QSPI_FIFO_CNT_REG, reg,
>>> +                 ((reg & QSPI_FIFO_CNT_MSK) ==
>>> +                 bytes_to_read), QSPI_POLL_INTERVAL,
>>> +                 QSPI_POLL_TIMEOUT);
>>> +    if (ret) {
>>> +        dev_err(q->dev, "%s timed out\n", __func__);
>>> +        bytes_to_read = 0;
>>> +    } else
>>> +        for (i = 0; i < bytes_to_read; i++) {
>>> +            reg = readl(q->csr_base + QSPI_DATA_REG);
>>> +            *buf++ = (u8)(reg & 0xff);
>>> +        }
>>> +
>>> +    writel(QSPI_ACTION_EN, q->csr_base + QSPI_ACTION_REG);
>>> +
>>> +    return bytes_to_read;
>>> +}
>>> +
>>> +static ssize_t altera_asmip2_write(struct spi_nor *nor, loff_t to,
>>> +                    size_t len, const u_char *buf)
>>> +{
>>> +    struct altera_asmip2_flash *flash = nor->priv;
>>> +    struct altera_asmip2 *q = flash->q;
>>> +    size_t bytes_to_write, i;
>>> +    u32 reg;
>>> +    int ret;
>>> +
>>> +    bytes_to_write = min_t(size_t, len, (QSPI_FIFO_DEPTH - 5));
>>> +
>>
>> not 5 but (1 + nor->addr_width)
>>
>>
>>> +    writel(nor->program_opcode, q->csr_base + QSPI_DATA_REG);
>>> +
>>> +    writel((to & 0xff000000) >> 24, q->csr_base + QSPI_DATA_REG);
>>> +    writel((to & 0x00ff0000) >> 16, q->csr_base + QSPI_DATA_REG);
>>> +    writel((to & 0x0000ff00) >> 8, q->csr_base + QSPI_DATA_REG);
>>> +    writel((to & 0x000000ff), q->csr_base + QSPI_DATA_REG);
>>
>> Same as for altera_asmip2_read()
>>> +
>>> +    for (i = 0; i < bytes_to_write; i++) {
>>> +        reg = (u32)*buf++;
>>> +        writel(reg, q->csr_base + QSPI_DATA_REG);
>>> +    }
>>> +
>>> +    reg = QSPI_ACTION_EN | QSPI_ACTION_SC;
>>> +
>>> +    writel(reg, q->csr_base + QSPI_ACTION_REG);
>>> +
>>> +    ret = readl_poll_timeout(q->csr_base + QSPI_FIFO_CNT_REG, reg,
>>> +                 (((reg >> QSPI_FIFO_CNT_TX_SFT) &
>>> +                 QSPI_FIFO_CNT_MSK) == 0), QSPI_POLL_INTERVAL,
>>> +                 QSPI_POLL_TIMEOUT);
>>> +
>>> +    if (ret) {
>>> +        dev_err(q->dev,
>>> +            "%s timed out waiting for fifo to clear\n",
>>> +            __func__);
>>> +        bytes_to_write = 0;
>>> +    }
>>> +
>>> +    writel(QSPI_ACTION_EN, q->csr_base + QSPI_ACTION_REG);
>>> +
>>> +    return bytes_to_write;
>>> +
>>> +}
>>> +
>>> +static int altera_asmip2_prep(struct spi_nor *nor, enum spi_nor_ops
>>> ops)
>>> +{
>>> +    struct altera_asmip2_flash *flash = nor->priv;
>>> +    struct altera_asmip2 *q = flash->q;
>>> +
>>> +    mutex_lock(&q->bus_mutex);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void altera_asmip2_unprep(struct spi_nor *nor, enum
>>> spi_nor_ops ops)
>>> +{
>>> +    struct altera_asmip2_flash *flash = nor->priv;
>>> +    struct altera_asmip2 *q = flash->q;
>>> +
>>> +    mutex_unlock(&q->bus_mutex);
>>> +}
>>> +
>>> +static int altera_asmip2_setup_banks(struct device *dev,
>>> +                      u32 bank, struct device_node *np)
>>> +{
>>> +    const struct spi_nor_hwcaps hwcaps = {
>>> +        .mask = SNOR_HWCAPS_READ |
>>> +            SNOR_HWCAPS_READ_FAST |
>>> +            SNOR_HWCAPS_PP,
>>> +    };
>>> +    struct altera_asmip2 *q = dev_get_drvdata(dev);
>>> +    struct altera_asmip2_flash *flash;
>>> +    struct spi_nor *nor;
>>> +    int ret = 0;
>>> +    char modalias[40] = {0};
>>> +
>>> +    if (bank > q->num_flashes - 1)
>>> +        return -EINVAL;
>>> +
>>> +    flash = devm_kzalloc(q->dev, sizeof(*flash), GFP_KERNEL);
>>> +    if (!flash)
>>> +        return -ENOMEM;
>>> +
>>> +    q->flash[bank] = flash;
>>> +    flash->q = q;
>>> +    flash->bank = bank;
>>> +
>>> +    nor = &flash->nor;
>>> +    nor->dev = dev;
>>> +    nor->priv = flash;
>>> +    nor->mtd.priv = nor;
>>> +    spi_nor_set_flash_node(nor, np);
>>> +
>>> +    /* spi nor framework*/
>>> +    nor->read_reg = altera_asmip2_read_reg;
>>> +    nor->write_reg = altera_asmip2_write_reg;
>>> +    nor->read = altera_asmip2_read;
>>> +    nor->write = altera_asmip2_write;
>>> +    nor->prepare = altera_asmip2_prep;
>>> +    nor->unprepare = altera_asmip2_unprep;
>>> +
>>> +    /* scanning flash and checking dev id */
>>> +#ifdef CONFIG_OF
>>> +    if (np && (of_modalias_node(np, modalias, sizeof(modalias)) < 0))
>>> +        return -EINVAL;
>>> +#endif
>>> +
>>> +    ret = spi_nor_scan(nor, modalias, &hwcaps);
>>
>> modalias is for legacy non-jedec SPI NOR memory support. Drop it and
>> pass NULL as the 2nd argument of spi_nor_scan() if possible. Unless you
>> really plan to use some old non-jedec SPI NOR memory?
> 
> I am more than happy to get rid of old legacy code.
> 
>>
>> All but m25p80.c driver pass NULL as the 2nd argument of spi_nor_scan().
>>
>> Best regards,
>>
>> Cyrille
>>
>>> +    if (ret) {
>>> +        dev_err(nor->dev, "flash not found\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret =  mtd_device_register(&nor->mtd, NULL, 0);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int altera_asmip2_create(struct device *dev, void __iomem
>>> *csr_base)
>>> +{
>>> +    struct altera_asmip2 *q;
>>> +    u32 reg;
>>> +
>>> +    q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>>> +    if (!q)
>>> +        return -ENOMEM;
>>> +
>>> +    q->dev = dev;
>>> +    q->csr_base = csr_base;
>>> +
>>> +    mutex_init(&q->bus_mutex);
>>> +
>>> +    dev_set_drvdata(dev, q);
>>> +
>>> +    reg = readl(q->csr_base + QSPI_ACTION_REG);
>>> +    if (!(reg & QSPI_ACTION_RST)) {
>>> +        writel((reg | QSPI_ACTION_RST), q->csr_base + QSPI_ACTION_REG);
>>> +        dev_info(dev, "%s asserting reset\n", __func__);
>>> +        udelay(10);
>>> +    }
>>> +
>>> +    writel((reg & ~QSPI_ACTION_RST), q->csr_base + QSPI_ACTION_REG);
>>> +    udelay(10);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int altera_qspi_add_bank(struct device *dev,
>>> +             u32 bank, struct device_node *np)
>>> +{
>>> +    struct altera_asmip2 *q = dev_get_drvdata(dev);
>>> +
>>> +    if (q->num_flashes >= ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP)
>>> +        return -ENOMEM;
>>> +
>>> +    q->num_flashes++;
>>> +
>>> +    return altera_asmip2_setup_banks(dev, bank, np);
>>> +}
>>> +
>>> +static int altera_asmip2_remove_banks(struct device *dev)
>>> +{
>>> +    struct altera_asmip2 *q = dev_get_drvdata(dev);
>>> +    struct altera_asmip2_flash *flash;
>>> +    int i;
>>> +    int ret = 0;
>>> +
>>> +    if (!q)
>>> +        return -EINVAL;
>>> +
>>> +    /* clean up for all nor flash */
>>> +    for (i = 0; i < q->num_flashes; i++) {
>>> +        flash = q->flash[i];
>>> +        if (!flash)
>>> +            continue;
>>> +
>>> +        /* clean up mtd stuff */
>>> +        ret = mtd_device_unregister(&flash->nor.mtd);
>>> +        if (ret) {
>>> +            dev_err(dev, "error removing mtd\n");
>>> +            return ret;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __probe_with_data(struct platform_device *pdev,
>>> +                 struct altera_asmip2_plat_data *qdata)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    int ret, i;
>>> +
>>> +    ret = altera_asmip2_create(dev, qdata->csr_base);
>>> +
>>> +    if (ret) {
>>> +        dev_err(dev, "failed to create qspi device %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    for (i = 0; i < qdata->num_chip_sel; i++) {
>>> +        ret = altera_qspi_add_bank(dev, i, NULL);
>>> +        if (ret) {
>>> +            dev_err(dev, "failed to add qspi bank %d\n", ret);
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int altera_asmip2_probe(struct platform_device *pdev)
>>> +{
>>> +    struct device_node *np = pdev->dev.of_node;
>>> +    struct device *dev = &pdev->dev;
>>> +    struct altera_asmip2_plat_data *qdata;
>>> +    struct resource *res;
>>> +    void __iomem *csr_base;
>>> +    u32 bank;
>>> +    int ret;
>>> +    struct device_node *pp;
>>> +
>>> +    qdata = dev_get_platdata(dev);
>>> +
>>> +    if (qdata)
>>> +        return __probe_with_data(pdev, qdata);
>>> +
>>> +    if (!np) {
>>> +        dev_err(dev, "no device tree found %p\n", pdev);
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    csr_base = devm_ioremap_resource(dev, res);
>>> +    if (IS_ERR(csr_base)) {
>>> +        dev_err(dev, "%s: ERROR: failed to map csr base\n", __func__);
>>> +        return PTR_ERR(csr_base);
>>> +    }
>>> +
>>> +    ret = altera_asmip2_create(dev, csr_base);
>>> +
>>> +    if (ret) {
>>> +        dev_err(dev, "failed to create qspi device\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    for_each_available_child_of_node(np, pp) {
>>> +        of_property_read_u32(pp, "reg", &bank);
>>> +        if (bank >= ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP) {
>>> +            dev_err(dev, "bad reg value %u >= %u\n", bank,
>>> +                ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP);
>>> +            goto error;
>>> +        }
>>> +
>>> +        if (altera_qspi_add_bank(dev, bank, pp)) {
>>> +            dev_err(dev, "failed to add bank %u\n", bank);
>>> +            goto error;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +error:
>>> +    altera_asmip2_remove_banks(dev);
>>> +    return -EIO;
>>> +}
>>> +
>>> +static int altera_asmip2_remove(struct platform_device *pdev)
>>> +{
>>> +    if (!pdev) {
>>> +        dev_err(&pdev->dev, "%s NULL\n", __func__);
>>> +        return -EINVAL;
>>> +    } else {
>>> +        return altera_asmip2_remove_banks(&pdev->dev);
>>> +    }
>>> +}
>>> +
>>> +static const struct of_device_id altera_asmip2_id_table[] = {
>>> +
>>> +    { .compatible = "altr,asmi_parallel2",},
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, altera_asmip2_id_table);
>>> +
>>> +static struct platform_driver altera_asmip2_driver = {
>>> +    .driver = {
>>> +        .name = ALTERA_ASMIP2_DRV_NAME,
>>> +        .of_match_table = altera_asmip2_id_table,
>>> +    },
>>> +    .probe = altera_asmip2_probe,
>>> +    .remove = altera_asmip2_remove,
>>> +};
>>> +module_platform_driver(altera_asmip2_driver);
>>> +
>>> +MODULE_AUTHOR("Matthew Gerlach <matthew.gerlach@linux.intel.com>");
>>> +MODULE_DESCRIPTION("Altera ASMI Parallel II");
>>> +MODULE_LICENSE("GPL v2");
>>> +MODULE_ALIAS("platform:" ALTERA_ASMIP2_DRV_NAME);
>>> diff --git a/include/linux/mtd/altera-asmip2.h
>>> b/include/linux/mtd/altera-asmip2.h
>>> new file mode 100644
>>> index 0000000..580c43c
>>> --- /dev/null
>>> +++ b/include/linux/mtd/altera-asmip2.h
>>> @@ -0,0 +1,24 @@
>>> +/*
>>> + *
>>> + * Copyright 2017 Intel Corporation, Inc.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + */
>>> +#ifndef __ALTERA_QUADSPI_H
>>> +#define __ALTERA_QUADSPI_H
>>> +
>>> +#include <linux/device.h>
>>> +
>>> +#define ALTERA_ASMIP2_DRV_NAME "altr-asmip2"
>>> +#define ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP 3
>>> +#define ALTERA_ASMIP2_RESOURCE_SIZE 0x10
>>> +
>>> +struct altera_asmip2_plat_data {
>>> +    void __iomem *csr_base;
>>> +    u32 num_chip_sel;
>>> +};
>>> +
>>> +#endif
>>>
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe linux-fpga" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
