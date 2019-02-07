From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 4/6] mfd: Add support for the MediaTek MT6358 PMIC
Date: Thu, 7 Feb 2019 10:04:50 +0000
Message-ID: <345df368-b247-9c4b-a69d-e95f14bff8b6@arm.com>
References: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1548839891-20932-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20190207093450.GH4672@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207093450.GH4672@dell>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, tglx@linutronix.de, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 07/02/2019 09:34, Lee Jones wrote:
> Thomas, et al.,
> 
> Please could you take a look at this?
> 
> I need some IRQ related guidance.  TIA.
> 
> On Wed, 30 Jan 2019, Hsin-Hsiung Wang wrote:
> 
>> This adds support for the MediaTek MT6358 PMIC. This is a
>> multifunction device with the following sub modules:
>>
>> - Regulator
>> - RTC
>> - Codec
>> - Interrupt
>>
>> It is interfaced to the host controller using SPI interface
>> by a proprietary hardware called PMIC wrapper or pwrap.
>> MT6358 MFD is a child device of the pwrap.
>>
>> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
>> ---
>>  drivers/mfd/Makefile                 |    2 +-
>>  drivers/mfd/mt6358-irq.c             |  236 +++++
>>  drivers/mfd/mt6397-core.c            |   62 +-
>>  include/linux/mfd/mt6358/core.h      |  158 +++
>>  include/linux/mfd/mt6358/registers.h | 1926 ++++++++++++++++++++++++++++++++++
>>  include/linux/mfd/mt6397/core.h      |    3 +
>>  6 files changed, 2385 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/mfd/mt6358-irq.c
>>  create mode 100644 include/linux/mfd/mt6358/core.h
>>  create mode 100644 include/linux/mfd/mt6358/registers.h
>>
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 088e249..50be021 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -230,7 +230,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)	+= intel-soc-pmic.o
>>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)	+= intel_soc_pmic_bxtwc.o
>>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
>>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
>> -obj-$(CONFIG_MFD_MT6397)	+= mt6397-core.o mt6397-irq.o
>> +obj-$(CONFIG_MFD_MT6397)	+= mt6397-core.o mt6397-irq.o mt6358-irq.o
>>  
>>  obj-$(CONFIG_MFD_ALTERA_A10SR)	+= altera-a10sr.o
>>  obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
>> diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
>> new file mode 100644
>> index 0000000..b29fdc1
>> --- /dev/null
>> +++ b/drivers/mfd/mt6358-irq.c
>> @@ -0,0 +1,236 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (c) 2019 MediaTek Inc.
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/mfd/mt6358/core.h>
>> +#include <linux/mfd/mt6358/registers.h>
>> +#include <linux/mfd/mt6397/core.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +static struct irq_top_t mt6358_ints[] = {
>> +	MT6358_TOP_GEN(BUCK),
>> +	MT6358_TOP_GEN(LDO),
>> +	MT6358_TOP_GEN(PSC),
>> +	MT6358_TOP_GEN(SCK),
>> +	MT6358_TOP_GEN(BM),
>> +	MT6358_TOP_GEN(HK),
>> +	MT6358_TOP_GEN(AUD),
>> +	MT6358_TOP_GEN(MISC),
>> +};
> 
> What is a 'top' IRQ?
> 
>> +static int parsing_hwirq_to_top_group(unsigned int hwirq)
>> +{
>> +	int top_group;
>> +
>> +	for (top_group = 1; top_group < ARRAY_SIZE(mt6358_ints); top_group++) {
>> +		if (mt6358_ints[top_group].hwirq_base > hwirq) {
>> +			top_group--;
>> +			break;
>> +		}
>> +	}
>> +	return top_group;
>> +}
> 
> This function is going to need some comments.  Why do you start at LDO
> instead of the top entry, BUCK?

It also begs the question: why isn't that directly associated to the
irq_data structure? Something is fishy here. In general, if you have to
iterate over anything, you're likely to be doing the wrong thing.

> 
>> +static void pmic_irq_enable(struct irq_data *data)
>> +{
>> +	unsigned int hwirq = irqd_to_hwirq(data);
>> +	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
>> +	struct pmic_irq_data *irq_data = chip->irq_data;
>> +
>> +	irq_data->enable_hwirq[hwirq] = 1;
>> +}
> 
> I see that you're doing your own caching operations.  Is that
> required?  I think I'm going to stop here and as for some IRQ guy's
> input on this.

