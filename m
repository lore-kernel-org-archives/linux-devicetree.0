From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v4 2/3] mfd: 88pm800: Set default interrupt clear method
Date: Fri, 26 Jun 2015 23:31:24 +0530
Message-ID: <558D9374.6080702@linaro.org>
References: <1435217189-19578-1-git-send-email-vaibhav.hiremath@linaro.org> <1435217189-19578-3-git-send-email-vaibhav.hiremath@linaro.org> <20150625102618.GC15013@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150625102618.GC15013@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Thursday 25 June 2015 03:56 PM, Lee Jones wrote:
> On Thu, 25 Jun 2015, Vaibhav Hiremath wrote:
>
>> As per the spec, bit 1 (INT_CLEAR_MODE) of reg addr 0xe
>> (page 0) controls the method of clearing interrupt
>> status of 88pm800 family of devices;
>>
>>    0: clear on read
>>    1: clear on write
>>
>> If pdata is not coming from board file, then set the
>> default irq clear method to "irq clear on write"
>>
>> Also, as suggested by "Lee Jones" renaming variable field
>> to appropriate name.
>>
>> Signed-off-by: Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   drivers/mfd/88pm800.c       | 15 ++++++++++-----
>>   include/linux/mfd/88pm80x.h |  6 ++++--
>>   2 files changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
>> index 40fd014..e0cd7ad 100644
>> --- a/drivers/mfd/88pm800.c
>> +++ b/drivers/mfd/88pm800.c
>> @@ -376,7 +376,7 @@ static int device_irq_init_800(struct pm80x_chip *chip)

<snip>

>>   	ret = device_irq_init_800(chip);
>>   	if (ret < 0) {
>> @@ -566,6 +568,9 @@ static int pm800_probe(struct i2c_client *client,
>>   		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>>   		if (!pdata)
>>   			return -ENOMEM;
>> +
>> +		/* by default, set irq clear method on write */
>> +		pdata->irq_clr_on_wr = true;
>
> You can save yourself some memory here, by removing this seemingly
> pointless allocation and do this above:
>
>          chip->irq_clr_on_wr = pdata ? pdata->irq_clr_on_wr : true;
>
>>   	}


I accepted quickly earlier, without giving second thought.

We need pdata, as it is being used in multiple places inside driver.
And I do not want to break that. So allocation of pdata is indeed
needed here.

And also, in order to put your suggested line of code is concerned, I
have to rearrange the code, as access to "chip" is only available after
pm80x_init()

And I feel that would look ugly.

So I will stick to my original code as far as this comment is concerned.


Note that, your comment on CLR_ON_WRITE and CLR_ON_READ already taken
care of.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
