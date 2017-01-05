From: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: [PATCHv3 0/8] Add support for STM32 RTC
Date: Thu, 5 Jan 2017 14:43:21 +0100
Message-ID: <1483623809-29937-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v3:
- rework set_alarm
- return platform_get_irq error code instead of -ENOENT

v2:
- remove clock-names and interrupt-names from bindings
- remove unuseful headers
- clean stm32_rtc structure
- replace stm32_rtc_readl/_writel by readl/writel_relaxed
- use threaded IRQ
- rework set_alarm
- add various comments
- select COMPILE_TEST and REGMAP_MMIO

This patchset adds support for the STM32 Real-Time Clock.
This RTC is an independent BCD timer/counter and provides a time-of-day
clock/calendar with programmable alarm interrupt.
RTC calendar can be driven by three clock sources LSE, LSI or HSE.

Amelie Delaunay (8):
  ARM: dts: stm32: set HSE_RTC clock frequency to 1 MHz on stm32f429
  dt-bindings: document the STM32 RTC bindings
  rtc: add STM32 RTC driver
  ARM: dts: stm32: Add RTC support for STM32F429 MCU
  ARM: dts: stm32: enable RTC on stm32f429-disco
  ARM: dts: stm32: enable RTC on stm32f469-disco
  ARM: dts: stm32: enable RTC on stm32429i-eval
  ARM: configs: stm32: Add RTC support in STM32 defconfig

 .../devicetree/bindings/rtc/st,stm32-rtc.txt       |  27 +
 arch/arm/boot/dts/stm32429i-eval.dts               |   4 +
 arch/arm/boot/dts/stm32f429-disco.dts              |   6 +
 arch/arm/boot/dts/stm32f429.dtsi                   |  16 +
 arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
 arch/arm/configs/stm32_defconfig                   |   2 +
 drivers/rtc/Kconfig                                |  11 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-stm32.c                            | 776 +++++++++++++++++++++
 9 files changed, 847 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
 create mode 100644 drivers/rtc/rtc-stm32.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
