From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH-v3 2/3] mfd: 88pm800: Allow configuration of interrupt
 clear method
Date: Thu, 25 Jun 2015 14:32:34 +0900
Message-ID: <558B9272.6090100@samsung.com>
References: <1435137673-1629-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435137673-1629-3-git-send-email-vaibhav.hiremath@linaro.org>
 <CAJKOXPdqTnkB6Lw4fsJ-=o4=QcYcAtZK0zgOM9aqgesTU=Dw+A@mail.gmail.com>
 <558B90F7.80700@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <558B90F7.80700-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25.06.2015 14:26, Vaibhav Hiremath wrote:
> 
> 
> On Thursday 25 June 2015 05:33 AM, Krzysztof Kozlowski wrote:
>> 2015-06-24 18:21 GMT+09:00 Vaibhav Hiremath
>> <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>>> As per the spec, bit 1 (INT_CLEAR_MODE) of reg addr 0xe
>>> (page 0) controls the method of clearing interrupt
>>> status of 88pm800 family of devices;
>>>
>>>    0: clear on read
>>>    1: clear on write
>>>
>>> This patch allows to configure this field, through DT.
>>>
>>> Also, as suggested by "Lee Jones" renaming DT property and variable
>>> field to appropriate name.
>>>
>>> Signed-off-by: Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> It does not look like a property of the board. Instead it looks like a
>> runtime configuration so it should not be part of DT bindings.
>>
> 
> Why do you say that?
> 
> It is very well feature of 88PM860 device, where you can control irq
> clear operation (either read/write).
> 
> 
> Thanks,
> Vaibhav
> 
>> I understand that previously this was configured by platform data and
>> now you want to move everything to DT. But this does not belong to
>> DT...
>>
> 
> Thats not completely true.
> I think DT is the right place for this configuration.

DT and its bindings describe the specific board or device. Let me quote:
<<The "Open Firmware Device Tree", or simply Device Tree (DT), is a data
structure and language for describing hardware.  More specifically, it
is a description of hardware that is readable by an operating system...>>

Whether you clear interrupts by writing or reading is configured during
runtime and it is completely independent to wiring. Each board with
88pm800 would allow both methods. So this is not a property of hardware
in the terms of open firmware. This is a runtime configuration.

Description of hardware would be a property which specifies whether a
88pm800-like device or a board using 88pm800 device ALLOWS choosing
different interrupt clearing.

Best regards,
Krzysztof


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
