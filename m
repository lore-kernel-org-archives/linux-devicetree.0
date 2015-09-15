From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/5] pinctrl: dt-binding: Add DT binding documentation
 for Atmel PIO4
Date: Tue, 15 Sep 2015 10:52:33 +0200
Message-ID: <20150915085233.GA4044@pengutronix.de>
References: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
 <1439281685-3020-3-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439281685-3020-3-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 11, 2015 at 10:28:02AM +0200, Ludovic Desroches wrote:
> Add documentation for the Atmel PIO4 controller introduced with SAMA5D2
> chip family.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> new file mode 100644
> index 0000000..61ac757
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> @@ -0,0 +1,90 @@
> +* Atmel PIO4 Controller
> +
> +The Atmel PIO4 controller is used to select the function of a pin and to
> +configure it.
> +
> +Required properties:
> +- compatible: "atmel,sama5d2-pinctrl".
> +- reg: base address and length of the PIO controller.
> +- interrupts: interrupt outputs from the controller, one for each bank.
> +- interrupt-controller: mark the device node as an interrupt controller.
> +- #interrupt-cells: should be two.
> +- gpio-controller: mark the device node as a gpio controller.
> +- #gpio-cells: should be two.
> +
> +Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
> +a general description of GPIO and interrupt bindings.
> +
> +Please refer to pinctrl-bindings.txt in this directory for details of the
> +common pinctrl bindings used by client devices.
> +
> +Subnode format
> +Each node (or subnode) will list the pins it needs and how to configured these
> +pins.
> +
> +	node {
> +		pinmux = <PIN_NUMBER_PINMUX>;
> +		GENERIC_PINCONFIG;
> +	};
> +
> +Required properties:
> +- pinmux: integer array. Each integer represents a pin number plus mux and
> +ioset settings. Use the macros from boot/dts/<soc>-pinfunc.h file to get the
> +right representation of the pin.
> +
> +Optional properties:
> +- GENERIC_PINCONFIG: generic pinconfig options to use, bias-disable,
> +bias-pull-down, bias-pull-up, drive-open-drain, input-schmitt-enable,
> +input-debounce, output-low, output-high.

For the binding:

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

It matches the Mediatek pinctrl binding and IMO the pinmux property
as described here is very suitable for controllers which can mux each
pin individually.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
