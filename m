From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] gpio: add export with name from dts
Date: Fri, 11 Oct 2013 14:45:57 +0100
Message-ID: <20131011134557.GG3910@e106331-lin.cambridge.arm.com>
References: <1381489420-12578-1-git-send-email-jiri.prchal@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381489420-12578-1-git-send-email-jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Oct 11, 2013 at 12:03:40PM +0100, Jiri Prchal wrote:
> Add export possibility to sysfs with given name in device tree.
> Rebased from older unapplyed patch: [PATCH] owrt: GPIO: add gpio_export_with_name.
> 
> Signed-off-by: Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt |   61 +++++++++++++++++++++++
>  drivers/gpio/gpiolib-of.c                       |   61 +++++++++++++++++++++++
>  drivers/gpio/gpiolib.c                          |   27 ++++++----
>  include/asm-generic/gpio.h                      |    6 ++-
>  include/linux/gpio.h                            |   23 ++++++++-
>  5 files changed, 166 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 6cec6ff..03c4ef5 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -117,3 +117,64 @@ Example:
>  Here, a single GPIO controller has GPIOs 0..9 routed to pin controller
>  pinctrl1's pins 20..29, and GPIOs 10..19 routed to pin controller pinctrl2's
>  pins 50..59.
> +
> +
> +3) gpio-export
> +--------------
> +
> +gpio-export will allow you to automatically export gpio

What does this mean? In what sense is the gpio exported?

Why is this needed? What's the intended purpose?

This patch is embedding a completely Linux-specific policy (when and how
to export devices via sysfs) into the DT. That does not belong in the
DT, as it is not a description of hardware. As such, NAK.

If we want gpios exported to userspace, that is better handled
elsewhere, and does not warrant a device tree binding for controlling
software.

> +
> +required properties:
> +- compatible: Should be "gpio-export"
> +
> +in each child node will reprensent a gpio or if no name is specified
> +a list of gpio to export

What does this mean?

What is each child node meant to look like?

Why are names and lists mutually exclusive?

s/reprensent/represent/

> +
> +required properties:
> +- gpios: gpio to export

Isn't this contradictory to the above?

> +
> +optional properties:
> + - gpio-export,name: export name

What does this mean?

Type?

> + - gpio-export,output: to set the as output with default value
> + 		       if no present gpio as input

Type?

What values are valid?

> + - pio-export,direction_may_change: boolean to allow the direction to be controllable

s/pio/gpio/.

'_' should be '-'.

> +
> +Example:
> +
> +
> +gpio_export {
> +	compatible = "gpio-export";
> +	#size-cells = <0>;

Why is there a #size-cells? No children have reg properties.

> +
> +	in {
> +		gpio-export,name = "in";
> +		gpios = <&pioC 20 0>;
> +	};
> +
> +	out {
> +		gpio-export,name = "out";
> +		gpio-export,output = <1>;
> +		gpio-export,direction_may_change;
> +		gpios = <&pioC 21 0>;
> +	};
> +
> +	in_out {
> +		gpio-export,name = "in_out";
> +		gpio-export,direction_may_change;
> +		gpios = <&pioC 21 0>;
> +	};
> +
> +	gpios_in {
> +		gpios = <&pioB 0 0
> +			 &pioB 3 0
> +			 &pioC 4 0>;

Tom maintain consistency across various arbitrary-size composite value
lists, I'd prefer we bracket each entry in lists individually, e.g.

gpios = <&pioB 0 0>,
        <&pioB 3 0>,
        <&pioC 4 0>;

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
