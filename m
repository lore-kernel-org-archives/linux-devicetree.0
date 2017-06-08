From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] gpio: use "output-active" and "output-inactive" for
 gpio-hogs
Date: Thu, 8 Jun 2017 17:33:46 -0500
Message-ID: <20170608223346.unfwdh32v3kt2y52@rob-hp-laptop>
References: <20170604101049.4592-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170604101049.4592-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 04, 2017 at 12:10:49PM +0200, Uwe Kleine-König wrote:
> Using the following gpio hog:
> 
> 	{
> 		gpio-hog;
> 		gpios = <17 GPIO_ACTIVE_LOW>;
> 		output-high;
> 	}
> 
> results in the gpio to be set to (physically) low value, which is
> surprising. So support "output-active" which makes the semantic more
> obvious. The old semantic is still supported for backward compatibility.

Ugg. Can't say I'm a fan of the Linux GPIO subsystem inverting the logic 
for GPIO_ACTIVE_LOW...

> 
> Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> ---
> Hello,
> 
> the next logical step would be to go through all in-tree dts files and
> substitute the old properties by the new ones. I can do this as soon as
> the idea is discussed and considered to be good.
> 
> Maybe the same idea can be applied to the cpp definitions GPIOD_OUT_LOW
> and GPIOD_OUT_HIGH.
> 
> And btw I wondered about the binding that defines what should happen in
> this case:
> 
> 	{
> 		gpio-hog;
> 		gpios = <...>;
> 		output-high;
> 		output-low;
> 	}
> 
> I would have defined as undefined instead of inactive.
> 
> Best regards
> Uwe
> 
>  Documentation/devicetree/bindings/gpio/gpio.txt | 10 ++++++----
>  drivers/gpio/gpiolib-of.c                       |  4 ++++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 68d28f62a6f4..4d29e0b33435 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -196,10 +196,12 @@ This means that when multiple properties are present they will be searched
>  in the order presented below and the first match is taken as the intended
>  configuration.
>  - input:      A property specifying to set the GPIO direction as input.
> -- output-low  A property specifying to set the GPIO direction as output with
> -	      the value low.
> -- output-high A property specifying to set the GPIO direction as output with
> -	      the value high.
> +- output-inactive: A property specifying to set the GPIO direction as output
> +	      using the inactive level as value.
> +- output-active: A property specifying to set the GPIO direction as output
> +	      using the active level as value.
> +- output-low  A deprecated alias for "output-inactive".
> +- output-high A deprecated alias for "output-active".

The question is was this really what was expected. I guess based on the 
code it was. I would have expected these gave low or high voltage 
levels. Seems like Linuxisms defining the binding.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
