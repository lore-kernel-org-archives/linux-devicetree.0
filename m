From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Mon, 18 Feb 2019 06:32:45 -0800
Message-ID: <20190218143245.GC15711@atomide.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2369739e-3bc8-257a-99e0-db2951c6777d@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [190216 03:30]:
> On 2/15/2019 9:46 PM, Tony Lindgren wrote:
> > The dts node for the interrupt controller should describe a
> > proper Linux device, that is with reg entries and so on.
> 
> You are asking to just keep the compatible property :)

Right, and then I realized this node is missing the standard
reg entry too. And you're saying the registers are not even
accissible from Linux.

So based on that IMO you should not even have a device tree
node for it at all. You should just have the interrupt
controller driver do the muxing on request_irq() using tisci
calls.

If that's not true, and these mux registers are accessible
from Linux, then set up proper dts node with reg entries.
And have the driver deal with the firmware based on the
compatible node.

Regards,

Tony
