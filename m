From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] USB: add generic onboard USB HUB driver
Date: Fri, 18 Dec 2015 15:42:45 +0800
Message-ID: <CAL411-rK6qfkbQsSjvXH5VPAQAm4tMyD6fVTEgFQrpLHNGMXeA@mail.gmail.com>
References: <CAL_Jsq+KAF6FGyOyC0JzODsSVoK4+V6umpj=cANywgui_wOKMg@mail.gmail.com>
 <Pine.LNX.4.44L0.1512171103080.1675-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1512171103080.1675-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 18, 2015 at 12:13 AM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> On Wed, 16 Dec 2015, Rob Herring wrote:
>
>> On Mon, Dec 14, 2015 at 3:35 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > On Monday 14 December 2015 15:26:11 Peter Chen wrote:
>> >> Hi all,
>> >>
>> >> There is a known issue that the USB code can't handle USB HUB's
>> >> external pins well, in that case, it may cause some onboard
>> >> USB HUBs can't work since their PHY's clock or reset pin needs to
>> >> operate.
>> >>
>> >> The user reported this issue at below:
>> >> http://www.spinics.net/lists/linux-usb/msg131502.html
>> >>
>> >> In this patch set, I add a generic onboard USB HUB driver to
>> >> handle this problem, the external signals will be configured
>> >> before usb controller's initialization, it much likes we did
>> >> it at board code before.
>> >>
>> >> The user needs to add this generic hub node at dts to support it.
>> >>
>> >> @The udoo users, help to test please.
>> >
>> > I still think need to do this properly by representing the hub
>> > device as a USB device, using power sequencing code like MMC does.
>>
>> I agree on doing it properly, but am not sure that pwrseq binding for
>> MMC is proper. The pwrseq binding is fairly limited and working around
>> the driver model IMO. Hubs may also need I2C setup which I don't think
>> could be done generically other than some defined sequence of i2c
>> transactions. The current project I'm working on needs to use I2C to
>> configure the hub to use HSIC mode for example. I really think we need
>> a pre-probe driver hook to handle this. That would allow device
>> specific setup to live in the driver.
>>
>> Perhaps a more simple approach would be just forcing driver probe if a
>> DT node is present. I'm not all that familiar with USB drivers, but
>> presumably there is some setup before probe like setting the USB
>> device address. We'd have to allow doing that later during probe.
>
> It's not clear (to me, anyway) how this is meant to work.  USB is a
> completely discoverable bus: There is no way to represent devices
> statically; they have to be discovered.  But a device can't be
> discovered unless it is functional, so if an onboard hub (or any other
> sort of USB device) requires power, clocks, or something similar in
> order to function, it won't be discovered.  There won't be any device
> structure to probe, and "forcing driver probe" won't accomplish
> anything.
>
> It seems to me that the only way something like this could be made to
> work is if the necessary actions are keyed off the host controller (and
> in particular, _not_ the hub driver), presumably at the time the
> controller is probed.

The reason why I put the code at hub driver is the onboard USB device
may be at 2nd level hub, at hub driver, we can know all devices under
this level hub.

> With anything else, you run the risk that the
> necessary resources won't get enabled before they are needed.
>

Sorry, I can't understand what you mean


-- 
BR,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
