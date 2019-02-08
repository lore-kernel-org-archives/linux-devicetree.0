From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 4/6] mfd: Add support for the MediaTek MT6358 PMIC
Date: Fri, 8 Feb 2019 12:09:36 -0800
Message-ID: <20190208200936.GN117604@google.com>
References: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1548839891-20932-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548839891-20932-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi,

A few comments inline.

On a general note I agree with others that this code would benefit
from more comments.

On Wed, Jan 30, 2019 at 05:18:09PM +0800, Hsin-Hsiung Wang wrote:
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
>  drivers/mfd/mt6397-core.c            |   62 +-
>  include/linux/mfd/mt6358/core.h      |  158 +++
>  include/linux/mfd/mt6358/registers.h | 1926 ++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |    3 +
>  6 files changed, 2385 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mfd/mt6358-irq.c
>  create mode 100644 include/linux/mfd/mt6358/core.h
>  create mode 100644 include/linux/mfd/mt6358/registers.h
> 
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 088e249..50be021 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -230,7 +230,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)	+= intel-soc-pmic.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)	+= intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
> -obj-$(CONFIG_MFD_MT6397)	+= mt6397-core.o mt6397-irq.o
> +obj-$(CONFIG_MFD_MT6397)	+= mt6397-core.o mt6397-irq.o mt6358-irq.o
>  
>  obj-$(CONFIG_MFD_ALTERA_A10SR)	+= altera-a10sr.o
>  obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
> diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> new file mode 100644
> index 0000000..b29fdc1
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
> +	MT6358_TOP_GEN(BUCK),
> +	MT6358_TOP_GEN(LDO),
> +	MT6358_TOP_GEN(PSC),
> +	MT6358_TOP_GEN(SCK),
> +	MT6358_TOP_GEN(BM),
> +	MT6358_TOP_GEN(HK),
> +	MT6358_TOP_GEN(AUD),
> +	MT6358_TOP_GEN(MISC),
> +};
> +
> +static int parsing_hwirq_to_top_group(unsigned int hwirq)

why 'parsing'?

IIUC the 'top's are interrupt groups for different functionalities.
Could we get rid of the 'top' terminology in most of the code and just
call it irq_grp or similar? Would be less obfuscated IMO.

> +{
> +	int top_group;
> +
> +	for (top_group = 1; top_group < ARRAY_SIZE(mt6358_ints); top_group++) {
> +		if (mt6358_ints[top_group].hwirq_base > hwirq) {
> +			top_group--;
> +			break;
> +		}
> +	}
> +	return top_group;
> +}
> +
> +static void pmic_irq_enable(struct irq_data *data)
> +{
> +	unsigned int hwirq = irqd_to_hwirq(data);
> +	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +	struct pmic_irq_data *irq_data = chip->irq_data;
> +
> +	irq_data->enable_hwirq[hwirq] = 1;

enable_hwirq should be boolean or - probably better - a bitmap
(less memory usage and no need for dynamic allocation).

> +static void pmic_irq_sync_unlock(struct irq_data *data)
> +{
> +	unsigned int i, top_gp, en_reg, int_regs, shift;
> +	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +	struct pmic_irq_data *irq_data = chip->irq_data;
> +
> +	for (i = 0; i < irq_data->num_pmic_irqs; i++) {
> +		if (irq_data->enable_hwirq[i] ==
> +				irq_data->cache_hwirq[i])
> +			continue;
> +
> +		top_gp = parsing_hwirq_to_top_group(i);
> +		int_regs = mt6358_ints[top_gp].num_int_bits / MT6358_REG_WIDTH;
> +		en_reg = mt6358_ints[top_gp].en_reg +
> +			mt6358_ints[top_gp].en_reg_shift * int_regs;
> +		shift = (i - mt6358_ints[top_gp].hwirq_base) % MT6358_REG_WIDTH;
> +		regmap_update_bits(chip->regmap, en_reg, 0x1 << shift,

use BIT()

> +static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
> +				  unsigned int top_gp)
> +{
> +	unsigned int sta_reg, int_status = 0;

initialization of int_status not needed.

nit: consider changing 'int_status' to just 'status' or 'irq_status'

> +	unsigned int hwirq, virq;
> +	int ret, i, j;
> +
> +	for (i = 0; i < mt6358_ints[top_gp].num_int_regs; i++) {
> +		sta_reg = mt6358_ints[top_gp].sta_reg +
> +			mt6358_ints[top_gp].sta_reg_shift * i;
> +		ret = regmap_read(chip->regmap, sta_reg, &int_status);
> +		if (ret) {
> +			dev_err(chip->dev,
> +				"Failed to read irq status: %d\n", ret);
> +			return;
> +		}
> +
> +		if (!int_status)
> +			continue;
> +
> +		for (j = 0; j < 16 ; j++) {

s/16/MT6358_REG_WIDTH/

> +			if ((int_status & BIT(j)) == 0)

  			if (!(int_status & BIT(j)))

> +				continue;
> +			hwirq = mt6358_ints[top_gp].hwirq_base +
> +				MT6358_REG_WIDTH * i + j;
> +			virq = irq_find_mapping(chip->irq_domain, hwirq);
> +			if (virq)
> +				handle_nested_irq(virq);
> +		}
> +
> +		regmap_write(chip->regmap, sta_reg, int_status);
> +	}
> +}
> +
> +static irqreturn_t mt6358_irq_handler(int irq, void *data)
> +{
> +	struct mt6397_chip *chip = data;
> +	struct pmic_irq_data *mt6358_irq_data = chip->irq_data;
> +	unsigned int top_int_status = 0;

initialization not needed

> +	unsigned int i;
> +	int ret;
> +
> +	ret = regmap_read(chip->regmap,
> +			  mt6358_irq_data->top_int_status_reg,
> +			  &top_int_status);
> +	if (ret) {
> +		dev_err(chip->dev, "Can't read TOP_INT_STATUS ret=%d\n", ret);
> +		return IRQ_NONE;
> +	}
> +
> +	for (i = 0; i < mt6358_irq_data->num_top; i++) {
> +		if (top_int_status & BIT(mt6358_ints[i].top_offset))
> +			mt6358_irq_sp_handler(chip, i);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

Cheers

Matthias
