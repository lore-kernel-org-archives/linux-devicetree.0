From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v3 1/6] irqchip: add support for Marvell Orion SoCs
Date: Tue, 11 Jun 2013 15:37:15 +0200
Message-ID: <51B7280B.7080604@gmail.com>
References: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com> <1370536034-23956-2-git-send-email-sebastian.hesselbarth@gmail.com> <alpine.LFD.2.02.1306111045520.22970@ionos> <alpine.LFD.2.02.1306111525180.22970@ionos>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.02.1306111525180.22970@ionos>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, John Stultz <john.stultz@linaro.org>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/11/13 15:30, Thomas Gleixner wrote:
> On Tue, 11 Jun 2013, Thomas Gleixner wrote:
>
>> On Thu, 6 Jun 2013, Sebastian Hesselbarth wrote:
>>
>>> This patch adds an irqchip driver for the main interrupt controller found
>>> on Marvell Orion SoCs (Kirkwood, Dove, Orion5x, Discovery Innovation).
>>> Corresponding device tree documentation is also added.
>>>
>>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>>
>> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>
> Second thoughts:
>
>> +static void orion_bridge_irq_handler(unsigned int irq, struct irq_desc *desc)
>> +{
>> +	struct irq_domain *d = irq_get_handler_data(irq);
>> +	struct irq_chip_generic *gc = irq_get_domain_generic_chip(d, irq);
>> +	u32 stat = readl_relaxed(gc->reg_base + ORION_BRIDGE_IRQ_CAUSE) &
>> +		gc->mask_cache;
>
> In init you map the first irq of that chip and install the chain
> handler for it. Now if that first irq fires, isn't that set in the
> cause register as well? And what acks that first irq?

It is "acked" by acking all unmasked bridge irqs.

Sebastian

