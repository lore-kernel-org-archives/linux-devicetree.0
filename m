From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH 3/3] of/gpio: Introduce of_put_gpio(), add ref counting
	for OF GPIO chips
Date: Mon, 15 Feb 2010 23:59:24 +0300
Message-ID: <20100215205924.GA23654@oksana.dev.rtsoft.ru>
References: <20100205204949.GA2575@oksana.dev.rtsoft.ru>
	<20100205205045.GC4178@oksana.dev.rtsoft.ru>
	<fa686aa41002090928o6911d095ydca1e1e670a0fc22@mail.gmail.com>
	<20100209191427.GA18263@oksana.dev.rtsoft.ru>
	<fa686aa41002151149u158bc2fbn5af16f6bd714d36c@mail.gmail.com>
Reply-To: avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41002151149u158bc2fbn5af16f6bd714d36c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2010 at 12:49:56PM -0700, Grant Likely wrote:
[...]
> Okay, I'm convinced now.  The model is wrong.  struct of_gc does need
> to be a member of struct gpio_chip and conditionally compiled against
> CONFIG_OF_GPIO.  This locking requirement is just too plain ugly,

And how would you implement of_get_gpio(np, index) then?
You don't have 'struct gpio_chip' in of_get_gpio(), so you can't
get of_gc out of it.

It's possible to lookup all GPIOs (gpio[0..ARCH_NR_GPIOS]) matching
on chip->dev->archdata.node == np, but you're just moving this stuff
into gpiolib, where you'll have to grab global gpio_lock instead of
devtree lock. And just as with np->data_lock or global devtree lock,
you'll have to grab gpio_lock in of_gpio_put(), of_gpio_chip_register
and of_gpio_chip_unregister().

See? Your suggestion doesn't make things better or simpler, instead
it turns the OF GPIO inside out, exposing arch details to the generic
code.

There is really no excuse for the arch-specific (OF) stuff being in
the generic code. Not in the irq subsystem, not in the gpio
subsystem. My implementation actually proves that.

> and
> dereferencing the np->data pointer in this way is dangerous
> (what if
> something that is not struct of_gc is stored there).

Not possible with the safe np->data accessors.

-- 
Anton Vorontsov
email: cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
irc://irc.freenode.net/bd2
