From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/9] dts: versatile: add sysregs nodes
Date: Fri, 9 Jan 2015 08:10:36 +0100
Message-ID: <CACRpkdZFxToT5L0sJXap-NQGtjkryn4KTZVnweKCxXL9WvFLEg@mail.gmail.com>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
	<1419967718-26909-6-git-send-email-robherring2@gmail.com>
	<CACRpkdbinR3Uvi5zZmQJFxJgnWfvE6JZouMVxxRRGVtMNXkBQQ@mail.gmail.com>
	<CAL_JsqKBLx03E1w0NMH8CH+Pm_L8yQvnR6VTTDxqnpOwAoDhXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKBLx03E1w0NMH8CH+Pm_L8yQvnR6VTTDxqnpOwAoDhXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 9, 2015 at 12:53 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Jan 8, 2015 at 1:44 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>> On Tue, Dec 30, 2014 at 8:28 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> compatible = "syscon";
>
> maybe? VExpress is missing that then...

I don't like the way some vexpress stuff has been done I think, just
not enough reviewing power :(

I've tried to make an as clean separation as possible in the Integrator
as it has been refactored with a minimum of time pressure and
I tried to make it as reusable as possible. But it doesn't necessarily
mean I did the right thing all the time ...

>>> +                               reg = <0x00000 0x1000>;
>>> +
>>> +                               v2m_led_gpios: sys_led@08 {
>>> +                                       compatible = "arm,vexpress-sysreg,sys_led";
>>> +                                       gpio-controller;
>>> +                                       #gpio-cells = <2>;
>>> +                               };
>>
>> These are not GPIOs. These are LED registers really.
>
> A register bit that controls an i/o signal sounds like a GPIO to me.

Are they described as general purpose in the manual for the
board?

In the ARM reference design manuals I've seen these bits are
described as for one purpose only. I mean you can claim the
memory RE signal is "a bit that controls an I/O signal" as well,
but we have to think about the abstraction here.

>> see how to use LEDs from drivers/leds/leds-syscon.c and bindings.
>> example in:
>> arch/arm/boot/dts/integrator.dtsi
>>
>> Very straight-forward I think.
>
> So we have 2 implementations and bindings for roughly the same hardware? Great!

The syscon stuff is designed to be reusable for machines outside
the Versatile and ARM reference families.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
