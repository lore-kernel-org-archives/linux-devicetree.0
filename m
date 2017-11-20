From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of
 supported chip names
Date: Mon, 20 Nov 2017 11:08:09 +0100
Message-ID: <CAMuHMdV0o0TYv0kgSdToW2S7q6xWDWjc3HV9KU7dKHdnRGU5gg@mail.gmail.com>
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <658ceb2b-5d2b-9349-f140-27858459e5a8@wedev4u.fr> <CAMuHMdWZ=71XvVyzsiPyiAz+0RsCZjmWqqvOKs=bDdSQMpLmnA@mail.gmail.com>
 <TY1PR06MB0895157B208F8281B635340EC0220@TY1PR06MB0895.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <TY1PR06MB0895157B208F8281B635340EC0220-/PRLmSCtZ16EeHdvShrxA20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Mon, Nov 20, 2017 at 10:43 AM, Fabrizio Castro
<fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
>> On Fri, Nov 17, 2017 at 6:36 PM, Cyrille Pitchen
>> <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org> wrote:
>> BTW, "sst" (for Silicon Storage Technology) should be added to
>> Documentation/devicetree/bindings/vendor-prefixes.txt, too, to avoid another
>> warning:
>>
>> WARNING: DT compatible string vendor "sst" appears un-documented --
>> check ./Documentation/devicetree/bindings/vendor-prefixes.txt
>> #79: FILE: arch/arm/boot/dts/r8a7743-iwg20m.dtsi:79:
>> + compatible = "sst,sst25vf016b", "jedec,spi-nor";
>
> we did submit a patch to fix this ("of: add vendor prefix for Silicon Storage Technology Inc."):
> https://patchwork.kernel.org/patch/9946889/
>
> a while ago

And it is queued in dt-rh/for-next (I thought I had that tree included, but
apparently I hadn't. Fixed ;-)

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
