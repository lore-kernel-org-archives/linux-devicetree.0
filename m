From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 05/22] ARM: dts: at91: Add generic compatible string
 for I2C EEPROM
Date: Thu, 13 Apr 2017 20:46:55 -0300
Message-ID: <021d8065-9d7a-f9ef-a497-f9c467d1e6d8@osg.samsung.com>
References: <20170413182839.25381-1-javier@osg.samsung.com>
 <20170413182839.25381-6-javier@osg.samsung.com>
 <869a0f44-6c97-2109-776b-6da9b86c732a@axentia.se>
 <dd93eb32-ca1e-5041-051e-c4f072f0f9a2@osg.samsung.com>
 <20170413212059.unh2mfo2w4oc4t33@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413212059.unh2mfo2w4oc4t33@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Hello Alexandre,

On 04/13/2017 06:20 PM, Alexandre Belloni wrote:
> On 13/04/2017 at 18:09:56 -0300, Javier Martinez Canillas wrote:
>> Hello Peter,
>>
>> On 04/13/2017 05:43 PM, Peter Rosin wrote:
>>> On 2017-04-13 20:28, Javier Martinez Canillas wrote:
>>
>> [snip]
>>
>>>>  
>>>>  	eeprom@50 {
>>>> -		compatible = "nxp,24c02";
>>>> +		compatible = "nxp,24c02","atmel,24c02";
>>>>  		reg = <0x50>;
>>>>  		pagesize = <16>;
>>>>  	};
>>>>
>>>
>>> Sure, in principle. But not having a space after the commas is a real OCD
>>> trigger for me. My spine is rotating... :-)
>>>
>>
>> Right, Geert already pointed out. It's something I missed in my sed script
>> so I got it wrong in all the DTS :(
>>
>> I'll fix my script and send a v2.
>>
> 
> That would be v3, right? ;)
> 

err, right :)

>>> Anyway, with those whitespace fixes (and without them too, but please):
>>> Acked-by: Peter Rosin <peda@axentia.se>
>>>
>>
>> Thanks for the review!
>>
> 
> I'd like to be copied on the first patches to ensure they are applied
> before applying that one. (Also, it is probably too late for 4.12 anyway

Ok, I'll copy you on the whole patch-set. But keep in mind that there is
no strict order since $SUBJECT without the at24 OF table is a no-op (the
match happens between first device in compatible string and I2C table).

> because we are past rc6).
>

Yes, there's no rush on applying these. I'm just posting all the patches
needed to finally have a proper OF modalias reporting in the I2C core.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
