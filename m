From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] gpio: mention in DT binding doc that <name>-gpio is deprecated
Date: Fri, 25 Sep 2015 13:32:32 -0500
Message-ID: <CAL_JsqL9FCGAy-9o_4M+hhG7MVB6MX8i5JJyNBnM3fPezVrYdQ@mail.gmail.com>
References: <1442840245-7982-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442840245-7982-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Masahiro Yamada <yamada.m-NAum8xwdG0+S7A1Ibl2khg@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 21, 2015 at 7:57 AM, Javier Martinez Canillas
<javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
> The gpiolib supports parsing DT properties of the form <name>-gpio but it
> was only added for compatibility with older DT bindings that got it wrong
> and should not be used in newer bindings.
>
> The commit that added support for this was:
>
> dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")
>
> but didn't update the documentation to explain this so it's been a source
> of confusion. So let's make this clear in the GPIO DT binding doc.
>
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Applied. Thanks.

Rob

>
> ---
>
> Changes in v2:
> - Explain that <name>-gpio is deprecated instead of saying that is
>   supported. Suggested by Alexandre Courbot.
>
>  Documentation/devicetree/bindings/gpio/gpio.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 5788d5cf1252..82d40e2505f6 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -16,7 +16,9 @@ properties, each containing a 'gpio-list':
>  GPIO properties should be named "[<name>-]gpios", with <name> being the purpose
>  of this GPIO for the device. While a non-existent <name> is considered valid
>  for compatibility reasons (resolving to the "gpios" property), it is not allowed
> -for new bindings.
> +for new bindings. Also, GPIO properties named "[<name>-]gpio" are valid and old
> +bindings use it, but are only supported for compatibility reasons and should not
> +be used for newer bindings since it has been deprecated.
>
>  GPIO properties can contain one or more GPIO phandles, but only in exceptional
>  cases should they contain more than one. If your device uses several GPIOs with
> --
> 2.4.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
