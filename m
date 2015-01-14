From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 3/4] gpio: Add find GPIO base in increasing order
Date: Wed, 14 Jan 2015 09:13:02 +0100
Message-ID: <CACRpkdZccD_FM+m3US3e40LitH4OsX-8cSS_ju+C541330PdXw@mail.gmail.com>
References: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com>
	<1417750722-14027-4-git-send-email-wangzhou.bry@gmail.com>
	<CAAVeFu+Hn1Fk7PDcc4wGHFyJurX0hsW1N1prnPs2j=taGQKrKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFu+Hn1Fk7PDcc4wGHFyJurX0hsW1N1prnPs2j=taGQKrKw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Zhou Wang <wangzhou.bry@gmail.com>, Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, liguozhu@hisilicon.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alan Tull <atull@altera.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, wangzhou1@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 10, 2014 at 9:51 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Fri, Dec 5, 2014 at 12:38 PM, Zhou Wang <wangzhou.bry@gmail.com> wrote:
>> In function gpiochip_find_base, base number of a GPIO controller
>> is found in decreasing order. ARCH_NR_GPIOS is used to define from
>> which number we begin to search for base number of a GPIO controller.
>>
>> In fact, ARCH_NR_GPIOS brings us some multiplatform problems, like:
>> http://www.spinics.net/lists/devicetree/msg60433.html
>>
>> This patch adds the support to find base number of a GPIO controller
>> in increasing order. It will assign base number from 0.
>> A new dts property called gpio-number-forward must be add to the related
>> GPIO dts nodes if you want it works well.
>
> Global GPIO numbers are a Linux-only concept, so your property should
> be named linux,gpio-number-forward.
>
> But even that way I don't think I like this idea. This just adds some
> more mess to how the GPIO number space is constructed, and it is
> already quite messy as it is. You have no guarantee over the probe
> order of your GPIO controllers, so they may very well be probed in a
> different order and end up with different base numbers anytime.

Yup.

The way stuff is usually forced ordered in device tree is to use
aliases, e.g.:

        aliases {
                serial0 = &pb1176_serial0;
                serial1 = &pb1176_serial1;
                serial2 = &pb1176_serial2;
                serial3 = &pb1176_serial3;
                serial4 = &fpga_serial;
        };

By getting the alias ID with of_alias_get_id(np, "serial")
a certain serial port is assigned to be
0, 1, 2 ...

I think I could accept a tweak of this patch that will register
GPIOs beginning from 0 if and only if the alias mechanism is
used.

        aliases {
                gpio0 = &foo_gpio0;
                gpio1 = &expander;
        };


The actual Linux-specific integer base will *NOT* be in the
device tree, but if you know how many GPIOs are on each
controller the number space is still stable and predictable
beginning from 0. If one want to keep track of the Linux
number space one can do so with comments in the device
tree or something.

> I know we pushed back against this kind of solution in the past, but
> it is still more reliable than having a property that affects how the
> kernel's base finding function works, and will offer us a way to
> eventually put ARCH_NR_GPIOS and gpiochip_find_base() to rest (at the
> cost of backwards-compatibility, but we just cannot do without it).
> Linus, do you agree?

What do you think about the above?

Yours,
Linus Walleij
