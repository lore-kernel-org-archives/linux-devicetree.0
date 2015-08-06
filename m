From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH/RFC 0/3] of/overlay: Update aliases when added or removed
Date: Thu, 6 Aug 2015 18:55:05 +0200
Message-ID: <CAMuHMdWbibuZ+u8HGqwxR9RsgQMoWi6=Q5M9_qyvAzLOBFGHCw@mail.gmail.com>
References: <CAMdRc4EFOW8t-Sfm-4Pnk1YoSPNhFO5Qb-iViTThy5WCXuH1eA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMdRc4EFOW8t-Sfm-4Pnk1YoSPNhFO5Qb-iViTThy5WCXuH1eA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Abel <rabel-Ejy783gw450hGw5VS8l+XCM2BslAju9D@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Wed, Jul 29, 2015 at 1:52 PM, Robert Abel
<rabel-Ejy783gw450hGw5VS8l+XCM2BslAju9D@public.gmane.org> wrote:
> On 30 Jun 2015 Grant Likely wroke
>> Looks good to me. I've made comments on patch 3. Also, you'll need to include unittests before I can merge it.
>> [...]
>>>   - Should the OF core handle this itself, by registering a notifier
>>>     using of_reconfig_notifier_register()?
>>Yes. Let's not add new hooks.
>
> Any news on this? Were the patches applied to any public tree or are
> there follow-up patches that address the issue using
> of_reconfig_notifier_register?

In the mean time I made some improvements (e.g. but removed aliases
on a list instead of freeing them, which causes crashes when using the
wrong deallocator), but I haven't implemented the notifier yet.

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
