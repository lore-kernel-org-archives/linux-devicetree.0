From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 5/5] ath9k: Make EEPROM endianness swapping configurable
 via devicetree
Date: Mon, 29 Aug 2016 21:45:38 +0200
Message-ID: <CAFBinCCSBE8KsLgP3t=FzB-2jgjfQBtuF+EjqQEk-7mmmps_Pg@mail.gmail.com>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
 <2303906.Xe1WvCfP0V@wuerfel> <CAFBinCCK4zG7QXENpCgEr9wUgzinfr1ugEm3HepjE6c3RDqtVg@mail.gmail.com>
 <201608291410.44338.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201608291410.44338.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: nbd-Vt+b4OUoWG0@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 2:10 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> Without patch 4 from this series the EEPROM data is loaded like this:
>> 1. out of tree code extracts the EEPROM data from NOR/SPI/NAND flash
>> 2. board specific entry (usually device-tree) tells the code to apply
>> swab16 to the data
>> 3. board specific entry (usually device-tree again) sets the
>> "endian_check" property in the ath9k_platform_data to true
>> 4.a ath9k sees that the magic bytes are not matching and applies swab16
>> 4.b while doing that it notifies the EEPROM format specific swapping
>>
>> However, with patch 4 from this series steps 4.a and 4.b are replaced with:
>> 4. ath9k checks the eepMisc field of the EEPROM and applies the EEPROM
>> format specific swapping
>
> I think the intention of the patch is right, but it needs to go further:
> It seems wrong to have 'u32' members e.g. in
>
> struct modal_eep_ar9287_header {
>         u32 antCtrlChain[AR9287_MAX_CHAINS];
>         u32 antCtrlCommon;
>
> and then do a swab32() on them. I suspect these should just be __le32
> (and __le16, respectively where needed), using appropriate accessors
> everywhere that those fields are being read instead of having one function
> that tries to turn them into cpu-native ordering.
I'm not sure if we want those fields to be __le32:
BIT(0) in the eepMisc field indicates whether to interpret the data as
big or little endian.
When this bit is set we would want these fields to be __be32 instead -
so I guess the current implementation is "OK" for this specific
use-case.

> If we can manage to convert the code into doing this consistently,
> maybe only the 16-bit swaps of the data stream are left over.
 we don't need the 16bit swap anymore - at least on the lantiq devices
that I know (not sure about other platforms / devices though).


Martin
