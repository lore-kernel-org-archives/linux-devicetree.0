From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/9] RPMPD for QCS404 and MSM8998
Date: Wed, 27 Mar 2019 18:08:23 +0530
Message-ID: <20190327123832.11566-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, rnayak@codeaurora.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Re-worked the macros of the rpmpd driver. Add power domains support
for QCS404 and MSM8998.

V3:
* always send level updates to vfc and vfl in set_performance state
* fixup commit messages [Rajendra]
* fixup s-o-b ordering

V2:
* Add rpmpd support for msm8998
* fixup corner/vfc with vlfl/vfl

Bjorn Andersson (4):
  soc: qcom: rpmpd: Modify corner defining macros
  dt-bindings: power: Add rpm power domain bindings for qcs404
  soc: qcom: rpmpd: Add QCS404 power-domains
  arm64: dts: qcom: qcs404: Add rpmpd node

Sibi Sankar (5):
  soc: qcom: rpmpd: fixup rpmpd set performance state
  soc: qcom: rpmpd: Add support to set rpmpd state to max
  dt-bindings: power: Add rpm power domain bindings for msm8998
  soc: qcom: rpmpd: Add MSM8998 power-domains
  arm64: dts: qcom: msm8998: Add rpmpd node

 .../devicetree/bindings/power/qcom,rpmpd.txt  |   2 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  51 +++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  55 +++++++
 drivers/soc/qcom/rpmpd.c                      | 135 ++++++++++++++----
 include/dt-bindings/power/qcom-rpmpd.h        |  34 +++++
 5 files changed, 252 insertions(+), 25 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
