From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 5/6] rtc: max77xxx: add RTC driver for Maxim MAX77xxx
 series RTC IP
Date: Wed, 13 Jan 2016 20:29:38 +0530
Message-ID: <5696665A.5030508@nvidia.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com> <1452590273-16421-6-git-send-email-ldewangan@nvidia.com> <569594F0.4020007@samsung.com> <5695CD73.5010709@nvidia.com> <5695D268.3060705@samsung.com> <5695D1AF.9000806@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5695D1AF.9000806-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Wednesday 13 January 2016 09:55 AM, Laxman Dewangan wrote:
>
> On Wednesday 13 January 2016 09:58 AM, Krzysztof Kozlowski wrote:
>> On 13.01.2016 13:07, Laxman Dewangan wrote:
>>> On Wednesday 13 January 2016 05:36 AM, Krzysztof Kozlowski wrote:
>>
>>> That is also fine to me but still I am not comfortable with the config
>>> name and driver file name as this does not suggest the common.
>> The name does not matter. Really. We have a lot of drivers with a
>> specific device-like name and supporting different devices. To point
>> that your argument is invalid - your initial name of driver
>> "rtc-max77620.c" supported totally different "names": the max77620 and
>> max20024. It also wasn't suggesting something "common"...
> In all config string, I have mentioned the MAX20024.
>
>
>> With my approach we are not developing common think neither. We just
>> want to extend/re-use existing max77686 (or max77802) driver for new
>> devices. Just like everywhere else.
>
> OK, fine to me if this is acceptable.
> I will drop this rtc patch form this series and work in max77686 
> driver to modify first and once merged, use this config on my defconfig.
>

Here, MAX686 RTC driver needs two regmap handle, one for the rtc_regmap 
and other for STATUS2 register access.

         ret = regmap_read(info->max77686->regmap, MAX77686_REG_STATUS2, 
&val);
         if (ret < 0) {
                 dev_err(info->dev, "%s:%d fail to read status2 reg(%d)\n",
                                 __func__, __LINE__, ret);
                 goto out;
         }


We can not have two regmap handle on rtc driver as both regmap (pmic and 
rtc) registered with different i2c device.

Also this register should not be accessed by RTC driver if we want to 
decouple as this is very much MAX77686 register set.
Do we need this code?
static int max77686_rtc_read_alarm(struct device *dev, struct rtc_wkalrm 
*alrm)
{
         struct max77686_rtc_info *info = dev_get_drvdata(dev);
         u8 data[RTC_NR_TIME];
         unsigned int val;
         int i, ret;

::::::::
        alrm->pending = 0;
         ret = regmap_read(info->max77686->regmap, MAX77686_REG_STATUS2, 
&val);
         if (ret < 0) {
                 dev_err(info->dev, "%s:%d fail to read status2 reg(%d)\n",
                                 __func__, __LINE__, ret);
                 goto out;
         }

         if (val & (1 << 4)) /* RTCA1 */
                 alrm->pending = 1;

}





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
