From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] of: Handle memory@0 node on PPC32 only
Date: Wed, 23 Apr 2014 11:35:36 +0100
Message-ID: <20140423103536.GC30036@e106331-lin.cambridge.arm.com>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
 <1397756521-29387-4-git-send-email-leif.lindholm@linaro.org>
 <CAMuHMdXBNWum7UJ95uT2hwTd1b5C8ebF2LQ4T-A+RS80p7MH=A@mail.gmail.com>
 <20140418125924.GF5904@bivouac.eciton.net>
 <CAL_JsqJTMWKh3gsv0TnRap82+7BM4XaT4ZAWkQmyfvzTqOq12g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJTMWKh3gsv0TnRap82+7BM4XaT4ZAWkQmyfvzTqOq12g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> > diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> > index 889005f..230c747 100644
> > --- a/drivers/of/Kconfig
> > +++ b/drivers/of/Kconfig
> > @@ -77,4 +77,7 @@ config OF_RESERVED_MEM
> >         help
> >           Helpers to allow for reservation of memory regions
> >
> > +config OF_MEMORY_AT_0_QUIRK
> > +       def_bool n
> 
> I do not like this because it would not scale to many quirks. As I
> said,, my preference here would be to just add a WARN.

I would very much like to be able to remove the quirk entirely for arm64
if possible, which would require more than the addition of a WARN.

> The other option is get approval to break compatibility on the ST
> platform. It may not be a concern on certain platforms.

Lee, would you be able to provide an answer either way so we can get
the discussion moving?

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
