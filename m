From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 0/5] Add EXTI GPIO trigger support to STM32 ADC
Date: Mon, 30 Jan 2017 15:33:55 +0100
Message-ID: <1485786840-4557-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

STM32 ADC, can use GPIOs configured as EXTI line (external interrupt)
as trigger source for conversions.
This patchset is based on latest IIO testing branch, and adds support
for EXTi GPIO triggers in IIO.
It also adds a dt option to configure default trigger polarity in
STM32 ADC driver.

---
Changes in V2:
- Fixed Kconfig dependencies

Fabrice Gasnier (5):
  Documentation: dt: iio: document stm32 adc trigger polarity
  iio: adc: stm32: add dt option to set default trigger polarity
  Documentation: dt: iio: document stm32 exti trigger
  iio: trigger: add support for STM32 EXTI triggers
  iio: adc: stm32: add exti gpio trigger source

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |   3 +
 .../bindings/iio/trigger/st,stm32-exti-trigger.txt |  17 +++
 drivers/iio/adc/stm32-adc.c                        |  14 +++
 drivers/iio/trigger/Kconfig                        |  11 ++
 drivers/iio/trigger/Makefile                       |   1 +
 drivers/iio/trigger/stm32-exti-trigger.c           | 124 +++++++++++++++++++++
 include/linux/iio/trigger/stm32-exti-trigger.h     |  26 +++++
 7 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
 create mode 100644 drivers/iio/trigger/stm32-exti-trigger.c
 create mode 100644 include/linux/iio/trigger/stm32-exti-trigger.h

-- 
1.9.1
