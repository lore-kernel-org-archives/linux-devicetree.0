From: Tim Bird <tim.bird@sonymobile.com>
Subject: Re: [PATCH v2 2/3] ARM: qcom: Add coincell charger driver
Date: Wed, 15 Jul 2015 12:08:17 -0700
Message-ID: <55A6AFA1.6080703@sonymobile.com>
References: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com> <1436916380-3599-2-git-send-email-tim.bird@sonymobile.com> <55A5B33A.3070303@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55A5B33A.3070303@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?windows-1252?Q?=22Andersson=2C_Bj=F6rn=22?= <Bjorn.Andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org



On 07/14/2015 06:11 PM, Stephen Boyd wrote:
> On 07/14/2015 04:26 PM, Tim Bird wrote:
> 
>>   3 files changed, 166 insertions(+)
>>   create mode 100644 drivers/misc/qcom-coincell.c
>>
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index 42c3852..0909869 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -271,6 +271,17 @@ config HP_ILO
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called hpilo.
>>   
>> +config QCOM_COINCELL
>> +	tristate "Qualcomm coincell charger support"
>> +	depends on OF
> 
> It looks like it would compile fine without OF, so can we drop this 
> dependency? Or make it into
> 
>   depends on MFD_SPMI_PMIC || COMPILE_TEST
> 
> ?
I think I had CONFIG_OF off one time, and I spent the better
part of the afternoon trying to figure out why the driver wasn't
loading.  So it compiles but doesn't actually work.
But I think a dependency on MFD_SPMI_PMIC solves this issue.
So, OK on the second suggestion.

> 
>> +	select REGMAP
>> +	help
>> +	  This driver supports the coincell block found inside of
>> +	  Qualcomm PMICs.  The coincell charger provides a means to
>> +	  charge a coincell battery or backup capacitor which is used
>> +	  to maintain PMIC register and RTC state in the absence of
>> +	  external power.
>> +
>>   config SGI_GRU
>>   	tristate "SGI GRU driver"
>>   	depends on X86_UV && SMP
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index d056fb7..537d7f3 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -18,6 +18,7 @@ obj-$(CONFIG_LKDTM)		+= lkdtm.o
>>   obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
>>   obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
>>   obj-$(CONFIG_PHANTOM)		+= phantom.o
>> +obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
>>   obj-$(CONFIG_SENSORS_BH1780)	+= bh1780gli.o
>>   obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
>>   obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
>> diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
>> new file mode 100644
>> index 0000000..9c019e4
>> --- /dev/null
>> +++ b/drivers/misc/qcom-coincell.c
>> @@ -0,0 +1,154 @@
>> +/* Copyright (c) 2013, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2015, Sony Mobile Communications Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +
>> +struct qcom_coincell {
>> +	struct device	*dev;
>> +	struct regmap	*regmap;
>> +	u32		base_addr;
>> +};
>> +
>> +#define QCOM_COINCELL_REG_RSET		0x44
>> +#define QCOM_COINCELL_REG_VSET		0x45
>> +#define QCOM_COINCELL_REG_ENABLE	0x46
>> +
>> +#define QCOM_COINCELL_ENABLE		BIT(7)
>> +
>> +static const int qcom_rset_map[] = {2100, 1700, 1200, 800};
>> +static const int qcom_vset_map[] = {2500, 3200, 3100, 3000};
> 
> Nitpick: put spaces around those braces.

OK.  I presume you mean like this:
{ 2100, 1700, 1200, 800 };

>> +/* NOTE: for pm8921 and others, voltage of 2500 is 16 (10000b), not 0 */
>> +
>> +static int qcom_coincell_chgr_config(struct qcom_coincell *chgr, int rset,
>> +				     int vset, int enable)
> 
> bool enable?
>
OK
 
