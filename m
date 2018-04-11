From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/4] Add Actions Semi S900 SPS support
Date: Wed, 11 Apr 2018 22:10:32 +0530
Message-ID: <20180411164036.8046-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, robh+dt@kernel.org
Cc: liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, manivannanece23@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add SPS (Smart Power System) support to Actions Semi S900 SoC.

Manivannan Sadhasivam (4):
  dt-bindings: power: Add Actions Semi S900 SPS
  arm64: dts: actions: Add S900 SPS node
  soc: actions: sps: Add S900 power domains
  soc: actions: Fix help text in Kconfig for OWL_PM_DOMAINS

 .../devicetree/bindings/power/actions,owl-sps.txt  |  2 +
 arch/arm64/boot/dts/actions/s900.dtsi              |  6 +++
 drivers/soc/actions/Kconfig                        |  2 +-
 drivers/soc/actions/owl-sps.c                      | 58 ++++++++++++++++++++++
 include/dt-bindings/power/owl-s900-powergate.h     | 23 +++++++++
 5 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/power/owl-s900-powergate.h

-- 
2.14.1
