From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/9] dts: versatile: add sysregs nodes
Date: Mon, 19 Jan 2015 11:25:35 +0100
Message-ID: <CACRpkdbLdtXeVYWvd5DSmEVkMBT8YGs0kXPC+fktiNtgJhpp=w@mail.gmail.com>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
	<1419967718-26909-6-git-send-email-robherring2@gmail.com>
	<CACRpkdbinR3Uvi5zZmQJFxJgnWfvE6JZouMVxxRRGVtMNXkBQQ@mail.gmail.com>
	<CAL_JsqKBLx03E1w0NMH8CH+Pm_L8yQvnR6VTTDxqnpOwAoDhXg@mail.gmail.com>
	<20150115160635.GA1576@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150115160635.GA1576@red-moon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 15, 2015 at 5:06 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> On Thu, Jan 08, 2015 at 11:53:15PM +0000, Rob Herring wrote:
>> On Thu, Jan 8, 2015 at 1:44 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > On Tue, Dec 30, 2014 at 8:28 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> >> +                               reg = <0x00000 0x1000>;
>> >> +
>> >> +                               v2m_led_gpios: sys_led@08 {
>> >> +                                       compatible = "arm,vexpress-sysreg,sys_led";
>> >> +                                       gpio-controller;
>> >> +                                       #gpio-cells = <2>;
>> >> +                               };
>> >
>> > These are not GPIOs. These are LED registers really.
>>
>> A register bit that controls an i/o signal sounds like a GPIO to me.
>
> To me too. I agree that definining a gpio-controller for every possible
> gpio pin would soon get unwieldy, but hey, the choice made for vexpress
> leds makes perfect sense to me, after all they are gpio signals
> connected to leds, and there is a driver for that in the kernel:
>
> drivers/leds/leds-gpio.c
>
> we could move this stuff to syscon-leds, but honestly I think is one of those
> things we could argue forever about that.

OK it's just so that the GPIO maintainer disagrees with the way
gpio-controller is being used here, and I consequently NACK it
so for the record add my:

Nacked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

To this patch if/when merging it through ARM SoC.

If the DT people think it is a good way to describe the hardware
and override this then I will live with it I guess...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
