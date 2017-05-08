From: jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and
 output-enable
Date: Mon, 8 May 2017 19:25:16 +0200
Message-ID: <20170508172516.GC25206@w540>
References: <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540>
 <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Andy,

On Mon, May 08, 2017 at 07:08:32PM +0300, Andy Shevchenko wrote:
> On Mon, May 8, 2017 at 7:01 PM, jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> > On Sun, May 07, 2017 at 09:52:49AM +0200, Linus Walleij wrote:
> >> On Fri, Apr 28, 2017 at 4:53 PM, Andy Shevchenko
> >> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >> > Linus, for me it looks like better to revert that change, until we
> >> > will have clear picture why existing configuration parameters can't
> >> > work.
> >>
> >> Yeah I'll revert the binding for fixes.
>
> > As it seems we won't be able to proceed with the currently proposed solution,
> > would that be acceptable now that we use the "pinmux" property to add
> > flags as BIDIR
>
> Can you explain what does this *electrically* mean?

I really don't know what to add to what Chris said in his 2 previous
replies to the same question, and I don't know if I can even get this
information as the most detailed drawing I can provide is what you
have seen already at page 2696 Fig. 54.1 of the following document.

https://www.renesas.com/en-us/doc/products/mpumcu/doc/rz/r01uh0403ej0300_rz_a1h.pdf?key=ccbb2d79446f1cbd015031061140507c

>From my perspective these flags are configurations internal to the pin
controller hardware used to enable/disable input buffers when a pin needs to
perform in both direction.
The level of detail I can provide on this is the logical diagram we have pointed
you to already.

As I assume you are trying to get this answer from us in order to
avoid duplicating things in pin controller sub-system, and I
understand this, but my question here was "can we have those flags as part
of the pinmux property argument list, as that property description
seems to allow us to do that, instead of making them generic pin
configuration properties and upset other developers?"

Anyway, I still fail to see why those configuration flags, only
affecting the way the pin controller hardware enables/disables
its internal buffers and its internal operations have to be
described in term of their externally visible electrically characteristics.

> Second question, what makes it differ to what already exists?

To me, what already exists are pin configuration properties generic to
the whole pin controller subsystem, and I understand you don't want to
see duplication there.

At the same time, to me, those flags are settings the pin controller
wants to have specified by software to overcome its hw design flaws,
and are intended to configure its internal buffers in a way it cannot
do by itself for some very specific operation modes (they are listed
in the hw reference manual, it's not something you can chose to
configure or not, if you want a pin working in i2c mode, you HAVE to
pass those flags to pin controller).

Thanks
   j

Edit: I see Chris have now replied as well so I leave the SWIO part
out, as his answer is already better than what I can give you.

>
> >  and SWIO_[INPUT|OUTPUT] directly there?
>
> Ditto.
>
> > This was my original proposal, rejected because we were using the "pins"
> > property at the time.
>
>
> --
> With Best Regards,
> Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
