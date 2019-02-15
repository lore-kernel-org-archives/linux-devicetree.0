From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/2] Add Reset controller support for HI3670 SoC
Date: Fri, 15 Feb 2019 11:19:53 +0530
Message-ID: <20190215054955.788-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guodong.xu@linaro.org, john.stultz@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds Reset controller support for HiSilicon HI3670 SoC.
HI3670 SoC is architecturally same as HI3660 SoC, hence the same driver
is reused.

This patchset has been tested on HiKey970 board.

Thanks,
Mani

Changes in v2:

* Used the DT compatible fallback approach instead of adding a new one
  for HI3670

Manivannan Sadhasivam (2):
  dt-bindings: reset: Add HI3670 reset controller binding
  arm64: dts: hisilicon: hi3670: Add reset controller support

 .../devicetree/bindings/reset/hisilicon,hi3660-reset.txt   | 7 ++++---
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi                  | 6 ++++++
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.17.1
