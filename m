Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39760 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbfHNT53 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2019 15:57:29 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
Date: Wed, 14 Aug 2019 21:57:24 +0200
MIME-Version: 1.0
In-Reply-To: <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 8/14/19 9:46 PM, Oleh Kravchenko wrote:
> Hello Jacek,
> 
> 14.08.19 21:18, Jacek Anaszewski пише:
>>>> Why the sequence "1 800 2 800 4 800 8 800 16 800" is duplicated here?
>>>> It seems redundant. But aside of that - aren't the timings modifiable?
>>>> In other words - are these all patterns somehow configurable or they are
>>>> pre-programmed?
>>>>
>>>
>>> All pattern is predefined, you can't change them at all.
>>> I just tried to describe real things what happened in LED board.
>>> It's ticks every 800 milliseconds for Pipe LEDs.
>>
>> It makes me wonder how you figured out the values? If you have
>> a documentation for this controller, could you share how the pattern
>> settings are documented?
> 
> I saw the code of firmware.
> Not sure if I can find any documentation for it right now.

Have you tried to alter the values? Or check what happens when
the duplication is removed?

>>>>> +
>>>>> +		Inverted cascade mode for Pipe LED:
>>>>> +		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 15 800"
>>>>
>>>> Similar duplication here.
>>>>
>>>>> +
>>>>> +		Bounce mode for Pipe LED:
>>>>> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
>>>>
>>>> Instead of two repeating "16 800" you could provide "16 1600".
>>>> But here again is the question whether these values are configurable.
>>>> From what I can see in your driver implementation you're expecting
>>>> exactly the values provided in these examples to enable given hardware
>>>> pattern (led_pattern_cmp()).
>>>>
>>>>> +
>>>>> +		Inverted bounce mode for Pipe LED:
>>>>> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"
>>>>
>>>
>>> Should I cut this patterns to smaller? Or let keep it?
>>>
>>
>> For the first two we could do without sequence duplication.
> 
> Ok, I will reduce it.

Please hold on for a while. I will have some more remarks to the driver,
just collecting missing info for now to gain more complete view on this
device.

-- 
Best regards,
Jacek Anaszewski
