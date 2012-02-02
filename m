From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of_gpio: add support of of_gpio_named_count to be able
 to count named gpio
Date: Thu, 2 Feb 2012 12:47:47 -0700
Message-ID: <20120202194747.GW15343@ponder.secretlab.ca>
References: <1328196001-22154-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328196001-22154-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 02, 2012 at 04:20:01PM +0100, Jean-Christophe PLAGNIOL-VILLARD wrote:
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

Applied, thanks.

g.

> ---
>  drivers/of/gpio.c       |    9 +++++----
>  include/linux/of_gpio.h |   27 +++++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/of/gpio.c b/drivers/of/gpio.c
> index 7e62d15..e034b38 100644
> --- a/drivers/of/gpio.c
> +++ b/drivers/of/gpio.c
> @@ -78,8 +78,9 @@ err0:
>  EXPORT_SYMBOL(of_get_named_gpio_flags);
>  
>  /**
> - * of_gpio_count - Count GPIOs for a device
> + * of_gpio_named_count - Count GPIOs for a device
>   * @np:		device node to count GPIOs for
> + * @propname:	property name containing gpio specifier(s)
>   *
>   * The function returns the count of GPIOs specified for a node.
>   *
> @@ -93,14 +94,14 @@ EXPORT_SYMBOL(of_get_named_gpio_flags);
>   * defines four GPIOs (so this function will return 4), two of which
>   * are not specified.
>   */
> -unsigned int of_gpio_count(struct device_node *np)
> +unsigned int of_gpio_named_count(struct device_node *np, const char* propname)
>  {
>  	unsigned int cnt = 0;
>  
>  	do {
>  		int ret;
>  
> -		ret = of_parse_phandle_with_args(np, "gpios", "#gpio-cells",
> +		ret = of_parse_phandle_with_args(np, propname, "#gpio-cells",
>  						 cnt, NULL);
>  		/* A hole in the gpios = <> counts anyway. */
>  		if (ret < 0 && ret != -EEXIST)
> @@ -109,7 +110,7 @@ unsigned int of_gpio_count(struct device_node *np)
>  
>  	return cnt;
>  }
> -EXPORT_SYMBOL(of_gpio_count);
> +EXPORT_SYMBOL(of_gpio_named_count);
>  
>  /**
>   * of_gpio_simple_xlate - translate gpio_spec to the GPIO number and flags
> diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
> index e4e2058..1b3628d 100644
> --- a/include/linux/of_gpio.h
> +++ b/include/linux/of_gpio.h
> @@ -53,7 +53,8 @@ static inline struct of_mm_gpio_chip *to_of_mm_gpio_chip(struct gpio_chip *gc)
>  extern int of_get_named_gpio_flags(struct device_node *np,
>  		const char *list_name, int index, enum of_gpio_flags *flags);
>  
> -extern unsigned int of_gpio_count(struct device_node *np);
> +extern unsigned int of_gpio_named_count(struct device_node *np,
> +					const char* propname);
>  
>  extern int of_mm_gpiochip_add(struct device_node *np,
>  			      struct of_mm_gpio_chip *mm_gc);
> @@ -74,7 +75,8 @@ static inline int of_get_named_gpio_flags(struct device_node *np,
>  	return -ENOSYS;
>  }
>  
> -static inline unsigned int of_gpio_count(struct device_node *np)
> +static inline unsigned int of_gpio_named_count(struct device_node *np,
> +					const char* propname)
>  {
>  	return 0;
>  }
> @@ -92,6 +94,27 @@ static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
>  #endif /* CONFIG_OF_GPIO */
>  
>  /**
> + * of_gpio_count - Count GPIOs for a device
> + * @np:		device node to count GPIOs for
> + *
> + * The function returns the count of GPIOs specified for a node.
> + *
> + * Note that the empty GPIO specifiers counts too. For example,
> + *
> + * gpios = <0
> + *          &pio1 1 2
> + *          0
> + *          &pio2 3 4>;
> + *
> + * defines four GPIOs (so this function will return 4), two of which
> + * are not specified.
> + */
> +static inline unsigned int of_gpio_count(struct device_node *np)
> +{
> +	return of_gpio_named_count(np, "gpios");
> +}
> +
> +/**
>   * of_get_gpio_flags() - Get a GPIO number and flags to use with GPIO API
>   * @np:		device node to get GPIO from
>   * @index:	index of the GPIO
> -- 
> 1.7.7
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
