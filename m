From: jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and
 output-enable
Date: Mon, 12 Jun 2017 11:44:24 +0200
Message-ID: <20170612094424.GG15739@w540>
References: <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540>
 <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAA+hA=Q9hwe7_xL440Reoi7z7m8-SScZ5E057419KSA7dQK=tQ@mail.gmail.com>
 <20170523183735.GC13664@w540>
 <CACRpkdYcaGzSvAN2Trqwer+8GbqXyfpE=VqiYcQvCOqhDO9MMw@mail.gmail.com>
 <20170529104229.GB21347@w540>
 <CAA+hA=T56WHugmA+5V5ZC6TTxeSUVt1hr0v53YuDsUYgBcvKTw@mail.gmail.com>
 <20170609075028.GE15739@w540>
 <CACRpkdZ=hNJLyV94FyRBSR3Dk8NLe-jEo3qbUKDya6ruqG3KNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ=hNJLyV94FyRBSR3Dk8NLe-jEo3qbUKDya6ruqG3KNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Sun, Jun 11, 2017 at 11:45:49PM +0200, Linus Walleij wrote:
> On Fri, Jun 9, 2017 at 9:50 AM, jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> > On Fri, Jun 09, 2017 at 03:26:57PM +0800, Dong Aisheng wrote:
>
> >> > I see three options here:
> >> >
> >> > 1) Add "output-buffer-enable" and "input-buffer-enable"
> >> > we end up with
> >> > "output-high"
> >> > "output-low"
> >> > "input-enable"
> >> > "output-buffer-enable"
> >> > "input-buffer-enable"
> >> >
> >> > 2) Add "output-buffer-enable" only
> >> > we end up with
> >> > "output-high"
> >> > "output-low"
> >> > "input-enable"
> >> > "output-buffer-enable"
> >> >
> >> > Binding may be confusing as in one case we use "output-buffer-enable"
> >> > while in the other "input-enable"
> >> >
> >> > 3) Add "output-enable" only
> >> > "output-high"
> >> > "output-low"
> >> > "input-enable"
> >> > "output-enable"
> >> >
> >> > As you, I don't like "output-enable" that much but it pairs better with
> >> > "input-enable".
> >> >
> >> > I'll let you and DT people decide on this, as it's really an ABI definition
> >> > problem and you have better judgment there.
> >> >
> >>
> >> What's the final decision of this?
> >
> > I admit a was buying a bit of time and post-poned the gentle ping for
> > any final word on this. But since you're asking I'll second your
> > question :)
>
> I suspect it is time to quote
> Documentation/process/management-style.rst
> (Torvalds):
>
> 1) Decisions
>
> Everybody thinks managers make decisions, and that decision-making is
> important.  The bigger and more painful the decision, the bigger the
> manager must be to make it.  That's very deep and obvious, but it's not
> actually true.
>
> The name of the game is to **avoid** having to make a decision.  In
> particular, if somebody tells you "choose (a) or (b), we really need you
> to decide on this", you're in trouble as a manager.  The people you
> manage had better know the details better than you, so if they come to
> you for a technical decision, you're screwed.  You're clearly not
> competent to make that decision for them.
>
> (It goes on, it's the best part of the entire Documentation/* dir in my
> opinion, please take the time to read it in full.)
>
> So: what do you guys, using this feature, and Andy, who raised serious
> concerns, think is the right binding? That is what *I* need to know.

Fair enough :)

I'll try to keep this short: I don't like "output-enable", and at the
same time I don't think "output-high" and "output-low" fit well for
this purpose, as they electrically means something different from what
our (and IMX) use case is: enabling/disabling input/output
buffers internal to pin controller/gpio block HW and not driving a value
there.

This seems clear to me from the "GPIO mode pitfalls" section of
pinctrl.txt documentation examples and from the fact that generic bindings
did not expose an "output" flag because if you drive an output line, you
reasonably either drive it high or low.

Unfortunately I cannot convince myself that the same reasons apply
to the input use case.  Enabling input on a pin implies the pinctrl/gpio driver
has to enable any input buffer required to use that pin as a properly
working input line, and enabling an input buffer implies being able to sense
the line value from there, so I don't see that much use for "input-buffer-enable"
alone.

So, even if bindings could look a bit weird as there won't be a direct
matching between properties names used to enable input/output buffers,
my vote is to add "output-buffer-enable" only, and keep using the
already there "input-enable" properties for the input use case.

Thanks
   j

>
> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
