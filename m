From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 08/14] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Tue, 30 Apr 2019 17:24:39 -0500
Message-ID: <20190430222439.GA7845@bogus>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
 <20190430101230.21794-9-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430101230.21794-9-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Apr 2019 15:42:24 +0530, Lokesh Vutla wrote:
> Add the DT binding documentation for Interrupt router driver.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> Changes since v7:
> - Changes interrupt cells to 2.
> 
>  .../interrupt-controller/ti,sci-intr.txt      | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
