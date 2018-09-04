From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/8] MSM8998 and MTP dts
Date: Mon,  3 Sep 2018 22:01:15 -0700
Message-ID: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series introduces the MSM8998 platform and the MTP device for this
platform. Including additional 6 patches that has been waiting for the initial
submission to be accepted.

Bjorn Andersson (7):
  arm64: dts: qcom: msm8998: Add RPM and regulators for MTP
  arm64: dts: qcom: msm8998: Add tsens and thermal-zones
  arm64: dts: qcom: msm8998: Add pmi8998 file
  arm64: dts: qcom: msm8998: Add smem related nodes
  arm64: dts: qcom: msm8998: Add firmware node
  arm64: dts: qcom: msm8998: Add the qfprom node
  arm64: dts: qcom: msm8998: Add smp2p nodes

Joonwoo Park (1):
  arm64: dts: Add msm8998 SoC and MTP board support

 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts  |  13 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 243 ++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi     | 692 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi     |  40 ++
 5 files changed, 989 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8998.dtsi

-- 
2.18.0