>> +{
>> +	int i, rc;
>> +	unsigned int value;
>> +
>> +	/* select current-limiting resistor */
>> +	for (i = 0; i < ARRAY_SIZE(qcom_rset_map); i++)
>> +		if (rset == qcom_rset_map[i])
>> +			break;
>> +
>> +	if (i >= ARRAY_SIZE(qcom_rset_map)) {
>> +		dev_err(chgr->dev, "invalid rset-ohms value %d\n", rset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = regmap_write(chgr->regmap,
>> +			  chgr->base_addr + QCOM_COINCELL_REG_RSET, i);
>> +	if (rc)
>> +		dev_err(chgr->dev, "could not write to RSET register\n");
>> +		return rc;
> 
> Missing braces?
> 
Ouch!  Yes.  Thanks.

<rant - mostly at myself>
Of all the kernel CodingStyle rules, the one I absolutely hate is not using
braces on single statement blocks.  It trips me up like this a lot.
Maybe I should add a checkpatch rule to catch this kind of thing.
</rant>

>> +
>> +	/* select charge voltage */
>> +	for (i = 0; i < ARRAY_SIZE(qcom_vset_map); i++)
>> +		if (vset == qcom_vset_map[i])
>> +			break;
>> +
>> +	if (i >= ARRAY_SIZE(qcom_vset_map)) {
>> +		dev_err(chgr->dev, "invalid vset-millivolts value %d\n", vset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = regmap_write(chgr->regmap,
>> +		chgr->base_addr + QCOM_COINCELL_REG_VSET, i);
>> +	if (rc)
>> +		dev_err(chgr->dev, "could not write to VSET register\n");
>> +		return rc;
> 
> Missing braces? I guess this hardware just works out of the bootloader 
> after the resistor is configured?
Yes, again.  Doh!

I swear I tested the register values after loading the driver
with different rset and vset values, to make sure they were taking effect.
But that was on a dragonboard with no actual coincell present.  I was
too chicken to mess with the values on an actual phone (since I can't
actually change the capacitor used for this, and didn't want to 
damage it with the wrong values.)

I must have done the value testing before messing up my braces.  Sorry!

Will fix.  Also, I will repeat testing of the values taking effect, on
the next iteration.

>> +
>> +	/* set 'enable' register */
>> +	value = enable ? QCOM_COINCELL_ENABLE : 0;
>> +	rc = regmap_write(chgr->regmap,
>> +			  chgr->base_addr + QCOM_COINCELL_REG_ENABLE, value);
>> +	if (rc)
>> +		dev_err(chgr->dev, "could not write to ENABLE register\n");
>> +
> 
> Honestly these printks seems pretty useless and could probably be left out.

I'm torn.  This driver and hardware is simple enough that the most
likely thing these printks will catch is a mis-configured "reg" value
in the DTS, and that would apply to most of these printks.
Inability to write to a valid register should be pretty rare.

I *would* like to visibly flag that case somehow, as I'm loathe to have some
DTS author have to traipse through kernel code to figure out where the
error is coming from.  I'm not sure, but I think things are pretty quiet
on probe errors, and if I don't print something, it makes a lot of 
work for a developer to find the problem, when all they've done is mistyped
something in the DTS.

>> +	return rc;
>> +}
>> +
>> +static int qcom_coincell_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *node = pdev->dev.of_node;
>> +	struct qcom_coincell *chgr;
>> +	u32 rset, vset, enable;
>> +	int rc;
>> +
>> +	if (!node) {
>> +		dev_err(&pdev->dev, "%s: device node missing\n", __func__);
>> +		return -ENODEV;
>> +	}
> 
> Does this happen?
Probably not any more.  The only way this device gets initialized now
is via OF operations.  This code was forward-ported from when this driver
also operated as a platform device.  In the current situation, I don't
know of a way for the kernel to get here if of_node is missing
(but I'm not an OF expert, and I didn't want to start using
a NULL of_node.)

What does of_property_read...() do with a NULL node?

I'm a little leery of taking this check out, but if you think it's
OK I'm fine doing it.

> 
>> +
>> +	chgr = devm_kzalloc(&pdev->dev, sizeof(*chgr), GFP_KERNEL);
>> +	if (!chgr)
>> +		return -ENOMEM;
>> +
>> +	chgr->dev = &pdev->dev;
>> +
>> +	chgr->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!chgr->regmap) {
>> +		dev_err(chgr->dev, "Unable to get regmap\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = of_property_read_u32(node, "reg", &chgr->base_addr);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = of_property_read_u32(node, "qcom,rset-ohms", &rset);
>> +	if (rc) {
>> +		dev_err(chgr->dev, "can't find 'qcom,rset-ohms' in DT block");
>> +		return rc;
>> +	}
>> +
>> +	rc = of_property_read_u32(node, "qcom,vset-millivolts", &vset);
>> +	if (rc) {
>> +		dev_err(chgr->dev,
>> +			"can't find 'qcom,vset-millivolts' in DT block");
>> +		return rc;
>> +	}
>> +
>> +	rc = of_property_read_u32(node, "qcom,charge-enable", &enable);
> 
> This should be a bool:
> 
>      enable = of_property_read_bool(node, "qcom,charge-enable");
OK.
 
>> +	if (rc)
>> +		enable = 0;
>> +
>> +	rc = qcom_coincell_chgr_config(chgr, rset, vset, enable);
>> +
>> +	return rc;
>> +}
>> +
>> +static const struct of_device_id qcom_coincell_match_table[] = {
>> +	{ .compatible = "qcom,pm8941-coincell", },
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, qcom_coincell_match_table);
>> +
>> +static struct platform_driver qcom_coincell_driver = {
>> +	.driver	= {
>> +		.name		= "qcom,pm8941-coincell",
> 
> Maybe a better driver name would be qcom-spmi-coincell?

OK by me.

Thanks for the review!!
 -- Tim

 
