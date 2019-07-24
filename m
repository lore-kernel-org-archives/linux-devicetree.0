From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: interrupt-controller: Document RTD129x
Date: Wed, 24 Jul 2019 10:21:27 -0600
Message-ID: <20190724162127.GA32658@bogus>
References: <20190707132246.GB13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190707132246.GB13340@arks.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Aleix Roca Nonell <kernelrocks@gmail.com>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 07, 2019 at 03:22:46PM +0200, Aleix Roca Nonell wrote:
> Add binding for Realtek RTD129x interrupt controller.
> 
> Signed-off-by: Aleix Roca Nonell <kernelrocks@gmail.com>
> ---
>  .../realtek,rtd129x-intc.txt                  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt
> new file mode 100644
> index 000000000000..3ebb7c02afe5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt
> @@ -0,0 +1,24 @@
> +Realtek RTD129x IRQ Interrupt Controller
> +=======================================
> +
> +Required properties:
> +
> +- compatible           :  Should be one of the following:
> +                          - "realtek,rtd129x-intc-misc"
> +                          - "realtek,rtd129x-intc-iso"

Don't use wildcards in compatible strings.

> +- reg                  :  Specifies the address of the ISR, IER and Unmask
> +                          register in couples of "address length".
> +- interrupts           :  Specifies the interrupt line which is mux'ed.
> +- interrupt-controller :  Presence indicates the node as interrupt controller.
> +- #interrupt-cells     :  Shall be 1. See common bindings in interrupt.txt.
> +
> +
> +Example:
> +
> +	interrupt-controller@98007000 {
> +		compatible = "realtek,rtd129x-iso-irq-mux";
> +		reg = <0x98007000 0x4 0x98007040 0x4 0x98007004 0x4>;

What's in the holes?

> +		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +	};
> -- 
> 2.21.0
> 
