Return-Path: <SRS0=ujMu=RS=google.com=tientzu@kernel.org>
MIME-Version: 1.0
References: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1552275991-34648-6-git-send-email-hsin-hsiung.wang@mediatek.com> <CANMq1KCg9Bm3OQpvfNw5ZiYfzApri_+Byatrtsf8O42W+ZYiXg@mail.gmail.com>
In-Reply-To: <CANMq1KCg9Bm3OQpvfNw5ZiYfzApri_+Byatrtsf8O42W+ZYiXg@mail.gmail.com>
From: Claire Chang <tientzu@google.com>
Date: Fri, 15 Mar 2019 15:25:49 +0800
Message-ID: <CALiNf2_wfhCuuEZOYtc5wiuG84SmLT9veVqLhT+5Sx_1AuhdHw@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] mfd: Add support for the MediaTek MT6358 PMIC
Content-Type: multipart/alternative; boundary="0000000000005f4d1805841cf3da"
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, tientzu@chromium.org, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>, srv_heupstream <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

--0000000000005f4d1805841cf3da
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 15, 2019 at 3:10 PM Nicolas Boichat <drinkcat@chromium.org>
wrote:

> +Claire Chang who found some issue with this patch.
>
> On Mon, Mar 11, 2019 at 11:48 AM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
> >
> > This adds support for the MediaTek MT6358 PMIC. This is a
> > multifunction device with the following sub modules:
> >
> > - Regulator
> > - RTC
> > - Codec
> > - Interrupt
> >
> > It is interfaced to the host controller using SPI interface
> > by a proprietary hardware called PMIC wrapper or pwrap.
> > MT6358 MFD is a child device of the pwrap.
> >
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/mfd/Makefile                 |    2 +-
> >  drivers/mfd/mt6358-irq.c             |  236 +++++
> >  drivers/mfd/mt6397-core.c            |   63 +-
> >  include/linux/mfd/mt6358/core.h      |  158 +++
> >  include/linux/mfd/mt6358/registers.h | 1926
> ++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/mt6397/core.h      |    3 +
> >  6 files changed, 2386 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/mfd/mt6358-irq.c
> >  create mode 100644 include/linux/mfd/mt6358/core.h
> >  create mode 100644 include/linux/mfd/mt6358/registers.h
> >
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 088e249..50be021 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -230,7 +230,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)        +=
> intel-soc-pmic.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)     += intel_soc_pmic_bxtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     += intel_soc_pmic_chtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  += intel_soc_pmic_chtdc_ti.o
> > -obj-$(CONFIG_MFD_MT6397)       += mt6397-core.o mt6397-irq.o
> > +obj-$(CONFIG_MFD_MT6397)       += mt6397-core.o mt6397-irq.o
> mt6358-irq.o
> >
> >  obj-$(CONFIG_MFD_ALTERA_A10SR) += altera-a10sr.o
> >  obj-$(CONFIG_MFD_SUN4I_GPADC)  += sun4i-gpadc.o
> > diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> > new file mode 100644
> > index 0000000..2941d87
> > --- /dev/null
> > +++ b/drivers/mfd/mt6358-irq.c
> > @@ -0,0 +1,236 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (c) 2019 MediaTek Inc.
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/mfd/mt6358/core.h>
> > +#include <linux/mfd/mt6358/registers.h>
> > +#include <linux/mfd/mt6397/core.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +static struct irq_top_t mt6358_ints[] = {
> > +       MT6358_TOP_GEN(BUCK),
> > +       MT6358_TOP_GEN(LDO),
> > +       MT6358_TOP_GEN(PSC),
> > +       MT6358_TOP_GEN(SCK),
> > +       MT6358_TOP_GEN(BM),
> > +       MT6358_TOP_GEN(HK),
> > +       MT6358_TOP_GEN(AUD),
> > +       MT6358_TOP_GEN(MISC),
> > +};
> > +
> > +static int parsing_hwirq_to_top_group(unsigned int hwirq)
> > +{
> > +       int top_group;
> > +
> > +       for (top_group = 1; top_group < ARRAY_SIZE(mt6358_ints);
> top_group++) {
> > +               if (mt6358_ints[top_group].hwirq_base > hwirq) {
> > +                       top_group--;
> > +                       break;
> > +               }
> > +       }
> > +       return top_group;
> > +}
> > +
> > +static void pmic_irq_enable(struct irq_data *data)
> > +{
> > +       unsigned int hwirq = irqd_to_hwirq(data);
> > +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> > +       struct pmic_irq_data *irqd = chip->irq_data;
> > +
> > +       irqd->enable_hwirq[hwirq] = true;
> > +}
> > +
> > +static void pmic_irq_disable(struct irq_data *data)
> > +{
> > +       unsigned int hwirq = irqd_to_hwirq(data);
> > +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> > +       struct pmic_irq_data *irqd = chip->irq_data;
> > +
> > +       irqd->enable_hwirq[hwirq] = false;
> > +}
> > +
> > +static void pmic_irq_lock(struct irq_data *data)
> > +{
> > +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> > +
> > +       mutex_lock(&chip->irqlock);
> > +}
> > +
> > +static void pmic_irq_sync_unlock(struct irq_data *data)
> > +{
> > +       unsigned int i, top_gp, en_reg, int_regs, shift;
> > +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> > +       struct pmic_irq_data *irqd = chip->irq_data;
> > +
> > +       for (i = 0; i < irqd->num_pmic_irqs; i++) {
> > +               if (irqd->enable_hwirq[i] ==
> > +                               irqd->cache_hwirq[i])
> > +                       continue;
> > +
> > +               top_gp = parsing_hwirq_to_top_group(i);
> > +               int_regs = mt6358_ints[top_gp].num_int_bits /
> MT6358_REG_WIDTH;
> > +               en_reg = mt6358_ints[top_gp].en_reg +
> > +                       mt6358_ints[top_gp].en_reg_shift * int_regs;
> > +               shift = (i - mt6358_ints[top_gp].hwirq_base) %
> MT6358_REG_WIDTH;
> > +               regmap_update_bits(chip->regmap, en_reg, BIT(shift),
> > +                                  irqd->enable_hwirq[i] << shift);
> > +               irqd->cache_hwirq[i] = irqd->enable_hwirq[i];
> > +       }
> > +       mutex_unlock(&chip->irqlock);
> > +}
> > +
> > +static int pmic_irq_set_type(struct irq_data *data, unsigned int type)
> > +{
> > +       return 0;
> > +}
> > +
> > +static struct irq_chip mt6358_irq_chip = {
> > +       .name = "mt6358-irq",
> > +       .irq_enable = pmic_irq_enable,
> > +       .irq_disable = pmic_irq_disable,
> > +       .irq_bus_lock = pmic_irq_lock,
> > +       .irq_bus_sync_unlock = pmic_irq_sync_unlock,
> > +       .irq_set_type = pmic_irq_set_type,
> > +};
>
Should we also add .irq_set_wake just like mt6397-irq.c?
Without .irq_set_wake, we will have unbalanced IRQ wake disable issue
during suspend/resume.

