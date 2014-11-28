From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v2 2/2] gpio: Document GPIO hogging mechanism
Date: Fri, 28 Nov 2014 16:31:19 +0900
Message-ID: <CAAVeFuKEXp68LF9LJuKbQ9JM4YiksiG2K0ekPHM=K2ZJHZYDJg@mail.gmail.com>
References: <1416527684-19017-1-git-send-email-bparrot@ti.com> <1416527684-19017-3-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416527684-19017-3-git-send-email-bparrot-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 21, 2014 at 8:54 AM, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org> wrote:
> Add GPIO hogging documentation to gpio.txt
>
> Signed-off-by: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
> ---
> Changes since v1:
>  * Split the devicetree bindings documentation in its own patch.
>
>  Documentation/devicetree/bindings/gpio/gpio.txt | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 3fb8f53..82755e2 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -103,6 +103,24 @@ Every GPIO controller node must contain both an empty "gpio-controller"
>  property, and a #gpio-cells integer property, which indicates the number of
>  cells in a gpio-specifier.
>
> +The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> +providing automatic GPIO request and configuration as part of the
> +gpio-controller's driver probe function.
> +
> +Each GPIO hog definition is represented as a child node of the GPIO controller.
> +Required properties:
> +- gpio-hog: a property specifying that this child node represent a gpio-hog.
> +- gpios: store the gpio information (id, flags, ...). Shall contain the
> +  number of cells specified in its parent node (GPIO controller node).
> +- input: a property specifying to set the GPIO direction as input.
> +- output-high: a property specifying to set the GPIO direction to output with
> +  the value high.
> +- output-low: a property specifying to set the GPIO direction to output with
> +  the value low.
> +
> +Optional properties:
> +- line-name: the GPIO label name. If not present the node name is used.
> +
>  Example of two SOC GPIO banks defined as gpio-controller nodes:
>
>         qe_pio_a: gpio-controller@1400 {
> @@ -110,6 +128,13 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
>                 reg = <0x1400 0x18>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
> +
> +               line_b: line_b {

Mmm what is the label used for? Can this node ever be referenced from
somewhere else?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
