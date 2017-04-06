From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 0/4] arm64: renesas: enable M3ULCB board peripherals
Date: Thu, 6 Apr 2017 11:53:45 +0200
Message-ID: <CAMuHMdX9caECvsBnfUQhbQKdW_uGJ_VXAUksMMXw7EAGP8QUCQ@mail.gmail.com>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1489788135.8957.2.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489788135.8957.2.camel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Fri, Mar 17, 2017 at 11:02 PM, Sjoerd Simons
<sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> On Thu, 2017-01-26 at 17:53 +0300, Vladimir Barinov wrote:
>> This adds the folowing:
>> - R8A7796 SoC based M3ULCB board peripherals
>>
>> Vladimir Barinov (4):
>> [1/4] arm64: dts: m3ulcb: enable I2C
>> [2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
>> [3/4] arm64: dts: m3ulcb: enable EthernetAVB
>> [4/4] arm64: dts: m3ulcb: enable HS200 for eMMC
>
> Seems these didn't hit -next just yet, for this series (tested on a
> M3ULCB)
>
> Tested-By: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

It seems this series is still pending? Any reason (not) to apply it?

Thanks!

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