> > +
> > +static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
> > +                                 unsigned int top_gp)
> > +{
> > +       unsigned int sta_reg, irq_status;
> > +       unsigned int hwirq, virq;
> > +       int ret, i, j;
> > +
> > +       for (i = 0; i < mt6358_ints[top_gp].num_int_regs; i++) {
> > +               sta_reg = mt6358_ints[top_gp].sta_reg +
> > +                       mt6358_ints[top_gp].sta_reg_shift * i;
> > +               ret = regmap_read(chip->regmap, sta_reg, &irq_status);
> > +               if (ret) {
> > +                       dev_err(chip->dev,
> > +                               "Failed to read irq status: %d\n", ret);
> > +                       return;
> > +               }
> > +
> > +               if (!irq_status)
> > +                       continue;
> > +
> > +               for (j = 0; j < MT6358_REG_WIDTH ; j++) {
> > +                       if ((irq_status & BIT(j)) == 0)
> > +                               continue;
> > +                       hwirq = mt6358_ints[top_gp].hwirq_base +
> > +                               MT6358_REG_WIDTH * i + j;
> > +                       virq = irq_find_mapping(chip->irq_domain, hwirq);
> > +                       if (virq)
> > +                               handle_nested_irq(virq);
> > +               }
> > +
> > +               regmap_write(chip->regmap, sta_reg, irq_status);
> > +       }
> > +}
> > +
> > +static irqreturn_t mt6358_irq_handler(int irq, void *data)
> > +{
> > +       struct mt6397_chip *chip = data;
> > +       struct pmic_irq_data *mt6358_irq_data = chip->irq_data;
> > +       unsigned int top_irq_status;
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       ret = regmap_read(chip->regmap,
> > +                         mt6358_irq_data->top_int_status_reg,
> > +                         &top_irq_status);
> > +       if (ret) {
> > +               dev_err(chip->dev, "Can't read TOP_INT_STATUS ret=%d\n",
> ret);
> > +               return IRQ_NONE;
> > +       }
> > +
> > +       for (i = 0; i < mt6358_irq_data->num_top; i++) {
> > +               if (top_irq_status & BIT(mt6358_ints[i].top_offset))
> > +                       mt6358_irq_sp_handler(chip, i);
> > +       }
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int pmic_irq_domain_map(struct irq_domain *d, unsigned int irq,
> > +                              irq_hw_number_t hw)
> > +{
> > +       struct mt6397_chip *mt6397 = d->host_data;
> > +
> > +       irq_set_chip_data(irq, mt6397);
> > +       irq_set_chip_and_handler(irq, &mt6358_irq_chip,
> handle_level_irq);
> > +       irq_set_nested_thread(irq, 1);
> > +       irq_set_noprobe(irq);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct irq_domain_ops mt6358_irq_domain_ops = {
> > +       .map = pmic_irq_domain_map,
> > +       .xlate = irq_domain_xlate_twocell,
> > +};
> > +
> > +int mt6358_irq_init(struct mt6397_chip *chip)
> > +{
> > +       int i, j, ret;
> > +       struct pmic_irq_data *irqd;
> > +
> > +       irqd = devm_kzalloc(chip->dev, sizeof(struct pmic_irq_data *),
> > +                           GFP_KERNEL);
> > +       if (!irqd)
> > +               return -ENOMEM;
> > +
> > +       chip->irq_data = irqd;
> > +
> > +       mutex_init(&chip->irqlock);
> > +       irqd->top_int_status_reg = MT6358_TOP_INT_STATUS0;
> > +       irqd->num_pmic_irqs = MT6358_IRQ_NR;
> > +       irqd->num_top = ARRAY_SIZE(mt6358_ints);
> > +
> > +       irqd->enable_hwirq = devm_kcalloc(chip->dev,
> > +                                         irqd->num_pmic_irqs,
> > +                                         sizeof(bool),
> > +                                         GFP_KERNEL);
> > +       if (!irqd->enable_hwirq)
> > +               return -ENOMEM;
> > +
> > +       irqd->cache_hwirq = devm_kcalloc(chip->dev,
> > +                                        irqd->num_pmic_irqs,
> > +                                        sizeof(bool),
> > +                                        GFP_KERNEL);
> > +       if (!irqd->cache_hwirq)
> > +               return -ENOMEM;
> > +
> > +       /* Disable all interrupt for initializing */
> > +       for (i = 0; i < irqd->num_top; i++) {
> > +               for (j = 0; j < mt6358_ints[i].num_int_regs; j++)
> > +                       regmap_write(chip->regmap,
> > +                                    mt6358_ints[i].en_reg +
> > +                                    mt6358_ints[i].en_reg_shift * j, 0);
> > +       }
> > +
> > +       chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
> > +                                                irqd->num_pmic_irqs,
> > +                                                &mt6358_irq_domain_ops,
> chip);
> > +       if (!chip->irq_domain) {
> > +               dev_err(chip->dev, "could not create irq domain\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
> > +                                       mt6358_irq_handler, IRQF_ONESHOT,
> > +                                       mt6358_irq_chip.name, chip);
> > +       if (ret) {
> > +               dev_err(chip->dev, "failed to register irq=%d; err:
> %d\n",
> > +                       chip->irq, ret);
> > +               return ret;
> > +       }
> > +
> > +       enable_irq_wake(chip->irq);
> > +       return ret;
> > +}
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index 53f1edc..9ef14f9 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -18,12 +18,36 @@
> >  #include <linux/regmap.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/mfd/mt6323/core.h>
> > +#include <linux/mfd/mt6358/core.h>
> >  #include <linux/mfd/mt6397/core.h>
> >  #include <linux/mfd/mt6323/registers.h>
> > +#include <linux/mfd/mt6358/registers.h>
> >  #include <linux/mfd/mt6397/registers.h>
> >
> > +#define MT6358_RTC_BASE                0x0588
> > +#define MT6358_RTC_SIZE                0x3c
> > +#define MT6358_RTC_WRTGR_OFFSET        0x3a
> >  #define MT6397_RTC_BASE                0xe000
> >  #define MT6397_RTC_SIZE                0x3e
> > +#define MT6397_RTC_WRTGR_OFFSET        0x3c
> > +
> > +static const struct resource mt6358_rtc_resources[] = {
> > +       {
> > +               .start = MT6358_RTC_BASE,
> > +               .end   = MT6358_RTC_BASE + MT6358_RTC_SIZE,
> > +               .flags = IORESOURCE_MEM,
> > +       },
> > +       {
> > +               .start = MT6358_IRQ_RTC,
> > +               .end   = MT6358_IRQ_RTC,
> > +               .flags = IORESOURCE_IRQ,
> > +       },
> > +       {
> > +               .start = MT6358_RTC_WRTGR_OFFSET,
> > +               .end   = MT6358_RTC_WRTGR_OFFSET,
> > +               .flags = IORESOURCE_REG,
> > +       },
> > +};
> >
> >  static const struct resource mt6397_rtc_resources[] = {
> >         {
> > @@ -36,6 +60,11 @@
> >                 .end   = MT6397_IRQ_RTC,
> >                 .flags = IORESOURCE_IRQ,
> >         },
> > +       {
> > +               .start = MT6397_RTC_WRTGR_OFFSET,
> > +               .end   = MT6397_RTC_WRTGR_OFFSET,
> > +               .flags = IORESOURCE_REG,
> > +       },
> >  };
> >
> >  static const struct resource mt6323_keys_resources[] = {
> > @@ -63,6 +92,21 @@
> >         },
> >  };
> >
> > +static const struct mfd_cell mt6358_devs[] = {
> > +       {
> > +               .name = "mt6358-regulator",
> > +               .of_compatible = "mediatek,mt6358-regulator"
> > +       }, {
> > +               .name = "mt6397-rtc",
> > +               .num_resources = ARRAY_SIZE(mt6358_rtc_resources),
> > +               .resources = mt6358_rtc_resources,
> > +               .of_compatible = "mediatek,mt6358-rtc",
> > +       }, {
> > +               .name = "mt6358-sound",
> > +               .of_compatible = "mediatek,mt6358-sound"
> > +       },
> > +};
> > +
> >  static const struct mfd_cell mt6397_devs[] = {
> >         {
> >                 .name = "mt6397-rtc",
> > @@ -97,6 +141,10 @@ struct chip_data {
> >         .cid_addr = MT6323_CID,
> >  };
> >
> > +static const struct chip_data mt6358_core = {
> > +       .cid_addr = MT6358_SWCID,
> > +};
> > +
> >  static const struct chip_data mt6397_core = {
> >         .cid_addr = MT6397_CID,
> >  };
> > @@ -140,7 +188,11 @@ static int mt6397_probe(struct platform_device
> *pdev)
> >         if (pmic->irq <= 0)
> >                 return pmic->irq;
> >
> > -       ret = mt6397_irq_init(pmic);
> > +       if (pmic->chip_id == MT6358_CHIP_ID)
> > +               ret = mt6358_irq_init(pmic);
> > +       else
> > +               ret = mt6397_irq_init(pmic);
> > +
> >         if (ret)
> >                 return ret;
> >
> > @@ -151,6 +203,12 @@ static int mt6397_probe(struct platform_device
> *pdev)
> >                                            0, pmic->irq_domain);
> >                 break;
> >
> > +       case MT6358_CHIP_ID:
> > +               ret = devm_mfd_add_devices(&pdev->dev, -1, mt6358_devs,
> > +                                          ARRAY_SIZE(mt6358_devs), NULL,
> > +                                          0, pmic->irq_domain);
> > +               break;
> > +
> >         case MT6391_CHIP_ID:
> >         case MT6397_CHIP_ID:
> >                 ret = devm_mfd_add_devices(&pdev->dev, -1, mt6397_devs,
> > @@ -177,6 +235,9 @@ static int mt6397_probe(struct platform_device *pdev)
> >                 .compatible = "mediatek,mt6323",
> >                 .data = &mt6323_core,
> >         }, {
> > +               .compatible = "mediatek,mt6358",
> > +               .data = &mt6358_core,
> > +       }, {
> >                 .compatible = "mediatek,mt6397",
> >                 .data = &mt6397_core,
> >         }, {
> > diff --git a/include/linux/mfd/mt6358/core.h
> b/include/linux/mfd/mt6358/core.h
> > new file mode 100644
> > index 0000000..ce9e08a
> > --- /dev/null
> > +++ b/include/linux/mfd/mt6358/core.h
> > @@ -0,0 +1,158 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + */
> > +
> > +#ifndef __MFD_MT6358_CORE_H__
> > +#define __MFD_MT6358_CORE_H__
> > +
> > +#define MT6358_REG_WIDTH 16
> > +
> > +struct irq_top_t {
> > +       int hwirq_base;
> > +       unsigned int num_int_regs;
> > +       unsigned int num_int_bits;
> > +       unsigned int en_reg;
> > +       unsigned int en_reg_shift;
> > +       unsigned int sta_reg;
> > +       unsigned int sta_reg_shift;
> > +       unsigned int top_offset;
> > +};
> > +
> > +struct pmic_irq_data {
> > +       unsigned int num_top;
> > +       unsigned int num_pmic_irqs;
> > +       unsigned short top_int_status_reg;
> > +       bool *enable_hwirq;
> > +       bool *cache_hwirq;
> > +};
> > +
> > +enum mt6358_irq_top_status_shift {
> > +       MT6358_BUCK_TOP = 0,
> > +       MT6358_LDO_TOP,
> > +       MT6358_PSC_TOP,
> > +       MT6358_SCK_TOP,
> > +       MT6358_BM_TOP,
> > +       MT6358_HK_TOP,
> > +       MT6358_AUD_TOP,
> > +       MT6358_MISC_TOP,
> > +};
> > +
> > +enum mt6358_irq_numbers {
> > +       MT6358_IRQ_VPROC11_OC = 0,
> > +       MT6358_IRQ_VPROC12_OC,
> > +       MT6358_IRQ_VCORE_OC,
> > +       MT6358_IRQ_VGPU_OC,
> > +       MT6358_IRQ_VMODEM_OC,
> > +       MT6358_IRQ_VDRAM1_OC,
> > +       MT6358_IRQ_VS1_OC,
> > +       MT6358_IRQ_VS2_OC,
> > +       MT6358_IRQ_VPA_OC,
> > +       MT6358_IRQ_VCORE_PREOC,
> > +       MT6358_IRQ_VFE28_OC = 16,
> > +       MT6358_IRQ_VXO22_OC,
> > +       MT6358_IRQ_VRF18_OC,
> > +       MT6358_IRQ_VRF12_OC,
> > +       MT6358_IRQ_VEFUSE_OC,
> > +       MT6358_IRQ_VCN33_OC,
> > +       MT6358_IRQ_VCN28_OC,
> > +       MT6358_IRQ_VCN18_OC,
> > +       MT6358_IRQ_VCAMA1_OC,
> > +       MT6358_IRQ_VCAMA2_OC,
> > +       MT6358_IRQ_VCAMD_OC,
> > +       MT6358_IRQ_VCAMIO_OC,
> > +       MT6358_IRQ_VLDO28_OC,
> > +       MT6358_IRQ_VA12_OC,
> > +       MT6358_IRQ_VAUX18_OC,
> > +       MT6358_IRQ_VAUD28_OC,
> > +       MT6358_IRQ_VIO28_OC,
> > +       MT6358_IRQ_VIO18_OC,
> > +       MT6358_IRQ_VSRAM_PROC11_OC,
> > +       MT6358_IRQ_VSRAM_PROC12_OC,
> > +       MT6358_IRQ_VSRAM_OTHERS_OC,
> > +       MT6358_IRQ_VSRAM_GPU_OC,
> > +       MT6358_IRQ_VDRAM2_OC,
> > +       MT6358_IRQ_VMC_OC,
> > +       MT6358_IRQ_VMCH_OC,
> > +       MT6358_IRQ_VEMC_OC,
> > +       MT6358_IRQ_VSIM1_OC,
> > +       MT6358_IRQ_VSIM2_OC,
> > +       MT6358_IRQ_VIBR_OC,
> > +       MT6358_IRQ_VUSB_OC,
> > +       MT6358_IRQ_VBIF28_OC,
> > +       MT6358_IRQ_PWRKEY = 48,
> > +       MT6358_IRQ_HOMEKEY,
> > +       MT6358_IRQ_PWRKEY_R,
> > +       MT6358_IRQ_HOMEKEY_R,
> > +       MT6358_IRQ_NI_LBAT_INT,
> > +       MT6358_IRQ_CHRDET,
> > +       MT6358_IRQ_CHRDET_EDGE,
> > +       MT6358_IRQ_VCDT_HV_DET,
> > +       MT6358_IRQ_RTC = 64,
> > +       MT6358_IRQ_FG_BAT0_H = 80,
> > +       MT6358_IRQ_FG_BAT0_L,
> > +       MT6358_IRQ_FG_CUR_H,
> > +       MT6358_IRQ_FG_CUR_L,
> > +       MT6358_IRQ_FG_ZCV,
> > +       MT6358_IRQ_FG_BAT1_H,
> > +       MT6358_IRQ_FG_BAT1_L,
> > +       MT6358_IRQ_FG_N_CHARGE_L,
> > +       MT6358_IRQ_FG_IAVG_H,
> > +       MT6358_IRQ_FG_IAVG_L,
> > +       MT6358_IRQ_FG_TIME_H,
> > +       MT6358_IRQ_FG_DISCHARGE,
> > +       MT6358_IRQ_FG_CHARGE,
> > +       MT6358_IRQ_BATON_LV = 96,
> > +       MT6358_IRQ_BATON_HT,
> > +       MT6358_IRQ_BATON_BAT_IN,
> > +       MT6358_IRQ_BATON_BAT_OUT,
> > +       MT6358_IRQ_BIF,
> > +       MT6358_IRQ_BAT_H = 112,
> > +       MT6358_IRQ_BAT_L,
> > +       MT6358_IRQ_BAT2_H,
> > +       MT6358_IRQ_BAT2_L,
> > +       MT6358_IRQ_BAT_TEMP_H,
> > +       MT6358_IRQ_BAT_TEMP_L,
> > +       MT6358_IRQ_AUXADC_IMP,
> > +       MT6358_IRQ_NAG_C_DLTV,
> > +       MT6358_IRQ_AUDIO = 128,
> > +       MT6358_IRQ_ACCDET = 133,
> > +       MT6358_IRQ_ACCDET_EINT0,
> > +       MT6358_IRQ_ACCDET_EINT1,
> > +       MT6358_IRQ_SPI_CMD_ALERT = 144,
> > +       MT6358_IRQ_NR,
> > +};
> > +
> > +#define MT6358_IRQ_BUCK_BASE MT6358_IRQ_VPROC11_OC
> > +#define MT6358_IRQ_LDO_BASE MT6358_IRQ_VFE28_OC
> > +#define MT6358_IRQ_PSC_BASE MT6358_IRQ_PWRKEY
> > +#define MT6358_IRQ_SCK_BASE MT6358_IRQ_RTC
> > +#define MT6358_IRQ_BM_BASE MT6358_IRQ_FG_BAT0_H
> > +#define MT6358_IRQ_HK_BASE MT6358_IRQ_BAT_H
> > +#define MT6358_IRQ_AUD_BASE MT6358_IRQ_AUDIO
> > +#define MT6358_IRQ_MISC_BASE MT6358_IRQ_SPI_CMD_ALERT
> > +
> > +#define MT6358_IRQ_BUCK_BITS (MT6358_IRQ_VCORE_PREOC -
> MT6358_IRQ_BUCK_BASE + 1)
> > +#define MT6358_IRQ_LDO_BITS (MT6358_IRQ_VBIF28_OC - MT6358_IRQ_LDO_BASE
> + 1)
> > +#define MT6358_IRQ_PSC_BITS (MT6358_IRQ_VCDT_HV_DET -
> MT6358_IRQ_PSC_BASE + 1)
> > +#define MT6358_IRQ_SCK_BITS (MT6358_IRQ_RTC - MT6358_IRQ_SCK_BASE + 1)
> > +#define MT6358_IRQ_BM_BITS (MT6358_IRQ_BIF - MT6358_IRQ_BM_BASE + 1)
> > +#define MT6358_IRQ_HK_BITS (MT6358_IRQ_NAG_C_DLTV - MT6358_IRQ_HK_BASE
> + 1)
> > +#define MT6358_IRQ_AUD_BITS (MT6358_IRQ_ACCDET_EINT1 -
> MT6358_IRQ_AUD_BASE + 1)
> > +#define MT6358_IRQ_MISC_BITS   \
> > +       (MT6358_IRQ_SPI_CMD_ALERT - MT6358_IRQ_MISC_BASE + 1)
> > +
> > +#define MT6358_TOP_GEN(sp)     \
> > +{      \
> > +       .hwirq_base = MT6358_IRQ_##sp##_BASE,   \
> > +       .num_int_regs = \
> > +               (MT6358_IRQ_##sp##_BITS / MT6358_REG_WIDTH) + 1,        \
> > +       .num_int_bits = MT6358_IRQ_##sp##_BITS, \
> > +       .en_reg = MT6358_##sp##_TOP_INT_CON0,           \
> > +       .en_reg_shift = 0x6,    \
> > +       .sta_reg = MT6358_##sp##_TOP_INT_STATUS0,               \
> > +       .sta_reg_shift = 0x2,   \
> > +       .top_offset = MT6358_##sp##_TOP,        \
> > +}
> > +
> > +#endif /* __MFD_MT6358_CORE_H__ */
>

--0000000000005f4d1805841cf3da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 15, 2019 at 3:10 PM Nicol=
as Boichat &lt;<a href=3D"mailto:drinkcat@chromium.org">drinkcat@chromium.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">+Claire Chang who found some issue with this patch.<br>
<br>
On Mon, Mar 11, 2019 at 11:48 AM Hsin-Hsiung Wang<br>
&lt;<a href=3D"mailto:hsin-hsiung.wang@mediatek.com" target=3D"_blank">hsin=
-hsiung.wang@mediatek.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This adds support for the MediaTek MT6358 PMIC. This is a<br>
&gt; multifunction device with the following sub modules:<br>
&gt;<br>
&gt; - Regulator<br>
&gt; - RTC<br>
&gt; - Codec<br>
&gt; - Interrupt<br>
&gt;<br>
&gt; It is interfaced to the host controller using SPI interface<br>
&gt; by a proprietary hardware called PMIC wrapper or pwrap.<br>
&gt; MT6358 MFD is a child device of the pwrap.<br>
&gt;<br>
&gt; Signed-off-by: Hsin-Hsiung Wang &lt;<a href=3D"mailto:hsin-hsiung.wang=
@mediatek.com" target=3D"_blank">hsin-hsiung.wang@mediatek.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/mfd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 drivers/mfd/mt6358-irq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 236 +++++<br>
&gt;=C2=A0 drivers/mfd/mt6397-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A063 +-<br>
&gt;=C2=A0 include/linux/mfd/mt6358/core.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 158 =
+++<br>
&gt;=C2=A0 include/linux/mfd/mt6358/registers.h | 1926 ++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 include/linux/mfd/mt6397/core.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 3 +<br>
&gt;=C2=A0 6 files changed, 2386 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 drivers/mfd/mt6358-irq.c<br>
&gt;=C2=A0 create mode 100644 include/linux/mfd/mt6358/core.h<br>
&gt;=C2=A0 create mode 100644 include/linux/mfd/mt6358/registers.h<br>
&gt;<br>
&gt; diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile<br>
&gt; index 088e249..50be021 100644<br>
&gt; --- a/drivers/mfd/Makefile<br>
&gt; +++ b/drivers/mfd/Makefile<br>
&gt; @@ -230,7 +230,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 +=3D intel-soc-pmic.o<br>
&gt;=C2=A0 obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)=C2=A0 =C2=A0 =C2=A0+=3D intel=
_soc_pmic_bxtwc.o<br>
&gt;=C2=A0 obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)=C2=A0 =C2=A0 =C2=A0+=3D intel=
_soc_pmic_chtwc.o<br>
&gt;=C2=A0 obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)=C2=A0 +=3D intel_soc_pmic_=
chtdc_ti.o<br>
&gt; -obj-$(CONFIG_MFD_MT6397)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D mt6397-core.o=
 mt6397-irq.o<br>
