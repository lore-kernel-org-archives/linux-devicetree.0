From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] gpio: document polarity flag best practices
Date: Wed, 19 Feb 2014 23:20:56 +0100
Message-ID: <13285112.itIsE0msVp@avalon>
References: <1392835406-9380-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392835406-9380-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Thank you for the patch.

On Wednesday 19 February 2014 11:43:26 Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Document what we (Laurent and I, following a mailing list dicussion)
> believe are best practices for the polarity flag in a GPIO specifier.
> 
> While touching the doc, I made a few minor editing changes to other
> areas.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 60 ++++++++++++++++++----
>  1 file changed, 52 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt
> b/Documentation/devicetree/bindings/gpio/gpio.txt index
> 0c85bb6e3a80..3fb8f53071b8 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -13,11 +13,11 @@ properties, each containing a 'gpio-list':
>  	gpio-specifier : Array of #gpio-cells specifying specific gpio
>  			 (controller specific)
> 
> -GPIO properties should be named "[<name>-]gpios".  Exact
> +GPIO properties should be named "[<name>-]gpios". The exact
>  meaning of each gpios property must be documented in the device tree
>  binding for each device.
> 
> -For example, the following could be used to describe gpios pins to use
> +For example, the following could be used to describe GPIO pins used
>  as chip select lines; with chip selects 0, 1 and 3 populated, and chip
>  select 2 left empty:
> 
> @@ -44,35 +44,79 @@ whether pin is open-drain and whether pin is logically
> inverted. Exact meaning of each specifier cell is controller specific, and
> must be documented in the device tree binding for the device.
> 
> -Example of the node using GPIOs:
> +Example of a node using GPIOs:
> 
>  	node {
>  		gpios = <&qe_pio_e 18 0>;
>  	};
> 
>  In this example gpio-specifier is "18 0" and encodes GPIO pin number,
> -and empty GPIO flags as accepted by the "qe_pio_e" gpio-controller.
> +and GPIO flags as accepted by the "qe_pio_e" gpio-controller.
> +
> +1.1) GPIO specifier best practices
> +----------------------------------
> +
> +A gpio-specifier should contain a flag indicating the GPIO polarity;
> active- +high or active-low. If it does, the follow best practices should
> be followed: +
> +The gpio-specifier's polarity flag should represent the physical level at
> the +GPIO controller that achieves (or represents, for inputs) a logically
> asserted +value at the device. The exact definition of logically asserted
> should be +defined by the binding for the device. If the board inverts the
> signal between +the GPIO controller and the device, then the gpio-specifier
> will represent the +opposite physical level than the signal at the device's
> pin.
> +
> +When the device's signal polarity is configurable, the binding for the
> +device must either:
> +
> +a) Define a single static polarity for the signal, with the expectation
> that +any software using that binding would statically program the device
> to use +that signal polarity.
> +
> +The static choice of polarity may be either:
> +
> +a1) (Preferred) Dictated by a binding-specific DT property.
> +
> +or:
> +
> +a2) Defined statically by the DT binding itself.
> +
> +In particular, the polarity cannot be derived from the gpio-specifier,
> since +that would prevent the DT from separately representing the two
> orthogonal +concepts of configurable signal polarity in the device, and
> possible board- +level signal inversion.
> +
> +or:
> +
> +b) Pick a single option for device signal polarity, and document this
> choice +in the binding. The gpio-specifier should represent the polarity of
> the signal +(at the GPIO controller) assuming that the device is configured
> for this +particular signal polarity choice. If software chooses to program
> the device +to generate or receive a signal of the opposite polarity,
> software will be +responsible for correctly interpreting (inverting) the
> GPIO signal at the GPIO +controller.
> 
>  2) gpio-controller nodes
>  ------------------------
> 
> -Every GPIO controller node must both an empty "gpio-controller"
> -property, and have #gpio-cells contain the size of the gpio-specifier.
> +Every GPIO controller node must contain both an empty "gpio-controller"
> +property, and a #gpio-cells integer property, which indicates the number of
> +cells in a gpio-specifier.
> 
>  Example of two SOC GPIO banks defined as gpio-controller nodes:
> 
>  	qe_pio_a: gpio-controller@1400 {
> -		#gpio-cells = <2>;
>  		compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
>  		reg = <0x1400 0x18>;
>  		gpio-controller;
> +		#gpio-cells = <2>;
>  	};
> 
>  	qe_pio_e: gpio-controller@1460 {
> -		#gpio-cells = <2>;
>  		compatible = "fsl,qe-pario-bank-e", "fsl,qe-pario-bank";
>  		reg = <0x1460 0x18>;
>  		gpio-controller;
> +		#gpio-cells = <2>;
>  	};
> 
>  2.1) gpio- and pin-controller interaction

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
