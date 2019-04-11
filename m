From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v6 06/12] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Thu, 11 Apr 2019 08:00:23 -0700
Message-ID: <20190411150023.GQ2839@atomide.com>
References: <20190410041358.16809-1-lokeshvutla@ti.com>
 <20190410041358.16809-7-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190410041358.16809-7-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Hi,

* Lokesh Vutla <lokeshvutla@ti.com> [190410 04:15]:
> +Example:
> +--------
> +The following example demonstrates both interrupt router node and the consumer
> +node(main gpio) on the AM654 SoC:
> +
> +main_intr: interrupt-controller0 {
> +	compatible = "ti,sci-intr";
> +	ti,intr-trigger-type = <1>;
> +	interrupt-controller;
> +	interrupt-parent = <&gic500>;
> +	#interrupt-cells = <3>;
> +	ti,sci = <&dmsc>;
> +	ti,sci-dst-id = <56>;
> +	ti,sci-rm-range-girq = <0x1>;
> +};

To me it seems there should not be too many of these interrupt
controller nodes for each SoC. Maybe you're already planning on
doing it, but I suggest that you just add more specific compatibles
and then look up the dst-id from a mapping table in the driver
similar to what patch 04/12 in this series is already doing.

That way you don't need to add custom TI specific (firmware
defined) device tree properties listed above ;)

Regards,

Tony
