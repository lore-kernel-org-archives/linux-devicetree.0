From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH 0/2] Add bcm2835aux interrupt controller
Date: Wed, 7 Jun 2017 21:55:27 +0100
Message-ID: <89e725de-c77d-6a24-3ae5-9acb061cd6bb@raspberrypi.org>
References: <6dc301c8-e5a2-1334-c476-1ce7e303787f@raspberrypi.org>
 <1357388068.219504.1496867858076@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1357388068.219504.1496867858076@email.1und1.de>
Sender: linux-clk-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: alexanders83@web.de, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/06/2017 21:37, Stefan Wahren wrote:
> Hi Phil,
>
>> Phil Elwell <phil@raspberrypi.org> hat am 7. Juni 2017 um 13:11 geschrieben:
>>
>>
>> Devices in the AUX block share a common interrupt line, with a register
>> indicating which devices have active IRQs. Expose this as a nested
>> interrupt controller to avoid IRQ sharing problems (easily observed if
>> UART1 and SPI1/2 are enabled simultaneously).
>>
>> The interrupt functionality could arguably be forked off as a separate
>> irqchip driver, but the clock driver has already claimed the AUX_IRQ
>> register so some driver and DT surgery would still be required.
>> Eric Anholt thought that including it here is reasonable, but I'm
>> prepared to split it out if this is considered too hacky.
>
> in order to give the maintainers (e.g. irqchip) a chance, they should be included into CC.

Will do.

>> Phil Elwell (2):
>>   clk: bcm2835: Add AUX interrupt controller
>
> Either way the dt-binding must be updated as a separate patch. So Rob can review it.

Thanks, Stefan - I'll add that to v2.

Phil

