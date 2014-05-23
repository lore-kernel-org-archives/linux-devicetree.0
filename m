From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: add passthru-mask property to versatile-fpga-irq
Date: Fri, 23 May 2014 14:46:41 +0200
Message-ID: <CACRpkdZGevG9YaUPUs98pQidcGz7MxbxjuSxBn=cqaOYGhWegw@mail.gmail.com>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
	<1400620176-7239-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400620176-7239-2-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 20, 2014 at 11:09 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Add a passthru-mask property for setting interrupts which are passed
> through directly to a primary controller.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt b/Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt
> index c9cf605..956b71d 100644
> --- a/Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt
> +++ b/Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt
> @@ -34,3 +34,6 @@ Optional properties:
>  - interrupts: if the FPGA IRQ controller is cascaded, i.e. if its IRQ
>    output is simply connected to the input of another IRQ controller,
>    then the parent IRQ shall be specified in this property.
> +- passthru-mask: a u32 number representing a bit mas determining which of

bit mask

(speling)

> +  the interrupts are directly passed through to the primary interrupt
> +  controller.

This is very confusing on the Integrators. The FPGA IRQ controller
*is* the primary interrupt controller on these.

(Further on Integrators with an IM-PD1 expansion board the
VIC is actually the secondary controller visavis the FPGA
IRQ controller which is the primary one.)

So on the versatile the FPGA IRQ controller is *not* cascaded
off one line of the VIC but rather connected in parallel or
something?

Care to elaborate a bit on how things are cascaded here?
And specify that this is for some special usecase or
something?

I'll read through the patches and see if I can wrap my head
around this.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
