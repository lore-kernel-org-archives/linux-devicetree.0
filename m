From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/3] eeprom: at25: Add DT support for EEPROMs with odd
 address bits
Date: Tue, 5 Dec 2017 10:09:11 +0100
Message-ID: <CAMuHMdWFzUbZ-wcyZmLEXcnFQ+RJBnkrxW+B0ie9cR=1LPtsgw@mail.gmail.com>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be>
 <1512048586-17534-2-git-send-email-geert+renesas@glider.be>
 <CAMuHMdWczQ0KiH7soGLKxX8CQEwxA=kVDc_saYqgytE2U_3WKw@mail.gmail.com>
 <20171204211705.543xjzvttbrt65pm@rob-hp-laptop> <CAMuHMdUDPFhSwkHg2wm7yCNAfdUP8wAR9OXxbcu6SDhtZqe2+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUDPFhSwkHg2wm7yCNAfdUP8wAR9OXxbcu6SDhtZqe2+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ivo Sieben <meltedpianoman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chris Wright <chrisw-69jw2NvuJkxg9hUCZPvPmw@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Dec 5, 2017 at 9:57 AM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> On Mon, Dec 4, 2017 at 10:17 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, Dec 04, 2017 at 10:17:47AM +0100, Geert Uytterhoeven wrote:
>>> On Thu, Nov 30, 2017 at 2:29 PM, Geert Uytterhoeven
>>> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
>>> > Certain EEPROMS have a size that is larger than the number of address
>>> > bytes would allow, and store the MSB of the address in bit 3 of the
>>> > instruction byte.
>>> >
>>> > This can be described in platform data using EE_INSTR_BIT3_IS_ADDR, or
>>> > in DT using the obsolete legacy "at25,addr-mode" property.
>>> > But currently there exists no non-deprecated way to describe this in DT.
>>> >
>>> > Hence extend the existing "address-width" DT property to allow
>>> > specifying 9, 17, or 25 address bits, and enable support for that in the
>>> > driver.
>>> >
>>> > Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>> > ---
>>> > EEPROMs using 9 address bits are common (e.g. M95040, 25AA040/25LC040).
>>> > Do EEPROMs using 17 or 25 address bits, as mentioned in
>>> > include/linux/spi/eeprom.h, really exist?
>>> > Or should we just limit it to a single odd value (9 bits)?
>>>
>>> At least for the real Atmel parts, only the AT25040 part uses odd (8 +
>>> 1 bit) addressing.
>>
>> Seems like we should have a specific compatible for it.
>
> Possibly. But currently all configuration is done through DT properties, not
> through matching on compatible values.

Adding compatible values for all known/used parts could quickly become a
large table.
E.g. Atmel/Microchip has 3 variants of 512-byte EEPROMs: AT25040B,
25LC040A, and 25AA040A. The former uses an 8-byte pagesize, while the
latter parts use 16-byte pagesizes.
Not to mention "compatible" parts from other manufacturers, and all other
supported size.

Currently all of this is configured through the "pagesize", "size", and
"address-width" DT properties, with matching on generic "atmel,at25".

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
