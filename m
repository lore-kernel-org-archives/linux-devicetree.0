From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/6] pinctrl: rockchip: support rk3288
Date: Mon, 7 Jul 2014 12:41:01 +0200
Message-ID: <CACRpkdaG-FrfQOB0FHeev1D0L8rrOW2-4jW4KufJMb4NneVeHQ@mail.gmail.com>
References: <1887108.ECBDVhibgn@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1887108.ECBDVhibgn@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 16, 2014 at 1:35 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:

> This series adds support for the rk3288 SoC.
>
> The first patch generalizes the gpio-only handling of the rk3188 into=
 a
> general quirk-handling making it possible to deprecate the special ba=
nk
> compatible and also to add quirks of later SoCs.
>
> Patches 2 to 5 enable the driver to handle the quirks of rk3288 and
> patch 6 then simply adds the description of the rk3288 banks.
>
> Tested on a rk3288-evb and on a rk3188-radxarock with both the
> deprecated and new regular notation for bank0.
>
> Heiko Stuebner (6):
>   pinctrl: rockchip: generalize bank-quirks
>   pinctrl: rockchip: precalculate iomux offsets
>   pinctrl: rockchip: add support for 4bit wide iomux settings
>   pinctrl: rockchip: enable iomuxes from pmu space
>   pinctrl: rockchip: support unrouted iomuxes per bank
>   pinctrl: rockchip: add support for rk3288 pin-controller

Excellent and nice broken-down patch series Heiko!

All patches applied for v3.17.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
