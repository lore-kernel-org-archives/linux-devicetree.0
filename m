From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Fwd: [PATCH v2] ARM: dt: fix up PL011 device tree bindings
Date: Mon, 8 Sep 2014 13:32:56 +0200
Message-ID: <CACRpkdbMnfULKDJM+YC2EwiiDjs+xS8mHJbJSefXt-1x9uyyNA@mail.gmail.com>
References: <1399887437-32154-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdai=GX694hH1VxfMiGXcf7YH3wTE9HVS3hHA_zFFT28fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdai=GX694hH1VxfMiGXcf7YH3wTE9HVS3hHA_zFFT28fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The thread is so old that the mailing list has changed. Mea culpa.
Here is a copy.

Linus

---------- Forwarded message ----------
From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Mon, Sep 8, 2014 at 1:31 PM
Subject: Re: [PATCH v2] ARM: dt: fix up PL011 device tree bindings
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org"
<devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Grant Likely
<grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org"
<linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


On Mon, May 12, 2014 at 11:37 AM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Make the map match the reality, the current binding text is
> nonsense:
>
> - The clock required for the clocking of the serial port
>   must come first and is not optional (as the driver will
>   otherwise proceed to grab and use the apb_pclk as uartclk),
>   and the apb_pclk that clocks the logic must come second
>   as the code will retrieve the first clock by index,
>   whereas the PrimeCell but will explicitly look for
>   "apb_pclk" so this can be specified later, as it is
>   looked up by name.
>
> - The pin control state "default" is the only mandated
>   state, the sleep state is entirely optional.
>
> We also add an example to avoid further confusion.
>
> Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v1->v2:
> - Rename amba_pclk to apb_pclk
> - Split clock/clocks properties and indicate that listin one
>   clock only is deprecated

I don't see either this or Mark's related patch being applied and the DT
binding for PL011 left in a sad state. Can we please apply this?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
