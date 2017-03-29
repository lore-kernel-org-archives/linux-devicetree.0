From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] doc,dts - add XRA1403 DTS binding documentation
Date: Wed, 29 Mar 2017 04:09:38 +0200
Message-ID: <CACRpkdZkuPKnz=5qqfNyj-JJQV7i_8e2X3-Scd13eowBrVvDqw@mail.gmail.com>
References: <cover.1490595641.git.nandor.han@ge.com> <39ba92bacf48da957f8f85d5cb11d3254fe3d68f.1490595641.git.nandor.han@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <39ba92bacf48da957f8f85d5cb11d3254fe3d68f.1490595641.git.nandor.han-JJi787mZWgc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 8:23 AM, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org> wrote:

> Add the XRA1403 DTS binding documentation.
>
> Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>

There is no big problem with this but:

> +The XRA1403 is an 16-bit GPIO expander with an SPI interface. Features available:
> +       - Individually programmable inputs:
> +               - Internal pull-up resistors
> +               - Polarity inversion
> +               - Individual interrupt enable
> +               - Rising edge and/or Falling edge interrupt
> +               - Input filter

Since you mention that it has interrupts maybe you want to add bindings
for the cascaded interrupt and the interrupt-controller; keyword etc
already now.

We just document what the hardware can do, we don't have to do all
of it in the first Linux driver submission.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
