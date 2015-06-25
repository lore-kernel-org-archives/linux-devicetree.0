From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v3 2/3] mfd: 88pm800: Allow configuration of interrupt
 clear method
Date: Thu, 25 Jun 2015 11:27:33 +0530
Message-ID: <558B984D.9040309@linaro.org>
References: <1435137673-1629-1-git-send-email-vaibhav.hiremath@linaro.org> <1435137673-1629-3-git-send-email-vaibhav.hiremath@linaro.org> <CAJKOXPdqTnkB6Lw4fsJ-=o4=QcYcAtZK0zgOM9aqgesTU=Dw+A@mail.gmail.com> <558B90F7.80700@linaro.org> <558B9272.6090100@samsung.com> <558B9549.5010705@linaro.org> <558B96B7.3030501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558B96B7.3030501-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thursday 25 June 2015 11:20 AM, Krzysztof Kozlowski wrote:
> On 25.06.2015 14:44, Vaibhav Hiremath wrote:
>>
>>
>> On Thursday 25 June 2015 11:02 AM, Krzysztof Kozlowski wrote:
>>> On 25.06.2015 14:26, Vaibhav Hiremath wrote:
>>>>
>>>>
>>>> On Thursday 25 June 2015 05:33 AM, Krzysztof Kozlowski wrote:
>>>>> 2015-06-24 18:21 GMT+09:00 Vaibhav Hiremath
>>>>> <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>>>>>> As per the spec, bit 1 (INT_CLEAR_MODE) of reg addr 0xe
>>>>>> (page 0) controls the method of clearing interrupt
>>>>>> status of 88pm800 family of devices;
>>>>>>
>>>>>>      0: clear on read
>>>>>>      1: clear on write
>>>>>>
>>>>>> This patch allows to configure this field, through DT.
>>>>>>
>>>>>> Also, as suggested by "Lee Jones" renaming DT property and variable
>>>>>> field to appropriate name.
>>>>>>
>>>>>> Signed-off-by: Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>>>>>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>>
>>>

<snip>

>>
>> Yes,
>> Fair enough...
>>
>> I see very little value in runtime configuration, why not just do it
>> only way (either read or write)?
>> I would prefer to just set it by default (during init), to clear irq on
>> write.
>
> Hard-coding a default value, if board files are not present, looks OK to me.
>

This is how it will look, I will also update the binding information
with this.


hvaibhav@hvaibhav-ThinkPad-T440p:~/projects/mainline/linux$ git diff 
--cached
diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index 0a417ac..e415a06 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -645,9 +645,8 @@ static int pm800_probe(struct i2c_client *client,
                         dev_err(&client->dev, "failed to allocaate 
memory\n");
                         return -ENOMEM;
                 }
-
-               pdata->irq_clr_on_wr = of_property_read_bool(np,
-                                       "marvell,irq-clr-on-write");
+               /* Setting irq clear method on write */
+               pdata->irq_clr_on_wr = true;
         }

         ret = pm80x_init(client);



Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
