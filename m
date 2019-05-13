From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 0/9] RPMPD for QCS404 and MSM8998
Date: Mon, 13 May 2019 15:50:06 +0530
Message-ID: <20190513102015.26551-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, marc.w.gonzalez@free.fr, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Re-worked the macros of the rpmpd driver. Add power domains support
for QCS404 and MSM8998.

V4:
* fixup fixes tag and commit message in patch 1 [Marc]
* fixup typos in qcs404 and msm8998 dt nodes
* fixup comments regarding resource type in patch 8 [Marc]

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
 drivers/soc/qcom/rpmpd.c                      | 134 ++++++++++++++----
 include/dt-bindings/power/qcom-rpmpd.h        |  34 +++++
 5 files changed, 252 insertions(+), 24 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
