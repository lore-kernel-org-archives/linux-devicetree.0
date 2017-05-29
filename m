From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v4 0/2] cec: STM32 driver
Date: Mon, 29 May 2017 11:20:15 +0200
Message-ID: <1a1685a9-c1c6-07db-6a3e-fe973d35086f@xs4all.nl>
References: <1496046855-5809-1-git-send-email-benjamin.gaignard@linaro.org>
 <5ef1d96d-dc5f-49b9-0650-51d086efc226@xs4all.nl>
 <CA+M3ks5gdzAGx9suKnz-=4Aw5DiigLGFjOA5xqunzDEL8MmPBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+M3ks5gdzAGx9suKnz-=4Aw5DiigLGFjOA5xqunzDEL8MmPBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/29/2017 11:07 AM, Benjamin Gaignard wrote:
> 2017-05-29 10:54 GMT+02:00 Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>:
>> Hi Benjamin,
>>
>> On 05/29/2017 10:34 AM, Benjamin Gaignard wrote:
>>>
>>> version 4:
>>> - rebased on Hans cec-config branch
>>> - rework bindings commit message
>>> - add notifier support
>>
>>
>> I really don't like this change. This forced me to think about this a bit
>> more,
>> and I think this requires another change as well.
>>
>> The problem you have is that the drm driver for this platform isn't ready
>> yet,
>> so this CEC driver needs userspace to provide a physical address since it
>> can't
>> use a notifier.
>>
>> Trying to support both is a bad idea since this runs the risk that we will
>> forget
>> to remove the CAP_PHYS_ADDR path later.
> 
> I would like stm32 cec driver to be able to work with or without
> notifier support.
> stm32 are small platforms and not everybody will use hdmi because of memory
> consomption but cec can be used anyway.

Ah, that's a good point.

So drop the notifier and add a comment where you describe that once the drm
driver becomes available notifier support will be added, but that CAP_PHYS_ADDR
remains allowed in cases where the drm driver isn't enabled due to the small
size of the platform.

With that comment it can stay in mainline.

When the drm driver arrives the notifier should probably be automatically
selected when the drm driver is enabled. I want to avoid the combination of
CAP_PHYS_ADDR and a drm driver, that shouldn't happen.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
