From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] Add reset controller support for BM1880 SoC
Date: Thu, 25 Apr 2019 18:25:05 +0530
Message-ID: <20190425125508.5965-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds reset controller support for Bitmain BM1880 SoC.
BM1880 SoC has two reset controllers each controlling reset lines of
different peripherals. And the reset-simple driver has been reused here.

This patchset has been tested on 96Boards Sophon Edge board.

Thanks,
Mani

Manivannan Sadhasivam (3):
  dt-bindings: reset: Add devicetree binding for BM1880 reset controller
  arm64: dts: bitmain: Add reset controller support for BM1880 SoC
  reset: Add reset controller support for BM1880 SoC

 .../bindings/reset/bitmain,bm1880-reset.txt   |  18 +++
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  17 +++
 drivers/reset/Kconfig                         |   3 +-
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-simple.c                  |  16 ++-
 .../dt-bindings/reset/bitmain,bm1880-reset.h  | 106 ++++++++++++++++++
 6 files changed, 155 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
 create mode 100644 include/dt-bindings/reset/bitmain,bm1880-reset.h

-- 
2.17.1
