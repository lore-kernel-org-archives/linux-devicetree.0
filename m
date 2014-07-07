From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: Add driver for Zynq GPIO controller
Date: Mon, 7 Jul 2014 16:51:56 +0200
Message-ID: <CACRpkdb1M3-hrSKLKWz21LCJ1sMvsq5E-aqkpmVhy0NwOS5HhA@mail.gmail.com>
References: <1403091577-10232-1-git-send-email-harinik@xilinx.com>
	<5cc8b89b-20ff-4fa9-92dd-bb2f6d3512d8@BY2FFO11FD030.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5cc8b89b-20ff-4fa9-92dd-bb2f6d3512d8@BY2FFO11FD030.protection.gbl>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Harini Katakam <harini.katakam@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Harini Katakam <harinikatakamlinux@gmail.com>, Harini Katakam <harinik@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 18, 2014 at 5:36 PM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> I did some of the changes for this v2 and a few things are not clear =
to
> me.
>
> The first is, how is userspace supposed to find the correct offset fo=
r a
> GPIO pin.

The sysfs interface to GPIO is *NOT* *GOOD* this is universally
agreed upon.

This needs someone to step in and provide a replacement, my preferred
mechanism would be a /dev/gpiochip0/... hierarchy using char devices.

> E.g. let's say GPIO 10 of this SOC-internal GPIO controller is
> something I want to control. So, I'd export GPIO (chip-base + 10). Bu=
t
> this chip-base seems pretty variable. v1 of this patch had it hardcod=
ed
> to 0, which resulted in a predictable offset, but apparently was utte=
rly
> wrong. Now I see an offset of 138 for this chip when using my config.
> And when I use multi_v7_defconfig the offset is somewhere in the 800s=
,
> IIRC. The best I found was the 'label' in the gpiochip's sysfs entry,
> but documentation says that is not necessarily unique, and parsing la=
bes
> seems sub-optimal too.

You see. It is badly designed and needs to be rewritten.

It was merged into the kernel at a time when the GPIO subsystem
was unmaintained, sadly.

> The second issue is a stack trace (below) I see when triggering
> interrupts (e.g. echo rising > edge; and then pushing the connected
> button). Looking at the stack trace, I don't see an obvious error (I
> think I pretty much copied the IRQ registration from the gpio-pl061.c
> driver you mentioned). Is this an issue in this driver or the core co=
de?

Probably.

Using GPIOs for IRQs in userspace is an even worse idea than using
GPIOs from userspace in general :-D

But before you add any hairy code in userspace, please have a look
at Documentation/gpio/sysfs.txt:

"Note that standard kernel drivers exist for common "LEDs and Buttons"
 GPIO tasks:  "leds-gpio" and "gpio_keys", respectively. Use those
 instead of talking directly to the GPIOs; they integrate with kernel
 frameworks better than your userspace code could."

So: what is the usecase for these GPIOs?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
