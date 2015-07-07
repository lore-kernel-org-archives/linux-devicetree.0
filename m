From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH-v2] rtc: 88pm80x: add device tree support
Date: Tue, 07 Jul 2015 12:07:14 +0530
Message-ID: <559B739A.3080300@linaro.org>
References: <vaibhav.hiremath@linaro.org> <1434567488-6477-1-git-send-email-vaibhav.hiremath@linaro.org> <1434567488-6477-3-git-send-email-vaibhav.hiremath@linaro.org> <20150620004354.GY27492@piout.net> <558BB1C1.2090400@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558BB1C1.2090400-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Thursday 25 June 2015 01:16 PM, Vaibhav Hiremath wrote:
>
>
> On Saturday 20 June 2015 06:13 AM, Alexandre Belloni wrote:
>> Hi,
>>
>
> Sorry I missed this email.
> Just wanted to send reminder email and saw this :)
>
>> On 18/06/2015 at 00:28:06 +0530, Vaibhav Hiremath wrote :
>>> -    pdata = dev_get_platdata(&pdev->dev);
>>> -    if (pdata == NULL)
>>> -        dev_warn(&pdev->dev, "No platform data!\n");
>>> +    if (!pdata && !node) {
>>> +        dev_err(&pdev->dev,
>>> +            "pm80x-rtc requires platform data or of_node\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (!pdata) {
>>> +        pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>>
>> I had troubles to follow the rtc_wakeup initialization cleanup but it
>> seems OK.
>
> Probably, once we have complete PM support ready then it would be
> easier to understand. I think as of now lets have this minimal code for
> rtc_wakeup.
>
>> However, I'm wondering why you are adding DT support as this
>> will always be probed from the MFD driver which pass the platform_data
>> and avoids that allocation.
>>
>
> You are right.
>
> Originally, it was cleanup patch,
>
>   - remove pm80x_pdata
>   - Add check for pdata and np
>   - and around rtc_wakeup
>
> While doing that I added this nice to have allocation.
>

Any update/feedback on this?

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
