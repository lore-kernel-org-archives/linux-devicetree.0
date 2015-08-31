From: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Mon, 31 Aug 2015 07:30:24 -0700
Message-ID: <CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
	<20150828101227.GD31748@leverpostej>
	<CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 29, 2015 at 5:09 AM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> If I properly understood what Chris wants, he may want to have a look
> at the following works:
>
> - GPIO hogging mechanism to configure a GPIO using the device tree -
> not sure if you can also export at that time?
> - Markus' ongoing work on GPIO naming:
> http://www.spinics.net/lists/linux-gpio/msg07844.html
> - Device tree overlays, to separate the configuration of GPIOs for
> user-space use (which is arguably specific to one's use case) from the
> rest of the board's definition
>
> With these 3 works I think Chris' needs would be fulfilled, at least
> as far as GPIOs are concerned.

Thanks for the pointers, Alexandre.  I think that these are right down
the line of what I think is required.  Much of the work seems already
done.  As you mention, though, exporting doesn't seem to be supported
yet.  I would like to see the addition of exporting to the GPIO hogging
mechanism:
1. A boolean to indicate the exporting the GPIO
2. A boolean to indicate whether the GPIO can be reconfigured
     (i.e. direction-may-change)

For the regulator case, it looks like a hogging mechanism might be
appropriate.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
