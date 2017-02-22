From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] regulator: Add driver for voltage controlled
 regulators
Date: Tue, 21 Feb 2017 18:22:14 -0600
Message-ID: <20170222002214.sejshtotyiobn6n2@rob-hp-laptop>
References: <20170210204348.107871-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170210204348.107871-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 12:43:48PM -0800, Matthias Kaehlcke wrote:
> The output voltage of a voltage controlled regulator can be controlled
> through the voltage of another regulator. The current version of this
> driver assumes that the output voltage is a linear function of the control
> voltage.
> 
> Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Note: The current version of the driver has a known limitation: If an
> input supply is configured besides the control supply the two regulators
> must have no common ancestor, otherwise the spinlock of the ancestor
> would be acquired twice by the core code. One possible solution would be
> to configure the control regulator through a string instead of a phandle,
> i.e. not specifying it as supply.
> 
>  .../devicetree/bindings/regulator/vctrl.txt        |  56 +++

Please split bindings to separate patch.

>  drivers/regulator/Kconfig                          |   7 +
>  drivers/regulator/Makefile                         |   1 +
>  drivers/regulator/vctrl-regulator.c                | 525 +++++++++++++++++++++
>  4 files changed, 589 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/vctrl.txt
>  create mode 100644 drivers/regulator/vctrl-regulator.c
> 
> diff --git a/Documentation/devicetree/bindings/regulator/vctrl.txt b/Documentation/devicetree/bindings/regulator/vctrl.txt
> new file mode 100644
> index 000000000000..ba3c9b2f61b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/vctrl.txt
> @@ -0,0 +1,56 @@
> +Bindings for Voltage controlled regulators
> +==========================================
> +
> +Required properties:
> +--------------------
> +- compatible		: must be "vctrl-regulator".
> +- ctrl-supply:		: a phandle for the regulator supplying the control
> +			  voltage.
> +- output-voltage-range	: an array of two integer values specifying the range
> +			  (min/max) of the output voltage. The min/max voltage
> +			  constraints of the regulator (if specified) must not
> +			  exceed this range.
> +- ctrl-voltage-range	: an array of two integer values specifying the range
> +			  (min/max) of the control voltage. The values of
> +			  ctrl-voltage-range and output-voltage-range are used
> +			  for the conversion between output and control voltage.
> +			  The min/max values of ctrl-voltage-range must specify
> +			  the control voltage needed to generate the min/max
> +			  output voltage.
> +
> +Optional properties:
> +--------------------
> +- ovp-threshold-percent	: overvoltage protection (OVP) threshold of the
> +			  regulator in percent. Some regulators have an OVP
> +			  circuitry which shuts down the regulator when the
> +			  actual output voltage deviates beyond a certain
> +			  margin from the expected value for a given control
> +			  voltage. On larger voltage decreases this can occur
> +			  undesiredly since the output voltage does not adjust
> +			  inmediately to changes in the control voltage. To
> +			  avoid this situation the vctrl driver breaks down
> +			  larger voltage decreases into multiple steps, where
> +			  each step is within the OVP threshold.
> +- min-slew-down-rate	: Describes how slowly the regulator voltage will decay
> +			  down in the worst case (lightest expected load).
> +			  Specified in uV / us (like main regulator ramp rate).
> +			  This value is required when ovp-threshold-percent is
> +			  specified.

Don't we have a standard prop for this or that's just for ramp? Perhaps 
this should be common?

> +
> +Example:
> +
> +	vctrl_reg {

Don't use '_' in node names.

> +		compatible = "vctrl-regulator";
> +		regulator-name = "vctrl_reg";
> +
> +		ctrl-supply = <&ctrl_supply>;
> +

> +		regulator-min-microvolt = <800000>;
> +		regulator-max-microvolt = <1500000>;
> +
> +		output-voltage-range = <800000 1500000>;

Why do you need both?

> +		ctrl-voltage-range = <200000 500000>;
> +
> +		slew-rate = <225>;

Not documented.

> +		ovp-threshold-percent = <16>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
