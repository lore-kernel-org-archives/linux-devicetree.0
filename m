From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC 0/3] of: add common bindings to (de)activate IEEE 802.11 bands
Date: Mon,  3 Oct 2016 00:50:56 +0200
Message-ID: <20161002225059.16757-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are at least two drivers (ath9k and mt76) out there, where
devicetree authors need to override the enabled bands.

For ath9k there is only one use-case: disabling a band which has been
incorrectly enabled by the vendor in the EEPROM (enabling a band is not
possible because the calibration data would be missing in the EEPROM).
The mt76 driver (currently pending for review) however allows enabling
and disabling the 2.4GHz and 5GHz band, see [0].

Based on the discussion of (earlier versions of) my ath9k devicetree
patch it was suggested [1] that we use enable- and disable- properties.
The current patch implements:
- bands can be enabled or disabled with the corresponding property
- if both (disable and enable) properties are given and a driver asks
  whether the band is enabled then the logic will return false (= not
  enabled, preferring the disabled flag)
- if both (disable and enable) properties are given and a driver asks
  whether the band is disabled then the logic will return true (again,
  preferring the disabled flag over the enabled flag)

We can still change the logic to do what the mt76 driver does (I am
fine with both solutions):
- property not available: driver decides which bands to enable
- property set to 0: disable the band
- property set to 1: enable the band

The new code has been integrated into ath9k to demonstrate how to use
it (with the benefit that the disable_2ghz and disable_5ghz settings
from the ath9k_platform_data can now also be configured via .dts).

open questions/decisions needed:
- where to place this new code? I put it into drivers/of/of_ieee80211
  because that's where most other functions live.
  However, I found that this makes backporting the code harder (using
  wireless-backports from the driver-backports project [2])
- we need a decision whether we want to go with two flags for each
  band (enable-ieee80211-band and disable-ieee80211-band) or if we
  prefer the solution from the mt76 driver (which means that the
  property for a band is absent for auto-detection, or
  ieee80211-band-enabled = <0/1> is specified. we could also move
  the 0 and 1 to a header file of course to make it easer to read,
  such as IEEE80211_BAND_ENABLED and IEEE80211_BAND_DISABLED)


[0] https://marc.info/?l=linux-wireless&m=147524754427890&w=2
[1] https://marc.info/?l=linux-wireless&m=147375173804817&w=2
[2] https://backports.wiki.kernel.org/index.php/Main_Page

Martin Blumenstingl (3):
  Documentation: dt-bindings: add IEEE 802.11 binding documentation
  of: add IEEE 802.11 device configuration support code
  ath9k: add OF configuration to disable the 2.4GHz or 5GHz band

 .../devicetree/bindings/net/wireless/ieee80211.txt | 12 ++++
 .../devicetree/bindings/net/wireless/qca,ath9k.txt |  2 +
 drivers/net/wireless/ath/ath9k/init.c              |  4 ++
 drivers/of/Kconfig                                 |  4 ++
 drivers/of/Makefile                                |  1 +
 drivers/of/of_ieee80211.c                          | 83 ++++++++++++++++++++++
 include/linux/of_ieee80211.h                       | 38 ++++++++++
 7 files changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ieee80211.txt
 create mode 100644 drivers/of/of_ieee80211.c
 create mode 100644 include/linux/of_ieee80211.h

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
