From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Sat, 16 Feb 2019 08:59:55 +0530
Message-ID: <2369739e-3bc8-257a-99e0-db2951c6777d@ti.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <20190212162247.GK5720@atomide.com>
 <6a274588-0fb6-2ddf-3bcc-f9e4d849ac07@ti.com>
 <20190213152620.GS5720@atomide.com>
 <4791de04-63af-4c5e-db9c-47634fcb8dc9@ti.com>
 <20190214154100.GB5720@atomide.com>
 <b4e821b3-f2fb-41d8-eb8c-8f4e8a19f77c@ti.com>
 <20190214174612.GF5720@atomide.com>
 <171e8597-2156-747d-d024-7b4bfc6f9186@ti.com>
 <20190215161629.GK5720@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190215161629.GK5720@atomide.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tony Lindgren <tony@atomide.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, jason@lakedaemon.net, Peter Ujfalusi <peter.ujfalusi@ti.com>, marc.zyngier@arm.com, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On 2/15/2019 9:46 PM, Tony Lindgren wrote:
> Hi,
> 
> * Lokesh Vutla <lokeshvutla@ti.com> [190214 18:03]:
>> On 2/14/2019 11:16 PM, Tony Lindgren wrote:
>>> But I'd rather have a proper hardware based phandle + index
>>> type mapping in the dts if possible though.
>>
>> The idea about sysfw here is that Linux is not aware of anything about
>> this device(Interrupt Router). It cannot even access any of its
>> registers. As a user Linux should know who is the parent to which the
>> Interrut router output should be configured. Then query sysfw about the
>> range of gic irqs allocated to it. Now for configuration, Linux should
>> pass the the input to interrupt router, gic irq no, and gic id(by which
>> sysfw uniquely identifies GIC interrupt controller with the SoC).  Based
>> on these parameters Interrupt Router registers gets configured.
> 
> If the interrupt router hardawre is hidden away from Linux,
> just leave it out of the device tree completely and have the
> interrupt controller driver request the routing.

Yes while requesting you should at-least specify which is your
destination interrupt-controller Else how does the sysfw even know to
whom the requester wants the routing to happen to. You do know that we
are dealing with a heterogeneous system where there are more the one
destination interrupt controllers(GIC, R5 VIM  etc etc..). This is what
the DT property is specifying and we cannot query a device based on a name.

> 
> The dts node for the interrupt controller should describe a
> proper Linux device, that is with reg entries and so on.

You are asking to just keep the compatible property :)

I am no where denying that. But the cases where the firmware does the
configuration DT spec[1] clearly mentions about the interface.

Please take a look at arm-psci devicetree binding documentation where
the function ids are represented using which each psci function is invoked.

[1]
https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf

Thanks and regards,
Lokesh
