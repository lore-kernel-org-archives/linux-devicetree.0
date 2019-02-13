From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Wed, 13 Feb 2019 14:40:23 -0600
Message-ID: <20190213204023.GA21941@bogus>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <20190212162247.GK5720@atomide.com>
 <6a274588-0fb6-2ddf-3bcc-f9e4d849ac07@ti.com>
 <20190213152620.GS5720@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213152620.GS5720@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 07:26:20AM -0800, Tony Lindgren wrote:
> * Lokesh Vutla <lokeshvutla@ti.com> [190213 04:26]:
> > Hi Tony,
> > 
> > On 12/02/19 9:52 PM, Tony Lindgren wrote:
> > > Hi,
> > > 
> > > * Lokesh Vutla <lokeshvutla@ti.com> [190212 07:43]:
> > >> +Example:
> > >> +--------
> > >> +The following example demonstrates both interrupt router node and the consumer
> > >> +node(main gpio) on the AM654 SoC:
> > >> +
> > >> +main_intr: interrupt-controller0 {
> > >> +	compatible = "ti,sci-intr";
> > >> +	interrupt-controller;
> > >> +	interrupt-parent = <&gic500>;
> > >> +	#interrupt-cells = <4>;
> > >> +	ti,sci = <&dmsc>;
> > >> +	ti,sci-dst-id = <56>;
> > >> +	ti,sci-rm-range-girq = <0x1>;
> > >> +};
> > > 
> > > Can you describe a bit what the "ti,sci-dst-id" is above?
> > > 
> > > These IDs seem to be listed at at [0] below, but is it really a property
> > > of the hardware? Or is it some enumeration of SoC devices in the firmware?
> > 
> > This is the way that sysfw describes the hardware. In this case it is GIC and it
> > is identified by this ID.
> 
> If this ID is an enumeration in the sysfw rather than an actual
> hardware property it should not be in the device tree. If so,
> the device driver should request the id from the sysfw based
> on a name. That is, if no struct device or device phandle can
> be used.
> 
> The problem with using enumeration in the dts is that it
> requires maintaining the dts, driver(s) and possibly firmware
> in sync. And that might change between SoCs variants when new
> devices get added and removed.

IOW, don't repeat h/w designers mistakes and make your firmware 
discoverable. We have DT only for what is not discoverable.

Rob
