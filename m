From: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Mon, 31 Aug 2015 08:53:54 -0700
Message-ID: <CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
	<20150828101227.GD31748@leverpostej>
	<CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
	<CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
	<20150831145500.GP12027@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150831145500.GP12027-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 31, 2015 at 7:55 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> yet.  I would like to see the addition of exporting to the GPIO hogging
>> mechanism:
>> 1. A boolean to indicate the exporting the GPIO
>
> Why would this be appropriate?  Exporting a GPIO to userspace doesn't
> sound like a property of the hardware...

You're right.  It is not strictly hardware.  But I still need a place to specify
this attribute in a board-dependent way. I suppose you could think of an
end user as a hardware component (though we have soft parts too), then
you'd be specifying that hardware's access to the hardware via the
export flag.

>> For the regulator case, it looks like a hogging mechanism might be
>> appropriate.
>
> Do you mean something like the existing support for marking regulators
> as always enabled?

No.  I was assuming that the hogging mechanism would include the
exporting capability from GPIOs.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
