From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: irq: add binding for Freescale
 IRQSTEER multiplexer
Date: Tue, 18 Dec 2018 09:06:00 -0600
Message-ID: <20181218150600.GA26309@bogus>
References: <20181217140120.12009-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217140120.12009-1-l.stach@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Mon, 17 Dec 2018 15:01:19 +0100, Lucas Stach wrote:
> This adds the DT binding for the Freescale IRQSTEER interrupt
> multiplexer found in the i.MX8 familiy SoCs.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> v2: clarify channel and irq-groups properties
> v3: switch to onecell IRQ handle
> ---
>  .../interrupt-controller/fsl,irqsteer.txt     | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
