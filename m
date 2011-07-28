From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCHv2 1/2] of/gpio: export of_gpio_simple_xlate
Date: Thu, 28 Jul 2011 16:16:46 -0600
Message-ID: <20110728221646.GC4674@ponder.secretlab.ca>
References: <1311866742-29997-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1311866742-29997-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 28, 2011 at 04:25:41PM +0100, Jamie Iles wrote:
> Allow GPIO drivers to use of_gpio_simple_xlate.  This is useful for the
> generic GPIO driver for example where gpio_chip is embedded in
> bgpio_chip and doesn't need of_mm_gpio_chip but has a simple 1:1 GPIO
> mapping.
> 
> Cc: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>

Applied, thanks.

g.

> ---
>  drivers/of/gpio.c       |    5 +++--
>  include/linux/of_gpio.h |    9 +++++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/gpio.c b/drivers/of/gpio.c
> index 3007662..ef0105f 100644
> --- a/drivers/of/gpio.c
> +++ b/drivers/of/gpio.c
> @@ -127,8 +127,8 @@ EXPORT_SYMBOL(of_gpio_count);
>   * gpio chips. This function performs only one sanity check: whether gpio
>   * is less than ngpios (that is specified in the gpio_chip).
>   */
> -static int of_gpio_simple_xlate(struct gpio_chip *gc, struct device_node *np,
> -				const void *gpio_spec, u32 *flags)
> +int of_gpio_simple_xlate(struct gpio_chip *gc, struct device_node *np,
> +			 const void *gpio_spec, u32 *flags)
>  {
>  	const __be32 *gpio = gpio_spec;
>  	const u32 n = be32_to_cpup(gpio);
> @@ -152,6 +152,7 @@ static int of_gpio_simple_xlate(struct gpio_chip *gc, struct device_node *np,
>  
>  	return n;
>  }
> +EXPORT_SYMBOL(of_gpio_simple_xlate);
>  
>  /**
>   * of_mm_gpiochip_add - Add memory mapped GPIO chip (bank)
> diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
> index aec8025..52280a2 100644
> --- a/include/linux/of_gpio.h
> +++ b/include/linux/of_gpio.h
> @@ -57,6 +57,8 @@ extern int of_mm_gpiochip_add(struct device_node *np,
>  extern void of_gpiochip_add(struct gpio_chip *gc);
>  extern void of_gpiochip_remove(struct gpio_chip *gc);
>  extern struct gpio_chip *of_node_to_gpiochip(struct device_node *np);
> +extern int of_gpio_simple_xlate(struct gpio_chip *gc, struct device_node *np,
> +				const void *gpio_spec, u32 *flags);
>  
>  #else /* CONFIG_OF_GPIO */
>  
> @@ -72,6 +74,13 @@ static inline unsigned int of_gpio_count(struct device_node *np)
>  	return 0;
>  }
>  
> +static inline int of_gpio_simple_xlate(struct gpio_chip *gc,
> +				       struct device_node *np,
> +				       const void *gpio_spec, u32 *flags)
> +{
> +	return -ENOSYS;
> +}
> +
>  static inline void of_gpiochip_add(struct gpio_chip *gc) { }
>  static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
>  
> -- 
> 1.7.4.1
> 
