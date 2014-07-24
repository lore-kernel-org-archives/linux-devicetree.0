From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1] gpio: keystone: add dsp gpio controller driver
Date: Thu, 24 Jul 2014 11:40:40 -0400
Message-ID: <53D128F8.80706@ti.com>
References: <1405507426-18992-1-git-send-email-grygorii.strashko@ti.com>	<CACRpkdYY_a_9G-VLBbv2a22Cg4j0t3Wv4W1h0n6-ccCXgVJXsA@mail.gmail.com>	<53CFD404.7070704@ti.com>	<CACRpkdYdUKmR+bZo374AqepDXfsZqBwJ88e4is90-UoUBWdJrA@mail.gmail.com>	<53D11667.8050807@ti.com> <CACRpkdbBeySnCBD4H2bBmievHYyPabL8sKXKiBp-D6PtNTV9YQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbBeySnCBD4H2bBmievHYyPabL8sKXKiBp-D6PtNTV9YQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Jaswinder Singh <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, Muralidharan Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 24 July 2014 11:23 AM, Linus Walleij wrote:
> On Thu, Jul 24, 2014 at 4:21 PM, Santosh Shilimkar
> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>> On Thursday 24 July 2014 10:12 AM, Linus Walleij wrote:
>>> On Wed, Jul 23, 2014 at 5:25 PM, Santosh Shilimkar
>>> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>>>
>>>> I will try to answer this. This IP is indeed a GPIO block
>>>> but the IO's are used just OUTPUT lines from Linux
>>>> HOST perspective. These IOs are connected to the DSPs
>>>> as input/IRQ lines.
>>>
>>> So the DSP is another discrete IC, and could be something
>>> different, so this is board-level information?
>>>
>>> I'm really worrying whether this is general purpose or not :-/
>>>
>> Am not sure I follow you. This IP is completely controlled
>> by Linux OS to generate output signals. How does it matter
>> whether its connected to a peripheral or a discrete IC.
> 
> What matters to me is whether it is general purpose or
> not, and what the use case is.
> 
> The Kconfig symbol is called GPIO_KEYSTONE_DSP
> not GPIO_KEYSTONE. That does not sound very general
> purpose at all. Why is "DSP" at the end of that config
> option if it is general purpose?
> 
That DSP is to just give different name since there
is another GPIO IP on keystone. We can get rid of that
DSP name but I think thats not your concern.

> And we know the Keystone
> already has another GPIO block, selected from the
> Kconfig symbol GPIO_DAVINCI. Probably that is the
> only real GPIO on this system.
>
Am sorry to say but real, unreal is very debatable.
A SOC can have more than one IP instance for different
purposes.

> And the use case doesn't seem to be exactly for
> things like driving leds, reading keys, bit-banging SPI
> or MMC card detect or other such common cases.
> It seems to be to trigger IRQs on another processor and
> nothing else. Not general purpose.
>
> If writing bit such and such in some register has the
> effect of pulling a bit high or low in some other IP
> is not GPIO. It should be part of the driver for that
> other IP block.
>
Using GPIO as an interrupt line is a legitimate
usecase already supported GPIO lib.
 
> Further you wrote:
> 
>> The DSP-ARM host IPC mechanism used on
>> Keystone is Linux user-space based and it does as
>> one of the component.
> 
> And given that it's already hinted that this is actually
> only there to aid some userspace driver I'm even *less*
> interested in having it in the GPIO subsystem.
> 
> Shoehorning this into the GPIO subsystem just seems
> like some convenient way to keep that DSP driver code
> in userspace instead of writing a proper kernel driver
> for the DSP.
> 
> Like someone wants to avoid things like this:
> drivers/staging/tidspbridge
> drivers/remoteproc/omap_remoteproc.c
> drivers/remoteproc/da8xx_remoteproc.c
>
Not at all. The usecase is different. remoteproc's are more
for firmware download, powerup, powerdown, boot an external
co-processor.
 
> As a community maintainer, naturally doing such real
> kernel drivers is way better than trying to sneak something
> in under the radar, and now I'm worried that this is what
> is actually attempted by this driver, so I'm concerned.
>
I respect your view but in this particular case, I just
thought we are denying a legitimate plumbing. Because if
it doesn't fit here, fitting it in other subsystems will
be shoehorning in my view.
 
>> Given that this IP only output functionality is used but
>> that shouldn't matter. We have seen SOCs where GPIOs
>> are just used as input to form a Matrix Keyboard.
> 
> Yes, that is common. And that is for example done with
> GPIO_DAVINCI which has lines out to open space
> and general purposes.
> 
> This is not GPIO, this is DSPIO IMO.
> 
I just think you are too much reading into that DSP name
which was just there to differentiate it from the other
GPIO IP.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
