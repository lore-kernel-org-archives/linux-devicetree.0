From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: mmio: add support for NI 169445 NAND GPIO
Date: Fri, 9 Dec 2016 15:06:55 -0600
Message-ID: <20161209210655.6kba4irujd7urb47@rob-hp-laptop>
References: <1480693022-22110-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480693022-22110-1-git-send-email-nathan.sullivan-acOepvfBmUk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 02, 2016 at 09:37:02AM -0600, Nathan Sullivan wrote:
> The GPIO-based NAND controller on National Instruments 169445 hardware
> exposes a set of simple lines for the control signals.
> 
> Signed-off-by: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
> ---
> "devicetree: add vendor prefix for National Instruments" added the ni vendor prefix.
> 
> This patch is needed for "MIPS: NI 169445 board support", so that GPIO NAND can work.
> 
>  .../bindings/gpio/ni,169445-nand-gpio.txt          | 36 ++++++++++++++++++++++
>  drivers/gpio/gpio-mmio.c                           |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt b/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> new file mode 100644
> index 0000000..ca2c14f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> @@ -0,0 +1,36 @@
> +Bindings for the National Instruments 169445 GPIO NAND controller
> +
> +The 169445 GPIO NAND controller has two memory mapped GPIO registers, one
> +for input (the ready signal) and one for output (control signals).  It is
> +intended to be used with the GPIO NAND driver.
> +
> +Required properties:
> +	- compatible: should be "ni,169445-nand-gpio"
> +	- reg-names: must contain
> +		"dat" - data register

-names with a single entry is pointless.

> +	- reg: address + size pairs describing the GPIO register sets;
> +		order must correspond with the order of entries in reg-names
> +	- #gpio-cells: must be set to 2. The first cell is the pin number and
> +			the second cell is used to specify the gpio polarity:
> +			0 = active high
> +			1 = active low
> +	- gpio-controller: Marks the device node as a gpio controller.
> +
> +Examples:
> +	gpio1: nand-gpio-out@1f300010 {

gpio-controller@...

> +		compatible = "ni,169445-nand-gpio";
> +		reg = <0x1f300010 0x4>;
> +		reg-names = "dat";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		ngpios = <5>;
> +	};
> +
> +	gpio2: nand-gpio-in@1f300014 {

ditto

> +		compatible = "ni,169445-nand-gpio";
> +		reg = <0x1f300014 0x4>;
> +		reg-names = "dat";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		ngpios = <1>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
