From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [RFC 0/3] of: add common bindings to (de)activate IEEE 802.11
 bands
Date: Wed, 5 Oct 2016 20:36:27 +0200
Message-ID: <23f49efe-ddef-ea16-00de-7477e4872d82@nbd.name>
References: <20161002225059.16757-1-martin.blumenstingl@googlemail.com>
 <CAL_Jsq+cie=enhUYBF-OSrMdQ5S_048JF31ghEjtBNAmkGbB9Q@mail.gmail.com>
 <CAFBinCCDjZs6szRw0D1rwB89tUo+-RNFH2_g=K+Xj2iRJuUZDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCCDjZs6szRw0D1rwB89tUo+-RNFH2_g=K+Xj2iRJuUZDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016-10-05 20:25, Martin Blumenstingl wrote:
> On Mon, Oct 3, 2016 at 5:22 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Sun, Oct 2, 2016 at 5:50 PM, Martin Blumenstingl
>> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> There are at least two drivers (ath9k and mt76) out there, where
>>> devicetree authors need to override the enabled bands.
>>>
>>> For ath9k there is only one use-case: disabling a band which has been
>>> incorrectly enabled by the vendor in the EEPROM (enabling a band is not
>>> possible because the calibration data would be missing in the EEPROM).
>>> The mt76 driver (currently pending for review) however allows enabling
>>> and disabling the 2.4GHz and 5GHz band, see [0].
>>>
>>> Based on the discussion of (earlier versions of) my ath9k devicetree
>>> patch it was suggested [1] that we use enable- and disable- properties.
>>> The current patch implements:
>>> - bands can be enabled or disabled with the corresponding property
>>> - if both (disable and enable) properties are given and a driver asks
>>>   whether the band is enabled then the logic will return false (= not
>>>   enabled, preferring the disabled flag)
>>> - if both (disable and enable) properties are given and a driver asks
>>>   whether the band is disabled then the logic will return true (again,
>>>   preferring the disabled flag over the enabled flag)
>>>
>>> We can still change the logic to do what the mt76 driver does (I am
>>> fine with both solutions):
>>> - property not available: driver decides which bands to enable
>>> - property set to 0: disable the band
>>> - property set to 1: enable the band
>>
>> I prefer this way. Really, I'd prefer just a boolean disable property.
>> I'm not sure why you need the enable. We usually have these tri-state
>> properties when you want not present to mean use the bootloader or
>> default setting. Try to make not present the most common case.
> Felix: could you please give a few details why mt76 can not only
> disable but also enable a specific band?
> There is no specific comment in the sources [0] why this is needed.
> All other drivers that I am aware of (ath9k, rt2x00) only allow
> disabling a specific band, they never enable it (this has to be done
> explicitly by the EEPROM).
None of the devices use it at the moment, I probably added it when I
played with a device that had broken EEPROM data. I guess I decided to
do it this way because on many devices the band capability field simply
cannot be trusted.
I guess I would be okay with just having a disable property and adding
an enable property later only if we end up actually needing it.

- Felix

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
