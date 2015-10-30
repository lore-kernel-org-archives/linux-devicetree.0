From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Setup ethernet0 alias for u-boot
Date: Fri, 30 Oct 2015 10:57:51 +0100
Message-ID: <CAMuHMdUnSH66LUdV1E+nTkdnr7=fvYk0f3UE3u18fSVm6x8X=Q@mail.gmail.com>
References: <1446151497-29833-1-git-send-email-sjoerd.simons@collabora.co.uk>
	<CAMuHMdXBcZAXSm1hXv6E-hW9Zp-bPLpp-HxuWukS-Y837LBneQ@mail.gmail.com>
	<1446198423.4092.285.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446198423.4092.285.camel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sjoerd,

On Fri, Oct 30, 2015 at 10:47 AM, Sjoerd Simons
<sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
>> Note that in my case I didn't have to add an empty mac-address
>> property.
>> U-Boot (2015.04-something --- don't have the sources) seems to add a
>> "local-mac-address" property automatically.
>
> After submitting the patch i actually dived a bit deeper at how this
> all hangs together.
>
> The linux kernel checks for mac-address, local-mac-address and address
> in the fdt node, in that order of preference. u-boot (at least recent
> ones like you have), will set the mac-address property *if* it's
> already defined but will always create the local-mac-address property
> regardless.

That's also what I noticed. Originally I added the empty "mac-address" like
you did, and /sys/firmware/devicetree/base/soc/ethernet@e6800000 ended up
having both "mac-address" and "local-mac-address", both with the correct
address.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
