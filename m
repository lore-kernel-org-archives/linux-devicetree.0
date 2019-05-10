From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/4] Add reset controller support for BM1880 SoC
Date: Sat, 11 May 2019 00:15:21 +0530
Message-ID: <20190510184525.13568-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds reset controller support for Bitmain BM1880 SoC.
BM1880 SoC has only one reset controller and the reset-simple driver
has been reused here.

This patchset has been tested on 96Boards Sophon Edge board.

Thanks,
Mani

Changes in v3:

* Removed the clk-rst part as it turned out be the clock gating register set.

Changes in v2:

As per review from Philipp:

* Reused reset_simple_active_low struct instead of a new one for bm1880
* Splitted the SPDX license change to a separate commit
* Added Reviewed-by tags from Rob and Philipp

Manivannan Sadhasivam (4):
  dt-bindings: reset: Add devicetree binding for BM1880 reset controller
  arm64: dts: bitmain: Add reset controller support for BM1880 SoC
  reset: Add reset controller support for BM1880 SoC
  reset: Switch to SPDX license identifier for reset-simple

 .../bindings/reset/bitmain,bm1880-reset.txt   | 18 +++++++
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       | 11 ++++
 drivers/reset/Kconfig                         |  3 +-
 drivers/reset/reset-simple.c                  |  8 ++-
 .../dt-bindings/reset/bitmain,bm1880-reset.h  | 51 +++++++++++++++++++
 5 files changed, 85 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
 create mode 100644 include/dt-bindings/reset/bitmain,bm1880-reset.h

-- 
2.17.1
