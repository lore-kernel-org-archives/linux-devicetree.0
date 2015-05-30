From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] clk: stm32: Add clock driver for STM32F4[23]xxx devices
Date: Sat, 30 May 2015 08:54:04 +0100
Message-ID: <1432972448-10332-1-git-send-email-daniel.thompson@linaro.org>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432327273-6810-1-git-send-email-daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset implements a clock driver for STM32F42xxx and STM32F43xxx
series devices. It supports decoding the state configured by the
bootloader (PLL, clock select, bus dividers) and all the gates clocks.
It does not currently support the I2S and SAI PLLs.

Relies on "Add support to STMicroeletronics STM32 family" v9 by Maxime
Coquelin: http://thread.gmane.org/gmane.linux.kernel/1961049 .

For completeness I've also included a small config patch I needed to
get my board to boot once I had rebased. I suspect Maxime may have the
same patch tucked away somewhere :-).

v2:
 * Move the HSE crystal frequency to stm32f429-disco.dts (was
   prevsiously in stm32f429.dtsi)
 * Fixed compiler warning that I overlooked the first time round.
 * Removed dead code in the .dtsi file.
 * Rebased on linux-next+v9 from Maxime.


Daniel Thompson (4):
  ARM: stm32: Enable clock source
  dt-bindings: Document the STM32F4 clock bindings
  clk: stm32: Add clock driver for STM32F4[23]xxx devices
  ARM: dts: stm32f429: Adopt STM32F4 clock driver

 .../devicetree/bindings/clock/st,stm32-rcc.txt     |  65 ++++
 arch/arm/Kconfig                                   |   1 +
 arch/arm/boot/dts/stm32f429-disco.dts              |   4 +
 arch/arm/boot/dts/stm32f429.dtsi                   |  79 ++---
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-stm32f4.c                          | 364 +++++++++++++++++++++
 6 files changed, 459 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 drivers/clk/clk-stm32f4.c

--
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
