From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] ARM: ux500: Add initial support for PM domains
Date: Tue, 28 Oct 2014 10:51:34 +0100
Message-ID: <CACRpkdZPtuC-AQsrZD8xhcg9GacKb2ifZ9u8HqcPU6H1NgGKdA@mail.gmail.com>
References: <1413277981-27451-1-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413277981-27451-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jinkun Hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 14, 2014 at 11:12 AM, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> This patchset enables initial support for PM domains for ux500.
>
> The implementation is based upon the generic PM domain and its corresponding
> DT support, which is used to decribe PM domains and tell what devices resides
> in what PM domain.
>
> In this initial step, the VAPE PM domain is added and the devices with
> corresponding drivers that properly implements runtime PM support. Especially,
> to gate the VAPE PM domain drivers must implement register context save/restore.
> Typically that must be done from the driver's runtime PM callbacks.
>
> Currently the generic PM domain, doesn't handle IRQ safe devices very well. For
> example, having such device in a PM domain would keep it always powered. The
> DMA controller in ux500, handled by the ste_dma40 driver is configured as IRQ
> safe. That limitation in the generic PM domain needs to be fixed, prior we can
> add the DMA device to the VAPE PM domain.

All patches applied and will send a pull request to ARM SoC ASAP.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
