From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Thu, 17 Oct 2013 16:04:55 +0100
Message-ID: <20131017150455.GH24056@e106331-lin.cambridge.arm.com>
References: <1382011682-18595-1-git-send-email-jiri.prchal@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1382011682-18595-1-git-send-email-jiri.prchal@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "blogic@openwrt.org" <blogic@openwrt.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "acourbot@nvidia.com" <acourbot@nvidia.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "cooloney@gmail.com" <cooloney@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello Jiri,

On Thu, Oct 17, 2013 at 01:08:02PM +0100, Jiri Prchal wrote:
> Add export possibility to sysfs with given name in device tree. It is nice for
> users to have board specific gpios exported at boot-time and with their names.
> It renames some functions in gpiolib and adds name as parameter. If it is passed
> NULL as name everything works like before, export by chip name.
> It can be done by extra function export_with_name without changing original
> export function but I think there would not to be twice almost the same.
> Even if gpio sysfs interface is almost to be deprecated, I would like to add
> this, cause new chardev interface is in farness future.
> Rebased from older unapplyed patch: [PATCH] owrt: GPIO: add gpio_export_with_name.
> v3:
> change to "linux,gpio-export"
> removed arrays of gpios, just one child node -> one GPIO line
> simplified node properties like as it's in gpio-leds
> if not label -> uses child node name
> 
> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt |   44 ++++++++++++++++++
>  drivers/gpio/gpiolib-of.c                       |   56 +++++++++++++++++++++++
>  drivers/gpio/gpiolib.c                          |   27 +++++++----
>  include/asm-generic/gpio.h                      |    6 ++-
>  include/linux/gpio.h                            |   23 +++++++++-
>  5 files changed, 144 insertions(+), 12 deletions(-)

As I mentioned on v1 of this patch [1], I do not think that this is the
right way to go about exporting GPIOs to userspace. Why do we need a
binding for a non-device to tell Linux (specifically Linux) whether or
not to represent a device to userspace, and how to do so?

Why can this policy not be handled within the GPIO framework, or within
GPIO drivers?

I would appreciate a response this time.

[1] http://thread.gmane.org/gmane.linux.drivers.devicetree/47822

Thanks,
Mark.

> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 6cec6ff..9888186 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -117,3 +117,47 @@ Example:
>  Here, a single GPIO controller has GPIOs 0..9 routed to pin controller
>  pinctrl1's pins 20..29, and GPIOs 10..19 routed to pin controller pinctrl2's
>  pins 50..59.
> +
> +3) gpio-export
> +--------------
> +
> +gpio-export will allow you to export a GPIO line to linux sysfs.
> +Can be used to describe hw GPIO lines by "name" and to have them exported at
> +boot-time to make it convenient for users.
> +
> +required properties:
> +- compatible: Should be "linux,gpio-export"
> +
> +in each child node will represent a GPIO line
> +
> +required properties:
> +- gpios: GPIO line to export
> +
> +optional properties:
> + - label: export name, if not present, child node name used
> + - output: to set it as output with default value
> +	   if not present gpio as input

Is this a boolean property, or a default value to output? This seems
like an awfully generic name.

