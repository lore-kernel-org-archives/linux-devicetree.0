From: Varadarajan Narayanan <varada@codeaurora.org>
Subject: [PATCH 0/5] Add minimal boot support for IPQ8074
Date: Fri, 28 Apr 2017 15:26:38 +0530
Message-ID: <1493373403-23462-1-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linus.walleij@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: sricharan@codeaurora.org, absahu@codeaurora.org, sjaganat@codeaurora.org, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The IPQ8074 is Qualcomm’s High-capacity 802.11ax SoC for Routers,
Gateways and Access Points.

This series adds minimal board boot support for ipq8074-hk01
board.

Abhishek Sahu (2):
  clk: qcom: ipq8074: Add Global Clock Controller support
  arm64: defconfig: Enable QCOM IPQ8074 clock and pinctrl

Varadarajan Narayanan (3):
  pinctrl: qcom: Add ipq8074 pinctrl driver
  dt-bindings: qcom: Add IPQ8074 bindings
  arm64: dts: Add ipq8074 SoC and MTP board support

 Documentation/devicetree/bindings/arm/qcom.txt     |    2 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 .../bindings/pinctrl/qcom,ipq8074-pinctrl.txt      |  202 ++++
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   48 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  153 +++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq8074.c                     | 1033 +++++++++++++++++
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq8074.c             | 1220 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |  152 +++
 14 files changed, 2835 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq8074.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq8074.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq8074.h

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

