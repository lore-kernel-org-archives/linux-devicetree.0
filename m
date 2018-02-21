Return-Path: <SRS0=Zag9=FP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:52648 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbeBUITI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 21 Feb 2018 03:19:08 -0500
Subject: Re: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration
 for irq output
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
 <5e9a306c-c2da-3c7b-8fe6-52588ba4c898@electromag.com.au>
 <ef0b68d3-3e3e-4957-8ab4-7d4613a9538c@cesnet.cz>
 <6667369.B4Kk5zL0O4@ws-stein>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <92aa8ace-e707-b12c-11b4-fa290c9ea80e@electromag.com.au>
Date: Wed, 21 Feb 2018 16:19:02 +0800
MIME-Version: 1.0
In-Reply-To: <6667369.B4Kk5zL0O4@ws-stein>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>, =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 21/02/2018 15:11, Alexander Stein wrote:
> On Tuesday, February 20, 2018, 6:15:46 PM CET Jan Kundrát wrote:
>> I was told that the appropriate way forward are device drivers which do not
>> specify the IRQ polarity. Apparently, people are supposed to do that in
>> their DT.
>>
>> So, in this context:
>>
>> - pinctrl-mcp23s08.c should only specify IRQF_ONESHOT | IRQF_SHARED
>> - the DT should use an appropriate IRQ_TYPE_LEVEL_LOW or
>> IRQ_TYPE_LEVEL_HIGH based on what the CPU expects to see on its IRQ pins
>> - the DT must also set a property to configure the MCP23xxx device to
>> *generate* an IRQ by the active-high flag, or another flag for an
>> open-drain active-low IRQ output suitable for connecting directly to an
>> interrupt line which gets shared by several open-drain IRQ producers
>> - whoever supplies the DT must now check that their settings "make sense"
>>
>> Yes, this means that people might have to update their DTs. To me, that
>> makes sense. If you ask me, the DT is already sort-of broken because it's
>> using IRQF_SHARED with a push-pull IRQ output. Yes, one can fix that with
>> extra transistors, but that sounds quite ugly, doesn't it.
> 
> Well, that is the exact situation on the board I had to deal with. The MCP was
> attached to a transisitor inverting the signal. The output on MCP has to be
> push-pull as there was no pull-up oder -down. But the line connecting the
> inverter to the CPU was an open-drain one and this line was actually a shared
> IRQ line. So of course the line bewteen MCP and inverter cannot be shared, but
> the IRQ used on CPU is actually shared. How can this be respresented in DT?
> 
G'day Alexandar,
It can't at the moment. Linux W. proposed modelling a inverter. Basically a irqchip driver
that flips the polarity of the interrupt. I was going to give it a go when I found time.
But it's not a high priority for me.

In your patch at: https://www.spinics.net/lists/devicetree/msg58208.html
This bit in mcp23s08_irq_setup
+	if (mcp->irq_active_high)
+		irqflags |= IRQF_TRIGGER_HIGH;
+	else
+		irqflags |= IRQF_TRIGGER_LOW;

is causing me problems.

It overrides the setting from the dt for me.
Probably due to this bit in __setup_irq:
	/*
	 * If the trigger type is not specified by the caller,
	 * then use the default for this interrupt.
	 */
	if (!(new->flags & IRQF_TRIGGER_MASK))
		new->flags |= irqd_get_trigger_type(&desc->irq_data);


Based on your description I would have thought the same.
With a transisitor inverting the line you'd want to register irq active_low,
while driving active_high to turn the transitor on.
Was this the case?


-- 
Regards
Phil Reid

