From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: r8a7796: Add missing second pair of DMA names
 to MSIOF nodes
Date: Thu, 13 Jul 2017 10:23:43 +0200
Message-ID: <CAMuHMdU58TtEpHAdmf-wKCrOvziZTTs3xBc7hv4E15n1UdCOOQ@mail.gmail.com>
References: <1499855753-21630-1-git-send-email-geert+renesas@glider.be> <20170713081811.GN5580@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170713081811.GN5580-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Thu, Jul 13, 2017 at 10:18 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Wed, Jul 12, 2017 at 12:35:53PM +0200, Geert Uytterhoeven wrote:
>> MSIOF0 and MSIOF1 are tied to two DMA controllers through two pairs of
>> DMA specifiers.  However, the second pair of corresponding DMA names was
>> missing.
>>
>> Fixes: 80fab06e258da762 ("arm64: dts: r8a7796: Add all MSIOF nodes")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Thanks, applied for v4.14.
>
> Let me know if you would prefer it handled as a fix for v4.13.
> I see the commit it fixes was part of v4.11.

Thanks!

V4.14 is fine.  It's not enabled in any board DTS, and DMA will stll work as
long as there are free channels on DMAC1.

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
