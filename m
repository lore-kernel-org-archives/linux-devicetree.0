From: Nisha Kumari <nishakumari@codeaurora.org>
Subject: [PATCH 0/4] Add labibb regulator support for LCD display mode
Date: Wed, 12 Jun 2019 16:30:48 +0530
Message-ID: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, broonie@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org
Cc: lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org, Nisha Kumari <nishakumari@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds the labibb regulator for supporting LCD display mode
on SDM845.

Nisha Kumari (4):
  dt-bindings: regulator: Add labibb regulator
  arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
  regulator: Add labibb driver
  regulator: adding interrupt handling in labibb regulator

 .../bindings/regulator/qcom-labibb-regulator.txt   |  57 ++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |  22 +
 drivers/regulator/Kconfig                          |  10 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-labibb-regulator.c          | 599 +++++++++++++++++++++
 5 files changed, 689 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
 create mode 100644 drivers/regulator/qcom-labibb-regulator.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
