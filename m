From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 10/14] dt-bindings: irqchip: Introduce TISCI Interrupt
 Aggregator bindings
Date: Tue, 30 Apr 2019 17:25:18 -0500
Message-ID: <20190430222518.GA8786@bogus>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
 <20190430101230.21794-11-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430101230.21794-11-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Apr 2019 15:42:26 +0530, Lokesh Vutla wrote:
> Add the DT binding documentation for Interrupt Aggregator driver.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> Changes since v7:
> - None
>  .../interrupt-controller/ti,sci-inta.txt      | 66 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
