From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 5/9] mfd: Add support for the MediaTek MT6358 PMIC
Date: Mon, 11 Mar 2019 16:22:05 +0800
Message-ID: <CANMq1KDPPuDC4O3W1EjqoLAzfwitx-pqX0Aq8zycomsigcHLFw@mail.gmail.com>
References: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1552275991-34648-6-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552275991-34648-6-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>, srv_heupstream <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 11:48 AM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> This adds support for the MediaTek MT6358 PMIC. This is a
> multifunction device with the following sub modules:
>
> - Regulator
> - RTC
> - Codec
> - Interrupt
>
> It is interfaced to the host controller using SPI interface
> by a proprietary hardware called PMIC wrapper or pwrap.
> MT6358 MFD is a child device of the pwrap.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile                 |    2 +-
>  drivers/mfd/mt6358-irq.c             |  236 +++++
>  drivers/mfd/mt6397-core.c            |   63 +-
>  include/linux/mfd/mt6358/core.h      |  158 +++
>  include/linux/mfd/mt6358/registers.h | 1926 ++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |    3 +
>  6 files changed, 2386 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mfd/mt6358-irq.c
>  create mode 100644 include/linux/mfd/mt6358/core.h
>  create mode 100644 include/linux/mfd/mt6358/registers.h
>
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 088e249..50be021 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -230,7 +230,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)        += intel-soc-pmic.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)     += intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     += intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  += intel_soc_pmic_chtdc_ti.o
> -obj-$(CONFIG_MFD_MT6397)       += mt6397-core.o mt6397-irq.o
> +obj-$(CONFIG_MFD_MT6397)       += mt6397-core.o mt6397-irq.o mt6358-irq.o
>
>  obj-$(CONFIG_MFD_ALTERA_A10SR) += altera-a10sr.o
>  obj-$(CONFIG_MFD_SUN4I_GPADC)  += sun4i-gpadc.o
> diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> new file mode 100644
> index 0000000..2941d87
> --- /dev/null
> +++ b/drivers/mfd/mt6358-irq.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2019 MediaTek Inc.
> +
> +#include <linux/interrupt.h>
> +#include <linux/mfd/mt6358/core.h>
> +#include <linux/mfd/mt6358/registers.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +static struct irq_top_t mt6358_ints[] = {
> +       MT6358_TOP_GEN(BUCK),
> +       MT6358_TOP_GEN(LDO),
> +       MT6358_TOP_GEN(PSC),
> +       MT6358_TOP_GEN(SCK),
> +       MT6358_TOP_GEN(BM),
> +       MT6358_TOP_GEN(HK),
> +       MT6358_TOP_GEN(AUD),
> +       MT6358_TOP_GEN(MISC),
> +};
> +
> +static int parsing_hwirq_to_top_group(unsigned int hwirq)

I think mka@ already told you that, but I'd rename to something like
get_hwirq_top_group.

> +{
> +       int top_group;
> +

Should we also add this? (I know that MT6358_TOP_GEN(BUCK).hwirq_base
== 0, but nothing really guarantees that.
if (mt6358_ints[0].hwirq_base < hwirq)
   return -1;

> +       for (top_group = 1; top_group < ARRAY_SIZE(mt6358_ints); top_group++) {
> +               if (mt6358_ints[top_group].hwirq_base > hwirq) {
> +                       top_group--;
> +                       break;

More simply:
return top_group-1;

> +               }
> +       }
> +       return top_group;

return -1 on error, and check for errors in the code below. If you
don't do that, you run the risk of accessing some array out of bounds.

> +}
> +
> +static void pmic_irq_enable(struct irq_data *data)
> +{
> +       unsigned int hwirq = irqd_to_hwirq(data);
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       irqd->enable_hwirq[hwirq] = true;
> +}
> +
> +static void pmic_irq_disable(struct irq_data *data)
> +{
> +       unsigned int hwirq = irqd_to_hwirq(data);
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       irqd->enable_hwirq[hwirq] = false;
> +}
> +
> +static void pmic_irq_lock(struct irq_data *data)
> +{
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +
> +       mutex_lock(&chip->irqlock);
> +}
> +
> +static void pmic_irq_sync_unlock(struct irq_data *data)
> +{
> +       unsigned int i, top_gp, en_reg, int_regs, shift;
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       for (i = 0; i < irqd->num_pmic_irqs; i++) {
> +               if (irqd->enable_hwirq[i] ==
> +                               irqd->cache_hwirq[i])

I think this fits in 80 chars.

> +                       continue;
> +
> +               top_gp = parsing_hwirq_to_top_group(i);

This is quite inefficient: you keep going through mt6358_ints for all
i. Can you just figure out (and remember) which group we are currently
in in this loop?

outside the loop:
top_gp = 0;

here:
while ((top_gp+1) < ARRAY_SIZE(mt6358_ints) && i >=
mt6358_ints[top_gp+1].hwirq_base)
   top_gp++;

> +               int_regs = mt6358_ints[top_gp].num_int_bits / MT6358_REG_WIDTH;
> +               en_reg = mt6358_ints[top_gp].en_reg +
> +                       mt6358_ints[top_gp].en_reg_shift * int_regs;
> +               shift = (i - mt6358_ints[top_gp].hwirq_base) % MT6358_REG_WIDTH;
> +               regmap_update_bits(chip->regmap, en_reg, BIT(shift),
> +                                  irqd->enable_hwirq[i] << shift);
> +               irqd->cache_hwirq[i] = irqd->enable_hwirq[i];
> +       }
> +       mutex_unlock(&chip->irqlock);
> +}
> +
> +static int pmic_irq_set_type(struct irq_data *data, unsigned int type)
> +{
> +       return 0;
> +}

Why do you need to stub this function out? I think the core will
already check if the irq_chip supports this function or not. I think
you can just leave it as NULL in the struct below.

> +
> +static struct irq_chip mt6358_irq_chip = {
> +       .name = "mt6358-irq",
> +       .irq_enable = pmic_irq_enable,
> +       .irq_disable = pmic_irq_disable,
> +       .irq_bus_lock = pmic_irq_lock,
> +       .irq_bus_sync_unlock = pmic_irq_sync_unlock,
> +       .irq_set_type = pmic_irq_set_type,
> +};
> +
[snip]
