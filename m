From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v2 1/5] mfd: 88pm800: Fix tabbing issue
Date: Tue, 25 Aug 2015 14:11:53 +0530
Message-ID: <55DC2A51.6090008@linaro.org>
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org> <1440442594-3102-2-git-send-email-vaibhav.hiremath@linaro.org> <20150825075121.GE19409@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150825075121.GE19409@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tuesday 25 August 2015 01:21 PM, Lee Jones wrote:
> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>
>> Driver had coding style issues where spaces were used instead
>> of tabs. This patch fixes them all.
>
> That's not all it's doing though is it?
>

Yes, its just tabbing related fixes.


> Please describe all of your changes.
>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   drivers/mfd/88pm800.c | 125 ++++++++++++++++++++++++--------------------------
>>   1 file changed, 61 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
>> index f104a32..c4e097d 100644
>> --- a/drivers/mfd/88pm800.c
>> +++ b/drivers/mfd/88pm800.c
>> @@ -30,55 +30,55 @@
>>   #include <linux/of_device.h>
>>
>>   /* Interrupt Registers */
>> -#define PM800_INT_STATUS1		(0x05)
>> +#define PM800_INT_STATUS1		0x05
>>   #define PM800_ONKEY_INT_STS1		(1 << 0)
>>   #define PM800_EXTON_INT_STS1		(1 << 1)
>> -#define PM800_CHG_INT_STS1			(1 << 2)
>> -#define PM800_BAT_INT_STS1			(1 << 3)
>> -#define PM800_RTC_INT_STS1			(1 << 4)
>> +#define PM800_CHG_INT_STS1		(1 << 2)
>> +#define PM800_BAT_INT_STS1		(1 << 3)
>> +#define PM800_RTC_INT_STS1		(1 << 4)
>>   #define PM800_CLASSD_OC_INT_STS1	(1 << 5)
>
> These should all be replaced by BIT().
>
> Please fix the whole file.

Will do.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
