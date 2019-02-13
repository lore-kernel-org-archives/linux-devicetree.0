From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 09/10] soc: ti: Add MSI domain support for K3
 Interrupt Aggregator
Date: Wed, 13 Feb 2019 08:41:12 -0800
Message-ID: <20190213164112.GW5720@atomide.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-10-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212074237.2875-10-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [190212 07:43]:
> With the system coprocessor managing the range allocation of the
> inputs to Interrupt Aggregator, it is difficult to represent
> the device IRQs from DT.
> 
> The suggestion is to use MSI in such cases where devices wants
> to allocate and group interrupts dynamically.
> 
> Create a MSI domain bus layer that allocates and frees MSIs for
> a device.
> 
> APIs that are implemented are:
> - inta_msi_create_irq_domain() that creates a MSI domain
> - inta_msi_domain_alloc_irqs() that creates MSIs for the
>   specified device and source indexes.
> - inta_msi_domain_free_irqs() frees the grouped irqs.

Can you please describe what all code will be calling these
functions?

If the callers are limited to drivers/soc/ti, then you
can can maybe make it local and get rid of the exported
custom functions as it's all built-in anyways.

Or does the dma ring accelerator for example need to call
these?

If various subsystems will be calling these I'd assume
we'd have some generic API.. Marc, any comments on that?

Regards,

Tony
