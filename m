From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] Add initial Bitmain BM1880 SoC/Board support
Date: Sat, 26 Jan 2019 09:40:36 +0530
Message-ID: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds initial support for Bitmain BM1880 SoC and Sophon
Edge board. BM1880 SoC consists of a Dual Core ARM Cortex A53 Application
processor subsystem, a single core RISC-V subsystem and a Tensor
Processor subsystem. This patchset adds support for only ARM Cortex
A53 Application processor subsystem with UART, which enables the board to
boot into initramfs with 2 CPUs.

Thanks,
Mani

Manivannan Sadhasivam (5):
  dt-bindings: arm: Document Bitmain BM1880 SoC
  arm64: Add ARCH_BITMAIN platform
  arm64: dts: bitmain: Add BM1880 SoC support
  arm64: dts: bitmain: Add Sophon Egde board support
  MAINTAINERS: Add entry for Bitmain SoC platform

 .../devicetree/bindings/arm/bitmain.yaml      |  18 +++
 MAINTAINERS                                   |   7 ++
 arch/arm64/Kconfig.platforms                  |   5 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/bitmain/Makefile          |   3 +
 .../boot/dts/bitmain/bm1880-sophon-edge.dts   |  50 ++++++++
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       | 119 ++++++++++++++++++
 7 files changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bitmain.yaml
 create mode 100644 arch/arm64/boot/dts/bitmain/Makefile
 create mode 100644 arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
 create mode 100644 arch/arm64/boot/dts/bitmain/bm1880.dtsi

-- 
2.17.1
