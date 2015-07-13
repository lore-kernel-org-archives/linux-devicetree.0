From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] mfd: 88pm800: Add init time initial configuration
 support
Date: Mon, 13 Jul 2015 12:40:57 +0530
Message-ID: <55A36481.80206@linaro.org>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org> <1436442431-3471-3-git-send-email-vaibhav.hiremath@linaro.org> <55A0BD78.8050005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A0BD78.8050005-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Saturday 11 July 2015 12:23 PM, Krzysztof Kozlowski wrote:
> W dniu 09.07.2015 o 20:47, Vaibhav Hiremath pisze:
>> This patch adds init time configuration of 88PM800/805 and
>> 88PM860. It includes,
>>
>>    - Enable BUCK clock gating in low power mode
>>    - Full mode support for BUCK2 and 4
>>    - Enable voltage change (LPF, DVC) in PMIC
>>
>> Note that both 88PM800 and 88PM860 do share common configurations,
>> but since I can not validate the configuration on 88PM800,
>> restricting myself only to 88PM860.
>> If anyone can validate on 88PM800, we can move common code accordingly.
>>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Although I am not familiar with the device and driver, patch looks good
> to me, except one idea below. Anyway feel free to add:
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>

Thanks for your review.

>
>> ---
>>   drivers/mfd/88pm800.c       | 64 +++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/mfd/88pm80x.h | 13 +++++++++
>>   2 files changed, 77 insertions(+)
>>
>> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
>> index 95c8ad4..80a1bc1 100644
>> --- a/drivers/mfd/88pm800.c
>> +++ b/drivers/mfd/88pm800.c
>> @@ -521,6 +521,63 @@ out:
>>   	return ret;
>>   }
>>
>> +static int pm800_init_config(struct pm80x_chip *chip, struct device_node *np)
>> +{
>> +	int ret;
>> +	unsigned int val;
>> +
>> +	switch (chip->type) {
>> +	case CHIP_PM800:
>> +	case CHIP_PM805:
>> +		break;
>
> It may be useful for future generations to put short notice here why
> there is no init for these devices? I saw the explanation in commit
> message but still someone in the future may look at the code and wonder
> why only 88PM860 is initialized and the others are not?
>

Yeup, Agreed.

I will incorporate it in V2.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
