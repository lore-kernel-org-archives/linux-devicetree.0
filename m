Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46789 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfHNUx1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2019 16:53:27 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
 <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>
Date: Wed, 14 Aug 2019 22:53:22 +0200
MIME-Version: 1.0
In-Reply-To: <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 8/14/19 10:16 PM, Oleh Kravchenko wrote:
> Hello Jacek,
> 
> 14.08.19 22:57, Jacek Anaszewski пише:
>>>>>
>>>>> All pattern is predefined, you can't change them at all.
>>>>> I just tried to describe real things what happened in LED board.
>>>>> It's ticks every 800 milliseconds for Pipe LEDs.
>>>>
>>>> It makes me wonder how you figured out the values? If you have
>>>> a documentation for this controller, could you share how the pattern
>>>> settings are documented?
>>>
>>> I saw the code of firmware.
>>> Not sure if I can find any documentation for it right now.
>>
>> Have you tried to alter the values? Or check what happens when
>> the duplication is removed?
> 
> What do you mean alter? It doesn't make any sense.
> Board is accepts only brightness level from '0' to '5'.
> I'm really confused :-)

OK, I didn't analyze the driver thoroughly enough.
Now everything is clear to me. Patterns are triggered just
by writing two-byte command.

>>>>
>>>> For the first two we could do without sequence duplication.
>>>
>>> Ok, I will reduce it.
>>
>> Please hold on for a while. I will have some more remarks to the driver,
>> just collecting missing info for now to gain more complete view on this
>> device.
> 
> Here is the full story:
> 
> EL15203000 LEDs board (aka RED LEDs board, because it has only RED LEDs).
> It's provide access to 3 LEDs:
> 
> - First LED (Screen) is a light tube around big 21" screen
>   It's have 3 brightness levels:
>   * OFF
>   * ON
>   * Breathing mode (8 seconds full cycle)

OK, so this is LED string. We would need to bend rules to make it
appearing as a single LED class device, but allowing non-synchronous
blinking of LEDs in the string.

> - Second LED (Vending area) is highlight coffee cap
>   * OFF
>   * ON
> - Third LED (Pipe) is actually virtual, because consists from 5 LEDs
>   * OFF for all 5 LEDs
>   * ON for all 5 LEDs
>   * Cascade
>   * Inverses cascade
>   * Bounce
>   * Inverses bounce
Similarly in case of this one. I will give you a feedback on how
to define the patterns within few days.

-- 
Best regards,
Jacek Anaszewski
