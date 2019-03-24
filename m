Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/6] arm64: dts: qcom: qcs404: ethernet and other updates
Date: Sun, 24 Mar 2019 22:02:03 +0530
Message-Id: <20190324163209.17312-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This series adds ethernet nodes, fixes DMA settings, fixes regulator
voltages and lastly adds spmi regulators for QCS404 platform

Bjorn Andersson (1):
  arm64: dts: qcom: qcs404: Fix voltages for s5 and l3

Jorge Ramirez-Ortiz (1):
  arm64: dts: qcom: pms405: add spmi regulators

Khasim Syed Mohammed (1):
  arm64: dts: qcom: qcs404: Remove default setting of
    controlled-remotely for BAM DMA

Shawn Guo (1):
  arm64: dts: qcom: qcs404: Enable blsp1_uart3 for qcs404-evb

Vinod Koul (2):
  arm64: dts: qcom: qcs404: Add Ethernet node
  arm64: dts: qcom: qcs404: Enable ethernet for EVB-4000

 arch/arm64/boot/dts/qcom/pms405.dtsi         | 20 +++++
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 82 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi     | 24 +++++-
 arch/arm64/boot/dts/qcom/qcs404.dtsi         | 23 +++++-
 4 files changed, 144 insertions(+), 5 deletions(-)

-- 
2.20.1
