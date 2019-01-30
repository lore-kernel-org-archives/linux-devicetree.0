From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qualcomm: usb: Add Super-Speed PHY driver
Date: Wed, 30 Jan 2019 12:38:20 +0100
Message-ID: <8986d1ea-e009-6f15-e9ca-93cd64284ff7@linaro.org>
References: <1548761715-4004-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548761715-4004-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190129202726.GA3036@builder>
 <fbd70494-e2f1-ae04-8b14-2cc97cead8b9@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fbd70494-e2f1-ae04-8b14-2cc97cead8b9@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, andy.gross@linaro.org, swboyd@chromium.org, shawn.guo@linaro.org, vkoul@kernel.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/30/19 10:53, Jorge Ramirez wrote:
> On 1/29/19 21:27, Bjorn Andersson wrote:
>> On Tue 29 Jan 03:35 PST 2019, Jorge Ramirez-Ortiz wrote:
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
>>> new file mode 100644
>>> index 0000000..e6ae96e
>>> --- /dev/null
>>> +++ b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
>>> @@ -0,0 +1,347 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2012-2014,2017 The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2018, Linaro Limited
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/err.h>
>>> +#include <linux/io.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/phy/phy.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <linux/reset.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#define PHY_CTRL0			0x6C
>>> +#define PHY_CTRL1			0x70
>>> +#define PHY_CTRL2			0x74
>>> +#define PHY_CTRL4			0x7C
>>> +
>>> +/* PHY_CTRL bits */
>>> +#define REF_PHY_EN			BIT(0)
>>> +#define LANE0_PWR_ON			BIT(2)
>>> +#define SWI_PCS_CLK_SEL			BIT(4)
>>> +#define TST_PWR_DOWN			BIT(4)
>>> +#define PHY_RESET			BIT(7)
>>> +
>>> +enum phy_vdd_ctrl { ENABLE, DISABLE, };
>>
>> Use bool to describe boolean values.
> 
> um, ok, but these are not booleans, they are actions (ie ctrl = action
> not true or false).
> 
> anyway will change it to something else
> 
>>
>>> +enum phy_regulator { VDD, VDDA1P8, };
>>
>> It doesn't look like you need either of these if you remove the
>> set_voltage calls.
> 
> we need to point to the regulator in the array so we need an index to it
> somehow.

you are right, we dont

> 
>>
>>> +
>>> +struct ssphy_priv {
>>> +	void __iomem *base;
>>> +	struct device *dev;
>>> +	struct reset_control *reset_com;
>>> +	struct reset_control *reset_phy;
>>> +	struct regulator *vbus;
>>> +	struct regulator_bulk_data *regs;
>>> +	int num_regs;
>>> +	struct clk_bulk_data *clks;
>>> +	int num_clks;
>>> +	enum phy_mode mode;
>>> +};
>>> +
>>> +static inline void qcom_ssphy_updatel(void __iomem *addr, u32 mask, u32 val)
>>> +{
>>> +	writel((readl(addr) & ~mask) | val, addr);
>>> +}
>>> +
>>> +static inline int qcom_ssphy_vbus_enable(struct regulator *vbus)
>>> +{
>>> +	return !regulator_is_enabled(vbus) ? regulator_enable(vbus) : 0;
>>
>> regulator_is_enabled() will check if the actual regulator is on, not if
>> you already voted for it.
>>
>> So if something else is enabling the vbus regulator you will skip your
>> enable and be in the mercy of them not releasing it. Presumably there's
>> only one consumer of this particular regulator, but it's a bad habit.
> 
> yep
> 
>>
>> Please keep track of this drivers requested state in this driver, if
>> qcom_ssphy_vbus_ctrl() is called not only for the state changes.
> 
> um, there is not such a function: the ctrl function is not for vbus but
> for vdd

argh, sorry, it is me who misread my own driver. ok I know what you
mean. will send the updated driver shortly.
