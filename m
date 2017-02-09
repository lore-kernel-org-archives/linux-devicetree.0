From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 12/13] dt-bindings: auxdisplay: Add bindings for Hitachi HD44780
Date: Thu, 9 Feb 2017 09:51:57 +0100
Message-ID: <CAMuHMdV7B1jKZBV0iw80sH=t6h93jJ6myB3O9pV7vMKaOt-bxw@mail.gmail.com>
References: <1486391895-9554-1-git-send-email-geert@linux-m68k.org>
 <1486391895-9554-13-git-send-email-geert@linux-m68k.org> <20170209011130.t63w45ud55332uhy@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170209011130.t63w45ud55332uhy@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Feb 9, 2017 at 2:11 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Feb 06, 2017 at 03:38:14PM +0100, Geert Uytterhoeven wrote:
>> Add DT bindings for an Hitachi HD44780 Character LCD Controller where
>> its M6800 bus interface is connected to GPIOs.
>
> Really, you should have a bit-bang M6800 bus driver and binding and then
> the binding for the LCD ctrl looks the same whether you are bit-banging
> it or not.

I thought about that, but turned it down due to the required complexity
for the little gain. And I think it would complicate memory mapped
configurations (see below), which would have to use regmap instead of readb()
and friends.

> That's a bit more work though. Maybe you could split the binding like
> this, but keep a monolithic driver for now. The driver can just fetch
> the GPIOs from the parent (bus controller) node. And you'd have to work
> out probing the driver.

Ugh...

>> Memory-mapped configurations are not yet supported.
>
> I guess this would require faulting on some address and then bit-banging
> the access. That sounds fun...

I meant connecting it to the processor bus instead of GPIOs, so the HD44780
registers become memory mapped.
That can be handled fairly easily by allowing a "reg" property as an
alternative to the data/enable/rw-gpios.

The only complication is that the M6800 bus has a single strobe (enable)
signal, and requires the rw signal to be valid before, while e.g. Intel CPUs
have separate read and write strobes. Usually people handle that by wiring\
rw to an address line, and thus using separate addresses for read and write.

I didn't add support for memory-mapped configurations as I can't test it
(without more hardware hacking ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
