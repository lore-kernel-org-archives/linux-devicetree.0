From: Chris Zhong <zyw@rock-chips.com>
Subject: Re: [PATCH v2 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Tue, 26 Aug 2014 18:05:05 +0800
Message-ID: <53FC5BD1.7030406@rock-chips.com>
References: <1408505461-24200-1-git-send-email-zyw@rock-chips.com> <20140820092117.GI4266@lee--X1> <53FA9D1E.8040202@rock-chips.com> <20140826092205.GG9574@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140826092205.GG9574@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, mturquette@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, grant.likely@linaro.org, hl@rock-chips.com, huangtao@rock-chips.com, cf@rock-chips.com, zhangqing@rock-chips.com, xxx@rock-chips.com, dianders@chromium.org, heiko@sntech.de, olof@lixom.net, sonnyrao@chromium.org, dtor@chromium.org, javier.martinez@collabora.co.uk, kever.yang@rock-chips.com
List-Id: devicetree@vger.kernel.org


On 08/26/2014 05:22 PM, Lee Jones wrote:
> On Mon, 25 Aug 2014, Chris Zhong wrote:
>> On 08/20/2014 05:21 PM, Lee Jones wrote:
>>> On Wed, 20 Aug 2014, Chris Zhong wrote:
>>>
>>>> The RK808 chip is a power management IC for multimedia and handheld
>>>> devices. It contains the following components:
>>>>
>>>> - Regulators
>>>> - RTC
>>>>
>>>> The rk808 core driver is registered as a platform driver and provides
>>>> communication through I2C with the host device for the different
>>>> components.
>>>>
>>>> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>>>> ---
> [...]
>
>>>> +	rk808->pdata = pdata;
>>> Remove pdata from 'struct rk808'.  You can obtain it from dev.
>> Can I keep this pdata in rk808, because it is used in the regulator driver.
>> The one obtain from dev maybe empty.
> If the one in dev is empty, you should populate that instead.

So, should I malloc a pada, and assign it to client->dev?
