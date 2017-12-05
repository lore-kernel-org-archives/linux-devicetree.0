From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] eeprom: at25: Add DT support for EEPROMs with odd
 address bits
Date: Tue, 5 Dec 2017 09:59:10 +0100
Message-ID: <CAMuHMdU15AAUTN+GUBv6M2=0=hkaQ6Xb=WpRTtS6kcxShBZ6eg@mail.gmail.com>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be>
 <1512048586-17534-2-git-send-email-geert+renesas@glider.be>
 <CAMuHMdWczQ0KiH7soGLKxX8CQEwxA=kVDc_saYqgytE2U_3WKw@mail.gmail.com> <CAMSQXEFsooRytoJaZXwEvQnJQtFVMUtgaN2t2=Y1Jir=WNee1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMSQXEFsooRytoJaZXwEvQnJQtFVMUtgaN2t2=Y1Jir=WNee1g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivo Sieben <meltedpianoman@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Wright <chrisw@sous-sol.org>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Ivo,

On Mon, Dec 4, 2017 at 11:00 PM, Ivo Sieben <meltedpianoman@gmail.com> wrote:
> 2017-12-04 10:17 GMT+01:00 Geert Uytterhoeven <geert@linux-m68k.org>:
>>> EEPROMs using 9 address bits are common (e.g. M95040, 25AA040/25LC040).
>>> Do EEPROMs using 17 or 25 address bits, as mentioned in
>>> include/linux/spi/eeprom.h, really exist?
>>> Or should we just limit it to a single odd value (9 bits)?
>>
>> At least for the real Atmel parts, only the AT25040 part uses odd (8 +
>> 1 bit) addressing.
>> AT25M01 uses 3-byte addressing (it needs 17 bits).
>>
>> So I tend to believe EEPROMs using 16 + 1  or 24 + 1 address bits (with the
>> extra bit in the instruction byte) do not exist?
>>
>
> I think you are right. Most likely this extra address bit option is
> only used for 9 bit addressable chips.
> I'm not an expert, but I know only the M95040 chip for which I
> originally wrote the patch.
> By then I decided to make it a bit broader (so also to be used as
> address 17 & 25 bit addressing) but that might
> not make any sense indeed.
>
>>> @@ -6,7 +6,9 @@ Required properties:
>>>  - spi-max-frequency : max spi frequency to use
>>>  - pagesize : size of the eeprom page
>>>  - size : total eeprom size in bytes
>>> -- address-width : number of address bits (one of 8, 16, or 24)
>>> +- address-width : number of address bits (one of 8, 9, 16, 17, 24, or 25).
>>> +  For odd values, the MSB of the address is sent as bit 3 of the instruction
>>> +  byte, before the address byte(s).
>>
>> Alternatively, we can drop the binding change, i.e. keep on using
>> address-width = <8> for 512-byte '040...
>>
>
> As you also stated before: maybe it is more clear to leave only the
> "9" value option documented
> here, that looks to me the only valid use case for it.

OK.

>
>>> +               if (val & 1) {
>>> +                       chip->flags |= EE_INSTR_BIT3_IS_ADDR;
>>> +                       val -= 1;
>>> +               }
>>
>> ... and handle it here like:
>>
>>         if (chip->byte_len == 2U << val)
>>                 chip->flags |= EE_INSTR_BIT3_IS_ADDR;
>>
>> However, that would IMHO be a bit confusing, as the "address-width"
>> property is no longer the real address width, but indicates how many bits
>> are specified in address bytes sent after the read/write command.
>> So "address-bytes" = 1, 2, or 3 would be more correct ;-)
>>
>> Or deprecate this whole "specify parameters using DT properties" business,
>> and derive them from the compatible value. But that would mean adding a
>> large and ever growing table to an old driver...
>>
>> Thoughts?
>
> I'm not a DT expert but to me your first proposal makes the most sense
> to me and feels the most intuitive:
> I would go for the address-with value 9 option here.

OK.

> Since we only expect value 9 to be a valid option, maybe you could
> rewrite it a bit to explicitly check for value 9:
>
> if (val == 9) {
>         chip->flags |= EE_INSTR_BIT3_IS_ADDR;
>         val -= 1;
> }
>
> I think this is slightly more readable.

Sure.

> Hope this helps,

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
