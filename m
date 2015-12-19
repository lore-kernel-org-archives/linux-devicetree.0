From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5] arm: pxa: support ICP DAS LP-8x4x FPGA irq
Date: Fri, 18 Dec 2015 22:20:02 -0600
Message-ID: <20151219042002.GV14936@rob-hp-laptop>
References: <1397668667-27328-5-git-send-email-ynvich@gmail.com>
 <1450207582-17957-1-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450207582-17957-1-git-send-email-ynvich@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Ianovich <ynvich@gmail.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 10:26:21PM +0300, Sergei Ianovich wrote:
> ICP DAS LP-8x4x contains FPGA chip. The chip functions as an interrupt
> source providing 16 additional interrupts among other things. The
> interrupt lines are muxed to a GPIO pin of a 2nd level PXA-GPIO
> interrupt controller. GPIO pins of the 2nd level controller are in turn
> muxed to a CPU interrupt line.
> 
> Until pxa is completely converted to device tree, it is impossible
> to use IRQCHIP_DECLARE() and the irqdomain needs to added manually.
> Drivers for the on-CPU IRQs and GPIO-IRQs are loaded using
> postcore_initcall(). We need to have all irq domain drivers loaded prior
> to DT parsing in order to allow normal initialization of IRQ resources
> with DT.
> 
> Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> CC: Arnd Bergmann <arnd@arndb.de>
> ---
>    v4..v5
>    * constify struct of_device_id
>    * drop irq number from handler signature
> 
>    v3.2..v4
>    * move DTS binding to a different patch (8/21)
> 
>    v3.1..v3.2
>    fixes to apply Linus Walleij's "Reviewed-by":
>    * add kerneldoc comment for state container struct
>    * rename irq -> hwirq for clarity
>    * drop overzealous error checks from the hotpaths
> 
>    v3..v3.1
>    fixes according to Linus Walleij review comments:
>    * update commit message
>    * use state container instead of global variables
>    * get hardware irq nums from irq_data, don't calculate them
>    * use BIT() macro
>    * add defines for system irq register masks
>    * replace cycle control variable with break
>    * use better names for resource variables
>    * add a linear domain instead of a legacy one
>    * use irq_create_mapping() instead of irq_alloc_desc()
> 
>    v2..v3
>    * no changes (except number 09/16 -> 11/21)
> 
>    v0..v2
>    * extract irqchip and move to drivers/irqchip/
>    * use device tree
>    * use devm helpers where possible
> 
>  .../bindings/interrupt-controller/irq-lp8x4x.txt   |  49 +++++
>  drivers/irqchip/Kconfig                            |   5 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-lp8x4x.c                       | 227 +++++++++++++++++++++
>  4 files changed, 282 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/irq-lp8x4x.txt
>  create mode 100644 drivers/irqchip/irq-lp8x4x.c
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/irq-lp8x4x.txt b/Documentation/devicetree/bindings/interrupt-controller/irq-lp8x4x.txt
> new file mode 100644
> index 0000000..c8940d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/irq-lp8x4x.txt
> @@ -0,0 +1,49 @@
> +ICP DAS LP-8x4x FPGA Interrupt Controller
> +
> +ICP DAS LP-8x4x contains FPGA chip. The chip functions as a interrupt
> +source providing 16 additional interrupts among other things.
> +
> +Required properties:
> +- compatible : should be "icpdas,irq-lp8x4x"
> +
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +- interrupt-controller : identifies the node as an interrupt controller
> +
> +- #interrupt-cells : should be 1
> +
> +- interrupts : should provide interrupt
> +
> +- interrupt-parent : should provide a link to interrupt controller either
> +		     explicitly and implicitly from a parent node
> +
> +Example:
> +
> +	fpga: fpga@17000006 {

Nothing else in the fpga? In any case, this node should be named 
interrupt-controller@17000006.

> +		compatible = "icpdas,irq-lp8x4x";

As pointed out in the uart binding, don't use wildcards here.

> +		reg = <0x17000006 0x16>;
> +		interrupt-parent = <&gpio>;
> +		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		status = "okay";
> +	};
> +
> +	uart@17009050 {
> +		compatible = "icpdas,uart-lp8x4x";
> +		reg = <0x17009050 0x10
> +		       0x17009030 0x02>;
> +		interrupt-parent = <&fpga>;
> +		interrupts = <13>;
> +		status = "okay";
> +	};
