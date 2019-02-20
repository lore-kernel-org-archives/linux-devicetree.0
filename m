From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Wed, 20 Feb 2019 22:47:37 +0530
Message-ID: <ffc39399-a6bc-aabf-b701-d419346f9a71@ti.com>
References: <4791de04-63af-4c5e-db9c-47634fcb8dc9@ti.com>
 <20190214154100.GB5720@atomide.com>
 <b4e821b3-f2fb-41d8-eb8c-8f4e8a19f77c@ti.com>
 <20190214174612.GF5720@atomide.com>
 <171e8597-2156-747d-d024-7b4bfc6f9186@ti.com>
 <20190215161629.GK5720@atomide.com>
 <2369739e-3bc8-257a-99e0-db2951c6777d@ti.com>
 <20190218143245.GC15711@atomide.com>
 <84b3ec21-9ce9-b9a8-80a9-75001db43a90@ti.com>
 <20190219153537.GJ15711@atomide.com> <20190220163651.GS15711@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220163651.GS15711@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, jason@lakedaemon.net, Peter Ujfalusi <peter.ujfalusi@ti.com>, marc.zyngier@arm.com, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On 2/20/2019 10:06 PM, Tony Lindgren wrote:
> Hi,
> 
> Some more info on chained irq vs mux below that might
> help.
> 
> * Tony Lindgren <tony@atomide.com> [190219 15:36]:
>> * Lokesh Vutla <lokeshvutla@ti.com> [190219 08:51]:
>>> With this can you tell me how can we not have a device-tree and still support
>>> irq allocation?
>>
>> Using standard dts reg property to differentiate the interrupt
>> router instances. And if the interrupt router is a mux, you should
>> treat it as a mux rather than a chained interrupt controller.
>>
>> We do have drivers/mux nowadays, not sure if it helps in this case
>> as at least timer interrupts need to be configured very early.
> 
> Adding Linus Walleij to Cc since he posted a good test to
> consider if something should use chained (or nested) irq:
> 
> "individual masking and ACKing bits and can all be used at the
>  same time" [0]

Interrupt Router just routes M inputs to N outputs. One input can only
be mapped to one output. This is a clear case of a hierarchical domain
and the driver is implementing it.

Thanks and regards,
Lokesh

> 
> Not sure if we have that documented somewhere?
> 
> But seems like the interrupt router should be set up as
> a separate mux driver talking with firmware that the
> interrupt controller driver calls on request_irq(>
> Cheers,
> 
> Tony
> 
> 
> [0] https://marc.info/?l=linux-omap&m=155065629529311&w=2
> 
