From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Thu, 15 Sep 2016 08:32:06 -0500
Message-ID: <20160915133206.GA8693@rob-hp-laptop>
References: <1473166599-29266-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473166599-29266-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei.Chen-kQvG35nSl+M@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 06, 2016 at 02:56:39PM +0200, Neil Armstrong wrote:
> Since the I2C sx150x GPIO expander driver uses platform_data to manage
> the pins configurations, rewrite the driver as a pinctrl driver using
> pinconf to get/set pin configurations from DT or debugfs.
> 
> The pinctrl driver is functionnally equivalent as the gpio-only driver
> and can use DT for pinconf. The platform_data confirmation is dropped.
> 
> This patchset removed the gpio-only driver and selects the Pinctrl driver
> config instead. This patchset also migrates the gpio dt-bindings to pinctrl
> and add the pinctrl optional properties.
> 
> The driver was tested with a SX1509 device on a BeagleBone black with
> interrupt support and on a X86_64 machine over an I2C to USB converter.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
> This is a fixed version that builds and runs on non-OF platforms and on
> arm based OF. The GPIO version is removed and the bindings are also moved
> to the pinctrl bindings.
> 
> One remaining question, should i2c_driver remove be implemented ?
> It would be quite hard to implement due to the interrupt controller.
> 
> Peter, could you test this fixed version instead ?
> 
> Changes since RFC at http://lkml.kernel.org/r/:
>  - Put #ifdef CONFIG_OF/CONFIG_OF_GPIO to remove OF code for non-of platforms
>  - No more rely on OF_GPIO config
>  - Moved and enhanced bindings to pinctrl bindings
>  - Removed gpio-sx150x.c
>  - Temporary select PINCTRL_SX150X when GPIO_SX150X
>  - Temporary mark GPIO_SX150X as deprecated
> 
>  .../devicetree/bindings/gpio/gpio-sx150x.txt       |   41 -
>  .../devicetree/bindings/pinctrl/pinctrl-sx150x.txt |   67 ++

Please use '-M' option so we just have to review the delta.

>  drivers/gpio/Kconfig                               |   10 +-
>  drivers/gpio/Makefile                              |    1 -
>  drivers/gpio/gpio-sx150x.c                         |  794 ---------------
>  drivers/pinctrl/Kconfig                            |   14 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-sx150x.c                   | 1060 ++++++++++++++++++++
>  8 files changed, 1145 insertions(+), 843 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
>  delete mode 100644 drivers/gpio/gpio-sx150x.c
>  create mode 100644 drivers/pinctrl/pinctrl-sx150x.c

[...]

> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
> new file mode 100644
> index 0000000..b8710c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
> @@ -0,0 +1,67 @@
> +SEMTECH SX150x GPIO expander bindings
> +
> +Please refer to ../pinctrl/pinctrl-bindings.txt, gpio.txt, and
> +../interrupt-controller/interrupts.txt for generic information regarding
> +pin controller, GPIO, and interrupt bindings.
> +
> +Required properties:
> +- compatible: should be "semtech,sx1506q",

should be one of:\n

> +			"semtech,sx1508q",
> +			"semtech,sx1509q",
> +			"semtech,sx1502q".
> +
> +- reg: The I2C slave address for this device.
> +
> +- #gpio-cells: Should be 2. The first cell is the GPIO number and the
> +		second cell is used to specify optional parameters:
> +		bit 0: polarity (0: normal, 1: inverted)
> +
> +- gpio-controller: Marks the device as a GPIO controller.
> +
> +Optional properties :
> +- interrupt-parent: phandle of the parent interrupt controller.
> +
> +- interrupts: Interrupt specifier for the controllers interrupt.
> +
> +- interrupt-controller: Marks the device as a interrupt controller.
> +
> +- semtech,probe-reset: Will trigger a reset of the GPIO expander on probe
> +
> +The GPIO expander can optionally be used as an interrupt controller, in
> +which case it uses the default two cell specifier.
> +
> +Required properties for pin configuration sub-nodes:
> + - pins: List of pins to which the configuration applies.
> +
> +Optional properties for pin configuration sub-nodes:
> +----------------------------------------------------
> + - bias-disable: disable any pin bias, except the OSCIO pin
> + - bias-pull-up: pull up the pin, except the OSCIO pin
> + - bias-pull-down: pull down the pin, except the OSCIO pin
> + - bias-pull-pin-default: use pin-default pull state, except the OSCIO pin
> + - drive-push-pull: drive actively high and low
> + - drive-open-drain: drive with open drain only for sx1508q and sx1509q and except the OSCIO pin
> + - output-low: set the pin to output mode with low level
> + - output-high: set the pin to output mode with high level
> +
> +Example:
> +
> +	i2c_gpio_expander@20{

While you're here, use '-' rather than '_'.

> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +		compatible = "semtech,sx1506q";
> +		reg = <0x20>;
> +		interrupt-parent = <&gpio_1>;
> +		interrupts = <16 0>;
> +
> +		gpio-controller;
> +		interrupt-controller;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio1_cfg_pins>;
> +
> +		gpio1_cfg_pins: gpio1_cfg {

Ditto.

> +			pins = "gpio1";
> +			bias-pull-up;
> +		};
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
