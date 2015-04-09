From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: Question about shared interrupts in devicetree
Date: Thu, 9 Apr 2015 19:02:44 +0200 (CEST)
Message-ID: <619385522.136300.1428598965058.JavaMail.open-xchange@oxbaltgw02.schlund.de>
References: <2039290448.1160624.1428183613109.JavaMail.open-xchange@oxbaltgw03.schlund.de> <20150407112928.GA3812@leverpostej> <2146749411.2111.1428426398346.JavaMail.open-xchange@oxbaltgw03.schlund.de> <CAMuHMdUaQTotvzRiGczyVxfeu34UNLMmwU=aVGTP6rDSHUK45Q@mail.gmail.com> <55262935.9080005@i2se.com> <CAMuHMdXpByUO4S_Qdhvbm8PF8hfGTtqr7aA9mmRE5Dk6LrZkJw@mail.gmail.com>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXpByUO4S_Qdhvbm8PF8hfGTtqr7aA9mmRE5Dk6LrZkJw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernelnewbies <kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?=22Marek_Va=C5=A1ut=22?= <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> hat am 9. April 2015 um 09:37
> geschrieben:
>
> [...]
> 
> >
> > Could you please explain the benefit / reason of this approach?
>
> Since you have different logical modules in the subsystem, this allows to
> model
> the subsystem as separate modules and a separate interrupt controller, and
> have separate drivers for all modules.
>
> Look at da9063 for an example (there are more according to "git grep irq_chip
> -- drivers/mfd", but not all of them may have DT bindings).
>

thanks for the hint, but this makes my patch series not really smaller. I
invested a lot of time (started in September 2014) and i want to submit at least
1 of the 3 drivers soon as possible.

I think the best approch would be to submit my series with option B as a
proposal. In the discussion about the patch it would be easier to decide if a
interrupt controller is really necessary.

> Gr{oetje,eeting}s,
>
> Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like
> that.
> -- Linus Torvalds

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
