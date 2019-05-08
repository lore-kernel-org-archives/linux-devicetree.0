From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 0/3] arm64: dts: qcom: qcs404: Enable PCIe
Date: Wed,  8 May 2019 15:43:06 -0700
Message-ID: <20190508224309.5744-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series defines the PCIe PHY and controller on QCS404 and enable them for
EVB. This was 1 commit, but per Vinod's request its split up in its individual
pieces.

Bjorn Andersson (3):
  arm64: dts: qcom: qcs404: Make gcc as reset-controller
  arm64: dts: qcom: qcs404: Add PCIe related nodes
  arm64: dts: qcom: qcs404-evb: Enable PCIe

 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 26 ++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 66 ++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

-- 
2.18.0
