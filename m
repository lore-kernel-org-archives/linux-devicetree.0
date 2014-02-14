From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 10/10] Documentation: Add device tree bindings for TI
 LMU devices
Date: Fri, 14 Feb 2014 10:06:21 +0000
Message-ID: <20140214100620.GD25107@e106331-lin.cambridge.arm.com>
References: <1392359564-7205-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392359564-7205-1-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 14, 2014 at 06:32:44AM +0000, Milo Kim wrote:
> Bindings for TI LMU, backlight, LM3631 regulator and LM3633 LED are added.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/leds-lm3633.txt       |   39 +++++
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  182 ++++++++++++++++++++
>  .../bindings/regulator/lm3631-regulator.txt        |   49 ++++++
>  .../bindings/video/backlight/ti-lmu-backlight.txt  |  127 ++++++++++++++
>  4 files changed, 397 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti-lmu.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/lm3631-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3633.txt b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
> new file mode 100644
> index 0000000..4adeb62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
> @@ -0,0 +1,39 @@
> +TI LMU LM3633 LED device tree bindings
> +
> +Required properties:
> +  - compatible: "ti,lm3633-leds"
> +  - lvled1-used, lvled2-used, lvled3-used, lvled4-used, lvled5-used, lvled6-used
> +    : LED string configuration. Each child node should include this information
> +      about which LED string is used.

Which child nodes? They weren't mentioned until this point.

If properties need to be in a child node, mention the child node first,
and make it clear where the properties are expected to be.

> +
> +Optional properties:
> +  - chan-name: LED channel name

Any reason to abbreviate "channel" to "chan"?

What's this for?

> +  - max-current-milliamp: Max current setting. Unit is mA.

The code and examples treat this as an 8-bit value, but this fact isn't
mentioned here.

> +
> +Example:
> +
> +lm3633@36 {
> +	compatible = "ti,lm3633";

It wasn't mentioned that this had to be a sub-node of a "ti,lm3633"
node. Please describe above and refer to the document for the
"ti,lm3633" binding.

[...]

> diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> new file mode 100644
> index 0000000..2b3ecca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> @@ -0,0 +1,182 @@
> +TI LMU(Lighting Management Unit) device tree bindings
> +
> +TI LMU driver supports lighting devices belows.
> +
> +   Name        Device tree properties
> +  ------      ------------------------
> +  LM3532       Backlight
> +  LM3631       Backlight and regulator
> +  LM3633       Backlight and LED
> +  LM3695       Backlight
> +  LM3697       Backlight
> +
> +Those have shared device tree properties.
> +
> +Required properties:
> +  - compatible: "ti,lm3532", "ti,lm3631", "ti,lm3633", "ti,lm3695", "ti,lm3697"

Should be one of, rather than all at once?

> +  - reg: I2C slave address.
> +    0x38 is LM3532
> +    0x29 is LM3631
> +    0x36 is LM3633, LM3697
> +    0x63 is LM3695
> +  - ti,enable-gpio: GPIO number of hardware enable pin

We refer to GPIOs with more than a number...

> +
> +For the TI LMU backlight properties, please refer to:
> +Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
> +
> +For the LM3631 regulator properties, please refer to:
> +Documentation/devicetree/bindings/regulator/lm3631-regulator.txt
> +
> +For the LM3633 LED properties, please refer to:
> +Documentation/devicetree/bindings/leds/leds-lm3633.txt

Are these expected as subnodes?

> +
> +Examples:
> +
> +lm3532@38 {
> +	compatible = "ti,lm3532";
> +	reg = <0x38>;
> +
> +	/* GPIO134 for HWEN pin */
> +	ti,enable-gpio = <&gpio5 6 GPIO_ACTIVE_HIGH>;
> +
> +	backlight {
> +		compatible = "ti,lmu-backlight", "ti,lm3532-backlight";

This looks backwards. The most general string should be later in the
list. This applies elsewhere too.

[...]

> diff --git a/Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt b/Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
> new file mode 100644
> index 0000000..554ddca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
> @@ -0,0 +1,127 @@
> +TI LMU backlight device tree bindings
> +
> +Required properties:
> +  - compatible: One of lists below with "ti,lmu-backlight" should be set.
> +    "ti,lm3532-backlight"
> +    "ti,lm3631-backlight"
> +    "ti,lm3633-backlight"
> +    "ti,lm3695-backlight"
> +    "ti,lm3697-backlight"

Do you mean that "ti,lmu-backlight" should be a fallback entry in the
compatible list?

> +  - hvled1-used, hvled2-used, hvled3-used: Backlight string configuration.
> +    Each backlight child node should include this information about
> +    which backlight string is used.
> +
> +Optional properties
> +  - bl-name: Backlight device name

Why bother abbreviating backlight to bl?

What's this for anyway? Surely something else has to link to the
backlight node, and a meaningful name should be implied.

> +  - max-current-milliamp: Max current setting. Unit is mA.

Type?

> +  - initial-brightness: Backlight initial brightness

Type? Units?

> +  - ramp-up: Light effect for ramp up rate. Unit is msec.
> +  - ramp-down: Light effect for ramp down rate. Unit is msec.
> +  - pwm-period: PWM period. Only valid for PWM brightness control mode.

Type? Units?

> +  - pwms, pwm-names: For the PWM user nodes, please refer to

How many do you expect?

What are each of them for?

What are they named?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
