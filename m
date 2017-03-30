From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH/RFC v2 0/2] arm64: dts: r8a7795: Add support for R-Car H3 ES2.0
Date: Thu, 30 Mar 2017 13:13:03 +0200
Message-ID: <CAMuHMdV+=pNpFO7H3J0=JM1BnXtm4t=Q+1bx=R+f9=JxvJZT_Q@mail.gmail.com>
References: <1490362665-4422-1-git-send-email-geert+renesas@glider.be> <1490870898.3471.3.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490870898.3471.3.camel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sjoerd,

On Thu, Mar 30, 2017 at 12:48 PM, Sjoerd Simons
<sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> On Fri, 2017-03-24 at 14:37 +0100, Geert Uytterhoeven wrote:
>> This patch series adds preliminary support for Renesas Salvator-X
>> development boards equipped with revision ES2.0 of the R-Car H3 Soc.
>>
>>   - Patch 1 adds support for the R-Car H3 ES2.0 Soc,
>>     While this patch is safe as-is, as it doesn't affect any existing
>>     setups, it's probably a bit premature to apply it.
>>   - Patch 2 adds support for Salvator-X boards with R-Car H3 ES2.0.
>>     This patch does affect existing development setups, as it changes
>> the
>>     name of the DTB for Salvator-X boards equipped with ES1.x SoCs.
>>     Given most developers have access to ES1.x only, this patch must
>> not be
>>     applied yet.
>
> Would it make more sense to add a new r8a7795-es2.dtsi and keep the
> current dtsi for es1? Having to load different device-trees based on
> which kernel is used would be rather nasty.

We definitely considered that option.
However, we concluded that in the end, we want to mainly support production
SoCs.  Hence the default files should represent the production version.
Using a preproduction SoC can be considered a special case, and thus needs
a file with a special esX ID in its name.

We do realize this can cause some inconveniences during the transition period,
when most developers don't have access to ES2.0 SoCs yet, or have mixed
environments of ES1.x and ES2.0.

Of course you can keep on using the current DTB (binary) on your H3 ES1.x
boards, as long as you don't need to use devices not yet described in that DTB.

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
