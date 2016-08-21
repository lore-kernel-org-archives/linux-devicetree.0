From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/5] ath9k: EEPROM swapping improvements
Date: Sun, 21 Aug 2016 16:49:01 +0200
Message-ID: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are two types of swapping the EEPROM data in the ath9k driver.
Before this series one type of swapping could not be used without the
other.

The first type of swapping looks at the "magic bytes" at the start of
the EEPROM data and performs swab16 on the EEPROM contents if needed.
The second type of swapping is EEPROM format specific and swaps
specific fields within the EEPROM itself (swab16, swab32 - depends on
the EEPROM format).

With this series the second part now looks at the EEPMISC register
inside the EEPROM, which uses a bit to indicate if the EEPROM data
is Big Endian (this is also done by the FreeBSD kernel).
This has a nice advantage: currently there are some out-of-tree hacks
(in OpenWrt and LEDE) where the EEPROM has a Big Endian header on a
Big Endian system (= no swab16 is performed) but the EEPROM itself
indicates that it's data is Little Endian. Until now the out-of-tree
code simply did a swab16 before passing the data to ath9k, so ath9k
first did the swab16 - this also enabled the format specific swapping.
These out-of-tree hacks are still working with the new logic, but it
is recommended to remove them.

The last patch in this series allows enabling the EEPROM endianness
swapping via devicetree. This should be fine now since it addresses
the concerns raised by Arnd Bergmann in in the original OF support
patches: [0].

This series depends on my other series (V5):
"add devicetree support to ath9k" - see [1]


[0] http://www.spinics.net/lists/linux-wireless/msg152634.html
[1] https://marc.info/?l=linux-wireless&m=147178988827847&w=2


Martin Blumenstingl (5):
  ath9k: Add a #define for the EEPROM "eepmisc" endianness bit
  ath9k: Set the "big endian" bit of the AR9003 EEPROM templates
  ath9k: Add an eeprom_ops callback for retrieving the eepmisc value
  ath9k: Make the EEPROM swapping check use the eepmisc register
  ath9k: Make EEPROM endianness swapping configurable via devicetree

 .../devicetree/bindings/net/wireless/qca,ath9k.txt | 16 ++++++
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.c     | 21 +++++---
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.h     |  7 ++-
 drivers/net/wireless/ath/ath9k/eeprom.c            | 57 ++++++++++++++++------
 drivers/net/wireless/ath/ath9k/eeprom.h            |  5 +-
 drivers/net/wireless/ath/ath9k/eeprom_4k.c         | 10 +++-
 drivers/net/wireless/ath/ath9k/eeprom_9287.c       | 10 +++-
 drivers/net/wireless/ath/ath9k/eeprom_def.c        | 10 +++-
 drivers/net/wireless/ath/ath9k/init.c              |  6 ++-
 9 files changed, 110 insertions(+), 32 deletions(-)

-- 
2.9.3
