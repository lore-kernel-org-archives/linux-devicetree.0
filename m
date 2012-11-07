From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Wed, 7 Nov 2012 22:24:19 +0100
Message-ID: <CACRpkdYqCQc0Er1JR_eVzZPCycvKjd0Pph8Dcay0FbU3Q64D8A@mail.gmail.com>
References: <38620644.IyR5R8rjKP@percival>
	<CACRpkdZc3cEGfSKW-b=G31yuw_E-GOXid3jkxZ0tuKYGYRE5Nw@mail.gmail.com>
	<5097F8CF.5090100@wwwdotorg.org>
	<1801189.6J3flQFRCq@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1801189.6J3flQFRCq@percival>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2012 at 2:33 AM, Alex Courbot <acourbot@nvidia.com> wrote:

> How about, in a first time (and because I'd also like to get the power seqs
> moving on), a typedef from int to gpio_handle_t and a first implementation of
> the gpio_handle_*() API that would just call the existing integer-based API
> (apart from gpio_handle_get())? That way things will not break when we switch
> to a real handle.

I'm afraid of typedef:ing gpio_handle_t to int because it sort of
encourages non-handlers to be used mixed with the old integers.

I would prefer to create, e.g. in <linux/gpio/consumer.h>
something like:

struct gpio;

struct gpio *gpio_get(struct device *dev, const char *name);

int gpio_get_value(struct gpio *g);

Nothing more! I.e. struct gpio is an opaque cookie, nothing to be known
about it.

And then have the drivers using this *ONLY* include <linux/gpio/consumer.h>
and not <linux/gpio.h>. So drivers have no clue what struct gpio is and
will only operate on it using functions.

This follows the pattern set by Thomas Gleixner for e.g. IRQ descriptors,
and the style was also used in the redesign of the struct clk *.

Of course the cross-referencing implementation can in e.g.
drivers/gpio/gpiodev.c internally define that like this:

#include <linux/gpio.h>

/**
  * @gpio: pointer to global GPIO number
  */
struct gpio {
    int gpio;
};

struct gpio *gpio_get(struct device *dev, const char *name)
{
   /* Lookup in cross-ref table etc */
}

int gpioh_get_value(struct gpio *g)
{
   return gpio_get_value(g->gpio);
}

(...)

Then we can work from there. I think it adds the proper
opaqueness factor.

I don't really like the "gpioh_*" prefix instead of just gpio_* but
I guess there is not polymorphism to exploit as transition
path here :-P

Yours,
Linus Walleij
