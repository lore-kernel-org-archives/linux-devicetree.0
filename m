From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/3] Documentation: dt: net: add ath9k wireless device binding
Date: Mon, 11 Jul 2016 00:01:05 +0200
Message-ID: <1877260.9mAQ7eY9me@wuerfel>
References: <20160624123430.4097-1-martin.blumenstingl@googlemail.com> <1746957.vJhcHQMZVi@wuerfel> <CAFBinCBbzMM0Pz8s444YE+NSN+035+o8PtNBoUn4v8yPMzG9Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCBbzMM0Pz8s444YE+NSN+035+o8PtNBoUn4v8yPMzG9Mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday, July 10, 2016 10:54:50 PM CEST Martin Blumenstingl wrote:
> On Sun, Jul 10, 2016 at 10:52 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Sunday, July 10, 2016 1:28:32 AM CEST Martin Blumenstingl wrote:
> >> +- qca,check-eeprom-endianness: When enabled, the driver checks if the
> >> +                               endianness of the EEPROM (based on the two
> >> +                               magic bytes at the start of the EEPROM)
> >> +                               matches the host system's native endianness.
> >> +                               The data will be swapped accordingly if there
> >> +                               is a mismatch.
> >> +                               Leaving this disabled means that the EEPROM
> >> +                               data will be interpreted in the system's
> >> +                               native endianness, regardless of the magic
> >> +                               bytes.
> >> +                               Enable this option only when the magic bytes
> >> +                               are known to indicate the correct endianness
> >> +                               of the EEPROM data, because otherwise the
> >> +                               EEPROM data may be swapped and thus may be
> >> +                               parsed incorrectly.
> >
> > Defining properties in terms of "native" endianess is usually not a good
> > idea, as some architectures (ARMv6+, PowerPC, ...) allow running either
> > big-endian or little-endian without changing the endianess of device
> > registers in the process.
> >
> > It's better to document the property as defaulting to a specific endianess
> > unless you have an override or the autodetection flag, regardless of
> > the CPU endianess.
> ath9k reads the data from the EEPROM into memory. With that property
> disabled ath9k simply assumes that the endianness of the values in the
> EEPROM are having the correct endianness for the host system (in other
> words: no swap is being applied).
> I am not sure I understand you correctly, but isn't what you are
> explaining an issue in the ath9k code, rather than in this
> documentation?

I looked at the code more to find that out now, but I'm more confused
now, as the eeprom seems to be read as a byte stream, and the endianess
conversion that the driver performs is not on the data values in it,
but seems to instead swap the bytes in each 16-bit word, regardless
of the contents (the values inside of the byte stream are always
interpreted as big-endian). Is that a correct observation?

What I see in ath_pci_eeprom_read() is that the 16-bit words are taken
from the lower 16 bit of the little-endian AR_EEPROM_STATUS_DATA
register. As this is coming from a PCI register, it must have a device
specific endianess that is identical on all CPUs, so in the description
above, mentioning CPU endianess is a bit confusing. I could not find
the code that does the conditional byteswap, instead this function

static bool ar9300_eeprom_read_byte(struct ath_hw *ah, int address,
                                    u8 *buffer)
{
        u16 val;

        if (unlikely(!ath9k_hw_nvram_read(ah, address / 2, &val)))
                return false;

        *buffer = (val >> (8 * (address % 2))) & 0xff;
        return true;
}

evidently assumes that the lower 8 bit of the 16-bit data from PCI
come first, i.e. it byteswaps on big-endian CPUs to get the bytestream
back into the order in which it is stored in the EEPROM.

Interestingly, this also seems to happen for ath_ahb_eeprom_read()
even though on that one the value does not get swapped by the bus
accessor, so presumably big-endian machines with a ahb based ath9k
store their eeprom byte-reversed?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
