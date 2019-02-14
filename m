From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Thu, 14 Feb 2019 07:41:00 -0800
Message-ID: <20190214154100.GB5720@atomide.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <20190212162247.GK5720@atomide.com>
 <6a274588-0fb6-2ddf-3bcc-f9e4d849ac07@ti.com>
 <20190213152620.GS5720@atomide.com>
 <4791de04-63af-4c5e-db9c-47634fcb8dc9@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4791de04-63af-4c5e-db9c-47634fcb8dc9@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [190214 08:39]:
> IMHO, device ids are something which can be used in DT. There are many other
> things like the interrupt ranges etc.. which are discoverable from sysfw and we
> are implementing it.

We need to describe hardware in the device tree, not firmware.

If you have something discoverable from the firmware, you should
have the device driver query it from sysfw based on a hardware
property, not based on some invented enumeration in the firmware.
If there is some device to firmware translation needed, hide that
into the device driver and keep it out of the device tree.

For example, look at the interrupt binding where the interrupt
is phandle to the controller and the bit offset from the interrupt
controller instance.

You need to use device IO address + bit offset (or register
offset) type indexing for device tree here. Something out of
the TRM that makes sense to developers.

Regards,

Tony
