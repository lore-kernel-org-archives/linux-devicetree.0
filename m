From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Sat, 29 Aug 2015 21:09:48 +0900
Message-ID: <CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com> <20150828101227.GD31748@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150828101227.GD31748@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chris R <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>> Similarly, I'd like to be able to signal the export of a GPIO to userspace
>> (/sys/class/gpio/gpioWXY) without a customized board file.  Since we're
>> using DT to specify the hardware in a system, it would be a convenient place
>> to specify exporting GPIOs to userspace.
>
> I believe that the GPIO subsystem maintainers (Linus Walleij and
> Alexandre Courbot) were trying to make GPIO control from userspace more
> consistent (independent of DT) for a while. However I am not all that
> familiar with the GPIO subsystem and may have misunderstood some of the
> work that's going on there.

If I properly understood what Chris wants, he may want to have a look
at the following works:

- GPIO hogging mechanism to configure a GPIO using the device tree -
not sure if you can also export at that time?
- Markus' ongoing work on GPIO naming:
http://www.spinics.net/lists/linux-gpio/msg07844.html
- Device tree overlays, to separate the configuration of GPIOs for
user-space use (which is arguably specific to one's use case) from the
rest of the board's definition

With these 3 works I think Chris' needs would be fulfilled, at least
as far as GPIOs are concerned.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
