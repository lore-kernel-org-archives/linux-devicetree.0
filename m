From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] Add pinctrl support for BM1880 SoC
Date: Wed, 24 Apr 2019 17:32:19 +0530
Message-ID: <20190424120224.22660-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds pinctrl support for Bitmain BM1880 SoC and
Sophon Edge board. BM1880 SoC can only handle pinmux functionality,
hence the driver has no pinconf support.

This patchset has been tested on 96Boards Sophon Edge board.

Thanks,
Mani

Manivannan Sadhasivam (5):
  dt-bindings: pinctrl: Add BM1880 pinctrl binding
  arm64: dts: bitmain: Add pinctrl support for BM1880 SoC
  arm64: dts: bitmain: Add UART pinctrl support for Sophon Edge
  pinctrl: Add pinctrl support for BM1880 SoC
  MAINTAINERS: Add entry for BM1880 pinctrl

 .../pinctrl/bitmain,bm1880-pinctrl.txt        |  98 ++
 MAINTAINERS                                   |   2 +
 .../boot/dts/bitmain/bm1880-sophon-edge.dts   |  29 +
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  14 +
 drivers/pinctrl/Kconfig                       |   7 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-bm1880.c              | 965 ++++++++++++++++++
 7 files changed, 1116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-bm1880.c

-- 
2.17.1
