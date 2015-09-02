From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Wed, 2 Sep 2015 21:29:57 +0900
Message-ID: <CAAVeFuJsM_gDNHNqSRi2iHNAzMHAiw0-y5V1pRce4SD8OgY11Q@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com> <20150828101227.GD31748@leverpostej>
 <CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
 <CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
 <20150831145500.GP12027@sirena.org.uk> <CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
 <20150831180140.GS12027@sirena.org.uk> <CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 1, 2015 at 4:20 AM, Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From what I see the standard kernel allows exposing GPIOs to userspace.
> There are kernel calls to do so.  It seems to be recognized as an important
> feature.  The standard kernel also has a regulator-consumer whose whole
> purpose is to expose control of a regulator to userspace.  So it looks like
> such userspace control is intended.
>
> My concern is that, while these features are appropriate to expose in
> userspace, I can't expose them using what are now the standard ways
> (i.e. without a board file or customized driver for each board).  I'd like
> to have a way to use the same kernel for all our boards, and have a
> configuration that can be provided that will expose the required ones.
>
> It may be possible to make it a set of kernel command line parameters,
> which would then be customized for each board.  There are, no doubt,
> still other ways to accomplish this board-specific customization.
> However, since there is already a board-specific mechanism to do
> kernel driver/module configuration (i.e. DT), it seemed like a good idea
> to piggy-back on it.
>
> Obviously exporting to userspace isn't a hardware configuration
> parameter, but the mechanism of hooking up and configuring drivers
> that DT uses looks to me like the most efficient way implement this.

Since the GPIO sysfs allows you to request any GPIO that is not
claimed by a kernel driver from userspace, is there a reason why you
cannot simply run board-specific init scripts that request and
configure the GPIOs you need? Once GPIO naming is merged, this should
be as elegant as it gets for what you want to do.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
