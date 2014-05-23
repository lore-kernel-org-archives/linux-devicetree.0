From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/10] irqchip: versatile-fpga: add pass-thru enable support
Date: Fri, 23 May 2014 14:56:07 +0200
Message-ID: <CACRpkdbarWMjn6cVSeWCFO7v9Qj_np5gL+7=NMB7NHkoMEPovA@mail.gmail.com>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
	<1400620176-7239-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400620176-7239-4-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 20, 2014 at 11:09 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Set the PIC_ENABLES register when the passthru-mask property is present.
> This enables interrupts on the secondary controller to be passed thru
> directly to the primary controller.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

(...)

> +#define PIC_ENABLES             0x20   /* set interrupt pass through bits */

What register is this? In this hardware register 0x20 is
#define FIQ_STATUS              0x20

Do you mean that this FPGA IRQ controller is an augmented version
with the FIQ portions removed and instead it has some special
routing register at 0x20?

In that case it should have a different compatible-string should it not?

I was under the impression that this was just a simple cascaded
IRQ controller cascaded off bit 31 of the VIC, which is much simpler
to handle, maybe in the manner of commits
e641b987c20832dfaaa51d7792ed928c2b2d2dbf
"irqchip: support cascaded VICs"
f6da9fe45c3074b909084ae9da5f55034ebffeb4
"irqchip: vic: Properly chain the cascaded IRQs"

But for the fpga IRQ driver. Atleast that is how the comments in
the device tree says it should work so something is odd
here :-/

I really want to know how this special register works.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
