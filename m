From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v4 2/2] gpio: Document GPIO hogging mechanism
Date: Wed, 17 Dec 2014 17:43:12 +0900
Message-ID: <CAAVeFuK2o8nCcQSOWf2pO-0hk33CyUsw0SErqq+CdbYZhRgLmA@mail.gmail.com>
References: <1418422051-9471-1-git-send-email-bparrot@ti.com> <1418422051-9471-3-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418422051-9471-3-git-send-email-bparrot-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A few nits:

On Sat, Dec 13, 2014 at 7:07 AM, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org> wrote:
> Add GPIO hogging documentation to gpio.txt
>
> Signed-off-by: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
> ---
> Changes since v3:
>  * Renamed the "direction" DT properties to "state".
>
>  Documentation/devicetree/bindings/gpio/gpio.txt | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 3fb8f53..a38da91 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -103,6 +103,22 @@ Every GPIO controller node must contain both an empty "gpio-controller"
>  property, and a #gpio-cells integer property, which indicates the number of
>  cells in a gpio-specifier.
>
> +The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> +providing automatic GPIO request and configuration as part of the
> +gpio-controller's driver probe function.
> +
> +Each GPIO hog definition is represented as a child node of the GPIO controller.
> +Required properties:
> +- gpio-hog:  A property specifying that this child node represent a gpio-hog.

... represent a GPIO hog.

> +- gpios:     Store the gpio information (id, flags, ...). Shall contain the
> +            number of cells specified in its parent node (GPIO controller
> +            node).
> +- state:     A property specifying the direction/value needed. This property
> +            can take the folowing values: input, output-high, output-low.

s/folowing/following

This aside,

Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
