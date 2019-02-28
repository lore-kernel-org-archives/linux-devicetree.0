From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] Add MMC controller support for HI3670 SoC
Date: Thu, 28 Feb 2019 21:15:08 +0530
Message-ID: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, amit.kucheria@linaro.org, guodong.xu@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds MMC controller support for HI3670 SoC. Since HI3670
SoC is architecturally same as the HI3660 SoC, HI3660 DWMMC driver is
reused here with DT compatible fallback approach. Also, SD and WiFi
supports are added for the HiKey970 board.

Wei:

Please apply this patchset along with the reset and UFS patches in the
following order:

1. Reset support patches
2. MMC support patches
3. UFS support patches

PS: Since there is no PMIC support available yet, fixed-regulator nodes
are used to get the driver working (regulators are enabled by bootloader).

Thanks,
Mani

Manivannan Sadhasivam (3):
  dt-bindings: mmc: Add HI3670 MMC controller binding
  arm64: dts: hisilicon: hi3670: Add MMC controller support
  arm64: dts: hisilicon: hikey970: Add SD and WiFi support

 .../devicetree/bindings/mmc/k3-dw-mshc.txt    |   2 +
 .../boot/dts/hisilicon/hi3670-hikey970.dts    |  75 ++++++++++++
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  37 ++++++
 .../boot/dts/hisilicon/hikey970-pinctrl.dtsi  | 115 ++++++++++++++++++
 4 files changed, 229 insertions(+)

-- 
2.17.1
