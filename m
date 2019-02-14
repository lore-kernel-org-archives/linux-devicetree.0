From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Thu, 14 Feb 2019 14:08:54 +0530
Message-ID: <4791de04-63af-4c5e-db9c-47634fcb8dc9@ti.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <20190212162247.GK5720@atomide.com>
 <6a274588-0fb6-2ddf-3bcc-f9e4d849ac07@ti.com>
 <20190213152620.GS5720@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213152620.GS5720@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On 13/02/19 8:56 PM, Tony Lindgren wrote:
> * Lokesh Vutla <lokeshvutla@ti.com> [190213 04:26]:
>> Hi Tony,
>> 
>> On 12/02/19 9:52 PM, Tony Lindgren wrote:
>>> Hi,
>>> 
>>> * Lokesh Vutla <lokeshvutla@ti.com> [190212 07:43]:
>>>> +Example: +-------- +The following example demonstrates both interrupt 
>>>> router node and the consumer +node(main gpio) on the AM654 SoC: + 
>>>> +main_intr: interrupt-controller0 { +	compatible = "ti,sci-intr"; + 
>>>> interrupt-controller; +	interrupt-parent = <&gic500>; + 
>>>> #interrupt-cells = <4>; +	ti,sci = <&dmsc>; +	ti,sci-dst-id = <56>; + 
>>>> ti,sci-rm-range-girq = <0x1>; +};
>>> 
>>> Can you describe a bit what the "ti,sci-dst-id" is above?
>>> 
>>> These IDs seem to be listed at at [0] below, but is it really a property
>>>  of the hardware? Or is it some enumeration of SoC devices in the 
>>> firmware?
>> 
>> This is the way that sysfw describes the hardware. In this case it is GIC 
>> and it is identified by this ID.
> 
> If this ID is an enumeration in the sysfw rather than an actual hardware 
> property it should not be in the device tree. If so,

Devicetree-specification-v0.2[1] "Section 1.1 Purpose and Scope" mentions that
devicetree specification provides a complete boot program to client program
interface definition. Where boot program here is the sysfw and client program is
Linux. In this case we are describing the id which is the destination interrupt
controller to which the irqs are supposed to be attached.

> the device driver should request the id from the sysfw based on a name. That 
> is, if no struct device or device phandle can

>From a scalability perspective using a name to get a device id might worsen
things.  There are hundreds of devices within the SoC and standardizing a name
for each device and making sure using the same name across all future SoCs might
be a bit pain. If there are more than one instance of the same device then name
that should be requested is different with in the same driver.

IMHO, device ids are something which can be used in DT. There are many other
things like the interrupt ranges etc.. which are discoverable from sysfw and we
are implementing it.

> be used.
> > The problem with using enumeration in the dts is that it requires
> maintaining the dts, driver(s) and possibly firmware in sync. And that might

The idea here is device ids are not going to change for a SoC. For new SoCs
within the same architecture ids will change and we will have new dts or this
new SoC.

> change between SoCs variants when new devices get added and removed.
> 

[1]
https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf

Thanks and regards,
Lokesh
