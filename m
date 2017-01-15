From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 0/4] Amlogic Meson SAR ADC support
Date: Sun, 15 Jan 2017 23:42:17 +0100
Message-ID: <20170115224221.15510-1-martin.blumenstingl@googlemail.com>
References: <20170111174334.24343-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170111174334.24343-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add support for the SAR ADC on Amlogic Meson GXBB, GXL and
GXM SoCs.
The hardware on GXBB provides 10-bit ADC results, while GXL and GXM are
providing 12-bit results. Support for older SoCs (Meson8b and Meson8)
can be added with little effort, most of which is testing I guess (I
don't have any pre-GXBB hardware so I can't say).

A new set of clocks had to be added to the GXBB clock controller (used
by the GXBB/GXL/GXM SoCs) which are required to get the ADC working.

The ADC itself can sample multiple channels at the same time and allows
capturing multiple samples (which can be used for filtering/averaging).
The ADC results are stored inside a FIFO register. More details on what
the driver supports (or doesn't) can be found in the description of
patch #3.

The code is based on the public S805 (Meson8b) and S905 (GXBB)
datasheets, as well as by reading (various versions of) the vendor
driver and by inspecting the registers on the vendor kernels of my
testing-hardware.

Typical use-cases for the ADC on the Meson GX SoCs are:
- adc-keys ("ADC attached resistor ladder buttons")
- SoC temperature measurement (not supported by this driver yet as
  the system firmware does this already and provides the values via the
  SCPI protocol)
- "version-strapping" (different resistor values are used to indicate
  the board-revision)
- and of course typical ADC measurements

Thanks to Heiner Kallweit, Jonathan Cameron and Lars-Peter Clausen for
reviewing this series and providing valuable input!

Changes since v1 (all changes are for patch #3, except where noted):
- fix IRQ number in meson-gx.dtsi (thanks to Heiner Kallweit for
  providing the correct value), affects patch #4
- move the most used members of meson_saradc_priv to the beginning
- remove unused struct member "completion" from meson_saradc_priv
- use devm_kasprintf() instead of snprintf() + devm_kstrdup()
- initialize indio_dev->dev.parent earlier in meson_saradc_probe()
- moved meson_saradc_clear_fifo() logic to a separate function
- add comment why a do ... while loop is required in
  meson_saradc_wait_busy_clear()
- remove SAR_ADC_NUM_CHANNELS and SAR_ADC_VALUE_MASK macros (each of them
  was only used once and it's an unneeded level of abstraction)
- fixed multiline comment syntax violations
- dropped unneeded log messages during initialization
- set iio_dev name to "meson-gxbb-saradc" or "meson-gxl-saradc"
- use "indio_dev->dev.parent" in all kernel log calls (dev_warn/err/etc)
  to make it show the OF node name (instead of the iio device name)
- introduce struct meson_saradc_data to hold platform-specific
  information (such as resolution in bits and the iio_dev name)


Martin Blumenstingl (4):
  Documentation: dt-bindings: add the Amlogic Meson SAR ADC
    documentation
  clk: gxbb: add the SAR ADC clocks and expose them
  iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs
  ARM64: dts: meson: meson-gx: add the SAR ADC

 .../bindings/iio/adc/amlogic,meson-saradc.txt      |  31 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   8 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  10 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  10 +
 drivers/clk/meson/gxbb.c                           |  48 ++
 drivers/clk/meson/gxbb.h                           |   9 +-
 drivers/iio/adc/Kconfig                            |  12 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/meson_saradc.c                     | 893 +++++++++++++++++++++
 include/dt-bindings/clock/gxbb-clkc.h              |   4 +
 10 files changed, 1023 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
 create mode 100644 drivers/iio/adc/meson_saradc.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
