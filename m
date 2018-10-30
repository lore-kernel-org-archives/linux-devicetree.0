From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 00/17] arm64: dts: qcom: qcs404: Add Device tree nodes
Date: Tue, 30 Oct 2018 15:40:51 +0530
Message-ID: <20181030101108.11041-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

This series adds support for various nodes for QCS404-EVB.

Based on next-20181030

Bjorn Andersson (7):
  arm64: dts: qcom: qcs404: Add reserved-memory regions
  arm64: dts: qcom: qcs404: Add RPM GLINK related nodes
  arm64: dts: qcom: qcs404: Add PMS405 RPM regulators
  arm64: dts: qcom: qcs404: Add TLMM pinctrl node
  arm64: dts: qcom: qcs404: Add sdcc1 node
  arm64: dts: qcom: qcs404: Add scm firmware node
  arm64: dts: qcom: qcs404: Add remoteproc nodes

Vinod Koul (10):
  arm64: dts: qcom: qcs404: add base dts files
  arm64: dts: qcom: qcs404: add smp2p nodes
  arm64: dts: qcom: pms405: add spmi node
  arm64: dts: qcom: qcs404: add spmi node
  arm64: dts: qcom: pms405: add rtc node
  arm64: dts: qcom: pms405: add gpios
  arm64: dts: qcom: qcs404: add prng-ee node
  arm64: dts: qcom: qcs404: Add BAM DMA node
  arm64: dts: qcom: qcs404: Use BAM DMA for serial uart2
  arm64: dts: qcom: pms405: Add pon and pwrkey nodes

 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/pms405.dtsi    |  53 ++++
 arch/arm64/boot/dts/qcom/qcs404-evb.dts | 183 ++++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi    | 485 ++++++++++++++++++++++++++++++++
 4 files changed, 722 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pms405.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs404-evb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs404.dtsi

-- 
2.14.4
