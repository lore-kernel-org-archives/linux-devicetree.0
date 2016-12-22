From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: hi3660: Clock driver support for Hisilicon
 hi3660 SoC
Date: Thu, 22 Dec 2016 10:01:05 +0800
Message-ID: <fc7bebd2-ad03-6479-d6e7-42f5d724216c@linaro.org>
References: <1481781493-6188-1-git-send-email-zhangfei.gao@linaro.org>
 <1481781493-6188-3-git-send-email-zhangfei.gao@linaro.org>
 <20161221232551.GB8288@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161221232551.GB8288-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Stephen

Thanks for the suggestion.

On 2016年12月22日 07:25, Stephen Boyd wrote:
> On 12/15, Zhangfei Gao wrote:
>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Add some commit text here?
OK
>
>> diff --git a/drivers/clk/hisilicon/clk-hi3660.c b/drivers/clk/hisilicon/clk-hi3660.c
>> new file mode 100644
>> index 0000000..42ca47d
>> --- /dev/null
>> +++ b/drivers/clk/hisilicon/clk-hi3660.c
>> @@ -0,0 +1,601 @@
>> +/*
>> + * Copyright (c) 2016-2017 Linaro Ltd.
>> + * Copyright (c) 2016-2017 HiSilicon Technologies Co., Ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +#include <dt-bindings/clock/hi3660-clock.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
> This isn't needed.
>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include "clk.h"
>> +
> [...]
>> +
>> +static int hi3660_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = pdev->dev.of_node;
>> +	const struct of_device_id *of_id;
>> +	enum hi3660_clk_type type;
>> +
>> +	of_id = of_match_device(hi3660_clk_match_table, dev);
>> +	if (!of_id)
>> +		return -EINVAL;
>> +
>> +	type = (enum hi3660_clk_type)of_id->data;
> Use of_device_get_match_data() instead please.
Yes, this is simpler.
>
>> +
>> +	switch (type) {
>> +	case HI3660_CRGCTRL:
>> +		hi3660_clk_crgctrl_init(np);
>> +		break;
>> +	case HI3660_PCTRL:
>> +		hi3660_clk_pctrl_init(np);
>> +		break;
>> +	case HI3660_PMUCTRL:
>> +		hi3660_clk_pmuctrl_init(np);
>> +		break;
>> +	case HI3660_SCTRL:
>> +		hi3660_clk_sctrl_init(np);
>> +		break;
>> +	case HI3660_IOMCU:
>> +		hi3660_clk_iomcu_init(np);
>> +		break;
> This "multi-device" driver design is sort of odd. Why not have
> different files and struct drivers for the different devices in
> the system that are clock controllers? I don't really understand
> why we're controlling the devices with one struct driver
> instance. Is something shared between the devices?
Do you mean put in different .c / drivers?
They have to be put in the same file, since the parent / child relate to 
each other.
They are for the same chip, but some put in different region for 
privilege control.
>
>> +	default:
>> +		break;
>> +	}
>> +	return 0;
>> +}
> [...]
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:hi3660-clk");
>> +MODULE_DESCRIPTION("HiSilicon Hi3660 Clock Driver");
>
> You can drop these MODULE_* things as they're not going to be
> used in builtin only code.
ok, got it.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
