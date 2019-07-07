From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/6] dt-bindings: interrupt-controller: Document RTD129x
Date: Sun, 7 Jul 2019 20:10:59 +0100
Message-ID: <20190707201059.0e86dc71@why>
References: <20190707132246.GB13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190707132246.GB13340@arks.localdomain>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aleix Roca Nonell <kernelrocks@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, 7 Jul 2019 15:22:46 +0200
Aleix Roca Nonell <kernelrocks@gmail.com> wrote:

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

What does 'iso' mean in this context?

> +- reg                  :  Specifies the address of the ISR, IER and Unmask
> +                          register in couples of "address length".

Are these registers actually interleaved with other stuff? What else it
in between?

> +- interrupts           :  Specifies the interrupt line which is mux'ed.
> +- interrupt-controller :  Presence indicates the node as interrupt controller.
> +- #interrupt-cells     :  Shall be 1. See common bindings in interrupt.txt.

So I guess this is level only, with an unspecified polarity? No edge
interrupts?

> +
> +
> +Example:
> +
> +	interrupt-controller@98007000 {
> +		compatible = "realtek,rtd129x-iso-irq-mux";

It'd be good if the the example matched the rest of the documentation.

> +		reg = <0x98007000 0x4 0x98007040 0x4 0x98007004 0x4>;
> +		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +	};

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
