From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/3] Meson8 / Meson8b support for the meson_saradc driver
Date: Mon, 17 Apr 2017 20:28:17 +0200
Message-ID: <20170417182820.26670-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The SAR ADC register layout seems to be mostly the same on older SoCs.
Thus basically all functionality is already supported by the existing
driver.

There are two small differences though:
- the adc_clk and adc_div clock are not provided by the clock-controller
  on Meson8b. instead the SAR ADC provides an internal "adc_clk" (this
  behavior is already supported by the driver and requires no changes)
- the newer SoCs are using some register bits only the kernel or the
  BL30 (bootloader) are using the SAR ADC. This is the main change of
  this series: guarding all BL30 specific code with a corresponding
  "if"-block.

This also adds a new DT binding for the SAR ADC in Meson8 and Meson8b
because the driver has to specify (for this older version) that there's
no BL30 integration available (and these register bits should not be
touched).

Changes since v1 at [0]:
- switched to bool data-type for has_bl30_integration
- also added a "compatible" for Meson8 SoCs (the ADC driver from
  Amlogic's GPL kernel sources handles Meson8 and Meson8b identical)
- added patch #3 to constify some structs (there were supposed to be
  const from the very beginning)


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-March/003081.html


Martin Blumenstingl (3):
  Documentation: dt-bindings: iio: adc: add Meson8 and Meson8b support
  iio: adc: meson-saradc: add Meson8b SoC compatibility
  iio: adc: meson-saradc: mark all meson_sar_adc_data static and const

 .../bindings/iio/adc/amlogic,meson-saradc.txt      |  2 +
 drivers/iio/adc/meson_saradc.c                     | 86 +++++++++++++++-------
 2 files changed, 61 insertions(+), 27 deletions(-)

-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
