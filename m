From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH v2] gpio: interrupt consistency check for OF GPIO IRQs
Date: Mon, 26 Aug 2013 12:45:19 +0200
Message-ID: <201308261245.19513.poeschel@lemonage.de>
References: <1377092334-770-1-git-send-email-larsi@wh2.tu-dresden.de> <CACRpkdZgFMH07_W2eUWsgsUMXAJA1paEimAds=-XeViZaYySLA@mail.gmail.com> <5217BD74.5030801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5217BD74.5030801@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On Friday 23 August 2013 at 21:52:20, Stephen Warren wrote:
> On 08/23/2013 12:45 PM, Linus Walleij wrote:
> > On Thu, Aug 22, 2013 at 11:10 PM, Stephen Warren 
<swarren@wwwdotorg.org> wrote:
> >> On 08/21/2013 05:36 PM, Linus Walleij wrote:
> >>> On Thu, Aug 22, 2013 at 1:10 AM, Stephen Warren
> >>> <swarren@wwwdotorg.org> wrote: [Me]
> >>> 
> >>>>>> check if these in turn reference the interrupt-controller, and
> >>>>>> if they do, loop over the interrupts used by that child and
> >>>>>> perform gpio_request() and gpio_direction_input() on these,
> >>>>>> making them unreachable from the GPIO side.
> >>>> 
> >>>> What about bindings that require a GPIO to be specified, yet don't
> >>>> allow an IRQ to be specified, and the driver internally does
> >>>> perform gpio_to_irq() on it? I don't think one can detect that
> >>>> case.
> >>> 
> >>> This is still allowed. Consumers that prefer to have a GPIO
> >>> passed and convert it to IRQ by that call can still do so,
> >>> they will know what they're doing and will not cause the
> >>> double-command situation that we're trying to solve.
> >> 
> >> Why not? There are certainly drivers in the kernel which request a
> >> GPIO as both a GPIO and as an (dual-edge) interrupt, so that they
> >> can read the GPIO input whenever the IRQ goes off, in order to
> >> determine the pin state. This is safer against high-latency or lost
> >> interrupts.
> > 
> > Yes? Are we talking past each other here?
> > 
> > This is a perfectly OK thing to do as long as it is done like
> > this:
> > 
> > request_gpio(gpio);
> > gpio_direction_input(gpio);
> > request_irq(gpio_to_irq(gpio));
> 
> But I'm not aware that there's a rule saying it's illegal to:
> 
> request_irq(gpio_to_irq(gpio));
> request_gpio(gpio);
> gpio_direction_input(gpio);

But I'd consider this as a bug. What if the scheduler interrupts you right 
after you requested (and got assigned) the interrupt and another entity 
requests your gpio? Then you'd have a resource conflict, because you are 
not the owner of the gpio you requested an interrupt for.
