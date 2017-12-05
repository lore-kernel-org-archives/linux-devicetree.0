From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 0/3] eeprom: at25: Add DT support for 25lc040
Date: Tue, 5 Dec 2017 10:04:21 +0100
Message-ID: <CAMuHMdXUWXxQr5T6AnSDecZ6VMKpU46aBQpT3FCuuhvgpP3zhA@mail.gmail.com>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be> <20171204212215.f5dqiei6eqk6d7de@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204212215.f5dqiei6eqk6d7de@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ivo Sieben <meltedpianoman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Wright <chrisw-69jw2NvuJkxg9hUCZPvPmw@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Dec 4, 2017 at 10:22 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Nov 30, 2017 at 02:29:43PM +0100, Geert Uytterhoeven wrote:
>> Some "atmel,at25" compatible SPI EEPROMs (e.g. Microchip 25lc040) use an
>> odd number of address bits.  This patch series adds support for
>> instantiating such devices from DT.
>>
>> Do EEPROMs using 17 or 25 address bits, as mentioned in
>> include/linux/spi/eeprom.h, really exist?
>> Or should we just limit it to a single odd value (9 bits)?
>>
>> This has been tested with a bunch of 25lc040 EEPROMs.
>>
>> Thanks!
>>
>> Geert Uytterhoeven (3):
>>   eeprom: at25: Add DT support for EEPROMs with odd address bits
>>   dt-bindings: eeprom: at25: Grammar s/are can/can/
>>   dt-bindings: eeprom: at25: Document device-specific compatible values
>
> 2 and 3 are fixes and I'll apply for 4.15 if you don't mind.

Thanks, I don't mind.

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
