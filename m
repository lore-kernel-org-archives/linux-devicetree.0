From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 0/6] Add support for STM32 ADC
Date: Thu, 10 Nov 2016 17:18:52 +0100
Message-ID: <1478794738-28933-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds support for STM32F4 ADC into IIO framework.
STM32F4 ADC is a 12-bit successive approximation analog-to-digital
converter with multiplexed input channels. Conversions can
be performed in single, continuous, scan or discontinuous mode.
Conversions can be launched in software or using hardware triggers.

This driver has been developed and tested on STM32F429 eval board.
It consist of a MFD core driver, to manage common resources shared
between up to 3 ADC instances.

Changes in v2:
- Replace single driver model by MFD approach, to handle up to 3 ADCs
  as separate devices. Each ADC device then registers a unique IIO
  device.
- Make driver as simple as possible for the first instance, to ease
  review. For now, I dropped complexity by removing injected support,
  triggered buffer mode, dmas.
- Removed abstraction layer (indirection routines, ops) as only stm32f4
  is supported.

Fabrice Gasnier (6):
  Documentation: dt-bindings: Document STM32 ADC DT bindings
  mfd: stm32-adc: Add support for stm32 ADC
  iio: adc: Add support for STM32 ADC
  ARM: configs: stm32: enable ADC driver
  ARM: dts: stm32f429: Add adc support
  ARM: dts: stm32f429: enable adc on eval board

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  85 ++++
 arch/arm/boot/dts/stm32429i-eval.dts               |  25 +
 arch/arm/boot/dts/stm32f429.dtsi                   |  49 ++
 arch/arm/configs/stm32_defconfig                   |   3 +
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/stm32-adc.c                        | 525 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  14 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/stm32-adc-core.c                       | 301 ++++++++++++
 include/linux/mfd/stm32-adc-core.h                 |  52 ++
 11 files changed, 1066 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
 create mode 100644 drivers/iio/adc/stm32-adc.c
 create mode 100644 drivers/mfd/stm32-adc-core.c
 create mode 100644 include/linux/mfd/stm32-adc-core.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
