From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v7 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Mon, 1 Sep 2014 14:35:54 -0700
Message-ID: <CAD=FV=WUOk1dUUH5R11ONshkckS8QDa-6C_14VRTtRwQPZTv4Q@mail.gmail.com>
References: <1409562468-16586-1-git-send-email-zyw@rock-chips.com>
	<1409564384-18380-1-git-send-email-zyw@rock-chips.com>
	<20140901100922.GL7374@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140901100922.GL7374@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Chris Zhong <zyw@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Mike Turquette <mturquette@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, rtc-linux@googlegroups.com, Grant Likely <grant.likely@linaro.org>, Lin Huang <hl@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, zhangqing <zhangqing@rock-chips.com>, xxx <xxx@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, Dmitry Torokhov <dtor@chromium.>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Sep 1, 2014 at 3:09 AM, Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 01 Sep 2014, Chris Zhong wrote:
>
>> The RK808 chip is a power management IC for multimedia and handheld
>> devices. It contains the following components:
>>
>> - Regulators
>> - RTC
>> - Clkout
>>
>> The RK808 core driver is registered as a platform driver and provides
>> communication through I2C with the host device for the different
>> components.
>>
>> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>> Signed-off-by: Zhang Qing <zhangqing@rock-chips.com>
>
> Couple of nits.  Once fixed you can apply my:
>
> Acked-by: Lee Jones <lee.jones@linaro.org>
>
> [...]
>
>> +/*
>> + * MFD core driver for Rockchip RK808
>> + *
>> + * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
>
> Author?

I asked Chris to remove the author in my response to an earlier
version since it's at the bottom (MODULE_AUTHOR) and it seems extra
duplication.  You are the boss though, so if it should go both places
then Chris should add this back.  Sorry for the bad advice, Chris.

-Doug
