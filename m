From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/6] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Wed, 4 Nov 2015 16:55:47 -0600
Message-ID: <20151104225547.GA3705@rob-hp-laptop>
References: <1446657135-7820-1-git-send-email-afd@ti.com>
 <1446657135-7820-2-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446657135-7820-2-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 04, 2015 at 11:12:10AM -0600, Andrew F. Davis wrote:
> The TPS65086 PMIC contains several regulators and a GPO controller.
> Add bindings for the TPS65086 PMIC.
> 
> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/mfd/tps65086.txt | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b/Documentation/devicetree/bindings/mfd/tps65086.txt
> new file mode 100644
> index 0000000..2fd5394
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
> @@ -0,0 +1,46 @@
> +* TPS65086 Power Management Integrated Circuit bindings
> +
> +Required properties:
> + - compatible		: Should be "ti,tps65086".
> + - reg			: I2C slave address.
> + - interrupt-parent	: Phandle to he parent interrupt controller.
> + - interrupts		: The interrupt line the device is connected to.
> + - interrupt-controller	: Marks the device node as an interrupt controller.
> + - #interrupt-cells	: The number of cells to describe an IRQ, this
> +			    should be 2. The first cell is the IRQ number,
> +			    the second cell is the flags, encoded as the trigger
> +			    masks from <dt-bindings/interrupt-controller/irq.h>.
> +
> +Additional nodes defined in:
> + - Regulators	: ../regulator/tps65086-regulator.txt
> + - GPIO		: ../gpio/gpio-tps65086.txt
> +
> +Example:
> +
> +	pmic: tps65086@5e {
> +		compatible = "ti,tps65086";
> +		reg = <0x5e>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		regulators {
> +			compatible = "ti,tps65086-regulator";
> +
> +			buck1 {
> +				regulator-name = "vcc1";
> +				regulator-min-microvolt = <1600000>;
> +				regulator-max-microvolt = <1600000>;
> +				regulator-boot-on;
> +				ti,regulator-decay;
> +				ti,regulator-step-size-25mv;
> +			};
> +		};
> +
> +		gpio4: gpio {
> +			compatible = "ti,tps65086-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +	};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
