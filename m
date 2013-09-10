From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 10 Sep 2013 15:56:49 +0200
Message-ID: <522F2521.4090806@collabora.co.uk>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <52279524.8090006@wwwdotorg.org> <20130909161924.GT29403@sirena.org.uk> <2052193.CMUEUJFRgS@lem-wkst-02>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <2052193.CMUEUJFRgS@lem-wkst-02>
Sender: linux-gpio-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On 09/10/2013 10:47 AM, Lars Poeschel wrote:
> On Tuesday 10 September 2013 17:19:24, Mark Brown wrote:
>> On Wed, Sep 04, 2013 at 02:16:36PM -0600, Stephen Warren wrote:
>> > On 09/04/2013 03:05 AM, Lars Poeschel wrote:
>> > > The driver that tries to use the GPIO requested by this patch before HAS
>> > > to
>> > > fail. This is exactly the intention of this patch. We don't want the
>> > > GPIO to be requested any more, if it is used as an interrupt pin.
>> > 
>> > That will break existing drivers. There are drivers that request the
>> > same GPIO and IRQ. IIRC, the SDHCI CD (Card Detect) GPIO is requested
>> > that way.
>> 
>> Yes, plus input devices and audio jack detection among others.  This
>> pattern is very common if the GPIO is actually being used as a GPIO, an
>> edge triggered interrupt is used to flag when something happens and the
>> state is determined by reading the GPIO state (often with some
>> debounce).
> 
> And I say it again for those coming into the discussion late, like it has been 
> said many many times before: This patch does not break any of this drivers. 
> They simply request their GPIO from DT and turn it into an irq using 
> gpio_to_irq, request that irq on their behalf and use it as GPIO and IRQ in 
> parallel. At least this is not a problem.
> 

I agree with Lars and think that we should stop arguing about the limitations of
this patch and how this doesn't solve:


a) The fact that platform code has to call:

gpio_request()
gpio_direction_input()
request_irq()

b) That there are complex use cases where the same driver can request both a
GPIO and the mapped IRQ.

The only thing that this patch tries to solve is when a driver expect to request
a IRQ and it doesn't care if is a real IRQ line from an interrupt controller or
a GPIO pin mapped as an IRQ.

With board files we used to explicitly do the GPIO setup
(gpio_{request,direction_input}) but with DT these board files are gone and we
need a way to setup a GPIO implicitly when is mapped as an IRQ.

That's the only use case that this patch covers.

In legacy non-DT booting boards files will continue doing whatever are doing now
to ensure that drivers calling request_irq() will succeed and complex drivers
can just not define the GPIO-IRQ mapping in the DT and do whatever they need to
do manually.

Now, if just solving this use case is not enough and we want a more general
solution then we should start discussing how that solution should look like so
it can be implemented.

The most concrete idea so far is the one proposed by Stephen to pass a struct
device to gpiolib functions so GPIO controller drivers know when the same device
or a different one is requesting a GPIO twice to allow sharing a GPIO or not.

Also, it would be great if we can find a temporary solution so we can finally
have ethernet working with DT on most OMAP2+ boards. Since I expect that doing
the mentioned change on gpiolib would take at least a couple of kernel releases.

Thanks a lot and best regards,
Javier
