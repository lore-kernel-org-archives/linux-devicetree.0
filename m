From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RfC v4 3/6] dt-bindings: add Amlogic Meson GPIO
 interrupt-controller DT binding documentation
Date: Mon, 29 May 2017 10:44:49 +0200
Message-ID: <e6d54450-a781-8089-bab4-567337248ab7@baylibre.com>
References: <49ab677f-3165-d6f5-75f5-a963879e8ecf@gmail.com>
 <4f082b42-40dd-6e7d-61f5-d3aad1fc19de@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <4f082b42-40dd-6e7d-61f5-d3aad1fc19de@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 05/28/2017 09:11 PM, Heiner Kallweit wrote:
> Add dt binding documentation for Amlogic meson GPIO interrupt controller.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  .../amlogic,meson-gpio-intc.txt                    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> new file mode 100644
> index 00000000..2f20d212
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> @@ -0,0 +1,26 @@
> +Amlogic meson GPIO interrupt controller
> +
> +Meson SoCs contains an interrupt controller which is able watch the SoC pads
> +and generate an interrupt on edges or level. The controller is essentially a
> +256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
> +or level and polarity. The actual number of interrupt exposed depends on the
> +SoC.
> +
> +Required properties:
> +
> +- compatible : should be "amlogic,meson-gpio-intc".
> +- reg : Specifies base physical address and size of the registers.
> +- interrupt-controller : Identifies the node as an interrupt controller.
> +- #interrupt-cells : should be 2.
> +- parent-interrupts : list of GIC interrupts which can be used with the
> +		      GPIO IRQ multiplexer
> +
> +Example:
> +
> +gpio_intc: interrupt-controller@9880 {
> +	compatible = "amlogic,meson-gpio-intc";
> +	reg = <0x0 0x09880 0x0 0x10>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +	parent-interrupts = <64 65 66 67 68 69 70 71>;
> +};
> 

Looks good.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
