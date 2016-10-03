From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/3] of: add common bindings to (de)activate IEEE 802.11 bands
Date: Mon, 3 Oct 2016 10:22:36 -0500
Message-ID: <CAL_Jsq+cie=enhUYBF-OSrMdQ5S_048JF31ghEjtBNAmkGbB9Q@mail.gmail.com>
References: <20161002225059.16757-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161002225059.16757-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 2, 2016 at 5:50 PM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> There are at least two drivers (ath9k and mt76) out there, where
> devicetree authors need to override the enabled bands.
>
> For ath9k there is only one use-case: disabling a band which has been
> incorrectly enabled by the vendor in the EEPROM (enabling a band is not
> possible because the calibration data would be missing in the EEPROM).
> The mt76 driver (currently pending for review) however allows enabling
> and disabling the 2.4GHz and 5GHz band, see [0].
>
> Based on the discussion of (earlier versions of) my ath9k devicetree
> patch it was suggested [1] that we use enable- and disable- properties.
> The current patch implements:
> - bands can be enabled or disabled with the corresponding property
> - if both (disable and enable) properties are given and a driver asks
>   whether the band is enabled then the logic will return false (= not
>   enabled, preferring the disabled flag)
> - if both (disable and enable) properties are given and a driver asks
>   whether the band is disabled then the logic will return true (again,
>   preferring the disabled flag over the enabled flag)
>
> We can still change the logic to do what the mt76 driver does (I am
> fine with both solutions):
> - property not available: driver decides which bands to enable
> - property set to 0: disable the band
> - property set to 1: enable the band

I prefer this way. Really, I'd prefer just a boolean disable property.
I'm not sure why you need the enable. We usually have these tri-state
properties when you want not present to mean use the bootloader or
default setting. Try to make not present the most common case.

> The new code has been integrated into ath9k to demonstrate how to use
> it (with the benefit that the disable_2ghz and disable_5ghz settings
> from the ath9k_platform_data can now also be configured via .dts).
>
> open questions/decisions needed:
> - where to place this new code? I put it into drivers/of/of_ieee80211
>   because that's where most other functions live.
>   However, I found that this makes backporting the code harder (using
>   wireless-backports from the driver-backports project [2])

We are generally moving subsystem specific code like this out of
drivers/of/, so please do that here. Maybe someone will get motivated
to move the other networking code out too.

> - we need a decision whether we want to go with two flags for each
>   band (enable-ieee80211-band and disable-ieee80211-band) or if we
>   prefer the solution from the mt76 driver (which means that the
>   property for a band is absent for auto-detection, or
>   ieee80211-band-enabled = <0/1> is specified. we could also move
>   the 0 and 1 to a header file of course to make it easer to read,
>   such as IEEE80211_BAND_ENABLED and IEEE80211_BAND_DISABLED)

Please don't add defines for this. 0/1 meaning false/true is clear enough IMO.

Rob
