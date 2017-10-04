From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC] gpio: of: document gpio-init nodes
Date: Wed, 4 Oct 2017 15:53:06 -0500
Message-ID: <20171004205306.wzvxmstcberpws25@rob-hp-laptop>
References: <20170922204138.29951-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170922204138.29951-1-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 10:41:38PM +0200, Uwe Kleine-König wrote:
> Sometimes it is desirable to define a "safe" configuration for a GPIO in
> the device tree but let the operating system later still make use of
> this pin.
> 
> This might for example be useful to initially configure a debug pin that
> is usually unconnected as output to prevent floating until it is used
> later.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this picks up a discussion that pops up now and then with our customers.
> 
> Last time I discussed this topic with Linus Walleij my suggestion was to
> merge this usecase with gpio-hogs, but he wasn't happy with it because
> hogging implies that the pin is not free for other usage and he
> suggested to use "gpio-init" instead.
> 
> Maybe it's arguable if this "initial configuration" belongs into the
> device tree, but IMHO defining a "safe configuration" should have a
> place and the requirements are identical. This isn't implied by the name
> however, but I don't have a better idea for a different name.

It can be argued that by the time the kernel boots, it is way to late to 
configure pins to a safe state. Of course, even secure world reads the 
DT these days (or are at least talking about doing so). Still any s/w 
handling this could be too slow to get to a safe state.

Maybe "optimal default" state would be more accurate. 

> 
> Thinking further (which was also discussed last time) it would also be
> nice to restrict usage. For example that a given pin that has
> "output-low" as its safe setting might be configured later als high
> output but not as input. Maybe:

I can't imagine that an output can't be an input. Regardless, what 
you're describing is constraints and that seems like a whole other 
problem than default/initial state.

Plus, for constraints I'd think we want this done at the pin level, not 
GPIO. And we kind of already have that with pin states.

> 	companion-reset {
> 		gpio-somethingwithsafe;
> 		gpios = <12 0>;

"gpios" is already a defined property with a type (phandle + args). dtc 
checks for this now though gpio-hogs is already one exception, and I 
don't want to add another. Maybe it could be generalized to be allowed 
when the parent is a gpio-controller, but really I'd like to avoid this 
pattern from spreading.

> 		output-low;
> 		fixed-direction;
> 	};
> 
> (Conceptually we would have a hog then when also adding "fixed-value".)
> 
> I'm not sure the early configuration should be implemented in Linux. I'd
> target the bootloader for that instead, still having the blessing of a
> binding document would be great.
> 
> I look forward to your comments and ideas.
> 
> Best regards
> Uwe
> 
>  Documentation/devicetree/bindings/gpio/gpio.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 802402f6cc5d..849d620cee4d 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -207,6 +207,11 @@ configuration.
>  Optional properties:
>  - line-name:  The GPIO label name. If not present the node name is used.
>  
> +Similar to hogging above GPIOs can be initialized to a certain configuration
> +only which compared to hogs doesn't prevent the operating system to change the
> +pin later. The syntax is similar to hog definitons, the difference is only that
> +the identifying property is "gpio-init" instead of "gpio-hog".
> +
>  Example of two SOC GPIO banks defined as gpio-controller nodes:
>  
>  	qe_pio_a: gpio-controller@1400 {
> @@ -221,6 +226,12 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
>  			output-low;
>  			line-name = "foo-bar-gpio";
>  		};
> +
> +		companion-reset {
> +			gpio-init;
> +			gpios = <12 0>;
> +			output-low;
> +		};
>  	};
>  
>  	qe_pio_e: gpio-controller@1460 {
> -- 
> 2.11.0
> 
