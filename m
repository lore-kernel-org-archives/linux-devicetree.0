From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] OF phandle nexus support + GPIO nexus
Date: Thu, 24 Nov 2016 16:27:05 +0100
Message-ID: <CACRpkdZ4ceij+uvqFyfmgGwH9bGnJDn8jRr+0m8sCEYeexoz3g@mail.gmail.com>
References: <20161124102529.20212-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161124102529.20212-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2016 at 11:25 AM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> This is one small chunk of work related to DT overlays for expansion
> boards. It would be good to have a way to expose #<list>-cells types of
> providers through a connector in a standard way. So we introduce a way
> to make "nexus" nodes for these types of properties to remap the consumer
> number space to the other side of the connector's number space. It's
> basically a copy of the interrupt nexus implementation, but without
> the address space matching design and interrupt-parent walking.
>
> The first patch implements a generic method to do this, and the second patch
> adds a unit test for it. The third patch is more of an example than anything
> else. It shows how we would modify frameworks to use the new API.
>
> Stephen Boyd (3):
>   of: Support parsing phandle argument lists through a nexus node
>   of: unittest: Add phandle remapping test
>   gpio: Support gpio nexus dt bindings

Looks perfectly reasonable to me. But it's mainly for the DT people to review
I guess.

I have no idea about the eventual merge path though, I guess it needs to
go through the OF tree with my ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
