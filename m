From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: mention in DT binding doc that <name>-gpio is also supported
Date: Sat, 19 Sep 2015 00:44:11 +0900
Message-ID: <CAAVeFuK-doCwGB=EwN2F933G8_ubSRR2xz9xEnWLAhReTupvSA@mail.gmail.com>
References: <1442453638-14246-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1442453638-14246-1-git-send-email-javier@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 17, 2015 at 10:33 AM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> The GPIO DT binding doc mentions that GPIO are mapped by defining
> a <name>-gpios property in the consumer device's node but a -gpio
> sufix is also supported after commit:
>
> dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")
>
> Update the DT binding documentation to match the implementation.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
> ---
> Hello,
>
> The GPIO documentation was updated to mention that the -gpio sufix
> is also supported in patch https://lkml.org/lkml/2015/9/1/117 that
> already landed in Torvalds tree.
>
> I now noticed that the DT binding also only mentions -gpios so I'm
> posting this patch that adds -gpio to the DT binding documentation.

I think I remember that -gpio is considered obsolete and its use
should thus not be encouraged, which is the reason why the
documentation does not mention it. We could mention it and add a note
saying that it should not be used for new bindings, but all in all
isn't it better to keep the documentation clear of such use cases that
will not be accepted for new patches anyway?

>
> Best regards,
> Javier
>
>  Documentation/devicetree/bindings/gpio/gpio.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 5788d5cf1252..8db8c7bb96c1 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -13,10 +13,10 @@ properties, each containing a 'gpio-list':
>         gpio-specifier : Array of #gpio-cells specifying specific gpio
>                          (controller specific)
>
> -GPIO properties should be named "[<name>-]gpios", with <name> being the purpose
> -of this GPIO for the device. While a non-existent <name> is considered valid
> -for compatibility reasons (resolving to the "gpios" property), it is not allowed
> -for new bindings.
> +GPIO properties should be named "[<name>-]gpios" or "[<name>-]gpio" with <name>
> +being the purpose of this GPIO for the device. While a non-existent <name> is
> +considered valid for compatibility reasons (resolving to the "gpios" property),
> +it is not allowed for new bindings.
>
>  GPIO properties can contain one or more GPIO phandles, but only in exceptional
>  cases should they contain more than one. If your device uses several GPIOs with
> --
> 2.4.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
