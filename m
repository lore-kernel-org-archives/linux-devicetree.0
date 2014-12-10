From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Patch v3 2/2] gpio: Document GPIO hogging mechanism
Date: Wed, 10 Dec 2014 19:56:17 +0900
Message-ID: <CAAVeFuJHwGqXSgCu-FstUr32UZJaKjSBAUkfySkQVFqUhV75JQ@mail.gmail.com>
References: <1417726922-10376-1-git-send-email-bparrot@ti.com> <1417726922-10376-3-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1417726922-10376-3-git-send-email-bparrot@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 5, 2014 at 6:02 AM, Benoit Parrot <bparrot@ti.com> wrote:
> Add GPIO hogging documentation to gpio.txt
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
> Changes since v2:
>  * Updated to the latest hog syntax.
>
> Changes since v1:
>  * Split the devicetree bindings documentation in its own patch.
>
>  Documentation/devicetree/bindings/gpio/gpio.txt | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 3fb8f53..6d88133 100644
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
> +- gpios:     Store the gpio information (id, flags, ...). Shall contain the
> +            number of cells specified in its parent node (GPIO controller
> +            node).

Since this property will only describe one GPIO, why use the plural
form? Would it not be confusing?

> +- direction: A property specifying the direction/value needed. This property
> +            can take the folowing values: input, output-high, output-low.

nit: since this property not only describes the direction but also the
(potential) value, I suggest to rename it to "state".
