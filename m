Return-Path: <SRS0=60bI=UI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41750 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfFIMXW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 9 Jun 2019 08:23:22 -0400
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <44b77942-232d-4b23-1da9-f59644492d74@gmail.com>
Date: Sun, 9 Jun 2019 14:23:18 +0200
MIME-Version: 1.0
In-Reply-To: <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Oleh,

On 6/7/19 11:48 PM, Oleh Kravchenko wrote:
> Jacek,
> 
> 08.06.19 00:23, Jacek Anaszewski пише:
>> Hi Oleh.
>>
>> On 6/7/19 11:17 PM, Oleh Kravchenko wrote:
>>> Dan,
>>>
>>> On 08.06.19 00:04, Dan Murphy wrote:
>>>> Oleh
>>>> But this is not really max_brightness now this is a feature and now
>>>> does not make sense in this context
>>>>>>
>>>>>> You may need to use something different for this property or expose
>>>>>> a file in the driver.
>>>>>>
>>>>>>
>>>>> Protocol for this board define 0x32 as brightness level.
>>>>> This behaviur needed to keep backward compatibity.
>>>>>
>>>>>
>>>> Backwards compatibility to what?
>>> With old/new boards.
>>
>> You have in your driver the following:
>>
>> + * BRIGHTNESS    Can be 0x30 (OFF), 0x31 (ON).
>> + *         0x32 (Effect) can be used for 0x50 (leaking) and
>> + *         for 0x53 (blinking)
>>
>> If your max-brightness DT property is to be used for controlling this,
>> then I don't see how it would be backward compatible with anything.
>>
>> Clearly, you don't need max-brightness DT property at all.
> 
> What I should do with board which accept brightness in range 0x30 - 0x3a?
> Where 0x3a means special effect.

I believe 0x3a is a typo since above you have 0x32 for the effect.

Anyway, we shouldn't propagate hardware design flaws to the userspace
interface. You have ON/OFF register values for manipulating brightness,
so use them appropriately. struct led_classdev's max_brightness property
should be set to 1, as already pointed out by Dan.

>> For blinking you can use blink_set op. To be able to recommend
>> you anoptimal solution for the effect we would need more
>> details regarding its nature.
> 
> Thanks, I will do that.
> But how to properly handle other effects? Not only blinking?

For the effects we could probably use pattern trigger, but we need
more information on how it can be configured.

> And how to define it by device tree?
> Driver can't get this information about what is really supported.
> I don't want define effect code inside DT.

We now have led-pattern DT property, which allows to initialize a LED
with the DT provided pattern
(see Documentation/devicetree/bindings/leds/common.txt).

>>>> This is a new driver there should be no DT that has this compatible or
>>>> definition.
>>>>
>>>> I will let Rob ack or nack this node.
>>>>
>>>> Dan
>>>>
>>>
>>>
>>
> 

-- 
Best regards,
Jacek Anaszewski
