From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: [RFC PATCH 0/3] clk: stm32: Add clock driver for STM32F4[23]xxx devices
Date: Fri, 22 May 2015 21:41:10 +0100
Message-ID: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kamil Lulko <rev13@wp.pl>, Andreas Farber <afaerber@suse.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

This patchset implements a clock driver for STM32F42xxx and STM32F43xxx
series devices.

There are a few small caveats at the present:

 1. Relies on "Add support to STMicroeletronics STM32 family", v8 by
    Maxime Coquelin:
    http://thread.gmane.org/gmane.linux.kernel.cross-arch/27569

 2. Allocating ~80 clock components appears to fragment memory enough
    to prevent busybox (.text is ~300K, non-XIP) from running getty.
    I have to use "init=/bin/sh" to avoid OOM problems.

 3. Support for I2S and SAI is not included in this patchset.

Daniel Thompson (3):
  dt-bindings: Document the STM32F4 clock bindings
  clk: stm32: Add clock driver for STM32F4[23]xxx devices
  ARM: dts: stm32f429: Adopt STM32F4 clock driver

 .../devicetree/bindings/clock/st,stm32-rcc.txt     |  65 ++++
 arch/arm/boot/dts/stm32f429.dtsi                   |  83 ++---
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-stm32f4.c                          | 365 +++++++++++++++++++++
 4 files changed, 457 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 drivers/clk/clk-stm32f4.c

--
2.1.0
