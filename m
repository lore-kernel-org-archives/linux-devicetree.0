From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: GPIO: Add gpio-initval
Date: Tue, 17 Nov 2015 14:35:42 -0600
Message-ID: <20151117203542.GA7091@rob-hp-laptop>
References: <1447754878-21099-1-git-send-email-mpa@pengutronix.de>
 <1447754878-21099-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447754878-21099-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Nov 17, 2015 at 11:07:57AM +0100, Markus Pargmann wrote:
> Add a binding for GPIO initialization.

Some comments, but they are really more on the gpio hog. I must have 
missed them.
 
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 34 ++++++++++++++++---------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 069cdf6f9dac..d11abfa13add 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -155,29 +155,39 @@ gpio-controller@00000000 {
>  	ngpios = <18>;
>  }
>  
> -The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> -providing automatic GPIO request and configuration as part of the
> -gpio-controller's driver probe function.
> +The GPIO chip may contain GPIO definitions. These define properties for single
> +GPIOs of this controller.
>  
> -Each GPIO hog definition is represented as a child node of the GPIO controller.
> +There are two types of GPIO definitions:
> +
> +- GPIO hogging is a mechanism providing automatic GPIO request and
> +  configuration as part of the gpio-controller driver's probe function. The
> +  GPIO is held until the gpio-controller is removed.

I can't say I like the term hogs, but that's just cosmetic.

> +- GPIO initialization provides an automatic initialization to known save
> +  values. The GPIO can be used normally afterwards.
> +
> +Each GPIO definition is represented as a child node of the GPIO controller.
>  Required properties:
> -- gpio-hog:   A property specifying that this child node represent a GPIO hog.
>  - gpios:      Store the GPIO information (id, flags, ...). Shall contain the
>  	      number of cells specified in its parent node (GPIO controller
>  	      node).
> -Only one of the following properties scanned in the order shown below.
> -This means that when multiple properties are present they will be searched
> -in the order presented below and the first match is taken as the intended
> -configuration.
> +
> +Optional properties:
> +- line-name:  The GPIO label name. If not present the node name is used.

We already have "label" for this purpose.

> +
> + The following two options are mutually exclusive. One of them should be
> + specified, but not both:
> +- gpio-hog:   A property specifying that this child node represent a GPIO hog.
> +- gpio-initval: This GPIO should be initialized to the specified configuration.
> +
> + The following three options are mutually exclusive. They change the setting of
> + the GPIO pin. One of them should be specified:
>  - input:      A property specifying to set the GPIO direction as input.
>  - output-low  A property specifying to set the GPIO direction as output with
>  	      the value low.
>  - output-high A property specifying to set the GPIO direction as output with
>  	      the value high.

If they are mutually exclusive, then it should just be one property with 
values. That is much more simple to validate.

But none of this is really even needed. We can do all this with existing 
bindings. Most gpio controllers use 2 cells and the 2nd cell was 
reserved for something like this. Simply adding a -gpios property in the 
gpio controller node would do the job:

init-gpios = <&self n (GPIO_ACTIVE_HIGH | GPIO_OUTPUT)>;
hog-gpios = <&self m GPIO_INPUT>;

Perhaps we don't want to use GPIO_ACTIVE_x here, but we have 31 more 
free bits to use.

Rob
