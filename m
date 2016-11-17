From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] mfd: dt: Add Aspeed LPC binding
Date: Thu, 17 Nov 2016 10:30:46 +0100
Message-ID: <CACRpkdazPEbU2gmDyke=GTYtjVp8aeauS+PVkp-zuiVoVz7kbw@mail.gmail.com>
References: <20161117060633.3837-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117060633.3837-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 17, 2016 at 7:06 AM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:

> +* Device tree bindings for the Aspeed LPC Controller

We are going overboard with the lingo sometimes, to the point that we do not
understand how terse things become.

LPC = Low Pin Count, right?
Explain that right here: it is a slow external bus, right?

> +The Aspeed LPC controller contains registers for a variety of functions. Not
> +all registers for a function are contiguous, and some registers are referenced
> +by functions outside the LPC controller.
> +
> +Note that this is separate from the H8S/2168 compatible register set occupying
> +the start of the LPC controller address space.
> +
> +Some significant functions in the LPC controller:
> +
> +* LPC Host Controller
> +* Host Interface Controller

Host interface to what?

> +* iBT Controller

What is iBT?

> +* SuperIO Scratch registers

Again more context please.

With standards documents, either explain everything or provide
pointers for the information.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
