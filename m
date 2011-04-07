From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [patch 1/2] Add dt_compat field to struct gpio_chip
Date: Thu, 7 Apr 2011 10:17:04 -0700
Message-ID: <20110407171704.GC2455@angua.secretlab.ca>
References: <20110407163322.465935232@gmail.com>
	<20110407163930.GB17498@dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110407163930.GB17498-iIV0ii4H0r6tG0bUXCXiUA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 07, 2011 at 06:39:30PM +0200, Domenico Andreoli wrote:
> From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This new field allows easy creation of GPIO chips in base of struct arrays.
> 
> Signed-off-by: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> ---
>  drivers/of/gpio.c          |    3 +++
>  include/asm-generic/gpio.h |    1 +
>  2 files changed, 4 insertions(+)
> 
> Index: b/drivers/of/gpio.c
> ===================================================================
> --- a/drivers/of/gpio.c	2011-04-07 18:19:20.000000000 +0200
> +++ b/drivers/of/gpio.c	2011-04-07 18:20:31.000000000 +0200
> @@ -212,6 +212,9 @@
>  
>  void of_gpiochip_add(struct gpio_chip *chip)
>  {
> +	if ((!chip->of_node) && (chip->dt_compat))
> +		chip->of_node = of_find_compatible_node(NULL, NULL, chip->dt_compat);
> +

Hi Domenico,

Thanks for looking at this.

However, I think there is a better way to solve this problem,

>From what I can tell, this patch attempts to adapt to the way that
arch/arm/plat-samsung/gpio.c registers gpios with the kernel.  Each
platform seems to have its own static table of gpio banks which are
registered without any regard to the Linux device model.  It works,
but it isn't really the way things should be done.

The design of gpiolib right now is such that the of_node pointer
should be known *before* of_gpiochip_add() gets called.  This is very
important because the code that registers the gpio is the only place
that can truly know which node is actually associated with the gpio.

To solve your problem, the best solution would be to rework
arch/arm/plat-samsung-gpio.c to properly use the driver model and
register platform_devices which can be attached to dt nodes.  This
change should probably be done anyway, even ignoring the dt needs, but
I'm not going to force you to make this change to get dt support added
for samsung gpios.

Alternately, what you should do is make sure that the chip->of_node
pointer is correctly populated before calling gpiochip_add(), possibly
in s3c_gpiolib_add().

Also, be careful about the way that 'compatible' is being used.
Remember that compatible describes the /interface/ to a device, but
not the /instance/.  Many systems have multiple instances of the same
device, and compatible doesn't provide any help for differentiating
between them.  Typically, when trying to find a specific instance of a
device, it should be resolved with a property in the /aliases node, or
it should be matched up against the resolved base address of the
device.

Cheers,
g.

>  	if ((!chip->of_node) && (chip->dev))
>  		chip->of_node = chip->dev->of_node;
>  
> Index: b/include/asm-generic/gpio.h
> ===================================================================
> --- a/include/asm-generic/gpio.h	2011-04-07 18:19:20.000000000 +0200
> +++ b/include/asm-generic/gpio.h	2011-04-07 18:19:30.000000000 +0200
> @@ -129,6 +129,7 @@
>  	int of_gpio_n_cells;
>  	int (*of_xlate)(struct gpio_chip *gc, struct device_node *np,
>  		        const void *gpio_spec, u32 *flags);
> +	const char *dt_compat;
>  #endif
>  };
>  
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
