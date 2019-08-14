Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32988 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfHNSTC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2019 14:19:02 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
Date: Wed, 14 Aug 2019 20:18:56 +0200
MIME-Version: 1.0
In-Reply-To: <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Oleh,

On 8/13/19 10:37 PM, Oleh Kravchenko wrote:
> Hello Jacek,
> 
> Thank you for your useful review,
> 
> 13.08.19 23:28, Jacek Anaszewski пише:
>> Hi Oleh,
>>
>> Thank you for the patch set.
>>
>> On 8/8/19 10:32 PM, Oleh Kravchenko wrote:
>>> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>>> @@ -0,0 +1,22 @@
>>> +What:		/sys/class/leds/<led>/hw_pattern
>>> +Date:		August 2019
>>> +KernelVersion:	5.3
>>> +Description:
>>> +		Specify a hardware pattern for the EL15203000 LED.
>>> +		The LEDs board supports only predefined patterns by firmware
>>> +		for specific LEDs.
>>> +
>>> +		Breathing mode for Screen frame light tube:
>>> +		"0 4000 1 4000"
>>> +
>>> +		Cascade mode for Pipe LED:
>>> +		"1 800 2 800 4 800 8 800 16 800 1 800 2 800 4 800 8 800 16 800"
>>
>> Why the sequence "1 800 2 800 4 800 8 800 16 800" is duplicated here?
>> It seems redundant. But aside of that - aren't the timings modifiable?
>> In other words - are these all patterns somehow configurable or they are
>> pre-programmed?
>>
> 
> All pattern is predefined, you can't change them at all.
> I just tried to describe real things what happened in LED board.
> It's ticks every 800 milliseconds for Pipe LEDs.

It makes me wonder how you figured out the values? If you have
a documentation for this controller, could you share how the pattern
settings are documented?

>>> +
>>> +		Inverted cascade mode for Pipe LED:
>>> +		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 15 800"
>>
>> Similar duplication here.
>>
>>> +
>>> +		Bounce mode for Pipe LED:
>>> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
>>
>> Instead of two repeating "16 800" you could provide "16 1600".
>> But here again is the question whether these values are configurable.
>> From what I can see in your driver implementation you're expecting
>> exactly the values provided in these examples to enable given hardware
>> pattern (led_pattern_cmp()).
>>
>>> +
>>> +		Inverted bounce mode for Pipe LED:
>>> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"
>>
> 
> Should I cut this patterns to smaller? Or let keep it?
> 

For the first two we could do without sequence duplication.

-- 
Best regards,
Jacek Anaszewski
