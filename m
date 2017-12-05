From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] eeprom: at25: Add DT support for EEPROMs with odd
 address bits
Date: Tue, 5 Dec 2017 15:01:39 +0100
Message-ID: <CAMuHMdWiQnbDva=_JjqKvmXj=mB_80W0fZbYXVZe-ansHi2txA@mail.gmail.com>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be>
 <1512048586-17534-2-git-send-email-geert+renesas@glider.be>
 <CAMuHMdWczQ0KiH7soGLKxX8CQEwxA=kVDc_saYqgytE2U_3WKw@mail.gmail.com>
 <20171204211705.543xjzvttbrt65pm@rob-hp-laptop> <CAMuHMdUDPFhSwkHg2wm7yCNAfdUP8wAR9OXxbcu6SDhtZqe2+A@mail.gmail.com>
 <CAMuHMdWFzUbZ-wcyZmLEXcnFQ+RJBnkrxW+B0ie9cR=1LPtsgw@mail.gmail.com> <CAL_Jsq+-w=bbSN1LvRy7G9Dtc=7-C+CiyQnrtZkMLK23S98P9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+-w=bbSN1LvRy7G9Dtc=7-C+CiyQnrtZkMLK23S98P9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Ivo Sieben <meltedpianoman@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Chris Wright <chrisw@sous-sol.org>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Dec 5, 2017 at 2:56 PM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Dec 5, 2017 at 3:09 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Tue, Dec 5, 2017 at 9:57 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Mon, Dec 4, 2017 at 10:17 PM, Rob Herring <robh@kernel.org> wrote:
>>>> On Mon, Dec 04, 2017 at 10:17:47AM +0100, Geert Uytterhoeven wrote:
>>>>> On Thu, Nov 30, 2017 at 2:29 PM, Geert Uytterhoeven
>>>>> <geert+renesas@glider.be> wrote:
>>>>> > Certain EEPROMS have a size that is larger than the number of address
>>>>> > bytes would allow, and store the MSB of the address in bit 3 of the
>>>>> > instruction byte.
>>>>> >
>>>>> > This can be described in platform data using EE_INSTR_BIT3_IS_ADDR, or
>>>>> > in DT using the obsolete legacy "at25,addr-mode" property.
>>>>> > But currently there exists no non-deprecated way to describe this in DT.
>>>>> >
>>>>> > Hence extend the existing "address-width" DT property to allow
>>>>> > specifying 9, 17, or 25 address bits, and enable support for that in the
>>>>> > driver.
>>>>> >
>>>>> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> > ---
>>>>> > EEPROMs using 9 address bits are common (e.g. M95040, 25AA040/25LC040).
>>>>> > Do EEPROMs using 17 or 25 address bits, as mentioned in
>>>>> > include/linux/spi/eeprom.h, really exist?
>>>>> > Or should we just limit it to a single odd value (9 bits)?
>>>>>
>>>>> At least for the real Atmel parts, only the AT25040 part uses odd (8 +
>>>>> 1 bit) addressing.
>>>>
>>>> Seems like we should have a specific compatible for it.
>>>
>>> Possibly. But currently all configuration is done through DT properties, not
>>> through matching on compatible values.
>>
>> Adding compatible values for all known/used parts could quickly become a
>> large table.
>> E.g. Atmel/Microchip has 3 variants of 512-byte EEPROMs: AT25040B,
>> 25LC040A, and 25AA040A. The former uses an 8-byte pagesize, while the
>> latter parts use 16-byte pagesizes.
>> Not to mention "compatible" parts from other manufacturers, and all other
>> supported size.
>>
>> Currently all of this is configured through the "pagesize", "size", and
>> "address-width" DT properties, with matching on generic "atmel,at25".
>
> I wasn't suggesting throwing out all these. Just add a compatible for
> the one oddball 9-bit part.
>
> But I'm fine adding address-width=9 too.

OK. Then I'll go for the least intrusive solution (address-width=9).
These EEPROMs are fairly small and simple, and I can imagine them being
used on small systems too, so driver code/data size matters.

Stay tuned for v2.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
