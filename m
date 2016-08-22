From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/5] ath9k: Set the "big endian" bit of the AR9003 EEPROM templates
Date: Mon, 22 Aug 2016 22:31:28 +0200
Message-ID: <CAFBinCB0BVCi1cG=w_05MGj3ASyB9wXT37=yANaLdvmzB=AfYw@mail.gmail.com>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
 <3744898.ltfZjZgAjj@wuerfel> <CAFBinCBdv9poKwjsDeGue30x0B9aUjxdkb5BHZcBgouOMAGWMQ@mail.gmail.com>
 <14216135.Y4g7Oly61q@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <14216135.Y4g7Oly61q@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 5:31 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday, August 22, 2016 1:56:46 PM CEST Martin Blumenstingl wrote:
>> On Mon, Aug 22, 2016 at 1:47 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > On Sunday, August 21, 2016 4:49:03 PM CEST Martin Blumenstingl wrote:
>> >> We will default to the system's native endianness for the eepmisc value.
>> >> This may be overwritten by the actual calibration data. If it is not
>> >> overwritten we interpret the template data in it's native endianness,
>> >> meaning that no swapping is required.
>> >
>> > I'm still skeptical about this one. What is the significance of "native
>> > endianess" here? You are keying the endianess of the eeprom tables off the
>> > way the CPU operates, but for a PCI device there is no correlation between
>> > those two.
>> (the ar9003 eeprom format and handling is different compared to 9287,
>> def and 4k)
>> ar9003_eeprom.c contains EEPROM templates -> these are compiled into
>> the ath9k kernel module. Values from these templates can be
>> overwritten by the EEPROM found on the actual hardware.
>> This change tries to handle the case where the values in the hardware
>> EEPROM do not override any of the template values (means final EEPROM
>> data = template data). In this case the we can simply rely on the
>> endianness which was used to compile ath9k.ko.
>
> Ok, I see what you mean now. However, looking at the source now, I
> also see
>
> #define LE16(x) cpu_to_le16(x)
> #define LE32(x) cpu_to_le32(x)
>         .baseEepHeader = {
>                 .regDmn = { LE16(0), LE16(0x1f) },
>
> suggesting that the fields are meant to be little-endian in object
> code, and your patch does not change that. In fact, Felix's
> ffdc4cbe5b17 ("ath9k_hw: clean up EEPROM endian handling on AR9003")
> seems to have corrected this already.
oh, I totally missed that - thanks for the hint!
This means that eepMisc should be 0 (indicates little endian) in all
cases (it had this value, but the code was not explicit about it).

so please ignore this patch for now, it might cause more harm than good.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
