From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 0/5 RfC] pintrl: meson: add support for GPIO IRQs
Date: Thu, 11 May 2017 22:52:48 +0200
Message-ID: <CAFBinCBgNvyc_P_OSe1=wRB_jrCNUXWcRJzR8oGbqitQz3ntwQ@mail.gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com> <CACRpkdbeA9pwnOFjdryKjeyZewLWA7Q6ZRbxc=MreT0zJMbgQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbeA9pwnOFjdryKjeyZewLWA7Q6ZRbxc=MreT0zJMbgQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Thu, May 11, 2017 at 4:34 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sun, May 7, 2017 at 6:19 PM, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> This patch series is partially based on a series Jerome Brunet
>> submitted about half a year ago. Due to open questions this series never
>> made it to mainline, see https://patchwork.kernel.org/patch/9384431/
>>
>> This new attempt uses GPIOLIB_IRQCHIP resulting in less needed code.
>> Included is also support for using two parent IRQs in case
>> of IRQ_TYPE_EDGE_BOTH, like in the vendor driver.
>>
>> Worth to be mentioned is also that I had to work around a strange
>> issue with spurious interrupts resulting in a deadlock.
>> The affected critical section in __setup_irq is executed with interrupts
>> disabled, nevertheless spurious GPIO IRQs result in a deadlock what
>> seems to indicate that they are handled on the same CPU.
>> I didn't find a better explanation than a possible HW flaw so far.
>>
>> The series was successfully tested on a Odroid-C2, e.g. with removing
>> polling for SD card insertion/removal from the mmc driver.
>>
>> Heiner Kallweit (5):
>>   pinctrl: meson: add interrupts to pinctrl data
>>   pinctrl: meson: document GPIO IRQ DT binding
>>   pinctrl: meson: add DT node for GPIO IRQ on Meson GX
>>   pinctrl: meson: add DT node for GPIO IRQ on Meson 8 / 8b
>>   pinctrl: meson: add support for GPIO interrupts
>
> I just merged a bunch of patches from Martin Blumenstigl for this driver.
thank you!

> Martin can you help out reviewing these patches?
I think it would be nice to have GPIO interrupt support and I can
certainly help testing this. however, I am neither a pinctrl nor an
interrupt expert. I can have a look at the patches and give (limited)
feedback, but these should certainly be reviewed by people with more
knowledge of these (pinctrl and irq) subsystems.

Jerome has already spent (probably quite some...) time with the Meson
GPIO interrupt support, he has already replied to patch #1.

apart from that: thanks to anybody who dedicates time to this topic -
this is probably one of the most exotic bits (and thus hard to
implement) in the Meson SoCs!


Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
