From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: mmio: add support for NI 169445 NAND GPIO
Date: Wed, 15 Mar 2017 10:33:39 +0100
Message-ID: <CACRpkdZm1B=ohBp4eOh8j++SWUwa9dU0-PErdj3P0u-+kvrYzg@mail.gmail.com>
References: <1488830761-681-1-git-send-email-nathan.sullivan@ni.com> <1488830761-681-2-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488830761-681-2-git-send-email-nathan.sullivan-acOepvfBmUk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 6, 2017 at 9:06 PM, Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org> wrote:

> The GPIO-based NAND controller on National Instruments 169445 hardware
> exposes a set of simple lines for the control signals.
>
> Signed-off-by: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>

Totally standard ans simple patch, applied.

Hint: it's probably nice to use the gpio-line-names attribute
on these boards to name the lines.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
