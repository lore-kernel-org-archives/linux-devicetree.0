From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/3] ARM: qcom: Add coincell charger driver
Date: Wed, 15 Jul 2015 12:44:38 -0700
Message-ID: <55A6B826.7060304@codeaurora.org>
References: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com> <1436916380-3599-2-git-send-email-tim.bird@sonymobile.com> <55A5B33A.3070303@codeaurora.org> <55A6AFA1.6080703@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <55A6AFA1.6080703@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tim Bird <tim.bird@sonymobile.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?windows-1252?Q?=22Andersson=2C_Bj=F6rn=22?= <Bjorn.Andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On 07/15/2015 12:08 PM, Tim Bird wrote:
>
> On 07/14/2015 06:11 PM, Stephen Boyd wrote:
>> On 07/14/2015 04:26 PM, Tim Bird wrote:
>>
>>>    3 files changed, 166 insertions(+)
>>>    create mode 100644 drivers/misc/qcom-coincell.c
>>>
>>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>>> index 42c3852..0909869 100644
>>> --- a/drivers/misc/Kconfig
>>> +++ b/drivers/misc/Kconfig
>>> @@ -271,6 +271,17 @@ config HP_ILO
>>>    	  To compile this driver as a module, choose M here: the
>>>    	  module will be called hpilo.
>>>    
>>> +config QCOM_COINCELL
>>> +	tristate "Qualcomm coincell charger support"
>>> +	depends on OF
>> It looks like it would compile fine without OF, so can we drop this
>> dependency? Or make it into
>>
>>    depends on MFD_SPMI_PMIC || COMPILE_TEST
>>
>> ?
> I think I had CONFIG_OF off one time, and I spent the better
> part of the afternoon trying to figure out why the driver wasn't
> loading.  So it compiles but doesn't actually work.
> But I think a dependency on MFD_SPMI_PMIC solves this issue.
> So, OK on the second suggestion.
>
>>> +	select REGMAP

This config wouldn't be necessary either then because it would be 
selected implicitly by the SPMI parent driver.

>>> diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
>>> new file mode 100644
>>> index 0000000..9c019e4
>>> --- /dev/null
>>> +++ b/drivers/misc/qcom-coincell.c
>>> @@ -0,0 +1,154 @@
>>> +/* Copyright (c) 2013, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2015, Sony Mobile Communications Inc.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 and
>>> + * only version 2 as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/of.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +struct qcom_coincell {
>>> +	struct device	*dev;
>>> +	struct regmap	*regmap;
>>> +	u32		base_addr;
>>> +};
>>> +
>>> +#define QCOM_COINCELL_REG_RSET		0x44
>>> +#define QCOM_COINCELL_REG_VSET		0x45
>>> +#define QCOM_COINCELL_REG_ENABLE	0x46
>>> +
>>> +#define QCOM_COINCELL_ENABLE		BIT(7)
>>> +
>>> +static const int qcom_rset_map[] = {2100, 1700, 1200, 800};
>>> +static const int qcom_vset_map[] = {2500, 3200, 3100, 3000};
>> Nitpick: put spaces around those braces.
> OK.  I presume you mean like this:
> { 2100, 1700, 1200, 800 };

Yep.

>
>
>>> +	return rc;
>>> +}
>>> +
>>> +static int qcom_coincell_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device_node *node = pdev->dev.of_node;
>>> +	struct qcom_coincell *chgr;
>>> +	u32 rset, vset, enable;
>>> +	int rc;
>>> +
>>> +	if (!node) {
>>> +		dev_err(&pdev->dev, "%s: device node missing\n", __func__);
>>> +		return -ENODEV;
>>> +	}
>> Does this happen?
> Probably not any more.  The only way this device gets initialized now
> is via OF operations.  This code was forward-ported from when this driver
> also operated as a platform device.  In the current situation, I don't
> know of a way for the kernel to get here if of_node is missing
> (but I'm not an OF expert, and I didn't want to start using
> a NULL of_node.)
>
> What does of_property_read...() do with a NULL node?

I'm pretty sure it returns success or nothing when the node is NULL.

>
> I'm a little leery of taking this check out, but if you think it's
> OK I'm fine doing it.

I'll fix any problems with the removal of the check :)

>
>>> +
>>> +	chgr = devm_kzalloc(&pdev->dev, sizeof(*chgr), GFP_KERNEL);
>>> +	if (!chgr)
>>> +		return -ENOMEM;
>>> +
>>> +	chgr->dev = &pdev->dev;
>>> +
>>> +	chgr->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>>> +	if (!chgr->regmap) {
>>> +		dev_err(chgr->dev, "Unable to get regmap\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	rc = of_property_read_u32(node, "reg", &chgr->base_addr);
>>> +	if (rc)
>>> +		return rc;
>>> +
>>> +	rc = of_property_read_u32(node, "qcom,rset-ohms", &rset);
>>> +	if (rc) {
>>> +		dev_err(chgr->dev, "can't find 'qcom,rset-ohms' in DT block");
>>> +		return rc;
>>> +	}
>>> +
>>> +	rc = of_property_read_u32(node, "qcom,vset-millivolts", &vset);
>>> +	if (rc) {
>>> +		dev_err(chgr->dev,
>>> +			"can't find 'qcom,vset-millivolts' in DT block");
>>> +		return rc;
>>> +	}
>>> +
>>> +	rc = of_property_read_u32(node, "qcom,charge-enable", &enable);
>> This should be a bool:
>>
>>       enable = of_property_read_bool(node, "qcom,charge-enable");
> OK.
>   
>>> +	if (rc)
>>> +		enable = 0;
>>> +
>>> +	rc = qcom_coincell_chgr_config(chgr, rset, vset, enable);
>>> +
>>> +	return rc;

This could be simplified to a return qcom_coincell_chrg_config() too.

Also, do we even need the chgr structure allocated anywhere besides on 
the stack? It seems that it will be memory that's just lying around for 
no use after probe.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