> + - direction-may-change: boolean to allow the direction to be controllable
> +
> +Example:
> +
> +gpio_export {
> +	compatible = "linux,gpio-export";
> +
> +	in {
> +		label = "in";
> +		gpios = <&pioC 20 0>;
> +	};
> +
> +	out {
> +		label = "out";
> +		output = <1>;
> +		direction-may-change;
> +		gpios = <&pioC 21 0>;
> +	};
> +
> +	in_out {
> +		direction-may-change;
> +		gpios = <&pioC 22 0>;
> +	};
> +};
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 0dfaf20..7ecdf1b 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -21,6 +21,8 @@
>  #include <linux/of_gpio.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/slab.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
>  
>  /* Private data structure for of_gpiochip_find_and_xlate */
>  struct gg_data {
> @@ -243,3 +245,57 @@ void of_gpiochip_remove(struct gpio_chip *chip)
>  	if (chip->of_node)
>  		of_node_put(chip->of_node);
>  }
> +
> +static struct of_device_id gpio_export_ids[] = {
> +	{ .compatible = "linux,gpio-export" },
> +	{ /* sentinel */ }
> +};
> +
> +static int __init of_gpio_export_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *cnp;
> +	u32 val;
> +	int nb = 0;
> +
> +	for_each_child_of_node(np, cnp) {
> +		const char *name = NULL;
> +		int gpio;
> +		bool dmc;
> +
> +		of_property_read_string(cnp, "label", &name);
> +		if (!name)
> +			name = cnp->name;
> +
> +		gpio = of_get_gpio(cnp, 0);
> +		if (devm_gpio_request(&pdev->dev, gpio, name))
> +			continue;
> +
> +		if (!of_property_read_u32(cnp, "output", &val))
> +			gpio_direction_output(gpio, val);
> +		else
> +			gpio_direction_input(gpio);
> +
> +		dmc = of_property_read_bool(np, "direction-may-change");
> +		gpio_export_with_name(gpio, dmc, name);
> +		nb++;
> +	}
> +
> +	dev_info(&pdev->dev, "%d gpio(s) exported\n", nb);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver gpio_export_driver = {
> +	.driver		= {
> +		.name		= "linux,gpio-export",
> +		.owner	= THIS_MODULE,
> +		.of_match_table	= of_match_ptr(gpio_export_ids),
> +	},
> +};
> +
> +static int __init of_gpio_export_init(void)
> +{
> +	return platform_driver_probe(&gpio_export_driver, of_gpio_export_probe);
> +}
> +device_initcall(of_gpio_export_init);
> \ No newline at end of file
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 86ef346..c7494d1 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -96,7 +96,8 @@ static int gpiod_get_value(const struct gpio_desc *desc);
>  static void gpiod_set_value(struct gpio_desc *desc, int value);
>  static int gpiod_cansleep(const struct gpio_desc *desc);
>  static int gpiod_to_irq(const struct gpio_desc *desc);
> -static int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
> +static int gpiod_export_with_name(struct gpio_desc *desc,
> +				  bool direction_may_change, const char *name);
>  static int gpiod_export_link(struct device *dev, const char *name,
>  			     struct gpio_desc *desc);
>  static int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value);
> @@ -674,7 +675,7 @@ static ssize_t export_store(struct class *class,
>  			status = -ENODEV;
>  		goto done;
>  	}
> -	status = gpiod_export(desc, true);
> +	status = gpiod_export_with_name(desc, true, NULL);
>  	if (status < 0)
>  		gpiod_free(desc);
>  	else
> @@ -736,9 +737,10 @@ static struct class gpio_class = {
>  
>  
>  /**
> - * gpio_export - export a GPIO through sysfs
> + * gpiod_export_with_name - export a GPIO through sysfs
>   * @gpio: gpio to make available, already requested
>   * @direction_may_change: true if userspace may change gpio direction
> + * @name: gpio name
>   * Context: arch_initcall or later
>   *
>   * When drivers want to make a GPIO accessible to userspace after they
> @@ -750,7 +752,8 @@ static struct class gpio_class = {
>   *
>   * Returns zero on success, else an error.
>   */
> -static int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
> +int gpiod_export_with_name(struct gpio_desc *desc, bool direction_may_change,
> +			  const char *name)
>  {
>  	unsigned long		flags;
>  	int			status;
> @@ -788,7 +791,9 @@ static int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
>  	spin_unlock_irqrestore(&gpio_lock, flags);
>  
>  	offset = gpio_chip_hwgpio(desc);
> -	if (desc->chip->names && desc->chip->names[offset])
> +	if (name)
> +		ioname = name;
> +	else if (desc->chip->names && desc->chip->names[offset])
>  		ioname = desc->chip->names[offset];
>  
>  	dev = device_create(&gpio_class, desc->chip->dev, MKDEV(0, 0),
> @@ -829,11 +834,13 @@ fail_unlock:
>  	return status;
>  }
>  
> -int gpio_export(unsigned gpio, bool direction_may_change)
> +int gpio_export_with_name(unsigned gpio, bool direction_may_change,
> +			  const char *name)
>  {
> -	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
> +	return gpiod_export_with_name(gpio_to_desc(gpio), direction_may_change,
> +				      name);
>  }
> -EXPORT_SYMBOL_GPL(gpio_export);
> +EXPORT_SYMBOL_GPL(gpio_export_with_name);
>  
>  static int match_export(struct device *dev, const void *data)
>  {
> @@ -1531,7 +1538,9 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
>  		goto free_gpio;
>  
>  	if (flags & GPIOF_EXPORT) {
> -		err = gpiod_export(desc, flags & GPIOF_EXPORT_CHANGEABLE);
> +		err = gpiod_export_with_name(desc,
> +					     flags & GPIOF_EXPORT_CHANGEABLE,
> +					     NULL);
>  		if (err)
>  			goto free_gpio;
>  	}
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index bde6469..d0970e3 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -202,7 +202,8 @@ extern void gpio_free_array(const struct gpio *array, size_t num);
>   * A sysfs interface can be exported by individual drivers if they want,
>   * but more typically is configured entirely from userspace.
>   */
> -extern int gpio_export(unsigned gpio, bool direction_may_change);
> +extern int gpio_export_with_name(unsigned gpio, bool direction_may_change,
> +				 const char *name);
>  extern int gpio_export_link(struct device *dev, const char *name,
>  			unsigned gpio);
>  extern int gpio_sysfs_set_active_low(unsigned gpio, int value);
> @@ -284,7 +285,8 @@ struct device;
>  
>  /* sysfs support is only available with gpiolib, where it's optional */
>  
> -static inline int gpio_export(unsigned gpio, bool direction_may_change)
> +static inline int gpio_export_with_name(unsigned gpio, bool direction_may_change,
> +					const char *name)
>  {
>  	return -ENOSYS;
>  }
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index 552e3f4..12a6cd2 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -169,7 +169,8 @@ static inline void gpio_set_value_cansleep(unsigned gpio, int value)
>  	WARN_ON(1);
>  }
>  
> -static inline int gpio_export(unsigned gpio, bool direction_may_change)
> +static inline int gpio_export_with_name(unsigned gpio, bool direction_may_change,
> +					const char *name)
>  {
>  	/* GPIO can never have been requested or set as {in,out}put */
>  	WARN_ON(1);
> @@ -236,4 +237,24 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
>  			  unsigned long flags, const char *label);
>  void devm_gpio_free(struct device *dev, unsigned int gpio);
>  
> +/**
> + * gpio_export - export a GPIO through sysfs
> + * @gpio: gpio to make available, already requested
> + * @direction_may_change: true if userspace may change gpio direction
> + * Context: arch_initcall or later
> + *
> + * When drivers want to make a GPIO accessible to userspace after they
> + * have requested it -- perhaps while debugging, or as part of their
> + * public interface -- they may use this routine.  If the GPIO can
> + * change direction (some can't) and the caller allows it, userspace
> + * will see "direction" sysfs attribute which may be used to change
> + * the gpio's direction.  A "value" attribute will always be provided.
> + *
> + * Returns zero on success, else an error.
> + */
> +static inline int gpio_export(unsigned gpio,bool direction_may_change)
> +{
> +	return gpio_export_with_name(gpio, direction_may_change, NULL);
> +}
> +
>  #endif /* __LINUX_GPIO_H */
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
