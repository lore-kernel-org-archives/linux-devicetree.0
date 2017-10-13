From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 2/2] mfd: Add Spreadtrum SC27xx series PMICs driver
Date: Fri, 13 Oct 2017 21:40:59 +0800
Message-ID: <CAMz4kuJxug3mS4FUhd=-+1kZgWTupBuDihp1R=xeU_bi8BzkXQ@mail.gmail.com>
References: <73965e7fb34d6a96529589cdf48e54e95ed666b8.1507723345.git.baolin.wang@spreadtrum.com>
 <9c80fb5606b7d9dbaf4873aed8a72c6bea0b9910.1507723345.git.baolin.wang@spreadtrum.com>
 <20171013092657.7zeddqbkpoh73ou4@dell> <CAMz4ku+EMtH8MU4-7Pm3gFDyn_0nXW_-LTRbh2n=NcrhRYikbg@mail.gmail.com>
 <20171013101343.klld4f7smqztbkss@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013101343.klld4f7smqztbkss@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On 13 October 2017 at 18:13, Lee Jones <lee.jones@linaro.org> wrote:
> On Fri, 13 Oct 2017, Baolin Wang wrote:
>> On 13 October 2017 at 17:26, Lee Jones <lee.jones@linaro.org> wrote:
>> > On Wed, 11 Oct 2017, Baolin Wang wrote:
>> >
>> >> This patch adds support for Spreadtrum SC27xx series PMIC MFD core, and It
>> >> provides communication through the SPI interfaces. The SC27xx series PMICs
>> >> contains the following 6 major components:
>> >> - DCDCs
>> >> - LDOs
>> >> - Battery management system
>> >> - Audio codec
>> >> - User interface function, such as indicator, flash LED
>> >> - IC level function, such as power on/off, type-c
>> >>
>> >> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
>> >> ---
>> >>  drivers/mfd/Kconfig           |   10 ++
>> >>  drivers/mfd/Makefile          |    1 +
>> >>  drivers/mfd/sprd-sc27xx-spi.c |  273 +++++++++++++++++++++++++++++++++++++++++
>> >>  3 files changed, 284 insertions(+)
>> >>  create mode 100644 drivers/mfd/sprd-sc27xx-spi.c
>> >>
>> >> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> >> index fc5e4fe..4753cd5 100644
>> >> --- a/drivers/mfd/Kconfig
>> >> +++ b/drivers/mfd/Kconfig
>> >> @@ -1057,6 +1057,16 @@ config MFD_SMSC
>> >>          To compile this driver as a module, choose M here: the
>> >>          module will be called smsc.
>> >>
>> >> +config MFD_SC27XX_PMIC
>> >> +     tristate "Spreadtrum SC27xx PMICs"
>> >> +     depends on ARCH_SPRD || COMPILE_TEST
>> >> +     depends on SPI_MASTER
>> >> +     select MFD_CORE
>> >> +     select REGMAP_SPI
>> >> +     select REGMAP_IRQ
>> >> +     help
>> >> +       This enables support for the Spreadtrum SC27xx PMICs.
>> >> +
>> >>  config ABX500_CORE
>> >>       bool "ST-Ericsson ABX500 Mixed Signal Circuit register functions"
>> >>       default y if ARCH_U300 || ARCH_U8500 || COMPILE_TEST
>> >> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> >> index c3d0a1b..a377e0f 100644
>> >> --- a/drivers/mfd/Makefile
>> >> +++ b/drivers/mfd/Makefile
>> >> @@ -226,3 +226,4 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)     += sun4i-gpadc.o
>> >>  obj-$(CONFIG_MFD_STM32_LPTIMER)      += stm32-lptimer.o
>> >>  obj-$(CONFIG_MFD_STM32_TIMERS)       += stm32-timers.o
>> >>  obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
>> >> +obj-$(CONFIG_MFD_SC27XX_PMIC)        += sprd-sc27xx-spi.o
>> >> diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
>> >> new file mode 100644
>> >> index 0000000..2b3f2bc
>> >> --- /dev/null
>> >> +++ b/drivers/mfd/sprd-sc27xx-spi.c
>> >> @@ -0,0 +1,273 @@
>> >> +/*
>> >> + * Copyright (C) 2017 Spreadtrum Communications Inc.
>> >> + *
>> >> + * This software is licensed under the terms of the GNU General Public
>> >> + * License version 2, as published by the Free Software Foundation, and
>> >> + * may be copied, distributed, and modified under those terms.
>> >> + *
>> >> + * This program is distributed in the hope that it will be useful,
>> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> >> + * GNU General Public License for more details.
>> >> + */
>
> [...]
>
>> >> +static int sprd_pmic_spi_read(void *context,
>> >> +                           const void *reg, size_t reg_size,
>> >> +                           void *val, size_t val_size)
>> >> +{
>> >> +     struct device *dev = context;
>> >> +     struct spi_device *spi = to_spi_device(dev);
>> >> +     u32 rx_buf[2] = { 0 };
>> >> +     int ret;
>> >> +
>> >> +     rx_buf[0] = *(u32 *)reg;
>> >> +     ret = spi_read(spi, rx_buf, 1);
>> >> +     if (ret < 0)
>> >> +             return ret;
>> >> +
>> >> +     memcpy(val, rx_buf, val_size);
>> >
>> > This looks like you're asking for trouble.
>> >
>> > What if val_size > sizeof(rx_buf)?
>> >
>> > You should probably check for that.
>>
>> Since we always read one register every time, which means the reg_size
>> and val_size are always 4. But it will be more helpful to check
>> incorrect parameters by adding one check here.
>>
>> >
>> >> +     return 0;
>> >> +}
>> >> +
>> >> +static struct regmap_bus sprd_pmic_regmap = {
>> >> +     .write = sprd_pmic_spi_write,
>> >> +     .read = sprd_pmic_spi_read,
>> >> +     .reg_format_endian_default = REGMAP_ENDIAN_NATIVE,
>> >> +     .val_format_endian_default = REGMAP_ENDIAN_NATIVE,
>> >> +};
>> >> +
>> >> +static const struct regmap_config sprd_pmic_config = {
>> >> +     .reg_bits = 32,
>> >> +     .val_bits = 32,
>> >> +     .reg_stride = 4,
>> >> +     .max_register = 0xffff,
>> >> +};
>> >> +
>> >> +static int sprd_pmic_probe(struct spi_device *spi)
>> >> +{
>> >> +     struct sprd_pmic *sprd_pmic;
>> >> +     const struct sprd_pmic_data *data;
>> >> +     int ret, i;
>> >> +
>> >> +     data = of_device_get_match_data(&spi->dev);
>> >> +     if (!data) {
>> >> +             dev_err(&spi->dev, "No matching driver data found\n");
>> >> +             return -EINVAL;
>> >> +     }
>> >> +
>> >> +     sprd_pmic = devm_kzalloc(&spi->dev, sizeof(*sprd_pmic), GFP_KERNEL);
>> >> +     if (!sprd_pmic)
>> >> +             return -ENOMEM;
>> >> +
>> >> +     sprd_pmic->regmap = devm_regmap_init(&spi->dev, &sprd_pmic_regmap,
>> >> +                                          &spi->dev, &sprd_pmic_config);
>> >> +     if (IS_ERR(sprd_pmic->regmap)) {
>> >> +             ret = PTR_ERR(sprd_pmic->regmap);
>> >> +             dev_err(&spi->dev, "Failed to allocate register map %d\n", ret);
>> >> +             return ret;
>> >> +     }
>> >> +
>> >> +     spi_set_drvdata(spi, sprd_pmic);
>> >> +     sprd_pmic->dev = &spi->dev;
>> >> +     sprd_pmic->irq = spi->irq;
>> >> +
>> >> +     sprd_pmic->irq_chip.name = dev_name(&spi->dev);
>> >> +     sprd_pmic->irq_chip.status_base =
>> >> +             data->irq_base + SPRD_PMIC_INT_MASK_STATUS;
>> >> +     sprd_pmic->irq_chip.mask_base = data->irq_base + SPRD_PMIC_INT_EN;
>> >> +     sprd_pmic->irq_chip.ack_base = 0;
>> >> +     sprd_pmic->irq_chip.num_regs = 1;
>> >> +     sprd_pmic->irq_chip.num_irqs = data->num_irqs;
>> >> +     sprd_pmic->irq_chip.mask_invert = true;
>> >> +
>> >> +     sprd_pmic->irqs = devm_kzalloc(&spi->dev, sizeof(struct regmap_irq) *
>> >> +                                    data->num_irqs, GFP_KERNEL);
>> >> +     if (!sprd_pmic->irqs)
>> >> +             return -ENOMEM;
>> >> +
>> >> +     sprd_pmic->irq_chip.irqs = sprd_pmic->irqs;
>> >> +     for (i = 0; i < data->num_irqs; i++) {
>> >> +             sprd_pmic->irqs[i].reg_offset = i / data->num_irqs;
>> >> +             sprd_pmic->irqs[i].mask = BIT(i % data->num_irqs);
>> >> +     }
>> >
>> > Why don't you do this live, instead of pre-calculating?
>>
>> Since the SC27xx series PMICs have different interrupts number (such
>> as SC2731 has 16 interrupts and SC2720 has 6 interrupts).
>
> Right, so save num_irqs in your device data structure.

Yes. I will add some doc to describe why we need 'sprd_pmic_data'
structure as match data for different PMICs in this SC27xx series.

-- 
Baolin.wang
Best Regards
