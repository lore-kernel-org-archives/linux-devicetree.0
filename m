From: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Tue, 22 Sep 2015 06:37:46 -0700
Message-ID: <CAPiN7iWBpZxGazGeLQ2Sqq05EZDPYTVcgSbzj=mbEJHjXB4yxA@mail.gmail.com>
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
	<CACRpkdaUZ93t7BdAMhiS0m3wSGP_VaBQdU05ZK_AaHmHyCCKRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaUZ93t7BdAMhiS0m3wSGP_VaBQdU05ZK_AaHmHyCCKRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 21, 2015 at 4:51 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> That sounds quite workable to me.  It might get more complicated
>> than I'd prefer, especially if there are more things than GPIOs (such
>> as ADCs, DACs, etc.)
>
> What do you mean by this? We have in-kernel support for ADC and
> DAC, see drivers/iio/[adc|dac] and these have excellent userspace
> interfaces.

That statement was made regarding adding a "connector" component
into the DT, which would describe a hardware connector in the system.
The connector component would allow describing what came to it, and
in the above discussion was specifically to allow configuring GPIOs in
the DT that otherwise would not have a component to connect to, and
thus would not be able to be exported to userspace in the DT.

My "(such as...)" comment was indicating that other components than
just GPIOs might be included in the connector, and hence there might
be some implications there.  Would there be initialization or dependencies
that would have to be handled?  I don't know, but my thought at the time
was that it might get complicated.

Thanks for asking,

Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
