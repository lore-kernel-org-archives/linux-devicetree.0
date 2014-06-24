Return-Path: <alexander.sverdlin@nsn.com>
Message-ID: <53A99CB5.70704@nsn.com>
Date: Tue, 24 Jun 2014 17:43:49 +0200
From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com> <53A85549.7040809@nsn.com> <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com> <20140623183343.GA10389@heimdall> <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com> <53A8848A.3000803@roeck-us.net> <F23F6108-A3BE-47CB-B545-4F40520979BF@konsulko.com> <CAL_Jsq+wdybDOWtEJFiRn7TMxAdJ8at27G_KvCHkO_444hqZuw@mail.gmail.com> <53A982ED.3070709@nsn.com> <CAL_Jsq+H6qu_Bvs=3+c6EXCmpO7L9vGUmgxDHeqtUKiT+2+0GA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+H6qu_Bvs=3+c6EXCmpO7L9vGUmgxDHeqtUKiT+2+0GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: ext Rob Herring <robherring2@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Guenter Roeck <linux@roeck-us.net>, Ioan Nicu <ioan.nicu.ext@nsn.com>, Grant Likely <grant.likely@secretlab.ca>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On 24/06/14 16:49, ext Rob Herring wrote:
>>>>>> If that's the case, the code in irq.c is wrong.
>>>>>>
>>>>>> interrupt-controller is a bool property; the correct call to use is of_property_read_bool()
>>>>>> which returns true or false when the value is defined.
>>>>>>
>>>>>> The use of of_get_property is a bug here. It is perfectly valid for a property to have a
>>>>>> NULL value when length = 0.
>>>>>>
>>>>>
>>>>> That usage is spread throughout the code though. There are three or four similar checks
>>>>> for interrupt-controller in the code, and many others using of_get_property() to check
>>>>> for booleans.
>>>>>
>>>>> Some examples:
>>>>>       s5m8767,pmic-buck2-ramp-enable
>>>>>       s5m8767,pmic-buck3-ramp-enable
>>>>>       s5m8767,pmic-buck4-ramp-enable
>>>>>       d7s-flipped?
>>>>>       atmel,use-dma-rx
>>>>>       linux,rs485-enabled-at-boot-time
>>>>>       marvell,enable-port1 (and many others)
>>>>>       linux,bootx-noscreen
>>>>>       linux,opened
>>>>>
>>>>> and many many others.
>>>>>
>>>>> Maybe people meant to use of_find_property() ?
>>>>>
>>>>
>>>> I bet... I see a lot of users doing if (of_get_property()).
>>>>
>>>> Which is no good.
>>>
>>> I don't see what the issue is. The irq.c code is correct. The code is
>>> checking for existence of a property or not and of_get_property
>>> adequately does that. of_find_property is equivalent in this case. Now
>>
>> The code is correct and the functions are equal as long as we declare that
>> void property has value != NULL. Which must not be actually and the patch
>> from Pantelis actually creates this situation first time.
>>
>> So let's first agree, how should the empty property look like.
>> length should be 0, it's clear. But what about the value?
> 
> Actually, it is really only about what of_get_property's behavior is,
> and I'm saying it should remain as is. You could also make
> of_get_property return an empty string if prop->value is NULL. That
> could still possibly break some callers of of_find_property which

This will not brake anything and especially of_find_property() users,
but it's even worse hack, than to ensure value!=NULL :)

> would need fixing. But there's ~300 callers vs. ~1300 for
> of_get_property. In scanning thru of_find_property callers, it look
> like in general they are okay if prop->value changed to NULL.

Most of the 1300 uses of of_get_property() are valid, because they want the
value directly. Only some of them, who actually only checks for the existence of
the property are wrong and must use of_find_property(). 

> Unless there is some difficulty to support, the lower risk approach is
> just ensure prop->value is not NULL.

-- 
Best regards,
Alexander Sverdlin.