&gt; +obj-$(CONFIG_MFD_MT6397)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D mt6397-core.o=
 mt6397-irq.o mt6358-irq.o<br>
&gt;<br>
&gt;=C2=A0 obj-$(CONFIG_MFD_ALTERA_A10SR) +=3D altera-a10sr.o<br>
&gt;=C2=A0 obj-$(CONFIG_MFD_SUN4I_GPADC)=C2=A0 +=3D sun4i-gpadc.o<br>
&gt; diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..2941d87<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/mfd/mt6358-irq.c<br>
&gt; @@ -0,0 +1,236 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +//<br>
&gt; +// Copyright (c) 2019 MediaTek Inc.<br>
&gt; +<br>
&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; +#include &lt;linux/mfd/mt6358/core.h&gt;<br>
&gt; +#include &lt;linux/mfd/mt6358/registers.h&gt;<br>
&gt; +#include &lt;linux/mfd/mt6397/core.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/of_irq.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +<br>
&gt; +static struct irq_top_t mt6358_ints[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_TOP_GEN(BUCK),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_TOP_GEN(LDO),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_TOP_GEN(PSC),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_TOP_GEN(SCK),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_TOP_GEN(BM),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_TOP_GEN(HK),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_TOP_GEN(AUD),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_TOP_GEN(MISC),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int parsing_hwirq_to_top_group(unsigned int hwirq)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int top_group;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (top_group =3D 1; top_group &lt; ARRAY=
_SIZE(mt6358_ints); top_group++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mt6358_int=
s[top_group].hwirq_base &gt; hwirq) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0top_group--;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return top_group;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void pmic_irq_enable(struct irq_data *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int hwirq =3D irqd_to_hwirq(data)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mt6397_chip *chip =3D irq_data_get_=
irq_chip_data(data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pmic_irq_data *irqd =3D chip-&gt;ir=
q_data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;enable_hwirq[hwirq] =3D true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void pmic_irq_disable(struct irq_data *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int hwirq =3D irqd_to_hwirq(data)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mt6397_chip *chip =3D irq_data_get_=
irq_chip_data(data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pmic_irq_data *irqd =3D chip-&gt;ir=
q_data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;enable_hwirq[hwirq] =3D false;<br=
>
&gt; +}<br>
&gt; +<br>
&gt; +static void pmic_irq_lock(struct irq_data *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mt6397_chip *chip =3D irq_data_get_=
irq_chip_data(data);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;chip-&gt;irqlock);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void pmic_irq_sync_unlock(struct irq_data *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i, top_gp, en_reg, int_regs, =
shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mt6397_chip *chip =3D irq_data_get_=
irq_chip_data(data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pmic_irq_data *irqd =3D chip-&gt;ir=
q_data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; irqd-&gt;num_pmic_irq=
s; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irqd-&gt;e=
nable_hwirq[i] =3D=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;cache_hwirq[i])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0continue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0top_gp =3D par=
sing_hwirq_to_top_group(i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_regs =3D m=
t6358_ints[top_gp].num_int_bits / MT6358_REG_WIDTH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0en_reg =3D mt6=
358_ints[top_gp].en_reg +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mt6358_ints[top_gp].en_reg_shift * int_regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift =3D (i -=
 mt6358_ints[top_gp].hwirq_base) % MT6358_REG_WIDTH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_=
bits(chip-&gt;regmap, en_reg, BIT(shift),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqd-&gt;enable_hwirq[i] =
&lt;&lt; shift);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;cache=
_hwirq[i] =3D irqd-&gt;enable_hwirq[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;chip-&gt;irqlock);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int pmic_irq_set_type(struct irq_data *data, unsigned int type=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct irq_chip mt6358_irq_chip =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;mt6358-irq&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_enable =3D pmic_irq_enable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_disable =3D pmic_irq_disable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_bus_lock =3D pmic_irq_lock,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_bus_sync_unlock =3D pmic_irq_sync_unl=
ock,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_set_type =3D pmic_irq_set_type,<br>
&gt; +};<br></blockquote><div>Should we also add=C2=A0.irq_set_wake just li=
ke mt6397-irq.c?<br></div><div>Without .irq_set_wake, we will have u<span s=
tyle=3D"color:rgb(0,0,0);font-size:16px;white-space:nowrap">nbalanced IRQ w=
ake disable issue during suspend/resume.</span>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +static void mt6358_irq_sp_handler(struct mt6397_chip *chip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int top_gp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int sta_reg, irq_status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int hwirq, virq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, i, j;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; mt6358_ints[top_gp].n=
um_int_regs; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sta_reg =3D mt=
6358_ints[top_gp].sta_reg +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mt6358_ints[top_gp].sta_reg_shift * i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap=
_read(chip-&gt;regmap, sta_reg, &amp;irq_status);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_err(chip-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to read irq status: =
%d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!irq_statu=
s)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0continue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; =
j &lt; MT6358_REG_WIDTH ; j++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if ((irq_status &amp; BIT(j)) =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0hwirq =3D mt6358_ints[top_gp].hwirq_base +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_REG_WIDTH * i + j;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0virq =3D irq_find_mapping(chip-&gt;irq_domain, hwirq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (virq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle_nested_irq(virq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(c=
hip-&gt;regmap, sta_reg, irq_status);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t mt6358_irq_handler(int irq, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mt6397_chip *chip =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pmic_irq_data *mt6358_irq_data =3D =
chip-&gt;irq_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int top_irq_status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(chip-&gt;regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0mt6358_irq_data-&gt;top_int_status_reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&amp;top_irq_status);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(chip-&=
gt;dev, &quot;Can&#39;t read TOP_INT_STATUS ret=3D%d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_NON=
E;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; mt6358_irq_data-&gt;n=
um_top; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (top_irq_st=
atus &amp; BIT(mt6358_ints[i].top_offset))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mt6358_irq_sp_handler(chip, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int pmic_irq_domain_map(struct irq_domain *d, unsigned int irq=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq_hw_number_t hw)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mt6397_chip *mt6397 =3D d-&gt;host_=
data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_chip_data(irq, mt6397);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_chip_and_handler(irq, &amp;mt6358_=
irq_chip, handle_level_irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_nested_thread(irq, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_noprobe(irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct irq_domain_ops mt6358_irq_domain_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.map =3D pmic_irq_domain_map,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.xlate =3D irq_domain_xlate_twocell,<br>
&gt; +};<br>
&gt; +<br>
&gt; +int mt6358_irq_init(struct mt6397_chip *chip)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, j, ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pmic_irq_data *irqd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irqd =3D devm_kzalloc(chip-&gt;dev, sizeof=
(struct pmic_irq_data *),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!irqd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;irq_data =3D irqd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;chip-&gt;irqlock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;top_int_status_reg =3D MT6358_TOP=
_INT_STATUS0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;num_pmic_irqs =3D MT6358_IRQ_NR;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;num_top =3D ARRAY_SIZE(mt6358_int=
s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;enable_hwirq =3D devm_kcalloc(chi=
p-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0irqd-&gt;num_pmic_irqs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sizeof(bool),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!irqd-&gt;enable_hwirq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irqd-&gt;cache_hwirq =3D devm_kcalloc(chip=
-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqd=
-&gt;num_pmic_irqs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
of(bool),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFP_=
KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!irqd-&gt;cache_hwirq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable all interrupt for initializing =
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; irqd-&gt;num_top; i++=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; =
j &lt; mt6358_ints[i].num_int_regs; j++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0regmap_write(chip-&gt;regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mt6358_ints[i].en_=
reg +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mt6358_ints[i].en_=
reg_shift * j, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;irq_domain =3D irq_domain_add_lin=
ear(chip-&gt;dev-&gt;of_node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 irqd-&gt;num_pmic_irqs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mt6358_irq_domain_ops, chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chip-&gt;irq_domain) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(chip-&=
gt;dev, &quot;could not create irq domain\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_request_threaded_irq(chip-&gt=
;dev, chip-&gt;irq, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mt635=
8_irq_handler, IRQF_ONESHOT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a hr=
ef=3D"http://mt6358_irq_chip.name" rel=3D"noreferrer" target=3D"_blank">mt6=
358_irq_chip.name</a>, chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(chip-&=
gt;dev, &quot;failed to register irq=3D%d; err: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0chip-&gt;irq, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_irq_wake(chip-&gt;irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c<br>
&gt; index 53f1edc..9ef14f9 100644<br>
&gt; --- a/drivers/mfd/mt6397-core.c<br>
&gt; +++ b/drivers/mfd/mt6397-core.c<br>
&gt; @@ -18,12 +18,36 @@<br>
&gt;=C2=A0 #include &lt;linux/regmap.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/mfd/core.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/mfd/mt6323/core.h&gt;<br>
&gt; +#include &lt;linux/mfd/mt6358/core.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/mfd/mt6397/core.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/mfd/mt6323/registers.h&gt;<br>
&gt; +#include &lt;linux/mfd/mt6358/registers.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/mfd/mt6397/registers.h&gt;<br>
&gt;<br>
&gt; +#define MT6358_RTC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x0588<br>
&gt; +#define MT6358_RTC_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x3c<br>
&gt; +#define MT6358_RTC_WRTGR_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3a<br>
&gt;=C2=A0 #define MT6397_RTC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0xe000<br>
&gt;=C2=A0 #define MT6397_RTC_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x3e<br>
&gt; +#define MT6397_RTC_WRTGR_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3c<br>
&gt; +<br>
&gt; +static const struct resource mt6358_rtc_resources[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.start =3D MT6=
358_RTC_BASE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end=C2=A0 =C2=
=A0=3D MT6358_RTC_BASE + MT6358_RTC_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D IOR=
ESOURCE_MEM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.start =3D MT6=
358_IRQ_RTC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end=C2=A0 =C2=
=A0=3D MT6358_IRQ_RTC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D IOR=
ESOURCE_IRQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.start =3D MT6=
358_RTC_WRTGR_OFFSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end=C2=A0 =C2=
=A0=3D MT6358_RTC_WRTGR_OFFSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D IOR=
ESOURCE_REG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt;<br>
&gt;=C2=A0 static const struct resource mt6397_rtc_resources[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; @@ -36,6 +60,11 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end=C2=
=A0 =C2=A0=3D MT6397_IRQ_RTC,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =
=3D IORESOURCE_IRQ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.start =3D MT6=
397_RTC_WRTGR_OFFSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end=C2=A0 =C2=
=A0=3D MT6397_RTC_WRTGR_OFFSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D IOR=
ESOURCE_REG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 static const struct resource mt6323_keys_resources[] =3D {<br>
&gt; @@ -63,6 +92,21 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +static const struct mfd_cell mt6358_devs[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quo=
t;mt6358-regulator&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible=
 =3D &quot;mediatek,mt6358-regulator&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quo=
t;mt6397-rtc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_resources=
 =3D ARRAY_SIZE(mt6358_rtc_resources),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.resources =3D=
 mt6358_rtc_resources,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible=
 =3D &quot;mediatek,mt6358-rtc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quo=
t;mt6358-sound&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible=
 =3D &quot;mediatek,mt6358-sound&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 static const struct mfd_cell mt6397_devs[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D=
 &quot;mt6397-rtc&quot;,<br>
&gt; @@ -97,6 +141,10 @@ struct chip_data {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cid_addr =3D MT6323_CID,<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +static const struct chip_data mt6358_core =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.cid_addr =3D MT6358_SWCID,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 static const struct chip_data mt6397_core =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cid_addr =3D MT6397_CID,<br>
&gt;=C2=A0 };<br>
&gt; @@ -140,7 +188,11 @@ static int mt6397_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pmic-&gt;irq &lt;=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return pm=
ic-&gt;irq;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mt6397_irq_init(pmic);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pmic-&gt;chip_id =3D=3D MT6358_CHIP_ID=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mt6358=
_irq_init(pmic);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mt6397=
_irq_init(pmic);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt;<br>
&gt; @@ -151,6 +203,12 @@ static int mt6397_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0, pmic-&gt;irq_domain);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case MT6358_CHIP_ID:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_m=
fd_add_devices(&amp;pdev-&gt;dev, -1, mt6358_devs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ARRAY_SIZE(mt6358_devs), NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0, pmic-&gt;irq_domain);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case MT6391_CHIP_ID:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case MT6397_CHIP_ID:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D d=
evm_mfd_add_devices(&amp;pdev-&gt;dev, -1, mt6397_devs,<br>
&gt; @@ -177,6 +235,9 @@ static int mt6397_probe(struct platform_device *pd=
ev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatib=
le =3D &quot;mediatek,mt6323&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D=
 &amp;mt6323_core,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =
=3D &quot;mediatek,mt6358&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp=
;mt6358_core,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatib=
le =3D &quot;mediatek,mt6397&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D=
 &amp;mt6397_core,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt; diff --git a/include/linux/mfd/mt6358/core.h b/include/linux/mfd/mt635=
8/core.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..ce9e08a<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/linux/mfd/mt6358/core.h<br>
&gt; @@ -0,0 +1,158 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 MediaTek Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __MFD_MT6358_CORE_H__<br>
&gt; +#define __MFD_MT6358_CORE_H__<br>
&gt; +<br>
&gt; +#define MT6358_REG_WIDTH 16<br>
&gt; +<br>
&gt; +struct irq_top_t {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int hwirq_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int num_int_regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int num_int_bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int en_reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int en_reg_shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int sta_reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int sta_reg_shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int top_offset;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct pmic_irq_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int num_top;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int num_pmic_irqs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned short top_int_status_reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool *enable_hwirq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool *cache_hwirq;<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum mt6358_irq_top_status_shift {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_BUCK_TOP =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_LDO_TOP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_PSC_TOP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_SCK_TOP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_BM_TOP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_HK_TOP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_AUD_TOP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_MISC_TOP,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum mt6358_irq_numbers {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VPROC11_OC =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VPROC12_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCORE_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VGPU_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VMODEM_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VDRAM1_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VS1_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VS2_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VPA_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCORE_PREOC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VFE28_OC =3D 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VXO22_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VRF18_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VRF12_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VEFUSE_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCN33_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCN28_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCN18_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCAMA1_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCAMA2_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCAMD_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCAMIO_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VLDO28_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VA12_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VAUX18_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VAUD28_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VIO28_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VIO18_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VSRAM_PROC11_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VSRAM_PROC12_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VSRAM_OTHERS_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VSRAM_GPU_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VDRAM2_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VMC_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VMCH_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VEMC_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VSIM1_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VSIM2_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VIBR_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VUSB_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VBIF28_OC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_PWRKEY =3D 48,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_HOMEKEY,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_PWRKEY_R,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_HOMEKEY_R,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_NI_LBAT_INT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_CHRDET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_CHRDET_EDGE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_VCDT_HV_DET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_RTC =3D 64,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_BAT0_H =3D 80,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_BAT0_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_CUR_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_CUR_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_ZCV,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_BAT1_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_BAT1_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_N_CHARGE_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_IAVG_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_IAVG_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_TIME_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_DISCHARGE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_FG_CHARGE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BATON_LV =3D 96,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BATON_HT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BATON_BAT_IN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BATON_BAT_OUT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BIF,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BAT_H =3D 112,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BAT_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BAT2_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BAT2_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BAT_TEMP_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_BAT_TEMP_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_AUXADC_IMP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_NAG_C_DLTV,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_AUDIO =3D 128,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_ACCDET =3D 133,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_ACCDET_EINT0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_ACCDET_EINT1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_SPI_CMD_ALERT =3D 144,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MT6358_IRQ_NR,<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define MT6358_IRQ_BUCK_BASE MT6358_IRQ_VPROC11_OC<br>
&gt; +#define MT6358_IRQ_LDO_BASE MT6358_IRQ_VFE28_OC<br>
&gt; +#define MT6358_IRQ_PSC_BASE MT6358_IRQ_PWRKEY<br>
&gt; +#define MT6358_IRQ_SCK_BASE MT6358_IRQ_RTC<br>
&gt; +#define MT6358_IRQ_BM_BASE MT6358_IRQ_FG_BAT0_H<br>
&gt; +#define MT6358_IRQ_HK_BASE MT6358_IRQ_BAT_H<br>
&gt; +#define MT6358_IRQ_AUD_BASE MT6358_IRQ_AUDIO<br>
&gt; +#define MT6358_IRQ_MISC_BASE MT6358_IRQ_SPI_CMD_ALERT<br>
&gt; +<br>
&gt; +#define MT6358_IRQ_BUCK_BITS (MT6358_IRQ_VCORE_PREOC - MT6358_IRQ_BUC=
K_BASE + 1)<br>
&gt; +#define MT6358_IRQ_LDO_BITS (MT6358_IRQ_VBIF28_OC - MT6358_IRQ_LDO_BA=
SE + 1)<br>
&gt; +#define MT6358_IRQ_PSC_BITS (MT6358_IRQ_VCDT_HV_DET - MT6358_IRQ_PSC_=
BASE + 1)<br>
&gt; +#define MT6358_IRQ_SCK_BITS (MT6358_IRQ_RTC - MT6358_IRQ_SCK_BASE + 1=
)<br>
&gt; +#define MT6358_IRQ_BM_BITS (MT6358_IRQ_BIF - MT6358_IRQ_BM_BASE + 1)<=
br>
&gt; +#define MT6358_IRQ_HK_BITS (MT6358_IRQ_NAG_C_DLTV - MT6358_IRQ_HK_BAS=
E + 1)<br>
&gt; +#define MT6358_IRQ_AUD_BITS (MT6358_IRQ_ACCDET_EINT1 - MT6358_IRQ_AUD=
_BASE + 1)<br>
&gt; +#define MT6358_IRQ_MISC_BITS=C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(MT6358_IRQ_SPI_CMD_ALERT - MT6358_IRQ_MIS=
C_BASE + 1)<br>
&gt; +<br>
&gt; +#define MT6358_TOP_GEN(sp)=C2=A0 =C2=A0 =C2=A0\<br>
&gt; +{=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.hwirq_base =3D MT6358_IRQ_##sp##_BASE,=C2=
=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_int_regs =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(MT6358_IRQ_##=
sp##_BITS / MT6358_REG_WIDTH) + 1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_int_bits =3D MT6358_IRQ_##sp##_BITS, =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.en_reg =3D MT6358_##sp##_TOP_INT_CON0,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.en_reg_shift =3D 0x6,=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.sta_reg =3D MT6358_##sp##_TOP_INT_STATUS0=
,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.sta_reg_shift =3D 0x2,=C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.top_offset =3D MT6358_##sp##_TOP,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +}<br>
&gt; +<br>
&gt; +#endif /* __MFD_MT6358_CORE_H__ */<br>
</blockquote></div></div>

--0000000000005f4d1805841cf3da--
