From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Mon, 21 Sep 2015 16:51:26 -0700
Message-ID: <CACRpkdaUZ93t7BdAMhiS0m3wSGP_VaBQdU05ZK_AaHmHyCCKRQ@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
	<20150828101227.GD31748@leverpostej>
	<CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
	<CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
	<20150831145500.GP12027@sirena.org.uk>
	<CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
	<20150831180140.GS12027@sirena.org.uk>
	<CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg@mail.gmail.com>
	<20150901201755.GZ5313@sirena.org.uk>
	<CAPiN7iWq0EN+Pph82MHvNKn2pUNEh3Vs4ymjMpdB212x2fq0sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPiN7iWq0EN+Pph82MHvNKn2pUNEh3Vs4ymjMpdB212x2fq0sQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 1, 2015 at 3:19 PM, Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> That sounds quite workable to me.  It might get more complicated
> than I'd prefer, especially if there are more things than GPIOs (such
> as ADCs, DACs, etc.)

What do you mean by this? We have in-kernel support for ADC and
DAC, see drivers/iio/[adc|dac] and these have excellent userspace
interfaces.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
