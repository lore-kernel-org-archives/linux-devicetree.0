Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38749 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751249Ab3HTXHZ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 19:07:25 -0400
Message-id: <5213F6AB.80307@samsung.com>
Date: Wed, 21 Aug 2013 08:07:23 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
MIME-version: 1.0
Subject: Re: [PATCH 1/2] extcon: extcon-dra7xx: Add extcon driver for USB ID
 detection
References: <1376648029-30659-1-git-send-email-george.cherian@ti.com>
 <1376648029-30659-2-git-send-email-george.cherian@ti.com>
 <5212B740.2000000@samsung.com> <521338B7.7040208@ti.com>
 <52134513.1060304@samsung.com> <52136E1A.8020900@ti.com>
In-reply-to: <52136E1A.8020900@ti.com>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: George Cherian <george.cherian@ti.com>
Cc: balbi@ti.com, myungjoo.ham@samsung.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, rob@landley.net, ian.campbell@citrix.com, swarren@wwwdotorg.org, mark.rutland@arm.com, pawel.moll@arm.com, rob.herring@calxeda.com, linux-omap@vger.kernel.org, linux-usb@vger.kernel.org, bcousson@baylibre.com
List-ID: <devicetree@vger.kernel.org>

>>>>> +
>>>>> +    if (dra7xx_usb->irq_gpio) {
>>>>> +        status = devm_request_threaded_irq(dra7xx_usb->dev, irq_num,
>>>>> +                NULL, id_irq_handler, IRQF_SHARED |
>>>>> +                IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
>>>>> +                dev_name(&pdev->dev), (void *) dra7xx_usb);
>>>>> +        if (status)
>>>>> +            dev_err(dra7xx_usb->dev, "failed to request irq #%d\n",
>>>>> +                        irq_num);
>>>> If devm_request_threaded_irq() return fail state, why did not you do add error exception?
>>> If interrupt fails I fallback to polling thread.
>>>>> +        else
>>>>> +            return 0;
>>>> If devm_request_threaded_irq() return success state, why did you directly call 'return'?
>>>> kthread_create operation isn't necessary?
>>> Yes kthread is optional. Some boards doenot have the ID pin hooked onto the GPIO.
>>> In such cases we will run the kthread and poll on the ID pin values.
>>>>> +    }
>>>>> +
>>>>> +    dra7xx_usb->thread_task = kthread_create(id_poll_func, dra7xx_usb,
>>>>> +                         dev_name(&pdev->dev));
>>>> Should you use polling method with kthread? I think it isn't proper method.
>>>> You did get the irq number by using DT helper function and register irq handler
>>>> with devm_request_threaded_irq(). I prefer interrupt method for detection of cable state.
>>> I also prefer interrupt method. If any implementation does not have ID pin connected to GPIOs then still
>>> it could use the driver in polling mode.
>> As I mentioned above, I don't prefer interrupt method for cable detection.
> 
> I hope you meant, you prefer interrupt method for cable detection over polling .

Right, my mistake. I prefer interrupt method.

Thanks,
Chanwoo CHoi


