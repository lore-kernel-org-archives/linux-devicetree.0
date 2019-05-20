From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] Add pinconf support for BM1880 SoC
Date: Mon, 20 May 2019 14:00:56 +0530
Message-ID: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

This patchset adds pinconf support for Bitmain BM1880 SoC. In the previous
patchset adding pinctrl support, I declared that the SoC doesn't support
pinconf settings but further interaction with Bitmain engineers revealed
that the SoC does support it and hence this patchset.

Currently, there is no drive strength support added but it will come later.
Also, the current driver has some code to set pinmux in dedicated PWM
registers separately which is not needed, so I removed those and simplified
the driver.

Thanks,
Mani

Manivannan Sadhasivam (5):
  dt-bindings: pinctrl: Modify pinctrl memory map
  arm64: dts: bitmain: Modify pin controller memory map
  pinctrl: Rework the pinmux handling for BM1880 SoC
  dt-bindings: pinctrl: Document pinconf bindings for BM1880 SoC
  pinctrl: Add pinconf support for BM1880 SoC

 .../pinctrl/bitmain,bm1880-pinctrl.txt        |  23 +-
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       |   4 +-
 drivers/pinctrl/pinctrl-bm1880.c              | 455 +++++++++++-------
 3 files changed, 304 insertions(+), 178 deletions(-)

-- 
2.17.1
