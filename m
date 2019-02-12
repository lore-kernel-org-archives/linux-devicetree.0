From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Tue, 12 Feb 2019 08:22:47 -0800
Message-ID: <20190212162247.GK5720@atomide.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212074237.2875-6-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

Hi,

* Lokesh Vutla <lokeshvutla@ti.com> [190212 07:43]:
> +Example:
> +--------
> +The following example demonstrates both interrupt router node and the consumer
> +node(main gpio) on the AM654 SoC:
> +
> +main_intr: interrupt-controller0 {
> +	compatible = "ti,sci-intr";
> +	interrupt-controller;
> +	interrupt-parent = <&gic500>;
> +	#interrupt-cells = <4>;
> +	ti,sci = <&dmsc>;
> +	ti,sci-dst-id = <56>;
> +	ti,sci-rm-range-girq = <0x1>;
> +};

Can you describe a bit what the "ti,sci-dst-id" is above?

These IDs seem to be listed at at [0] below, but is it really a property
of the hardware? Or is it some enumeration of SoC devices in the firmware?

Regards,

Tony


[0] http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am6x/irq_dsts.html
