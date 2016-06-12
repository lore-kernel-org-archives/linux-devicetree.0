From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/1] iio: light: Added CM36672 Proximity Sensor Driver.
Date: Sun, 12 Jun 2016 19:30:04 +0200
Message-ID: <CACRpkdaRiNaUPt-pB4M-k6u4-z5mCaz8FRYvZyHYD7B6VPy31A@mail.gmail.com>
References: <1465462845-1571-1-git-send-email-capellamicro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465462845-1571-1-git-send-email-capellamicro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Tsai <capellamicro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Crestez Dan Leonard <leonard.crestez-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TasMV2rI37PzA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 9, 2016 at 11:00 AM, Kevin Tsai <capellamicro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> V2:
> Thanks commends from Peter Meerwald-Stadler, Jonathan Cameron, and Linux
> Walleij.

Haha that again, everybody does that.

> Updated for the following:
>  - Remove unused defines.
>  - Rewrite event registration.
>  - Remove direct register values in the device tree.
>  - Rewrite by regmap API.
>  - Remove irq module parameter.
>  - Correct cm36672_remove().

Awesome. Minor comments still:

> +Required properties:
> +- compatible: must be capella,cm36672"
> +- reg: the I2C slave address, usually 0x60
> +- interrupts: interrupt mapping for GPIO IRQ

Don't say GPIO IRQ. Some chips have hardwired external interrupt lines
rather than GPIOs and those should work just as fine. Does it support
level, edge etc IRQs?

> +Optional properties:
> +- interrupt-parent: interrupt controller
> +- interrupts: interrupt mapping for GPIO IRQ

That is mentioned again, I guess it is not optional and should be removed
from here?

> +- cm36672,prx_led_current: LED current, must be one of the following values:
> +    - 0: 50mA
> +    - 1: 75mA
> +    - 2: 100mA
> +    - 3: 120mA
> +    - 4: 140mA
> +    - 5: 160mA
> +    - 6: 180mA
> +    - 7: 200mA

Do not specify enumerators. Specify milliamps in the device tree
and have the code translate it to enumerators. DTS should be
human-readable and easy to understand without reading tables.

Just use vendor prefix and something you seen before like:
capella,driver-strength = <160>;
For 160mA

> +- cm36672,prx_hd: width of proximity sensor output data, must be one of the
> +  following values:
> +    - 0: 12-bit
> +    - 1: 16-bit

Use
capella,bus-width = <12>;
The SD cards have this pattern for bus widths.

Yours,
Linus Walleij
