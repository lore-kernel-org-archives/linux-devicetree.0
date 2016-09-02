From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/8] gpio: dt-bindings: Add documentation for Aspeed
 GPIO controllers
Date: Fri, 2 Sep 2016 10:00:45 -0500
Message-ID: <20160902150045.GA17024@rob-hp-laptop>
References: <20160830075427.11493-1-andrew@aj.id.au>
 <20160830075427.11493-5-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160830075427.11493-5-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 05:24:23PM +0930, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/gpio/gpio-aspeed.txt       | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> new file mode 100644
> index 000000000000..09f26cac18d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> @@ -0,0 +1,36 @@
> +Aspeed GPIO controller Device Tree Bindings
> +-------------------------------------------
> +
> +Required properties:
> +- #gpio-cells 		: Should be two
> +			  - First cell is the GPIO line number
> +			  - Second cell is used to specify optional
> +			    parameters (unused)
> +
> +- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"

I'd prefer this be listed first if you respin this.

> +
> +- reg			: Address and length of the register set for the device
> +- gpio-controller	: Marks the device node as a GPIO controller.
> +- interrupts		: Interrupt specifier (see interrupt bindings for
> +			  details)
> +- interrupt-controller	: Mark the GPIO controller as an interrupt-controller
> +
> +Optional properties:
> +
> +- interrupt-parent     : The parent interrupt controller, optional if inherited
> +
> +The gpio and interrupt properties are further described in their respective
> +bindings documentation:
> +
> +- Documentation/devicetree/bindings/gpio/gpio.txt
> +- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +
> +  Example:
> +	gpio@1e780000 {
> +		#gpio-cells = <2>;
> +		compatible = "aspeed,ast2400-gpio";
> +		gpio-controller;
> +		interrupts = <20>;
> +		reg = <0x1e780000 0x1000>;
> +		interrupt-controller;
> +	};
> -- 
> 2.9.3.1.g0db844e
> 
