Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57358 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbfFGUJ3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Jun 2019 16:09:29 -0400
Subject: Re: [PATCH 2/2] leds: add LED driver for EL15203000 board
References: <20190607114823.3735-1-oleg@kaa.org.ua>
 <20190607114823.3735-2-oleg@kaa.org.ua>
 <f0ec5988-77c2-b0fa-045d-ec6a7445fc48@ti.com>
 <a2382176-f4f5-b346-0b9f-bf59d047b8a6@kaa.org.ua>
 <39d78c5c-01b0-23ce-6d01-d6baa7a34159@ti.com>
 <ef09e290-719e-3cd9-f3a9-e13be8ce9c1e@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <892f52e2-8e9c-dabe-a899-b79e8ffdcb5a@ti.com>
Date: Fri, 7 Jun 2019 15:09:24 -0500
MIME-Version: 1.0
In-Reply-To: <ef09e290-719e-3cd9-f3a9-e13be8ce9c1e@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Oleh

On 6/7/19 3:05 PM, Oleh Kravchenko wrote:
> Dan,
>
> 07.06.19 22:41, Dan Murphy пише:
>> Oleh
>>
>> On 6/7/19 12:46 PM, Oleh Kravchenko wrote:
>>>> These can be #defined which makes them desctiptive
>>>>
>>>> #define EL15203000_LED_OFF     0x30
>>>>
>>>> #define EL15203000_LED_ON     0x31
>>>>
>>>> and so on
>>> Hm, but just adding 0x30 not will be more clear and faster?
>>> I think switch .. case or if .. else, will be more hard to read :)
>> Huh?
>>
>> You had to explain what the value 0x3X meant in a comment.  So clarity is not there.  Faster?
>>
>> The #define LED_?? makes sense without having to explain the protocol.  What is 0x30?
>>
>> And I am not seeing any switch..case or if..else in the code using these values but if it was defined it would be easier to read.
>>
>> Why would this value be in a switch..case or if..else if it is just a protocol value?
>>
>> You have 1 line of code that uses the 0x30 so maybe you don't need to define LED_ON and LED_OFF but this value means something
>>
>> and that should be #defined as there is no understanding what the 0x30 is actually doing.
>>
>> cmd[1] =  EL15203000_LED_???? + (u8)brightness;
> I described it in top of the file. Looks likes it's not clear.
> LED board has next brightness level:
> 	'0' - 0x30
> 	'1' - 0x31
> 	'2' - 0x32
>
>
I understand it but all I am saying is that 0x30 should have a #define 
we try not to use magic numbers.

And per the DT 0x32 is not a brightness but a feature so technically 
your max_brightness is 1.  And you should expose a different

file for the effects.  Because 0x32 is not a brightness level as it does 
not affect brightness but I guess it does something special.

Dan


>>>>> +        if (reg > U8_MAX) {
>>>>> +            dev_err(priv->dev, "LED value %d is invalid", reg);
>>>>> +            fwnode_handle_put(child);
>>>>> +
>>>>> +            return -ENODEV;
>>>> -EINVAL
>>> Done
>>>
>>>>> +        }
>>>>> +        led->reg = reg;
>>>>> +
>>>>> +        ret = fwnode_property_read_string(child, "label", &str);
>>>>> +        if (ret)
>>>>> +            snprintf(led->name, sizeof(led->name),
>>>>> +                 "el15203000::");
>>>>> +        else
>>>>> +            snprintf(led->name, sizeof(led->name),
>>>>> +                 "el15203000:%s", str);
>>>>> +
>>>>> +        fwnode_property_read_string(child, "linux,default-trigger",
>>>>> +                        &led->ldev.default_trigger);
>>>>> +
>>>>> +        led->priv              = priv;
>>>>> +        led->ldev.name              = led->name;
>>>>> +        led->ldev.max_brightness      = LED_ON;
>>>> Do not need this as it should be stored when doing the fwnode read.
>>> This is default value 1, by dtb we can override it to 2.
>> This has code some other issues.  I will comment in your v2.
> Thanks
>
>> Dan
>>
