From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] irq: versatile-fpga: add OX820 compatible
Date: Mon, 19 Sep 2016 16:22:13 -0500
Message-ID: <20160919212213.GA14809@rob-hp-laptop>
References: <20160909132953.15061-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160909132953.15061-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 09, 2016 at 03:29:53PM +0200, Neil Armstrong wrote:
> In order to support the interrupt controler in the Oxford Semiconductor
> OX820 SoC, add a new comatible string.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt           | 3 ++-
>  drivers/irqchip/irq-versatile-fpga.c                                   | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
> index 2a1d16b..8bd124c2 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
> @@ -6,7 +6,8 @@ controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
>  instance can handle up to 32 interrupts.
>  
>  Required properties:
> -- compatible: "arm,versatile-fpga-irq" or "oxsemi,ox810se-rps-irq"
> +- compatible: "arm,versatile-fpga-irq", "oxsemi,ox810se-rps-irq" or
> +		"oxsemi,ox820-rps-irq"

Same comment here.

>  - interrupt-controller: Identifies the node as an interrupt controller
>  - #interrupt-cells: The number of cells to define the interrupts.  Must be 1
>    as the FPGA IRQ controller has no configuration options for interrupt
> diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
> index 37dd464..da0e6d6 100644
> --- a/drivers/irqchip/irq-versatile-fpga.c
> +++ b/drivers/irqchip/irq-versatile-fpga.c
> @@ -228,4 +228,5 @@ int __init fpga_irq_of_init(struct device_node *node,
>  IRQCHIP_DECLARE(arm_fpga, "arm,versatile-fpga-irq", fpga_irq_of_init);
>  IRQCHIP_DECLARE(arm_fpga_sic, "arm,versatile-sic", fpga_irq_of_init);
>  IRQCHIP_DECLARE(ox810se_rps, "oxsemi,ox810se-rps-irq", fpga_irq_of_init);
> +IRQCHIP_DECLARE(ox820_rps, "oxsemi,ox820-rps-irq", fpga_irq_of_init);
>  #endif
> -- 
> 2.7.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
