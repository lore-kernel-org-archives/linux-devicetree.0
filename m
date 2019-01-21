From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 0/4] Add new device nodes for Spreadtrum SC9860 platform
Date: Mon, 21 Jan 2019 15:38:27 +0800
Message-ID: <cover.1548052878.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com
Cc: devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

This patch set adds charger and fuel gauge device nodes for Spreadtrum
SC2731 PMIC, it also removes redundant irq trigger setting for PMIC
devices and adds nvmem cells for ADC to calibrate the ADC channel scales.

Baolin Wang (4):
  arm64: dts: sprd: Remove PMIC INTC irq trigger type
  arm64: dts: sprd: Add ADC calibration support
  arm64: dts: sprd: Add SC2731 charger device
  arm64: dts: sprd: Add SC27XX fuel gauge device

 arch/arm64/boot/dts/sprd/sc2731.dtsi      |   42 ++++++++++++++++++++++++++---
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts |   16 +++++++++++
 2 files changed, 54 insertions(+), 4 deletions(-)

-- 
1.7.9.5
