From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Tue, 19 Feb 2019 14:21:10 +0530
Message-ID: <84b3ec21-9ce9-b9a8-80a9-75001db43a90@ti.com>
References: <20190212162247.GK5720@atomide.com>
 <6a274588-0fb6-2ddf-3bcc-f9e4d849ac07@ti.com>
 <20190213152620.GS5720@atomide.com>
 <4791de04-63af-4c5e-db9c-47634fcb8dc9@ti.com>
 <20190214154100.GB5720@atomide.com>
 <b4e821b3-f2fb-41d8-eb8c-8f4e8a19f77c@ti.com>
 <20190214174612.GF5720@atomide.com>
 <171e8597-2156-747d-d024-7b4bfc6f9186@ti.com>
 <20190215161629.GK5720@atomide.com>
 <2369739e-3bc8-257a-99e0-db2951c6777d@ti.com>
 <20190218143245.GC15711@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218143245.GC15711@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On 18/02/19 8:02 PM, Tony Lindgren wrote:
> * Lokesh Vutla <lokeshvutla@ti.com> [190216 03:30]:
>> On 2/15/2019 9:46 PM, Tony Lindgren wrote:
>>> The dts node for the interrupt controller should describe a
>>> proper Linux device, that is with reg entries and so on.
>>
>> You are asking to just keep the compatible property :)
> 
> Right, and then I realized this node is missing the standard
> reg entry too. And you're saying the registers are not even
> accissible from Linux.
> 
> So based on that IMO you should not even have a device tree
> node for it at all. You should just have the interrupt

Practically lets look at what all I am adding in the DT node. Below is one such
example:

main_intr: interrupt-controller0 {
	compatible = "ti,sci-intr";
	interrupt-controller;
	interrupt-parent = <&gic500>;
	#interrupt-cells = <4>;
	ti,sci = <&dmsc>;
	ti,sci-dst-id = <56>;
	ti,sci-rm-range-girq = <0x1>;
};

The following 4 properties are required at least for probing, to represent the
hierarchy and for  interrupt definition:
	compatible = "ti,sci-intr";
	interrupt-controller;
	interrupt-parent = <&gic500>;
	#interrupt-cells = <4>;

The remaining 3 properties represents the TISCI interface. Let's go step by step:
* ti,sci = <&dmsc> :This is the phandle to the firmware protocol driver using
which the messages are sent
* ti,sci-dst-id = <56> : This is the TISCI device ID for the parent controller
for which your irqs needs to be connected. As I said this cannot be queried from
sysfw and this is the input to the messages that are send to sysfw.
*  ti,sci-rm-range-girq = <0x1>: This define the ids using which the parent-irq
ranges that are allocated to this interrupt router instance can be queried from
sysfw.
If the above 2 properties are to be added as driver phandle then for every
instance of interrupt router in the SoC, a new compatible needs to be created. I
don't think this is a desirable solution.

With this can you tell me how can we not have a device-tree and still support
irq allocation?

Also, this is not the first time a driver based on a firmware is being added.
K2g clock, power and reset drivers are based on this where device ids are being
passed from consumers. Similarly arm scpi based drivers are also available.

Thanks and regards,
Lokesh
