From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 5/6] rtc: max77xxx: add RTC driver for Maxim MAX77xxx
 series RTC IP
Date: Thu, 14 Jan 2016 09:50:12 +0900
Message-ID: <5696F0C4.1060904@samsung.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-6-git-send-email-ldewangan@nvidia.com>
 <569594F0.4020007@samsung.com> <5695CD73.5010709@nvidia.com>
 <5695D268.3060705@samsung.com> <5695D1AF.9000806@nvidia.com>
 <5696665A.5030508@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5696665A.5030508@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org

On 13.01.2016 23:59, Laxman Dewangan wrote:
> 
> On Wednesday 13 January 2016 09:55 AM, Laxman Dewangan wrote:
>>
>> On Wednesday 13 January 2016 09:58 AM, Krzysztof Kozlowski wrote:
>>> On 13.01.2016 13:07, Laxman Dewangan wrote:
>>>> On Wednesday 13 January 2016 05:36 AM, Krzysztof Kozlowski wrote:
>>>
>>>> That is also fine to me but still I am not comfortable with the config
>>>> name and driver file name as this does not suggest the common.
>>> The name does not matter. Really. We have a lot of drivers with a
>>> specific device-like name and supporting different devices. To point
>>> that your argument is invalid - your initial name of driver
>>> "rtc-max77620.c" supported totally different "names": the max77620 and
>>> max20024. It also wasn't suggesting something "common"...
>> In all config string, I have mentioned the MAX20024.
>>
>>
>>> With my approach we are not developing common think neither. We just
>>> want to extend/re-use existing max77686 (or max77802) driver for new
>>> devices. Just like everywhere else.
>>
>> OK, fine to me if this is acceptable.
>> I will drop this rtc patch form this series and work in max77686
>> driver to modify first and once merged, use this config on my defconfig.
>>
> 
> Here, MAX686 RTC driver needs two regmap handle, one for the rtc_regmap
> and other for STATUS2 register access.
> 
>         ret = regmap_read(info->max77686->regmap, MAX77686_REG_STATUS2,
> &val);
>         if (ret < 0) {
>                 dev_err(info->dev, "%s:%d fail to read status2 reg(%d)\n",
>                                 __func__, __LINE__, ret);
>                 goto out;
>         }
> 
> 
> We can not have two regmap handle on rtc driver as both regmap (pmic and
> rtc) registered with different i2c device.
> 
> Also this register should not be accessed by RTC driver if we want to
> decouple as this is very much MAX77686 register set.
> Do we need this code?
> static int max77686_rtc_read_alarm(struct device *dev, struct rtc_wkalrm
> *alrm)
> {
>         struct max77686_rtc_info *info = dev_get_drvdata(dev);
>         u8 data[RTC_NR_TIME];
>         unsigned int val;
>         int i, ret;
> 
> ::::::::
>        alrm->pending = 0;
>         ret = regmap_read(info->max77686->regmap, MAX77686_REG_STATUS2,
> &val);
>         if (ret < 0) {
>                 dev_err(info->dev, "%s:%d fail to read status2 reg(%d)\n",
>                                 __func__, __LINE__, ret);
>                 goto out;
>         }
> 
>         if (val & (1 << 4)) /* RTCA1 */
>                 alrm->pending = 1;
> 
> }

Most of the drivers set the 'pending' field when reading alarm. Your
original driver did not.

The max77802 does exactly the same (BTW, these should be merged as
well... I'll add this to the TODO list) so I think this is necessary.

BR,
Krzysztof
