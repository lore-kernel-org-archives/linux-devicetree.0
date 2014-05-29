From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
Date: Thu, 29 May 2014 11:44:54 +0200
Message-ID: <CACRpkdap1U19EiULnq11udhY91UnnNu_-5MnLby3idbdjzBj4Q@mail.gmail.com>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org>
	<201405091244.02066.arnd@arndb.de>
	<CACRpkdb8c=k3Ky=TisNdzycc3owJsNSQmSTu03RR5E0QvE0KZA@mail.gmail.com>
	<537E7B83.4020900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537E7B83.4020900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 23, 2014 at 12:34 AM, Sebastian Hesselbarth
<sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 05/22/2014 09:41 AM, Linus Walleij wrote:

>> So for now I keep to our special driver.
>
> +1 for drivers/soc _and_ of_xlate for regmap instead of syscon.
>
> driven by Mike Turquette's request to join mach-berlin clock node into a
> single node, we currently use pinctrl driver (that must be somewhere in
> Linus inbox) as a crutch to register a regmap for other drivers.

I've merged it actually, I think. Else hit me on any missed patches.

> With a drivers/soc we'd have a good place for those messy, SoC-specific
> registers to put a driver that hooks up to a single node and takes care
> of registering e.g. pinctrl and reset the plain-old platform_device
> way. It will be a little bit like arm/mach-foo before, but maybe we
> have to admit that on SoCs there will always be some amount of
> very specific, non-probable, non-describable registers that simply need
> special treatment.

Hmmmm well I want to see that code before I believe it ... but
I get what you mean.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
