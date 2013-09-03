From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 03 Sep 2013 11:32:30 -0600
Message-ID: <52261D2E.30306@wwwdotorg.org>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <521D0964.2080209@wwwdotorg.org> <CACRpkdaWPQTPw8u+97iV8MRB1fdeS40kd242pJd3UE9Ler4kRQ@mail.gmail.com> <521FE637.3010805@collabora.co.uk> <5220F8AE.2080300@wwwdotorg.org> <CACRpkdZRkNzt6eGr81tEGJpV5_+vccOPun3HXjQoGNtFWGfvYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZRkNzt6eGr81tEGJpV5_+vccOPun3HXjQoGNtFWGfvYg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On 09/03/2013 06:43 AM, Linus Walleij wrote:
> On Fri, Aug 30, 2013 at 9:55 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> On 08/29/2013 06:24 PM, Javier Martinez Canillas wrote:
>> ...
>>> We have been trying to solve this issue for a few months by now and Linus'
>>> approach seems to be the most sensible solution to me.
>>>
>>> Drivers that request an IRQ and assume that platform code will request and setup
>>> the GPIO have been broken since the boards using these drivers were migrated to
>>> DT (e.g: smsc911x on OMAP2+ boards).
>>
>> That's only true if the driver for the GPIO controller is buggy.
>> Whatever request_irq() maps down to in the GPIO/IRQ controller driver
>> simply needs to set up the pin as an interrupt input, then it doesn't
>> matter which order the driver does things.
> 
> As mentioned it can't do that, because doing that creates a
> restriction on which order the driver does things...

I am not convinced here. Which driver (GPIO/IRQ controller driver, or
the driver which uses GPIOs/IRQs?) Which operations?

> But you mentioned that you wanted an API that would account
> for the case where the *same driver* requested the same resource
> (a GPIO line) to be used for both IRQ and GPIO, through two
> different calls.
> 
> I would be happy to see how we could do that, preferably in a
> generic way.
> 
> Since the gpio_request() does not contain the signature of the
> calling driver I don't see how we could do this without refactoring
> the whole world.
> 
> In that case it would probably be easiest to
> *first* proceed to complete Alexandre's suggested refactorings for
> GPIO descriptors, which tie down GPIOs to be requested like
> clocks and regulators and thus tied to a device, so we can from
> there proceed to implement such a conditional request,
> as we will then have the required information in the GPIO
> subsystem.

Indeed, that does seem necessary if you want the GPIO/IRQ core to be
able to implement this feature.
