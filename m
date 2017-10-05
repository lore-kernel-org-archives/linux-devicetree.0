From: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: dts: gr-peach: Reduce extal_clk resolution
Date: Thu, 5 Oct 2017 09:48:59 +0200
Message-ID: <20171005074859.GN4037@w540>
References: <1507131657-6414-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdXOJ6V_p26ozzwzUh5a9mvH-Aeiz2MavEf22v3iB6GiKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXOJ6V_p26ozzwzUh5a9mvH-Aeiz2MavEf22v3iB6GiKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert

On Wed, Oct 04, 2017 at 05:54:46PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Wed, Oct 4, 2017 at 5:40 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> > The system clock described by extal_clk is reported to have a frequency
> > of 13.333 Mhz and is correctly described by gr-peach device tree.
> >
> > However, when enabling a RIIC device the following error is reported by
> > drivers/i2c/busses/i2c-riic.c
> >
> > "invalid parent clk (33332500). Must be 33325000Hz"
> >
> > As RIIC devices have a clock source obtained by dividing by 12 the
> > system clock, the resulting value is not accepted by the driver
> > (which clearly states not to support any frequency except the reported
> > 33325000Hz one).
> >
> > Hence, reduce the system clock accuracy to a value which makes
> > frequencies obtained through division accepted by RIIC driver.
> >
> > Please note that other r7s72100 boards, such as Genmai, report the same
> > "reduced accuracy" frequency, even if their external clock sources are
> > effectively 13.333Mhz as gr-peach one.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
>
> There's no need to do this, Chris already proposed a fix, cfr.
> "[PATCH v2] i2c: riic: remove fixed clock restriction"
> (https://www.spinics.net/lists/linux-renesas-soc/msg18573.html).

Oh that's even better!
Do you see any value in augmenting the frequency resolution in Genmai
DTS then?

Thanks
  j

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
