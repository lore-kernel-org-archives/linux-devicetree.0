From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] Add Reset controller support for HI3670 SoC
Date: Fri,  1 Feb 2019 21:08:38 +0530
Message-ID: <20190201153841.21903-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guodong.xu@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds Reset controller support for HiSilicon HI3670 SoC.
HI3670 SoC is architecturally same as HI3660 SoC, hence the same driver
is reused.

This patchset has been tested on HiKey970 board.

Thanks,
Mani

Manivannan Sadhasivam (3):
  dt-bindings: reset: Add HI3670 reset controller binding
  arm64: dts: hisilicon: hi3670: Add reset controller support
  reset: hisilicon: Add HiSilicon HI3670 reset support

 .../devicetree/bindings/reset/hisilicon,hi3660-reset.txt    | 5 +++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi                   | 6 ++++++
 drivers/reset/hisilicon/reset-hi3660.c                      | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.17.1
