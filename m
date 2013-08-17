Return-Path: <devicetree-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:32907 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148Ab3HQI6Y (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 04:58:24 -0400
Message-ID: <520F3B2B.6000805@collabora.co.uk>
Date: Sat, 17 Aug 2013 10:58:19 +0200
From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] gpio: interrupt consistency check for OF GPIO IRQs
References: <1376697255-18806-1-git-send-email-linus.walleij@linaro.org>
In-Reply-To: <1376697255-18806-1-git-send-email-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>, Lars Poeschel <poeschel@lemonage.de>
List-ID: <devicetree@vger.kernel.org>

On 08/17/2013 01:54 AM, Linus Walleij wrote:
> Currently the kernel is ambigously treating GPIOs and interrupts
> from a GPIO controller: GPIOs and interrupts are treated as
> orthogonal. This unfortunately makes it unclear how to actually
> retrieve and request a GPIO line or interrupt from a GPIO
> controller in the device tree probe path.
> 
> In the non-DT probe path it is clear that the GPIO number has to
> be passed to the consuming device, and if it is to be used as
> an interrupt, the consumer shall performa a gpio_to_irq() mapping
> and request the resulting IRQ number.
> 
> In the DT boot path consumers may have been given one or more
> interrupts from the interrupt-controller side of the GPIO chip
> in an abstract way, such that the driver is not aware of the
> fact that a GPIO chip is backing this interrupt, and the GPIO
> side of the same line is never requested with gpio_request().
> A typical case for this is ethernet chips which just take some
> interrupt line which may be a "hard" interrupt line (such as an
> external interrupt line from an SoC) or a cascaded interrupt
> connected to a GPIO line.
> 
> This has the following undesired effects:
> 
> - The GPIOlib subsystem is not aware that the line is in use
>   and willingly lets some other consumer perform gpio_request()
>   on it, leading to a complex resource conflict if it occurs.
> 
> - The GPIO debugfs file claims this GPIO line is "free".
> 
> - The line direction of the interrupt GPIO line is not
>   explicitly set as input, even though it is obvious that such
>   a line need to be set up in this way, often making the system
>   depend on boot-on defaults for this kind of settings.
> 
> To solve this dilemma, perform an interrupt consistency check
> when adding a GPIO chip: if the chip is both gpio-controller and
> interrupt-controller, walk all children of the device tree,
> check if these in turn reference the interrupt-controller, and
> if they do, loop over the interrupts used by that child and
> perform gpio_request() and gpio_direction_input() on these,
> making them unreachable from the GPIO side.
> 
> The patch has been devised by Linus Walleij and Lars Poeschel.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Enric Balletbo i Serra <eballetbo@gmail.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Cc: Kevin Hilman <khilman@linaro.org>
> Cc: Balaji T K <balajitk@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Jon Hunter <jgchunter@gmail.com>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c | 161 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 665f953..216e939 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -10,7 +10,6 @@
>   * the Free Software Foundation; either version 2 of the License, or
>   * (at your option) any later version.
>   */
> -
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/module.h>
> @@ -19,6 +18,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_gpio.h>
> +#include <linux/of_irq.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/slab.h>
>  
> @@ -127,6 +127,161 @@ int of_gpio_simple_xlate(struct gpio_chip *gc,
>  EXPORT_SYMBOL(of_gpio_simple_xlate);
>  
>  /**
> + * of_gpio_scan_irq_lines() - internal function to recursively scan the device
> + * tree and request or free the GPIOs that are to be used as IRQ lines
> + * @node:	node to start the scanning at
> + * @gcn:	device node of the GPIO chip
> + * @gc:		GPIO chip instantiated from same node
> + * @request:	wheter the function should request(true) or free(false) the
> + *		irq lines
> + *
> + * This is a internal function that calls itself to recursively scan the device
> + * tree. It scans for uses of the device_node gcn as an interrupt-controller.
> + * If it finds some, it requests the corresponding gpio lines that are to be
> + * used as irq lines and sets them as input.
> + *
> + * If the request parameter is 0 it frees the gpio lines.
> + * For more information see documentation of of_gpiochip_reserve_irq_lines
> + * function.
> + */
> +static void of_gpio_scan_irq_lines(const struct device_node *const node,
> +				   struct device_node * const gcn,
> +				   const struct gpio_chip * const gc,
> +				   bool request)
> +{
> +	struct device_node *child;
> +	struct device_node *irq_parent;
> +	const __be32 *intspec;
> +	u32 intlen;
> +	u32 offset;
> +	int ret;
> +	int num_irq;
> +	int i;
> +
> +	if (node == NULL)
> +		return;
> +
> +	for_each_child_of_node(node, child) {
> +		of_gpio_scan_irq_lines(child, gcn, gc, request);
> +		/* Check if we have an IRQ parent, else continue */
> +		irq_parent = of_irq_find_parent(child);
> +		if (!irq_parent)
> +			continue;
> +
> +		/* Is it so that this very GPIO chip is the parent? */
> +		if (irq_parent != gcn) {
> +			of_node_put(irq_parent);
> +			continue;
> +		}
> +		of_node_put(irq_parent);
> +
> +		pr_debug("gpiochip OF: node %s references GPIO interrupt lines\n",
> +				child->name);
> +
> +		/* Get the interrupts property */
> +		intspec = of_get_property(child, "interrupts", &intlen);
> +		if (intspec == NULL)
> +			continue;
> +		intlen /= sizeof(*intspec);
> +
> +		num_irq = of_irq_count(gcn);
> +		for (i = 0; i < num_irq; i++) {
> +			/*
> +			 * The first cell is always the local IRQ number, and
> +			 * this corresponds to the GPIO line offset for a GPIO
> +			 * chip.
> +			 *
> +			 * FIXME: take interrupt-cells into account here.
> +			 */
> +			offset = of_read_number(intspec + i, 1);
> +			pr_debug("gpiochip: OF node %s references GPIO %d (%d)\n",
> +				child->name, gc->base + offset, offset);
> +
> +			if (request) {
> +				/*
> +				 * This child is making a reference to this
> +				 * chip through the interrupts property, so
> +				 * reserve these GPIO lines and set them as
> +				 * input.
> +				 */
> +				ret = gpio_request(gc->base + offset, child->name);
> +				if (ret)
> +					pr_err("gpiolib OF: could not request IRQ GPIO %d (%d) for node %s (%d)\n",
> +						gc->base + offset, offset, child->name, ret);
> +				ret = gpio_direction_input(gc->base + offset);
> +				if (ret)
> +					pr_err("gpiolib OF: could not set IRQ GPIO %d (%d) as input for node %s (%d)\n",
> +						gc->base + offset, offset, child->name, ret);
> +			} else {
> +				gpio_free(gc->base + offset);
> +			}
> +		}
> +	}
> +}
> +
> +/**
> + * of_gpiochip_reserve_irq_lines() - request or free GPIO IRQ lines
> + * @np:		device node of the GPIO chip
> + * @gc:		GPIO chip instantiated from same node
> + * @request:	wheter the function should request(1) or free(0) the irq lines
> + *
> + * This function should not be used directly, use the macros
> + * of_gpiochip_request_irq_lines or of_gpiochip_free_gpio_lines instead.
> + *
> + * For the case of requesting the irq lines (request == 1) this function is
> + * called after instantiating a GPIO chip from a device tree node to assert
> + * that all interrupts derived from the chip are consistently requested as
> + * GPIO lines, if the GPIO chip is BOTH a gpio-controller AND an
> + * interrupt-controller.
> + *
> + * If another node in the device tree is referencing the interrupt-controller
> + * portions of the GPIO chip, such that it is using a GPIO line as some
> + * arbitrary interrupt source, the following holds:
> + *
> + * - That line must NOT be used anywhere else in the device tree as a
> + *   <&gpio N> reference, or GPIO and interrupt usage may conflict.
> + *
> + * Conversely, if a node is using a line as a direct reference to a GPIO line,
> + * no node in the tree may use that line as an interrupt.
> + *
> + * If another node is referencing a GPIO line, and also want to use that line
> + * as an interrupt source, it is necessary for this driver to use the
> + * gpio_to_irq() kernel interface.
> + *
> + * For the case of freeing the irq lines (request == 0) this function simply
> + * uses the same device tree information used to request the irq lines to call
> + * gpiochip_free on that GPIOs.
> + */
> +static void of_gpiochip_reserve_irq_lines(struct device_node *np,
> +					  struct gpio_chip *gc, bool request)
> +{
> +	struct device_node *root;
> +
> +	/*
> +	 * If this chip is not tagged as interrupt-controller, there is
> +	 * no problem so we just exit.
> +	 */
> +	if (!of_property_read_bool(np, "interrupt-controller"))
> +		return;
> +
> +	/*
> +	 * Proceed to check the consistency of all references to this
> +	 * GPIO chip.
> +	 */
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return;
> +	of_gpio_scan_irq_lines(root, np, gc, request);
> +	of_node_put(root);
> +}
> +
> +#define of_gpiochip_request_irq_lines(np, gc) \
> +	of_gpiochip_reserve_irq_lines(np, gc, true)
> +
> +#define of_gpiochip_free_irq_lines(np, gc) \
> +	of_gpiochip_reserve_irq_lines(np, gc, false)
> +
> +/**
>   * of_mm_gpiochip_add - Add memory mapped GPIO chip (bank)
>   * @np:		device node of the GPIO chip
>   * @mm_gc:	pointer to the of_mm_gpio_chip allocated structure
> @@ -170,6 +325,8 @@ int of_mm_gpiochip_add(struct device_node *np,
>  	if (ret)
>  		goto err2;
>  
> +	of_gpiochip_request_irq_lines(np, gc);
> +
>  	return 0;
>  err2:
>  	iounmap(mm_gc->regs);
> @@ -231,12 +388,14 @@ void of_gpiochip_add(struct gpio_chip *chip)
>  		chip->of_xlate = of_gpio_simple_xlate;
>  	}
>  
> +	of_gpiochip_request_irq_lines(chip->of_node, chip);
>  	of_gpiochip_add_pin_range(chip);
>  	of_node_get(chip->of_node);
>  }
>  
>  void of_gpiochip_remove(struct gpio_chip *chip)
>  {
> +	of_gpiochip_free_irq_lines(chip->of_node, chip);
>  	gpiochip_remove_pin_ranges(chip);
>  
>  	if (chip->of_node)
> 

Hi Linus,

Sorry for being out of the loop, I was pretty busy last weeks. I just tested
your patch on my OMAP3 board and it solves the issue we had in OMAP.

Thanks a lot for solving this long standing issue!

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
