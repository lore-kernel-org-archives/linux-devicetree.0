From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH V2 2/3] dmaengine: bcm2835: use platform_get_irq_byname
Date: Wed, 20 Apr 2016 13:12:36 +0200
Message-ID: <CAMuHMdUgfyLrdmfHLHd3eNh79FcJarVPuhbxtU4XYZok=skLkw@mail.gmail.com>
References: <1460381349-14408-1-git-send-email-kernel@martin.sperl.org>
	<1460381349-14408-3-git-send-email-kernel@martin.sperl.org>
	<CAMuHMdW2Jw5=f9ojNSM0d1cGvPc6_QxwH4rcQdWBQTP89zyj4Q@mail.gmail.com>
	<571762A7.7000005@martin.sperl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571762A7.7000005-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

On Wed, Apr 20, 2016 at 1:06 PM, Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org> wrote:
> On 20.04.2016 08:51, Geert Uytterhoeven wrote:
>>
>> On Mon, Apr 11, 2016 at 3:29 PM,  <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org> wrote:
>>>
>>> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>>>
>>> Use platform_get_irq_byname to allow for correct mapping of
>>> interrupts to dma channels.
>>>
>>> The currently implemented device tree is unfortunately
>>> implemented with the wrong assumption, that each dma-channel
>>> has its own dma channel, but dma-irq 11 is handling
>>> dma-channel 11-14 and dma-irq 12 is actually a "catch all"
>>> interrupt.
>>>
>>> So here we use the byname variant and require that interrupts
>>> are explicitly named via the interrupts-name property in the
>>
>> interrupt-names
>
> Vinod has just merged this patch - do you want me to submit another

Yeah, that's how I noticed by accident :-)

> to correct those?

For the commit message it's indeed too late. For the error message in the
code, yes please.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
