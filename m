From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH V6 5/5] gpio: implement gpio-ranges binding document fix
Date: Wed, 28 Aug 2013 21:47:43 +0100
Message-ID: <20130828204743.4AF6E3E0B6B@localhost>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org> <1376515632-12594-5-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1376515632-12594-5-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, 14 Aug 2013 15:27:12 -0600, Stephen Warren <swarren@wwwdotorg.org> wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Use the new of_parse_phandle_with_fixed_args() to implement the
> corrected gpio-ranges DT property definition.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>

I'll take this with the rest of the series.

g.

> ---
>  drivers/gpio/gpiolib-of.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 665f953..48cda3c 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -194,8 +194,8 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
>  		return;
>  
>  	for (;; index++) {
> -		ret = of_parse_phandle_with_args(np, "gpio-ranges",
> -				"#gpio-range-cells", index, &pinspec);
> +		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +				index, &pinspec);
>  		if (ret)
>  			break;
>  
> -- 
> 1.8.1.5
> 

