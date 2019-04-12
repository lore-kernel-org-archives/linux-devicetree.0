From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v6 06/12] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Fri, 12 Apr 2019 08:33:21 -0700
Message-ID: <20190412153321.GV2839@atomide.com>
References: <20190410041358.16809-1-lokeshvutla@ti.com>
 <20190410041358.16809-7-lokeshvutla@ti.com>
 <20190411150023.GQ2839@atomide.com>
 <9cd4b818-905c-08a4-5675-a5ee763cea98@ti.com>
 <7e41405b-74e2-dc53-982a-766dee8a6884@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7e41405b-74e2-dc53-982a-766dee8a6884@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Marc Zyngier <marc.zyngier@arm.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190412 08:43]:
> On 12/04/2019 07:24, Lokesh Vutla wrote:
> > 
> > 
> > On 11/04/19 8:30 PM, Tony Lindgren wrote:
> > > Hi,
> > > 
> > > * Lokesh Vutla <lokeshvutla@ti.com> [190410 04:15]:
> > > > +Example:
> > > > +--------
> > > > +The following example demonstrates both interrupt router node and the consumer
> > > > +node(main gpio) on the AM654 SoC:
> > > > +
> > > > +main_intr: interrupt-controller0 {
> > > > +	compatible = "ti,sci-intr";
> > > > +	ti,intr-trigger-type = <1>;
> > > > +	interrupt-controller;
> > > > +	interrupt-parent = <&gic500>;
> > > > +	#interrupt-cells = <3>;
> > > > +	ti,sci = <&dmsc>;
> > > > +	ti,sci-dst-id = <56>;
> > > > +	ti,sci-rm-range-girq = <0x1>;
> > > > +};
> > > 
> > > To me it seems there should not be too many of these interrupt
> > > controller nodes for each SoC. Maybe you're already planning on
> > > doing it, but I suggest that you just add more specific compatibles
> > > and then look up the dst-id from a mapping table in the driver
> > > similar to what patch 04/12 in this series is already doing.
> > > 
> > > That way you don't need to add custom TI specific (firmware
> > > defined) device tree properties listed above ;)
> > 
> 
> < snip: I think Lokesh had a bad day or something :) >

Certainly custom bindings need to be discussed properly on the lists :)

> Anyways, the reason why we want these as custom properties in the DT is that
> there are multiple instances of the routers within one SoC. On AM65x we have
> MAIN NAVSS, MCU NAVSS, GPIOs for both etc., if we add driver data for each
> of these, it easily explodes quite a bit. Especially going forward with new
> SoCs.

Yup and I keep getting worried about this every time I see it still. But like
I've mentioned when we chatted offline, as long as Arnd, Marc and Rob ack this
use, I can live with it.

I'm just trying to avoid another "ti,hwmods" type custom property here..
We are still dealing with it to replace it with just standard use of
"compatible" property, and every time Rob sees it he still comments on it :)

Reagrds,

Tony
