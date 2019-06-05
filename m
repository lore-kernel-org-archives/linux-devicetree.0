From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 0/6] Add minimal boot support for IPQ6018
Date: Wed,  5 Jun 2019 22:45:55 +0530
Message-ID: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The IPQ6018 is Qualcomm’s 802.11ax SoC for Routers,
Gateways and Access Points.

This series adds minimal board boot support for ipq6018-cp01
board.

Sricharan R (6):
  pinctrl: qcom: Add ipq6018 pinctrl driver
  dt-bindings: qcom: Add ipq6018 bindings
  clk: qcom: Add DT bindings for ipq6018 gcc clock controller
  clk: qcom: Add ipq6018 Global Clock Controller support
  arm64: dts: Add ipq6018 SoC and CP01 board support
  arm64: defconfig: Enable qcom ipq6018 clock and pinctrl

 Documentation/devicetree/bindings/arm/qcom.yaml    |    2 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |   35 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  231 +
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq6018.c                     | 5267 ++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             | 1183 +++++
 include/dt-bindings/clock/qcom,gcc-ipq6018.h       |  405 ++
 13 files changed, 7148 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq6018.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq6018.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq6018.h

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
