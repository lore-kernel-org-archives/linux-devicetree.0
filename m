From: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Tue, 1 Sep 2015 15:19:44 -0700
Message-ID: <CAPiN7iWq0EN+Pph82MHvNKn2pUNEh3Vs4ymjMpdB212x2fq0sQ@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
	<20150828101227.GD31748@leverpostej>
	<CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
	<CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
	<20150831145500.GP12027@sirena.org.uk>
	<CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
	<20150831180140.GS12027@sirena.org.uk>
	<CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg@mail.gmail.com>
	<20150901201755.GZ5313@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150901201755.GZ5313-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 1, 2015 at 1:17 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> .......we have the application software act like drivers in
>> cases where high speed isn't required (such as GPIOs and switching
>> on/off power supplies).
>
> Yeah, so the power supplies bit is not something we want to encourage.

I agree with you (in almost all situations).

>> From what I see the standard kernel allows exposing GPIOs to userspace.
>> There are kernel calls to do so.  It seems to be recognized as an important
>> feature.  The standard kernel also has a regulator-consumer whose whole
>> purpose is to expose control of a regulator to userspace.  So it looks like
>> such userspace control is intended.
>
> At least in the case of regulators those are specifically for use in
> board file cases, they should never have direct DT bindings.

My understanding, is that we're trying very hard to avoid having any board
files, and that DT use was intended to facilitate getting away from them.
Perhaps my interpretation of the need to avoid board files is extreme?

>> ..... I'd like
>> to have a way to use the same kernel for all our boards, and have a
>> configuration that can be provided that will expose the required ones.
>
> So one thing you could do here is have your connector have a driver that
> handles what it knows about for the cases where that's useful and just
> punts everything else to userspace.  That way you don't need to actually
> write the kernel code for every last thing and can still punt to
> userspace but don't need to have a DT that represents the actual
> hardware.
>
> I don't know if other people think that makes sense though.

That's a very intriguing idea to me.  Let me see if I understand your
suggestion fully.

It would involve creating a kernel module (not really a driver, since
it doesn't actually control hardware) as well as modifications to the DT.

In the DT we'd create a hardware description of a connector, which
indicates all the signals, etc. that come to it.  Signals which are
connected to other devices and are thus fully described elsewhere
would simply be referenced.  Nothing new would happen with those
signals via DT and kernel module.

However, signals that are not described elsewhere could be qualified
in the DT as appropriate for the hardware connector.  For GPIO's that
could include direction, level, name, etc.  Since those signals aren't
mated internally with any other hardware they would automatically be
exposed to userspace.  The new kernel module would be responsible
for configuring the newly described hardware as well as doing the
exposing to userspace.

That sounds quite workable to me.  It might get more complicated
than I'd prefer, especially if there are more things than GPIOs (such
as ADCs, DACs, etc.) that might come to the connector previously
unconfigured.  But I think the idea is sound--and it keeps the DT in
the hardware rather than the userspace business, which is what we
want.  It also sounds like it might be broadly applicable, and have
interest far beyond me.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
