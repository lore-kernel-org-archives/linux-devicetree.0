From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-V5 3/4] mfd: 88pm800: Set default interrupt clear method
Date: Tue, 07 Jul 2015 15:23:50 +0530
Message-ID: <559BA1AE.9050006@linaro.org>
References: <1435591877-18214-1-git-send-email-vaibhav.hiremath@linaro.org> <1435591877-18214-4-git-send-email-vaibhav.hiremath@linaro.org> <20150707072958.GN3182@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150707072958.GN3182@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Tuesday 07 July 2015 12:59 PM, Lee Jones wrote:
> On Mon, 29 Jun 2015, Vaibhav Hiremath wrote:
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
>>   include/linux/mfd/88pm80x.h | 10 ++++++++--
>>   2 files changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
>> index d495737..66347be 100644
>> --- a/drivers/mfd/88pm800.c
>> +++ b/drivers/mfd/88pm800.c
>> @@ -374,7 +374,7 @@ static int device_irq_init_800(struct pm80x_chip *chip)
>>   {
>>   	struct regmap *map = chip->regmap;
>>   	unsigned long flags = IRQF_ONESHOT;
>> -	int data, mask, ret = -EINVAL;
>> +	int irq_clr_mode, mask, ret = -EINVAL;
>>
>>   	if (!map || !chip->irq) {
>>   		dev_err(chip->dev, "incorrect parameters\n");
>> @@ -382,15 +382,16 @@ static int device_irq_init_800(struct pm80x_chip *chip)
>>   	}
>>
>>   	/*
>> -	 * irq_mode defines the way of clearing interrupt. it's read-clear by
>> -	 * default.
>> +	 * irq_clr_on_wr defines the way of clearing interrupt by
>> +	 * read/write(0/1).  It's read-clear by default.
>>   	 */
>>   	mask =
>>   	    PM800_WAKEUP2_INV_INT | PM800_WAKEUP2_INT_CLEAR |
>>   	    PM800_WAKEUP2_INT_MASK;
>>
>> -	data = PM800_WAKEUP2_INT_CLEAR;
>> -	ret = regmap_update_bits(map, PM800_WAKEUP2, mask, data);
>> +	irq_clr_mode = chip->irq_clr_method == PM800_IRQ_CLR_ON_WRITE ?
>> +		PM800_WAKEUP2_INT_WRITE_CLEAR : PM800_WAKEUP2_INT_READ_CLEAR;
>> +	ret = regmap_update_bits(map, PM800_WAKEUP2, mask, irq_clr_mode);
>
> What's stopping you just passing PM800_WAKEUP2_INT_WRITE_CLEAR or
> PM800_WAKEUP2_INT_READ_CLEAR from pdata?  Then you can use the value
> directly without all of this faffing about.
>
>    regmap_update_bits(map, PM800_WAKEUP2, mask, pdata->irq_clr_mode);
>

Because "irq_clr_method" is of boolean type.
And macros which you are referring to is,

#define PM800_WAKEUP2_INT_READ_CLEAR            (0 << 1)
#define PM800_WAKEUP2_INT_WRITE_CLEAR           (1 << 1)


And also, I feel it is more cleaner approach with the current code as
register definition and userflag are maintained separately.

>>   	if (ret < 0)
>>   		goto out;
>> @@ -512,6 +513,7 @@ static int device_800_init(struct pm80x_chip *chip,
>>   	}
>>
>>   	chip->regmap_irq_chip = &pm800_irq_chip;
>> +	chip->irq_clr_method = pdata->irq_clr_method;
>>
>>   	ret = device_irq_init_800(chip);
>>   	if (ret < 0) {
>> @@ -564,6 +566,9 @@ static int pm800_probe(struct i2c_client *client,
>>   		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>>   		if (!pdata)
>>   			return -ENOMEM;
>> +
>> +		/* by default, set irq clear method on write */
>> +		pdata->irq_clr_method = PM800_IRQ_CLR_ON_WRITE;
>>   	}
>>
>>   	ret = pm80x_init(client);
>> diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
>> index 8fcad63..648e01a 100644
>> --- a/include/linux/mfd/88pm80x.h
>> +++ b/include/linux/mfd/88pm80x.h
>> @@ -77,6 +77,8 @@ enum {
>>   #define PM800_WAKEUP2			(0x0E)
>>   #define PM800_WAKEUP2_INV_INT		BIT(0)
>>   #define PM800_WAKEUP2_INT_CLEAR		BIT(1)
>> +#define PM800_WAKEUP2_INT_READ_CLEAR	(0 << 1)
>> +#define PM800_WAKEUP2_INT_WRITE_CLEAR	(1 << 1)
>>   #define PM800_WAKEUP2_INT_MASK		BIT(2)
>>
>>   #define PM800_POWER_UP_LOG		(0x10)
>> @@ -300,7 +302,11 @@ struct pm80x_chip {
>>   	struct regmap_irq_chip_data *irq_data;
>>   	int type;
>>   	int irq;
>> -	int irq_mode;
>> +
>> +#define PM800_IRQ_CLR_ON_READ	0
>> +#define PM800_IRQ_CLR_ON_WRITE	1
>
> Defines in the middle of structs makes for ugly code.
>

Sorry, but kernel code is full of such implementations.
Infact it is right place in terms of readability.

If you still feel insist to fix it, please let me know whether you want
to submit V6 just for this. Or you will fix it while merging.
I am OK with anything here...


Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
