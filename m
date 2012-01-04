From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: at91/gpio: remove the static specification of
 gpio_chip.base
Date: Wed, 4 Jan 2012 12:47:39 -0700
Message-ID: <20120104194739.GC15503@ponder.secretlab.ca>
References: <85d531b5686e5eff623bed9618f802198409905f.1323975517.git.nicolas.ferre@atmel.com>
 <62da3cffc145e2ada7ecbf4939a6029eb482d116.1323975517.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <62da3cffc145e2ada7ecbf4939a6029eb482d116.1323975517.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 15, 2011 at 08:16:07PM +0100, Nicolas Ferre wrote:
> This value is determined at runtime using device tree or platform data
> information.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
>  arch/arm/mach-at91/gpio.c |   13 ++++++-------
>  1 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/gpio.c b/arch/arm/mach-at91/gpio.c
> index c390f71..8ed0bc9 100644
> --- a/arch/arm/mach-at91/gpio.c
> +++ b/arch/arm/mach-at91/gpio.c
> @@ -49,7 +49,7 @@ static int at91_gpiolib_direction_input(struct gpio_chip *chip,
>  					unsigned offset);
>  static int at91_gpiolib_to_irq(struct gpio_chip *chip, unsigned offset);
>  
> -#define AT91_GPIO_CHIP(name, base_gpio, nr_gpio)			\
> +#define AT91_GPIO_CHIP(name, nr_gpio)					\
>  	{								\
>  		.chip = {						\
>  			.label		  = name,			\
> @@ -58,18 +58,17 @@ static int at91_gpiolib_to_irq(struct gpio_chip *chip, unsigned offset);
>  			.get		  = at91_gpiolib_get,		\
>  			.set		  = at91_gpiolib_set,		\
>  			.dbg_show	  = at91_gpiolib_dbg_show,	\
> -			.base		  = base_gpio,			\
>  			.to_irq		  = at91_gpiolib_to_irq,	\
>  			.ngpio		  = nr_gpio,			\
>  		},							\
>  	}
>  
>  static struct at91_gpio_chip gpio_chip[] = {
> -	AT91_GPIO_CHIP("pioA", 0x00, 32),
> -	AT91_GPIO_CHIP("pioB", 0x20, 32),
> -	AT91_GPIO_CHIP("pioC", 0x40, 32),
> -	AT91_GPIO_CHIP("pioD", 0x60, 32),
> -	AT91_GPIO_CHIP("pioE", 0x80, 32),
> +	AT91_GPIO_CHIP("pioA", 32),
> +	AT91_GPIO_CHIP("pioB", 32),
> +	AT91_GPIO_CHIP("pioC", 32),
> +	AT91_GPIO_CHIP("pioD", 32),
> +	AT91_GPIO_CHIP("pioE", 32),
>  };
>  
>  static int gpio_banks;
> -- 
> 1.7.5.4
> 
