Return-Path: <SRS0=RDbo=FO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from office2.cesnet.cz ([195.113.144.244]:47528 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752892AbeBTRPt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Feb 2018 12:15:49 -0500
From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration =?iso-8859-1?Q?for_irq_output?=
Date: Tue, 20 Feb 2018 18:15:46 +0100
MIME-Version: 1.0
Message-ID: <ef0b68d3-3e3e-4957-8ab4-7d4613a9538c@cesnet.cz>
In-Reply-To: <5e9a306c-c2da-3c7b-8fe6-52588ba4c898@electromag.com.au>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
 <1519032320-103817-4-git-send-email-preid@electromag.com.au>
 <56c7f046-21af-4105-a2a0-1a79ceda2858@cesnet.cz>
 <5e9a306c-c2da-3c7b-8fe6-52588ba4c898@electromag.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Alexander Stein <alexander.stein@systec-electronic.com>
List-ID: <devicetree@vger.kernel.org>

>> I think that it would be better to explicitly error out if=20
>> irq_active_high and open_drain are both set. When I sent my=20
>> attempt at this, I did it like this:
>
> Which is something I want to do. As I've got a inverter in between :)
> For the mcp the open-drain config bit takes precedence over active-high.
> Really needs to be fixed by fixing up the irq request, but I=20
> still haven't got a good
> fix for the irq request polarity based on active-high in this driver.
> I can't see how to fix it without breaking existing dt interface.

I was told that the appropriate way forward are device drivers which do not=20=

specify the IRQ polarity. Apparently, people are supposed to do that in=20
their DT.

So, in this context:

- pinctrl-mcp23s08.c should only specify IRQF_ONESHOT | IRQF_SHARED
- the DT should use an appropriate IRQ_TYPE_LEVEL_LOW or=20
IRQ_TYPE_LEVEL_HIGH based on what the CPU expects to see on its IRQ pins
- the DT must also set a property to configure the MCP23xxx device to=20
*generate* an IRQ by the active-high flag, or another flag for an=20
open-drain active-low IRQ output suitable for connecting directly to an=20
interrupt line which gets shared by several open-drain IRQ producers
- whoever supplies the DT must now check that their settings "make sense"

Yes, this means that people might have to update their DTs. To me, that=20
makes sense. If you ask me, the DT is already sort-of broken because it's=20
using IRQF_SHARED with a push-pull IRQ output. Yes, one can fix that with=20
extra transistors, but that sounds quite ugly, doesn't it. The current=20
heuristics only work for some users, and they don't work for you and me.

I dug a bit and found some reasoning [1] for why it was done like that back=20=

in 2014. Adding Alexander Stein to Cc as he wrote that code.

Phil, is that approach something that you agree with? Are you going to=20
submit a patch for this? Or should I do that?

With kind regards,
Jan

[1] https://www.spinics.net/lists/devicetree/msg60203.html
