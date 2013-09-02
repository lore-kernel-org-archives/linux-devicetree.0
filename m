From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH v2] gpio: interrupt consistency check for OF GPIO IRQs
Date: Mon, 02 Sep 2013 11:43:26 +0200
Message-ID: <1414118.3oldKCk0TC@lem-wkst-02>
References: <1377092334-770-1-git-send-email-larsi@wh2.tu-dresden.de> <CACRpkdYz7Kn-y8LHpNBV3YyYFhyaU6N592BJE1newUZJpUMNfA@mail.gmail.com> <5220FBC9.1070602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5220FBC9.1070602@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

Am Freitag, 30. August 2013, 14:08:41 schrieb Stephen Warren:
> On 08/29/2013 01:00 PM, Linus Walleij wrote:
> > On Fri, Aug 23, 2013 at 9:52 PM, Stephen Warren <swarren@wwwdotorg.org> 
wrote:
> >> On 08/23/2013 12:45 PM, Linus Walleij wrote:
> >>> This is a perfectly OK thing to do as long as it is done like
> >>> this:
> >>> 
> >>> request_gpio(gpio);
> >>> gpio_direction_input(gpio);
> >>> request_irq(gpio_to_irq(gpio));
> >> 
> >> But I'm not aware that there's a rule saying it's illegal to:
> >> 
> >> request_irq(gpio_to_irq(gpio));
> >> request_gpio(gpio);
> >> gpio_direction_input(gpio);
> > 
> > No but I think there should be one ... maybe I'm an oddball
> > but it seems natural to request a GPIO before tying
> > IRQs to fire off it.
> 
> What if there is no GPIO?

If there is no GPIO there is no gpio-controller and there is no problem.

> There are plenty of chips with dedicated IRQ input pins that can't be
> read as GPIOs, or treated as GPIOs in any way.
> 
> If a driver only needs IRQ input functionality, it should just request
> an IRQ and be done with it. There should be no need at all for the
> driver to know that the IRQ might be routed into a GPIO controller, and
> hence that the driver may (or may not) need to additionally request the
> GPIO before requesting the IRQ.

Yes, you're right, but reality is different. Legacy drivers / board-files do:

request_gpio(gpio);
gpio_direction_input(gpio);
request_irq(gpio_to_irq(gpio));
 
> In other words, request_irq() must do everything necessary for the input
> signal to operate as an IRQ input, irrespective of whether it might be
> possible to use that input signal as a GPIO.
