From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Spreadtrum EIC controller
 documentation
Date: Tue, 13 Feb 2018 17:39:45 -0600
Message-ID: <20180213233945.55mfqpydfxmimak2@rob-hp-laptop>
References: <e89b91042abbbcf04cb39a3350af000cc411eee1.1518076643.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e89b91042abbbcf04cb39a3350af000cc411eee1.1518076643.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 08, 2018 at 04:01:42PM +0800, Baolin Wang wrote:
> This patch adds the device tree bindings for the Spreadtrum EIC
> controller. The EIC can be recognized as one special type of GPIO,
> which can only be used as input.
> 
> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/gpio/gpio-eic-sprd.txt     |   51 ++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt b/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
> new file mode 100644
> index 0000000..34f194f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
> @@ -0,0 +1,51 @@
> +Spreadtrum EIC controller bindings
> +
> +The EIC is the abbreviation of external interrupt controller, which
> +is only can be used as input mode. The EIC controller includes 4
> +sub-modules: EIC-Debounce, EIC-Latch, EIC-Async, EIC-Sync.
> +
> +The EIC-debounce sub-module provides up to 8 source input signal
> +connection. A debounce machanism is used to capture input signal's
> +stable status (ms grade) and a single-trigger mechanism is introduced
> +into this sub-module to enhance the input event detection reliability.
> +In addition, this sub-module's clock can be shut-off automatically to
> +reduce power dissipation. The debounce range is from 1ms to 4s with
> +the step of 1ms. If the input signal is shorter than 1ms, it will be
> +omitted as this sub-module.
> +
> +The EIC-latch sub-module is used to latch some special input signal
> +and send interrupts to MCU core, and it can provide up to 8 latch
> +source input signal connection.
> +
> +The EIC-async sub-module uses 32k clock to capture short signal (us
> +grade) to generate interrupt to MCU by level or edge trigger.
> +
> +The EIC-sync is similar with GPIO's input function.
> +
> +Required properties:
> +- compatible: Should be one of the following:
> +  "sprd,sc9860-eic-debounce",
> +  "sprd,sc9860-eic-latch",
> +  "sprd,sc9860-eic-async",
> +  "sprd,sc9860-eic-sync",
> +  "sprd,sc27xx-eic-debounce".
> +- reg: Define the base and range of the I/O address space containing
> +  the GPIO controller registers.
> +- gpio-controller: Marks the device node as a GPIO controller.

Why a gpio controller? Do you read the input pin state?

> +- #gpio-cells: Should be <2>. The first cell is the gpio number and
> +  the second cell is used to specify optional parameters.
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells: Should be <2>. Specifies the number of cells needed
> +  to encode interrupt source.
> +- interrupts: Should be the port interrupt shared by all the gpios.
> +
> +Example:
> +	eic_debounce: eic@40210000 {

interrupt-controller@...

Or (if this remains a gpio controller)

gpio@...

> +		compatible = "sprd,sc9860-eic-debounce";
> +		reg = <0 0x40210000 0 0x80>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;

The example doesn't seem to match your description of the block or 
blocks. You talk about a bunch of sub modules and then there's just this 
one node?

> +	};
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
