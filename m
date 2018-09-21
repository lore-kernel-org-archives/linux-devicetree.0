From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/4] Add clock support for Hi3670 SoC
Date: Thu, 20 Sep 2018 23:00:59 -0700
Message-ID: <20180921060103.21370-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, xuwei5@hisilicon.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-clk@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

This patchset adds clock support for Hi3670 SoC from HiSilicon utilizing
the HiSi common clock code. While adding clock support, let's remove the
fixed clock for UART and source SoC clock on HiKey970 board.

This patchset has been verified on HiKey970 board.

Thanks,
Mani

Manivannan Sadhasivam (4):
  dt-bindings: clk: hisilicon: Add bindings for Hi3670 clk
  arm64: dts: hisilicon: Add clock nodes for Hi3670 SoC
  arm64: dts: hisilicon: Source SoC clock for UART6
  clk: hisilicon: Add clock driver for Hi3670 SoC

 .../bindings/clock/hi3670-clock.txt           |   43 +
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   48 +-
 drivers/clk/hisilicon/Kconfig                 |    7 +
 drivers/clk/hisilicon/Makefile                |    1 +
 drivers/clk/hisilicon/clk-hi3670.c            | 1016 +++++++++++++++++
 include/dt-bindings/clock/hi3670-clock.h      |  348 ++++++
 6 files changed, 1458 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/hi3670-clock.txt
 create mode 100644 drivers/clk/hisilicon/clk-hi3670.c
 create mode 100644 include/dt-bindings/clock/hi3670-clock.h

-- 
2.17.1
