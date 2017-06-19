From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v1] pinctrl: generic: Add output-enable property
Date: Mon, 19 Jun 2017 10:55:12 +0300
Message-ID: <8308055.PJrIDk1Zue@avalon>
References: <1497603581-9632-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497603581-9632-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Friday 16 Jun 2017 10:59:41 Jacopo Mondi wrote:
> Add output-enable generic pin configuration property.
> This properties allows enabling/disabling pin's output capabilities
> without actually driving any value on the line.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> ---
> 
> So, after that many discussions I'm now sending this, that only adds a new
> flag used to enable or disable a pin's output capabilities.
> I intentionally avoided naming the output buffer explicitly because if and
> how it has to be enabled/disabled is a platform specific details each
> driver has to take care of.
> 
> Dong: this is similar to what you recently proposed, without mentioning the
> output buffer directly. Can I have your Reviewed-by or your Acked-by here?
> 
> Linus, Andy: I initially proposed to add "output-buffer-enable" in place of
> this one, so not to confuse the property's semantic with its real world
> effect. While I'm still partially convinced output-enable is not the most
> accurate choice possible, it certainly is the best balance with bindings
> clearness, and the one where more consensus has been collected on. Hope
> this flies for you too and we can have this merged so me and Dong can send
> our updated series on top of this.
> 
> Thanks
>    j
> 
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 2 ++
>  drivers/pinctrl/pinconf-generic.c                              | 3 +++
>  include/linux/pinctrl/pinconf-generic.h                        | 3 +++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt index
> f01d154..f8af190 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -259,6 +259,8 @@ input-debounce		- debounce mode with debound 
time X
>  power-source		- select between different power supplies
>  low-power-enable	- enable low power mode
>  low-power-disable	- disable low power mode
> +output-disable		- disable output on a pin
> +output-enable		- enable output on a pin
>  output-low		- set the pin to output mode with low level
>  output-high		- set the pin to output mode with high level
>  slew-rate		- set the slew rate
> diff --git a/drivers/pinctrl/pinconf-generic.c
> b/drivers/pinctrl/pinconf-generic.c index 720a19f..fc0c230 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -44,6 +44,7 @@ static const struct pin_config_item conf_items[] = {
>  	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, 
false),
> PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_ENABLE, "input schmitt enabled", NULL,
> false), PCONFDUMP(PIN_CONFIG_LOW_POWER_MODE, "pin low power", "mode",
> true), +	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL,
> false), PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
>  	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", 
true),
>  	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
> @@ -172,6 +173,8 @@ static const struct pinconf_generic_params dt_params[] =
> { { "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
>  	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
>  	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
> +	{ "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
> +	{ "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
>  	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
>  	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
>  	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
> diff --git a/include/linux/pinctrl/pinconf-generic.h
> b/include/linux/pinctrl/pinconf-generic.h index 7620eb1..5761958 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -73,6 +73,8 @@
>   *	operation, if several modes of operation are supported these can be
>   *	passed in the argument on a custom form, else just use argument 1
>   *	to indicate low power mode, argument 0 turns low power mode off.
> + * @PIN_CONFIG_OUTPUT_ENABLE: this will enable the pin's output mode
> + * 	without driving a value there. 1 enables output mode, 0 disables it.

I think you need to elaborate a bit more here. It will be very difficult for a 
developer to understand the rationale behind PIN_CONFIG_OUTPUT_ENABLE and when 
it should be used instead of PIN_CONFIG_OUTPUT with just those two lines of 
documentation if he/she hasn't followed the discussion that led to this patch.

>   * @PIN_CONFIG_OUTPUT: this will configure the pin as an output. Use
> argument
>   *	1 to indicate high level, argument 0 to indicate low level. (Please
>   *	see Documentation/pinctrl.txt, section "GPIO mode pitfalls" for a
> @@ -105,6 +107,7 @@ enum pin_config_param {
>  	PIN_CONFIG_INPUT_SCHMITT,
>  	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
>  	PIN_CONFIG_LOW_POWER_MODE,
> +	PIN_CONFIG_OUTPUT_ENABLE,
>  	PIN_CONFIG_OUTPUT,
>  	PIN_CONFIG_POWER_SOURCE,
>  	PIN_CONFIG_SLEW_RATE,
> --
> 2.7.4

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
