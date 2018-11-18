From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: QCS404 BLSP nodes
Date: Sun, 18 Nov 2018 12:01:32 -0800
Message-ID: <20181118200135.25258-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This finalizes the definition of the BLSP UART, I2C and SPI devices found in
the QCS404 SoC.

Bjorn Andersson (3):
  arm64: dts: qcom: qcs404: Specify pinctrl state for UART
  arm64: dts: qcom: qcs404: Define remaining UARTs
  arm64: dts: qcom: qcs404: Add QUP I2C and SPI nodes

 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi |  14 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 333 +++++++++++++++++++++++
 2 files changed, 347 insertions(+)

-- 
2.18.0
