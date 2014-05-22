From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
Date: Thu, 22 May 2014 15:30:39 +0200
Message-ID: <CACRpkdaqsVUDA+6NC=EQmxcnDAnJEfPNYoptrEv=nq=eZEbA_g@mail.gmail.com>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org>
	<CAL_JsqLN_f1uvrY6w7J7ZcR9pfM0_XKYMQ5YU8F4yAcMW+oDGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLN_f1uvrY6w7J7ZcR9pfM0_XKYMQ5YU8F4yAcMW+oDGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 22, 2014 at 3:17 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, May 8, 2014 at 5:08 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>> +       model = "ARM RealView PB1176 with device tree";
>
> Isn't "with device tree" redundant?

Nuked it.

>> +static struct map_desc realview_dt_io_desc[] __initdata = {
>> +       {
>> +               /* FIXME: static map needed for LED driver */
>
> Don't you have patches to fix this? I need them for Versatile
> conversion as well.

Done away with. The legacy driver was moved to drivers/leds/leds-versatile.c
and I then contemplated adding DT support to it but it was a *bad*
idea.

Instead I have created drivers/leds/leds-syscon.c that can handle
any LEDs in a syscon. Will post in next iteration as soon as
I get the drivers/soc dependency in place.

>> +#if IS_ENABLED(CONFIG_CACHE_L2X0)
>> +       if (of_machine_is_compatible("arm,realview-eb"))
>> +               /*
>> +                * 1MB (128KB/way), 8-way associativity,
>
> These should go into DT properties. Cache attributes are already
> defined in ePAPR.

Yes, the dependencies to do this with DT is floating around somewhere
in the ARM tree or Russells tree I think, maybe I cannot do this until
the next kernel cycle.

>> +                * evmon/parity/share enabled
>
> These can probably be unconditionally enabled except for parity which
> could be a DT property.

I'll wait and see what I need to add really.

>> +       parent = soc_device_to_device(soc_dev);
>
> We really need to standardize this soc device stuff so that platforms
> always have a parent soc device or not.

Arnds position is that the entire platform/board should not be
a "soc device" and that seems correct since the board is no SoC.

So I will spin this off into a SoC driver and push under
drivers/soc and bind to the SoC node in the device tree.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
