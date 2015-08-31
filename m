From: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Mon, 31 Aug 2015 12:20:20 -0700
Message-ID: <CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
	<20150828101227.GD31748@leverpostej>
	<CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
	<CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
	<20150831145500.GP12027@sirena.org.uk>
	<CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
	<20150831180140.GS12027@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150831180140.GS12027-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 31, 2015 at 11:01 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> You're right.  It is not strictly hardware.  But I still need a place to specify
>> this attribute in a board-dependent way. I suppose you could think of an
>> end user as a hardware component (though we have soft parts too), then
>> you'd be specifying that hardware's access to the hardware via the
>> export flag.
>
> That doesn't really hang together - it's nothing to do with the hardware
> that this is what you want to do, someone might decide to connect an
> expansion board which would most usefully be controlled by in kernel
> drivers to exactly the same base hardware.

Yes.  That is what we do.  We make custom boards for our main Arm
CPU board.  However, rather than create a new kernel driver for every
variant of hardware, we have the application software act like drivers in
cases where high speed isn't required (such as GPIOs and switching
on/off power supplies).

> So when you say "hogging" what you actually mean to say is "userspace
> control"?  Please be clear in what you are saying,
Sorry, I was unaware that it has a precise meaning.  (And I hadn't
followed its evolution in the kernel.)

> We really need people working on these maker devices to recognise that
> Linux is a general purpose OS used on a wide ranging systems and that as
> a result we need to explicitly describe things like expansion ports in
> the DT rather than just hacking the system.  We don't want people making
> routers and similar devices to form the impression that the simple and
> idiomatic way to extend Linux is to just hack things from userspace.

I want to follow the standard paradigms and elegance of the mainline
kernel.  I don't want to create a set of hacks to do what we require, just
use standard kernel mechanisms and drivers.  I also don't want to have
to create custom drivers for every single board we create.  Nor do I want
to have a "board file" to initialize every board.

>From what I see the standard kernel allows exposing GPIOs to userspace.
There are kernel calls to do so.  It seems to be recognized as an important
feature.  The standard kernel also has a regulator-consumer whose whole
purpose is to expose control of a regulator to userspace.  So it looks like
such userspace control is intended.

My concern is that, while these features are appropriate to expose in
userspace, I can't expose them using what are now the standard ways
(i.e. without a board file or customized driver for each board).  I'd like
to have a way to use the same kernel for all our boards, and have a
configuration that can be provided that will expose the required ones.

It may be possible to make it a set of kernel command line parameters,
which would then be customized for each board.  There are, no doubt,
still other ways to accomplish this board-specific customization.
However, since there is already a board-specific mechanism to do
kernel driver/module configuration (i.e. DT), it seemed like a good idea
to piggy-back on it.

Obviously exporting to userspace isn't a hardware configuration
parameter, but the mechanism of hooking up and configuring drivers
that DT uses looks to me like the most efficient way implement this.

- Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
