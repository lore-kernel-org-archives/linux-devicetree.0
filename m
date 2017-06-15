From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 00/10] add support for more devices on Meson8 and Meson8b
Date: Thu, 15 Jun 2017 23:33:42 +0200
Message-ID: <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170611101644.28581-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds:
- USB support on Meson8 and Meson8b (it seems that some boards show an
  error when trying to initialize one of the USB2 PHYs, but we have the
  same problem on some GXBB boards. it is working fine for me - on a board
  which is not supported upstream yet)
- hardware random number generator support (Meson8 and Meson8b seem to
  have two 32-bit hardware random number generator registers, while the
  GX SoCs only have one. This is not handled by the meson-rng driver yet,
  but that can still be improved later on)
- SAR ADC support
- add reserved memory zones to fix random hangs when filling the memory
  (currently only on Meson8 until I have a Meson8b device to test if the
  same problem appears there as well)
- use the real ethernet clock on Meson8 and Meson8b to fix ethernet when
  the bootloader does not enable the gate clock
- add the SCU (Snoop Control Unit) which is needed for SMP support
- minor preparations for further .dts updates as this already exports the
  SDIO clocks (a driver for this MMC controller is work-in-progress) as
  well as the corresponding pin definitions in meson8.dtsi
- this adds the pwm_e (typically used for the 32.768 kHz LPO clock for the
  SDIO wifi chip) and pwm_f (used on some boards for the dimmable power
  LED) pins to meson8.dtsi

NOTE: the .dts changes from this series depend on my previous patch from
[0]: "ARM: dts: meson8: fix the IR receiver pins"


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-June/003983.html


Changes since v1:
- dropped patches 1-5 which export various clock IDs as these are
  already applied by Jerome to clk-meson's next/headers branch
- added new patch "ARM: dts: meson: use C preprocessor friendly include
  syntax" so we can use preprocessor macros like GIC_SPI and
  IRQ_TYPE_EDGE_RISING in the SAR ADC and USB patches
- added new patch "ARM: dts: meson: use GIC_SPI and IRQ_TYPE_EDGE_RISING
  macros" so the GIC_SPI and IRQ_TYPE_EDGE_RISING preprocessor macros
  are available for the SAR ADC and USB patches (as a side-effect this
  also provides a nice cleanup)
- use GIC_SPI and IRQ_TYPE_EDGE_RISING instead of magic numbers in patch
  "ARM: dts: meson: add the SAR ADC" and "ARM: dts: meson: add USB
  support on Meson8 and Meson8b"
- added (currently unused) "amlogic,meson8-rng" and "amlogic,meson8b-rng"
  compatibles in "ARM: dts: meson: add the hardware random number
  generator"
- fixed node name (it's the memory region of the ARM Power Firmware,
  not the secure monitor firmware) and dropped node alias (of both
  reserved memory zones) in "ARM: dts: meson8: add reserved memory zones"
- added Neil's Reviewed-By


Martin Blumenstingl (10):
  ARM: dts: meson: use C preprocessor friendly include syntax
  ARM: dts: meson: use GIC_SPI and IRQ_TYPE_EDGE_RISING macros
  ARM: dts: meson8: add the PWM_E and PWM_F pins
  ARM: dts: meson8: add the pins for the SDIO controller
  ARM: dts: meson: add the SAR ADC
  ARM: dts: meson8: add reserved memory zones
  ARM: dts: meson: add the hardware random number generator
  ARM: dts: meson: add USB support on Meson8 and Meson8b
  ARM: dts: meson8b: add the SCU device node
  ARM: dts: meson: use the real ethernet clock on Meson8 and Meson8b

 arch/arm/boot/dts/meson.dtsi         |  75 +++++++++++++++++++----
 arch/arm/boot/dts/meson6-atv1200.dts |   2 +-
 arch/arm/boot/dts/meson6.dtsi        |   2 +-
 arch/arm/boot/dts/meson8.dtsi        | 112 ++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/meson8b.dtsi       |  50 ++++++++++++++++
 5 files changed, 226 insertions(+), 15 deletions(-)

-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
