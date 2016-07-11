From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v4 1/3] Documentation: dt: net: add ath9k wireless device binding
Date: Mon, 11 Jul 2016 23:21:26 +0200
Message-ID: <CAFBinCBYmpBVph9vmWcPT512o2ObgmYn4naS2cTrpL61q6u1xw@mail.gmail.com>
References: <20160624123430.4097-1-martin.blumenstingl@googlemail.com>
 <1746957.vJhcHQMZVi@wuerfel> <CAFBinCBbzMM0Pz8s444YE+NSN+035+o8PtNBoUn4v8yPMzG9Mw@mail.gmail.com>
 <1877260.9mAQ7eY9me@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1877260.9mAQ7eY9me@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 11, 2016 at 12:01 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> ath9k reads the data from the EEPROM into memory. With that property
>> disabled ath9k simply assumes that the endianness of the values in the
>> EEPROM are having the correct endianness for the host system (in other
>> words: no swap is being applied).
>> I am not sure I understand you correctly, but isn't what you are
>> explaining an issue in the ath9k code, rather than in this
>> documentation?
>
> I looked at the code more to find that out now, but I'm more confused
> now, as the eeprom seems to be read as a byte stream, and the endianess
> conversion that the driver performs is not on the data values in it,
> but seems to instead swap the bytes in each 16-bit word, regardless
> of the contents (the values inside of the byte stream are always
> interpreted as big-endian). Is that a correct observation?
that seems to be the case for the ar9003 eeprom. Other implementations
are doing it different, look at ath9k_hw_ar9287_check_eeprom for
example: first ath9k_hw_nvram_swap_data checks the two magic bytes at
the beginning of the data and swaps the bytes in each 16-bit word if
the magic bytes don't match the magic bytes for the "native system
endianness" (see AR5416_EEPROM_MAGIC). Then more swapping is applied.
I asked for more details about the EEPROM format (specifically the
endianness part) here [0] as I don't have access to the datasheets
(all I have is the ath9k code)

> What I see in ath_pci_eeprom_read() is that the 16-bit words are taken
> from the lower 16 bit of the little-endian AR_EEPROM_STATUS_DATA
> register. As this is coming from a PCI register, it must have a device
> specific endianess that is identical on all CPUs, so in the description
> above, mentioning CPU endianess is a bit confusing. I could not find
> the code that does the conditional byteswap, instead this function
>
> static bool ar9300_eeprom_read_byte(struct ath_hw *ah, int address,
>                                     u8 *buffer)
> {
>         u16 val;
>
>         if (unlikely(!ath9k_hw_nvram_read(ah, address / 2, &val)))
>                 return false;
>
>         *buffer = (val >> (8 * (address % 2))) & 0xff;
>         return true;
> }
>
> evidently assumes that the lower 8 bit of the 16-bit data from PCI
> come first, i.e. it byteswaps on big-endian CPUs to get the bytestream
> back into the order in which it is stored in the EEPROM.
Please have a look at the ath9k_hw_nvram_swap_data function and
eeprom_ops.check_eeprom (for example ath9k_hw_ar9287_check_eeprom).
These are performing the conditional swapping (in addition to whatever
previous swapping there was).
The basic code works like this: read the full EEPROM data into memory
(either from PCI bus, ath9k_platform_data or request_firmware), then
eeprom_ops.check_eeprom will call ath9k_hw_nvram_swap_data for 16-bit
word swapping and afterwards the check_eeprom implementation will doe
further swapping.
Apart from that your findings seem correct (at least this is identical
to how I would interpret the code).

> Interestingly, this also seems to happen for ath_ahb_eeprom_read()
> even though on that one the value does not get swapped by the bus
> accessor, so presumably big-endian machines with a ahb based ath9k
> store their eeprom byte-reversed?
on AHB the eeprom data has to be provided via ath9k_platform_data /
request_firmware mechanism. Thus there is no bus specific swapping,
only the ath9k_hw_nvram_swap_data / eeprom_ops.check_eeprom swapping
is applied in this case.


[0] http://thread.gmane.org/gmane.linux.kernel.wireless.general/153569
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
