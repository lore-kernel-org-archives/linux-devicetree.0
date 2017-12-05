From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] eeprom: at25: Add DT support for EEPROMs with odd
 address bits
Date: Tue, 5 Dec 2017 09:57:58 +0100
Message-ID: <CAMuHMdUDPFhSwkHg2wm7yCNAfdUP8wAR9OXxbcu6SDhtZqe2+A@mail.gmail.com>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be>
 <1512048586-17534-2-git-send-email-geert+renesas@glider.be>
 <CAMuHMdWczQ0KiH7soGLKxX8CQEwxA=kVDc_saYqgytE2U_3WKw@mail.gmail.com> <20171204211705.543xjzvttbrt65pm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171204211705.543xjzvttbrt65pm@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Ivo Sieben <meltedpianoman@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Chris Wright <chrisw@sous-sol.org>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Dec 4, 2017 at 10:17 PM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Dec 04, 2017 at 10:17:47AM +0100, Geert Uytterhoeven wrote:
>> On Thu, Nov 30, 2017 at 2:29 PM, Geert Uytterhoeven
>> <geert+renesas@glider.be> wrote:
>> > Certain EEPROMS have a size that is larger than the number of address
>> > bytes would allow, and store the MSB of the address in bit 3 of the
>> > instruction byte.
>> >
>> > This can be described in platform data using EE_INSTR_BIT3_IS_ADDR, or
>> > in DT using the obsolete legacy "at25,addr-mode" property.
>> > But currently there exists no non-deprecated way to describe this in DT.
>> >
>> > Hence extend the existing "address-width" DT property to allow
>> > specifying 9, 17, or 25 address bits, and enable support for that in the
>> > driver.
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > ---
>> > EEPROMs using 9 address bits are common (e.g. M95040, 25AA040/25LC040).
>> > Do EEPROMs using 17 or 25 address bits, as mentioned in
>> > include/linux/spi/eeprom.h, really exist?
>> > Or should we just limit it to a single odd value (9 bits)?
>>
>> At least for the real Atmel parts, only the AT25040 part uses odd (8 +
>> 1 bit) addressing.
>
> Seems like we should have a specific compatible for it.

Possibly. But currently all configuration is done through DT properties, not
through matching on compatible values.

>> AT25M01 uses 3-byte addressing (it needs 17 bits).
>
> Do you need to know it is 17-bit vs. 24-bits? I'm guessing not as the
> unused bits are probably don't care.

The 17 bits can be derived from the EEPROM size in bytes (1 Mb = 128 KiB).
What is important to know is how to pass addresses to the device:
  1. 3 address bytes, OR
  2. 2 address bytes, and the odd MSB bit in the command byte.

But apparently the second scheme is not used for 17-bit addressing.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
