From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/6] extcon-gpio: If the gpio driver/chip supports
 debounce, use it
Date: Wed, 11 Sep 2013 11:03:56 +0900
Message-ID: <522FCF8C.9040205@samsung.com>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
 <1377836978-24082-3-git-send-email-linux@roeck-us.net>
 <522FC476.7060100@samsung.com> <522FCE08.5000704@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <522FCE08.5000704@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On 09/11/2013 10:57 AM, Guenter Roeck wrote:
> On 09/10/2013 06:16 PM, Chanwoo Choi wrote:
>> Hi Guenter
>>
>> I agree to use gpio_set_debounce() API but, I suggest following patch to code clean.
>> and I'd like you to use declarative sentence on patch name instead of 'If ...'.
>>
>> On 08/30/2013 01:29 PM, Guenter Roeck wrote:
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>   drivers/extcon/extcon-gpio.c |    5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
>>> index 77d35a7..973600e 100644
>>> --- a/drivers/extcon/extcon-gpio.c
>>> +++ b/drivers/extcon/extcon-gpio.c
>>> @@ -111,6 +111,11 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>>>       if (ret < 0)
>>>           goto err;
>>>
>>> +    /* Use gpio debounce if available. If so, don't debounce in software. */
>>> +    if (pdata->debounce &&
>>> +        !gpio_set_debounce(extcon_data->gpio, pdata->debounce * 1000))
>>> +        extcon_data->debounce_jiffies = 0;
>>> +
>>>       INIT_DELAYED_WORK(&extcon_data->work, gpio_extcon_work);
>>>
>>>       extcon_data->irq = gpio_to_irq(extcon_data->gpio);
>>>
>>
>> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
>> index 3943ce2..0777e72 100644
>> --- a/drivers/extcon/extcon-gpio.c
>> +++ b/drivers/extcon/extcon-gpio.c
>> @@ -56,8 +56,10 @@ static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
>>   {
>>          struct gpio_extcon_data *extcon_data = dev_id;
>>
>> -       queue_delayed_work(system_power_efficient_wq, &extcon_data->work,
>> -                             extcon_data->debounce_jiffies);
>> +       if (extcon_data->debounce_jiffies)
>> +               queue_delayed_work(system_power_efficient_wq,
>> +                                  &extcon_data->work,
>> +                                  extcon_data->debounce_jiffies);
> 
> I am a bit lost about this one. The above means that the workqueue would not be executed
> at all if debounce_jiffies is 0 (and if pdata->debounce is 0), meaning an event would
> never be generated. With the original code, the workqueue will be executed immediately
> if debounce_jiffies is 0, which I think is exactly what we need.
> 
>>          return IRQ_HANDLED;
>>   }
>>
>> @@ -100,7 +102,14 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>>          extcon_data->state_off = pdata->state_off;
>>          if (pdata->state_on && pdata->state_off)
>>                  extcon_data->edev.print_state = extcon_gpio_print_state;
>> -       extcon_data->debounce_jiffies = msecs_to_jiffies(pdata->debounce);
>> +       extcon_data->debounce_jiffies = 0;
>> +       if (pdata->debounce) {
>> +               ret = gpio_set_debounce(extcon_data->gpio,
>> +                                       pdata->debounce * 1000);
>> +               if (ret < 0)
>> +                       extcon_data->debounce_jiffies =
>> +                               msecs_to_jiffies(pdata->debounce);
>> +       }
>>
> Ok, though it is unnecessary to initialize debounce_jiffies (it is pre-initialized
> from the allocation), so I'll drop that line.

OK.

> 
>>          ret = extcon_dev_register(&extcon_data->edev, &pdev->dev);
>>          if (ret < 0)
>> @@ -111,11 +120,6 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>>          if (ret < 0)
>>                  goto err;
>>
>> -       /* Use gpio debounce if available. If so, don't debounce in software. */
>> -       if (pdata->debounce &&
>> -           !gpio_set_debounce(extcon_data->gpio, pdata->debounce * 1000))
>> -               extcon_data->debounce_jiffies = 0;
>> -
>>          INIT_DELAYED_WORK(&extcon_data->work, gpio_extcon_work);
>>
>>          extcon_data->irq = gpio_to_irq(extcon_data->gpio);
>> @@ -146,7 +150,8 @@ static int gpio_extcon_remove(struct platform_device *pdev)
>>   {
>>          struct gpio_extcon_data *extcon_data = platform_get_drvdata(pdev);
>>
>> -       cancel_delayed_work_sync(&extcon_data->work);
>> +       if (extcon_data->debounce_jiffies)
>> +               cancel_delayed_work_sync(&extcon_data->work);
> 
> I think we would have to call cancel_work_sync() in the else case to make sure
> that no work is in the process of being executed - which just turns out to execute
> the same code as cancel_delayed_work_sync(). So the if/else would just add complexity
> with no real gain.

OK.

Thanks,
Chanwoo Choi
