From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] Documentation: tps65086: Add DT bindings for the
 TPS65086 GPO controller
Date: Wed, 4 Nov 2015 16:57:38 -0600
Message-ID: <20151104225738.GA5127@rob-hp-laptop>
References: <1446657135-7820-1-git-send-email-afd@ti.com>
 <1446657135-7820-4-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446657135-7820-4-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 04, 2015 at 11:12:12AM -0600, Andrew F. Davis wrote:
> The TPS65086 PMIC contains several regulators and a GPO controller.
> Add bindings for the TPS65086 GPO controller.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  Documentation/devicetree/bindings/gpio/gpio-tps65086.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt b/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
> new file mode 100644
> index 0000000..ba05107
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
> @@ -0,0 +1,16 @@
> +* TPS65086 GPO Controller bindings
> +
> +Required properties:
> + - compatible		: Should be "ti,tps65086-gpio".
> + - gpio-controller	: Marks the device node as a GPIO Controller.
> + - #gpio-cells		: Should be two. The first cell is the pin number
> +			    and the second cell is used to specify flags.
> +			    See ../gpio/gpio.txt for possible values.
> +
> +Example:
> +
> +	gpio4: gpio {
> +		compatible = "ti,tps65086-gpio";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> -- 
> 1.9.1
> 
