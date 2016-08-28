From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 5/5] ath9k: Make EEPROM endianness swapping configurable
 via devicetree
Date: Sun, 28 Aug 2016 23:10:21 +0200
Message-ID: <CAFBinCCK4zG7QXENpCgEr9wUgzinfr1ugEm3HepjE6c3RDqtVg@mail.gmail.com>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
 <20160821144906.30984-6-martin.blumenstingl@googlemail.com> <2303906.Xe1WvCfP0V@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2303906.Xe1WvCfP0V@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, nbd-Vt+b4OUoWG0@public.gmane.org
Cc: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 1:52 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday, August 21, 2016 4:49:06 PM CEST Martin Blumenstingl wrote:
>> +- qca,check-eeprom-endianness: When enabled, the driver checks if the
>> +                               endianness of the EEPROM (using two checks,
>> +                               one is based on the two magic bytes at the
>> +                               start of the EEPROM and a second one which
>> +                               relies on a flag within the EEPROM data)
>> +                               matches the host system's native endianness.
>> +                               The data will be swapped accordingly if there
>> +                               is a mismatch.
>> +                               Leaving this disabled means that the EEPROM
>> +                               data will always be interpreted in the
>> +                               system's native endianness.
>> +                               Enable this option only when the EEPROMs
>> +                               endianness identifiers are known to be
>> +                               correct, because otherwise the EEPROM data
>> +                               may be swapped and thus interpreted
>> +                               incorrectly.
>
> The property should not describe the driver behavior, but instead
> describe what the hardware is like.
>
> A default of "system's native endianess" should not be specified
> in a binding, as the same DTB can be used with both big-endian or
> little-endian kernels on some architectures (ARM and PowerPC among
> others), so disabling the property means that it is guaranteed to
> be broken on one of the two.
OK, I went back to have a separate look at the whole issue again.
Let's recap, there are two types of swapping:
1. swab16 for the whole EEPROM data
2. EEPROM format specific swapping (for all u16 and u32 values)

Actually I am not 100% sure what #1 exists. In OpenWrt and LEDE it's
only used by the brcm63xx and lantiq targets (I personally have only
lantiq based devices, so that's what I can test with).
Without patch 4 from this series the EEPROM data is loaded like this:
1. out of tree code extracts the EEPROM data from NOR/SPI/NAND flash
2. board specific entry (usually device-tree) tells the code to apply
swab16 to the data
3. board specific entry (usually device-tree again) sets the
"endian_check" property in the ath9k_platform_data to true
4.a ath9k sees that the magic bytes are not matching and applies swab16
4.b while doing that it notifies the EEPROM format specific swapping

However, with patch 4 from this series steps 4.a and 4.b are replaced with:
4. ath9k checks the eepMisc field of the EEPROM and applies the EEPROM
format specific swapping

Currently this code is still guarded by a check whether swapping is
enabled or not.
However, FreeBSD uses the same check but has no guarding if-clause for it.

TL;DR: if we remove if (ah->ah_flags & AH_NO_EEP_SWAP) from patch 4 we
don't need an extra device-tree property.

The question is how we can test this properly:
I can test this on the boards I own (3 in total) - but I don't think
that this is enough.
Maybe we can test this together with some LEDE people - this should
get us test-coverage for embedded devices.
I'm open to more/better suggestions


Regards,
Martin
