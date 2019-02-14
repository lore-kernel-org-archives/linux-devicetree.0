From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Thu, 14 Feb 2019 09:46:12 -0800
Message-ID: <20190214174612.GF5720@atomide.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <20190212162247.GK5720@atomide.com>
 <6a274588-0fb6-2ddf-3bcc-f9e4d849ac07@ti.com>
 <20190213152620.GS5720@atomide.com>
 <4791de04-63af-4c5e-db9c-47634fcb8dc9@ti.com>
 <20190214154100.GB5720@atomide.com>
 <b4e821b3-f2fb-41d8-eb8c-8f4e8a19f77c@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b4e821b3-f2fb-41d8-eb8c-8f4e8a19f77c@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [190214 17:32]:
> Hi Tony,
> 	Please do not snip the on going discussion.
> 
> On 2/14/2019 9:11 PM, Tony Lindgren wrote:
> > * Lokesh Vutla <lokeshvutla@ti.com> [190214 08:39]:
> >> IMHO, device ids are something which can be used in DT. There are many other
> >> things like the interrupt ranges etc.. which are discoverable from sysfw and we
> >> are implementing it.
> > 
> > We need to describe hardware in the device tree, not firmware.
> > 
> > If you have something discoverable from the firmware, you should
> > have the device driver query it from sysfw based on a hardware
> > property, not based on some invented enumeration in the firmware.
> 
> Yes we are already querying sysfw for all the irq ranges that can be
> discoverable. The topic of discussion here is about the parent interrupt
> controller id. I am not sure how you are expecting an id be discoverable
> from system firmware especially with a name.

Well names are quite standard in dts (but should be used with
the phandle + offset). Think for example interrupt-names and
reg-names :)

> > If there is some device to firmware translation needed, hide that
> > into the device driver and keep it out of the device tree.
> 
> If preferred this can be moved to of_match_data attached to each
> compatible property. Then for each SoC a new compatible needs to be created.

Hiding the ID into the device driver and compatible property
makes sense to me if the id is based on SoC + firmware.

But I'd rather have a proper hardware based phandle + index
type mapping in the dts if possible though.

What does this id really consist of?

Regards,

Tony
