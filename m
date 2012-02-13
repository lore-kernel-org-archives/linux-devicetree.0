From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] gpio: drop CONFIG_OF_GPIO in the definition of the
 struct gpio_chip
Date: Mon, 13 Feb 2012 11:18:10 +0100
Message-ID: <4F38E362.6010307@atmel.com>
References: <1329125002-21134-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1329125002-21134-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/13/2012 10:23 AM, Jean-Christophe PLAGNIOL-VILLARD :
> this will allow to avoid the ifdef CONFIG_OF_GPIO in gpio drivers
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Added devicetree-discuss ml.

> ---
>  include/asm-generic/gpio.h |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index 1ff4e22..c08b758 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -122,7 +122,6 @@ struct gpio_chip {
>  	unsigned		can_sleep:1;
>  	unsigned		exported:1;
>  
> -#if defined(CONFIG_OF_GPIO)
>  	/*
>  	 * If CONFIG_OF is enabled, then all GPIO controllers described in the

Maybe you will need to rework this comment.

>  	 * device tree automatically may have an OF translation
> @@ -131,7 +130,6 @@ struct gpio_chip {
>  	int of_gpio_n_cells;
>  	int (*of_xlate)(struct gpio_chip *gc,
>  		        const struct of_phandle_args *gpiospec, u32 *flags);
> -#endif

I do not know if we can remove the ifdef completely of just move of_node
out of it.


>  };
>  
>  extern const char *gpiochip_is_requested(struct gpio_chip *chip,


-- 
Nicolas Ferre
