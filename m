From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: [PATCH v2 0/4] Add support for NXP LPC18xx EEPROM using nvmem
Date: Mon, 19 Oct 2015 14:32:22 -0300
Message-ID: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for NXP LPC18xx EEPROM memory found in
NXP LPC185x/3x and LPC435x/3x/2x/1x devices.

This patchset is based on tag next-20151019 of the linux-next
repository. It has been successfully tested on a LPC4337 CIAA-NXP
Board.

EEPROM notes:
------------

EEPROM size is 16384 bytes and it can be entirely read and 
written/erased with 1 word (4 bytes) granularity. The last page
(128 bytes) contains the EEPROM initialization data and is not writable.

Erase/program time is less than 3ms. The EEPROM device requires a
~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated dividing
the system bus clock by the division factor, contained in the divider
register (minus 1 encoded).

Changeset:
---------
v1 -> v2:
* Moved dt-bindings to be the first patch.
* Changed compatible name from lpc1850 to lpc1857 as the former doesn't have EEPROM.
* Fix hardware description which contained SoCs models without EEPROM.
* Disabled fast_io and changed mdelay for msleep in regmap writes.
* Replaced BUG_ON() in write function for an -EINVAL return.
* Add patches for defconfig and devicetree files.

Thanks,

Ariel D'Alessandro (4):
  DT: nvmem: Add NXP LPC18xx EEPROM memory binding documentation
  nvmem: NXP LPC18xx EEPROM memory NVMEM driver
  ARM: dts: lpc18xx: add EEPROM memory node
  ARM: configs: lpc18xx: enable EEPROM NVMEM driver

 .../devicetree/bindings/nvmem/lpc1857-eeprom.txt   |  26 ++
 arch/arm/boot/dts/lpc18xx.dtsi                     |  12 +
 arch/arm/configs/lpc18xx_defconfig                 |   2 +
 drivers/nvmem/Kconfig                              |   9 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/lpc18xx_eeprom.c                     | 266 +++++++++++++++++++++
 6 files changed, 317 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
 create mode 100644 drivers/nvmem/lpc18xx_eeprom.c

-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