Dunno either. I thought that's what regmap was for?

> 
>> +static void pmic_irq_disable(struct irq_data *data)
>> +{
>> +	unsigned int hwirq = irqd_to_hwirq(data);
>> +	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
>> +	struct pmic_irq_data *irq_data = chip->irq_data;
>> +
>> +	irq_data->enable_hwirq[hwirq] = 0;
>> +}
>> +
>> +static void pmic_irq_lock(struct irq_data *data)
>> +{
>> +	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
>> +
>> +	mutex_lock(&chip->irqlock);
>> +}
>> +
>> +static void pmic_irq_sync_unlock(struct irq_data *data)
>> +{
>> +	unsigned int i, top_gp, en_reg, int_regs, shift;
>> +	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
>> +	struct pmic_irq_data *irq_data = chip->irq_data;

I really wish you kept the symbol "irq_data" for something that is a
struct irq_data. This is making the code pointlessly obfuscated.

>> +
>> +	for (i = 0; i < irq_data->num_pmic_irqs; i++) {
>> +		if (irq_data->enable_hwirq[i] ==
>> +				irq_data->cache_hwirq[i])
>> +			continue;

Please explain what you are trying to do here. The unlock operation is
supposed to affect exactly one interrupt. Instead, you seem to deal with
a bunch of them at once. Operations are supposed to happen on the "leaf"
IRQs, not on the multiplexing interrupt.

Also, the whole cache thing seems pretty pointless. Why isn't regmap
doing that for you?

>> +
>> +		top_gp = parsing_hwirq_to_top_group(i);
>> +		int_regs = mt6358_ints[top_gp].num_int_bits / MT6358_REG_WIDTH;
>> +		en_reg = mt6358_ints[top_gp].en_reg +
>> +			mt6358_ints[top_gp].en_reg_shift * int_regs;
>> +		shift = (i - mt6358_ints[top_gp].hwirq_base) % MT6358_REG_WIDTH;
>> +		regmap_update_bits(chip->regmap, en_reg, 0x1 << shift,
>> +				   irq_data->enable_hwirq[i] << shift);
>> +		irq_data->cache_hwirq[i] = irq_data->enable_hwirq[i];
>> +	}
>> +	mutex_unlock(&chip->irqlock);
>> +}
>> +
>> +static int pmic_irq_set_type(struct irq_data *data, unsigned int type)
>> +{
>> +	return 0;
>> +}
>> +
>> +static struct irq_chip mt6358_irq_chip = {
>> +	.name = "mt6358-irq",
>> +	.irq_enable = pmic_irq_enable,
>> +	.irq_disable = pmic_irq_disable,
>> +	.irq_bus_lock = pmic_irq_lock,
>> +	.irq_bus_sync_unlock = pmic_irq_sync_unlock,
>> +	.irq_set_type = pmic_irq_set_type,
>> +};
>> +
>> +static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
>> +				  unsigned int top_gp)
>> +{
>> +	unsigned int sta_reg, int_status = 0;
>> +	unsigned int hwirq, virq;
>> +	int ret, i, j;
>> +
>> +	for (i = 0; i < mt6358_ints[top_gp].num_int_regs; i++) {
>> +		sta_reg = mt6358_ints[top_gp].sta_reg +
>> +			mt6358_ints[top_gp].sta_reg_shift * i;
>> +		ret = regmap_read(chip->regmap, sta_reg, &int_status);
>> +		if (ret) {
>> +			dev_err(chip->dev,
>> +				"Failed to read irq status: %d\n", ret);
>> +			return;
>> +		}
>> +
>> +		if (!int_status)
>> +			continue;
>> +
>> +		for (j = 0; j < 16 ; j++) {
>> +			if ((int_status & BIT(j)) == 0)
>> +				continue;
>> +			hwirq = mt6358_ints[top_gp].hwirq_base +
>> +				MT6358_REG_WIDTH * i + j;
>> +			virq = irq_find_mapping(chip->irq_domain, hwirq);
>> +			if (virq)
>> +				handle_nested_irq(virq);
>> +		}
>> +
>> +		regmap_write(chip->regmap, sta_reg, int_status);
>> +	}
>> +}
>> +
>> +static irqreturn_t mt6358_irq_handler(int irq, void *data)
>> +{
>> +	struct mt6397_chip *chip = data;
>> +	struct pmic_irq_data *mt6358_irq_data = chip->irq_data;
>> +	unsigned int top_int_status = 0;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ret = regmap_read(chip->regmap,
>> +			  mt6358_irq_data->top_int_status_reg,
>> +			  &top_int_status);
>> +	if (ret) {
>> +		dev_err(chip->dev, "Can't read TOP_INT_STATUS ret=%d\n", ret);
>> +		return IRQ_NONE;
>> +	}
>> +
>> +	for (i = 0; i < mt6358_irq_data->num_top; i++) {
>> +		if (top_int_status & BIT(mt6358_ints[i].top_offset))
>> +			mt6358_irq_sp_handler(chip, i);
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}

Why isn't this a normal chained irq flow, instead of a homegrown irq
handler? Is that because this is a threaded handler?

>> +
>> +static int pmic_irq_domain_map(struct irq_domain *d, unsigned int irq,
>> +			       irq_hw_number_t hw)
>> +{
>> +	struct mt6397_chip *mt6397 = d->host_data;
>> +
>> +	irq_set_chip_data(irq, mt6397);
>> +	irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
>> +	irq_set_nested_thread(irq, 1);
>> +	irq_set_noprobe(irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct irq_domain_ops mt6358_irq_domain_ops = {
>> +	.map = pmic_irq_domain_map,
>> +	.xlate = irq_domain_xlate_twocell,
>> +};
>> +
>> +int mt6358_irq_init(struct mt6397_chip *chip)
>> +{
>> +	int i, j, ret;
>> +	struct pmic_irq_data *irq_data;
>> +
>> +	irq_data = devm_kzalloc(chip->dev, sizeof(struct pmic_irq_data *),
>> +				GFP_KERNEL);
>> +	if (!irq_data)
>> +		return -ENOMEM;
>> +
>> +	chip->irq_data = irq_data;
>> +
>> +	mutex_init(&chip->irqlock);
>> +	irq_data->top_int_status_reg = MT6358_TOP_INT_STATUS0;
>> +	irq_data->num_pmic_irqs = MT6358_IRQ_NR;
>> +	irq_data->num_top = ARRAY_SIZE(mt6358_ints);
>> +
>> +	irq_data->enable_hwirq = devm_kcalloc(chip->dev,
>> +					      irq_data->num_pmic_irqs,
>> +					      sizeof(unsigned int),
>> +					      GFP_KERNEL);
>> +	if (!irq_data->enable_hwirq)
>> +		return -ENOMEM;
>> +
>> +	irq_data->cache_hwirq = devm_kcalloc(chip->dev,
>> +					     irq_data->num_pmic_irqs,
>> +					     sizeof(unsigned int),
>> +					     GFP_KERNEL);
>> +	if (!irq_data->cache_hwirq)
>> +		return -ENOMEM;
>> +
>> +	/* Disable all interrupt for initializing */
>> +	for (i = 0; i < irq_data->num_top; i++) {
>> +		for (j = 0; j < mt6358_ints[i].num_int_regs; j++)
>> +			regmap_write(chip->regmap,
>> +				     mt6358_ints[i].en_reg +
>> +				     mt6358_ints[i].en_reg_shift * j, 0);
>> +	}
>> +
>> +	chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
>> +						 irq_data->num_pmic_irqs,
>> +						 &mt6358_irq_domain_ops, chip);
>> +	if (!chip->irq_domain) {
>> +		dev_err(chip->dev, "could not create irq domain\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
>> +					mt6358_irq_handler, IRQF_ONESHOT,
>> +					mt6358_irq_chip.name, chip);
>> +	if (ret) {
>> +		dev_err(chip->dev, "failed to register irq=%d; err: %d\n",
>> +			chip->irq, ret);
>> +		return ret;
>> +	}
>> +
>> +	enable_irq_wake(chip->irq);

Why is that decided at probe time, from kernel space?

>> +	return ret;
>> +}

Anyway, I've stopped here. This definitely needs clarification.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
