From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: Add find GPIO base in increasing order
Date: Wed, 10 Dec 2014 17:51:37 +0900
Message-ID: <CAAVeFu+Hn1Fk7PDcc4wGHFyJurX0hsW1N1prnPs2j=taGQKrKw@mail.gmail.com>
References: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com> <1417750722-14027-4-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1417750722-14027-4-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Zhou Wang <wangzhou.bry@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, liguozhu@hisilicon.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, atull@altera.com, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, jamie@jamieiles.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, wangzhou1@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 5, 2014 at 12:38 PM, Zhou Wang <wangzhou.bry@gmail.com> wrote:
> In function gpiochip_find_base, base number of a GPIO controller
> is found in decreasing order. ARCH_NR_GPIOS is used to define from
> which number we begin to search for base number of a GPIO controller.
>
> In fact, ARCH_NR_GPIOS brings us some multiplatform problems, like:
> http://www.spinics.net/lists/devicetree/msg60433.html
>
> This patch adds the support to find base number of a GPIO controller
> in increasing order. It will assign base number from 0.
> A new dts property called gpio-number-forward must be add to the related
> GPIO dts nodes if you want it works well.

Global GPIO numbers are a Linux-only concept, so your property should
be named linux,gpio-number-forward.

But even that way I don't think I like this idea. This just adds some
more mess to how the GPIO number space is constructed, and it is
already quite messy as it is. You have no guarantee over the probe
order of your GPIO controllers, so they may very well be probed in a
different order and end up with different base numbers anytime.

Not that this is your fault - the number namespace is broken by design
and I don't think there is a way to fix it. The long-term solution is
to stop using it by switching to the gpiod interface.

First a few questions to understand why you need your GPIOs numbered
this way, and if you need it at all:
- Can't you use the gpiod interface instead so you don't need to rely
on GPIO numbers?
- Do you plan to use the sysfs interface? If so then we are screwed,
because there is no way to use it without using global GPIO numbers.
This is something we should/will fix with named exported GPIOs, but we
are not here yet.

As to how we can solve your problem: if you must use GPIO integers
(because you need to use the sysfs interface for instance), and need
them affected consistently, the only way I can think of is to
introduce a "linux,gpio-base" property that will set gpiochip->base to
a fixed number. It still kind of sucks, but at least it will enforce
that different controllers get the same base number reliably, and the
firmware is the best placed to know how many GPIOs each controller has
and decide an appropriate layout.

I know we pushed back against this kind of solution in the past, but
it is still more reliable than having a property that affects how the
kernel's base finding function works, and will offer us a way to
eventually put ARCH_NR_GPIOS and gpiochip_find_base() to rest (at the
cost of backwards-compatibility, but we just cannot do without it).
Linus, do you agree?

In the medium term, we need to offer a solution for user-space to
*not* rely on GPIO numbers, and that will necessarily go through a new
sysfs interface, since at the moment even GPIO chips use their base
number in their exported name.
