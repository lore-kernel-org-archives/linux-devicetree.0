From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Thu, 8 Nov 2012 15:14:34 +0900
Message-ID: <1908355.tpLPJU8MKg@percival>
References: <38620644.IyR5R8rjKP@percival> <1801189.6J3flQFRCq@percival> <CACRpkdYqCQc0Er1JR_eVzZPCycvKjd0Pph8Dcay0FbU3Q64D8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYqCQc0Er1JR_eVzZPCycvKjd0Pph8Dcay0FbU3Q64D8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Thursday 08 November 2012 05:24:19 Linus Walleij wrote:
> I would prefer to create, e.g. in <linux/gpio/consumer.h>
> something like:
> 
> struct gpio;
> 
> struct gpio *gpio_get(struct device *dev, const char *name);
> 
> int gpio_get_value(struct gpio *g);
> 
> Nothing more! I.e. struct gpio is an opaque cookie, nothing to be known
> about it.
> 
> And then have the drivers using this *ONLY* include <linux/gpio/consumer.h>
> and not <linux/gpio.h>. So drivers have no clue what struct gpio is and
> will only operate on it using functions.
> 
> This follows the pattern set by Thomas Gleixner for e.g. IRQ descriptors,
> and the style was also used in the redesign of the struct clk *.

Also pretty similar to the regulator framework, which might itself have been 
inspired by IRQs and clocks.

> Of course the cross-referencing implementation can in e.g.
> drivers/gpio/gpiodev.c internally define that like this:
> 
> #include <linux/gpio.h>
> 
> /**
>   * @gpio: pointer to global GPIO number
>   */
> struct gpio {
>     int gpio;
> };
> 
> struct gpio *gpio_get(struct device *dev, const char *name)
> {
>    /* Lookup in cross-ref table etc */
> }
> 
> int gpioh_get_value(struct gpio *g)
> {
>    return gpio_get_value(g->gpio);
> }
> 
> (...)
> 
> Then we can work from there. I think it adds the proper
> opaqueness factor.

Looks nice, simple and to the point! Let's see if I can find the time to cook 
something based on this.

Thanks!
Alex.
