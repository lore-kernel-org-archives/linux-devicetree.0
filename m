From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v5 4/4] gpio: dt-bindings: add gpio-mmio bindings
Date: Fri, 29 Apr 2016 16:29:13 +0200
Message-ID: <CACRpkdYXqcQ1a=S5c6Cev__nqfquo7tFA=3uJSu9wf96txfBwQ@mail.gmail.com>
References: <cover.1461888822.git.chunkeey@googlemail.com>
	<a0ded4d0161f7ab3cd1945741d95d2718dbe4f44.1461888822.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <a0ded4d0161f7ab3cd1945741d95d2718dbe4f44.1461888822.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 29, 2016 at 2:53 AM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>
> This patch adds the device tree bindings for the gpio-mmio.
> The gpio-mmio is already part of a the GPIO generic library.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

I share your ambition to create something generic for this class
of hardware(s).

> +Bindings for the generic driver for memory-mapped GPIO controllers.
> +
> +Required properties:
> +       - compatible: should be "linux,gpio-mmio"

Why?
"memory-mapped-gpio" sits nicely with me.

Read another very generic binding for inspiration:
Documentation/devicetree/bindings/leds/register-bit-led.txt

> +       - reg-names: must contain
> +               "dat" - data register
> +               may contain
> +               "set" - data set register
> +               "clr" - data clear register
> +               "dirout" - direction output register
> +               "dirin" - direction input register

I would just be more verbose:

data-in-register
data-out-set-register
data-out-clear-register
direction-output-register
direction-input-register

Some should be optional so we can support input-only
and output-only GPIO controllers too.

I would take this opportunity to add bindings also for stuff that
the generic MMIO driver does not support today but
could be made to support:

open-drain-register
open-source-register
debounce-register

etc

> +Optional properties:
> +       - ngpio: specifies the number of gpio mapped in the register.

Just reference the generic docs.

> +       - big-endian: force big endian register accesses.
> +       - big-endian-byte-order: assign GPIOs in reverse order.
> +       - unreadable-reg-set: data set register is not readable.
> +       - read-output-reg-set: cache value set for reads.
> +       - unreadable-reg-dir: dirout/dirin register is not readable.
> +       - no-output: GPIOs are read-only.

I think it's better to imply that if there is no data-in-register
specified, then it is output-only etc.

> +The GPIO generic library provides support for memory-mapped GPIO
> +controllers. The configuration is detected by which resources are pr=
esent.
> +The simplest form of a GPIO controller that the driver support is ju=
st a
> +single "dat" register, where GPIO state can be read and/or written.
> +However, the driver supports far more:
> +       - 8/16/32/64 bits registers. The number of GPIOs is automatic=
ally
> +         determined by the width of the registers.
> +       - GPIO controllers with clear/set registers.
> +       - GPIO controllers with a single "dat" register.
> +       - Big endian bits/GPIOs ordering.


Skip this. It is Linux-specific.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
