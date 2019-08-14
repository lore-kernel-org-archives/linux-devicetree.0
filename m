From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 00/22] arm64: dts: qcom: sm8150: Add SM8150 DTS
Date: Wed, 14 Aug 2019 18:19:50 +0530
Message-ID: <20190814125012.8700-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds DTS for SM8150, PMIC PM8150, PM8150B, PM8150L and the MTP
for SM815.

Only dependency for this series is the clk gcc dt binding [1] which is
already in Clock tree upstream, so merging that is required.

The patches are incremental based on features as they were developed. We can
merge them into bigger commits but I feel keeping them as individual units
helps.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-qcom&id=e5ee331ebcf33827d1bd64e984c565b23cf53227

Sibi Sankar (3):
  arm64: dts: qcom: sm8150: Add pmu node to SM8150 SoC
  arm64: dts: qcom: sm8150: Add SMEM nodes
  arm64: dts: qcom: sm8150: Add APSS shared mailbox

Vinod Koul (19):
  arm64: dts: qcom: sm8150: add base dts file
  arm64: dts: qcom: sm8150-mtp: add base dts file
  arm64: dts: qcom: sm8150: add tlmm node
  arm64: dts: qcom: sm8150-mtp: add tlmm reserved range
  arm64: dts: qcom: sm8150: Add spmi node
  arm64: dts: qcom: pm8150: Add Base DTS file
  arm64: dts: qcom: pm8150: Add pon and rtc nodes
  arm64: dts: qcom: pm8150: Add vadc node
  arm64: dts: qcom: pm8150b: Add Base DTS file
  arm64: dts: qcom: pm8150b: Add pon and adc nodes
  arm64: dts: qcom: pm8150b: Add gpio node
  arm64: dts: qcom: pm8150l: Add Base DTS file
  arm64: dts: qcom: pm8150l: Add pon and adc nodes
  arm64: dts: qcom: pm8150l: Add gpio node
  arm64: dts: qcom: sm8150-mtp: Include pmics
  arm64: dts: qcom: sm8150-mtp: Add resin node
  arm64: dts: qcom: sm8150: Add apss_shared and apps_rsc nodes
  arm64: dts: qcom: sm8150: Add reserved-memory regions
  arm64: dts: qcom: sm8150-mtp: Add regulators

 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi    |  89 +++++
 arch/arm64/boot/dts/qcom/pm8150b.dtsi   |  95 +++++
 arch/arm64/boot/dts/qcom/pm8150l.dtsi   |  74 ++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 371 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 476 ++++++++++++++++++++++++
 6 files changed, 1106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150l.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi

-- 
2.20.1
