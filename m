From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: at91: allow disabled gpio controllers
Date: Wed, 3 Dec 2014 16:08:15 +0100
Message-ID: <20141203150814.GD2714@ldesroches-Latitude-E6320>
References: <1417193367-12422-1-git-send-email-ludovic.desroches@atmel.com>
 <CACRpkdbXuXyfwAyFTHVDGa4OS88KsHXZeDDAeXf6ZJ_JQmduoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbXuXyfwAyFTHVDGa4OS88KsHXZeDDAeXf6ZJ_JQmduoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 01, 2014 at 02:56:22PM +0100, Linus Walleij wrote:
> On Fri, Nov 28, 2014 at 5:49 PM, Ludovic Desroches
> <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> 
> > This patch allows to have gpio controller with status set to disabled.
> >
> > gpio_banks represents all the gpio banks available on the device whereas
> > nbanks represents the gpio banks used. Having a disabled gpio controller
> > involves that nbanks value is lower than gpio_banks and that some
> > pointers in the gpio_chips array are NULL. This patch deals with these
> > specific cases.
> >
> > Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> 
> (...)
> >         /* We will handle a range of GPIO pins */
> > -       for (i = 0; i < info->nbanks; i++)
> > -               pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
> > +       for (i = 0; i < gpio_banks; i++)
> > +               if (gpio_chips[i])
> > +                       pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
> 
> I highly suspect the real solution to this problem is to get rid
> of the pinctrl_add_gpio_range() call from the driver.
> 
> Remobe these calls, and instead in at91_gpio_probe() in the same
> file, call gpiochip_add_pingroup_range() for each GPIO chip.
> 
> That way the GPIO ranges are inserted from the GPIO side instead
> of the pinctrl side, which is way better, since it is more relative,
> and make you only add ranges for the gpio chips actually there.

I had a quick look to Documentation about that stuff, I totally agree
that it is a better approach. Before going further I was wondering if it
would not cause backward compatibility issue with old dtb (it seems I'll
have to add some properties to gpio controllers).

Regards

Ludovic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
