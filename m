Return-Path: <SRS0=Zag9=FP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:53815 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbeBUAvt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Feb 2018 19:51:49 -0500
Subject: Re: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration
 for irq output
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
 <1519032320-103817-4-git-send-email-preid@electromag.com.au>
 <56c7f046-21af-4105-a2a0-1a79ceda2858@cesnet.cz>
 <5e9a306c-c2da-3c7b-8fe6-52588ba4c898@electromag.com.au>
 <ef0b68d3-3e3e-4957-8ab4-7d4613a9538c@cesnet.cz>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <cdd5da99-c155-194a-1c60-f38f3951e086@electromag.com.au>
Date: Wed, 21 Feb 2018 08:51:41 +0800
MIME-Version: 1.0
In-Reply-To: <ef0b68d3-3e3e-4957-8ab4-7d4613a9538c@cesnet.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Alexander Stein <alexander.stein@systec-electronic.com>
List-ID: <devicetree@vger.kernel.org>

On 21/02/2018 01:15, Jan Kundrát wrote:
>>> I think that it would be better to explicitly error out if irq_active_high and open_drain are both set. When I sent my attempt at this, I did it like this:
>>
>> Which is something I want to do. As I've got a inverter in between :)
>> For the mcp the open-drain config bit takes precedence over active-high.
>> Really needs to be fixed by fixing up the irq request, but I still haven't got a good
>> fix for the irq request polarity based on active-high in this driver.
>> I can't see how to fix it without breaking existing dt interface.
> 
> I was told that the appropriate way forward are device drivers which do not specify the IRQ polarity. Apparently, people are supposed to do that in their DT.
yes, That's what I've been told as well
> 
> So, in this context:
> 
> - pinctrl-mcp23s08.c should only specify IRQF_ONESHOT | IRQF_SHARED
yeap.
> - the DT should use an appropriate IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH based on what the CPU expects to see on its IRQ pins
yeap
> - the DT must also set a property to configure the MCP23xxx device to *generate* an IRQ by the active-high flag, or another flag for an open-drain active-low 
> IRQ output suitable for connecting directly to an interrupt line which gets shared by several open-drain IRQ producers
> - whoever supplies the DT must now check that their settings "make sense"
> 
> Yes, this means that people might have to update their DTs. To me, that makes sense. If you ask me, the DT is already sort-of broken because it's using 
> IRQF_SHARED with a push-pull IRQ output. Yes, one can fix that with extra transistors, but that sounds quite ugly, doesn't it. The current heuristics only work 
> for some users, and they don't work for you and me.
I think IRQF_SHARED is fine as a push pull irq output can be shared via and AND / OR gate.
The only reason not to IRQF_SHARED is when you can't determine if the IRQ is from this device.
ie: There's no register to read in the potential source to see if the IRQ is asserted.

> 
> I dug a bit and found some reasoning [1] for why it was done like that back in 2014. Adding Alexander Stein to Cc as he wrote that code.
> 
> Phil, is that approach something that you agree with? Are you going to submit a patch for this? Or should I do that?
Yes, It'd be nice to remove the IO_CON read in probe and explicitly set the  IO_CON register purely on the DT.

> 
> With kind regards,
> Jan
> 
> [1] https://www.spinics.net/lists/devicetree/msg60203.html
> 
> 

Hmm, the description in the patch is what I want the driver to do.

On Thu, Nov 27, 2014 at 3:36 PM, Alexander Stein
> What I need to do, is to change the interrupt polarity (to active high) at MCP23S17 while retaining the interrupt polarity on the controller as active-low.

But that's not what it does. As irqflags is set to match the chip output polarity in irq_setup
(Well it certainly doesn't for me).

Problem with changing the DT behaviour is, I believe it's consider an ABI and shouldn't be changed.


-- 
Regards
Phil Reid

