From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Wed, 13 Feb 2019 09:55:22 +0530
Message-ID: <6a274588-0fb6-2ddf-3bcc-f9e4d849ac07@ti.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <20190212162247.GK5720@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212162247.GK5720@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On 12/02/19 9:52 PM, Tony Lindgren wrote:
> Hi,
> 
> * Lokesh Vutla <lokeshvutla@ti.com> [190212 07:43]:
>> +Example:
>> +--------
>> +The following example demonstrates both interrupt router node and the consumer
>> +node(main gpio) on the AM654 SoC:
>> +
>> +main_intr: interrupt-controller0 {
>> +	compatible = "ti,sci-intr";
>> +	interrupt-controller;
>> +	interrupt-parent = <&gic500>;
>> +	#interrupt-cells = <4>;
>> +	ti,sci = <&dmsc>;
>> +	ti,sci-dst-id = <56>;
>> +	ti,sci-rm-range-girq = <0x1>;
>> +};
> 
> Can you describe a bit what the "ti,sci-dst-id" is above?
> 
> These IDs seem to be listed at at [0] below, but is it really a property
> of the hardware? Or is it some enumeration of SoC devices in the firmware?

This is the way that sysfw describes the hardware. In this case it is GIC and it
is identified by this ID.

Thanks and regards,
Lokesh
