From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv1 0/8] qcom: Add cpuidle to some platforms
Date: Fri, 10 May 2019 16:59:38 +0530
Message-ID: <cover.1557486950.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fix up a few entry-method="psci" issues and then add cpuidle low power
states for msm8996, msm8998, qcs404, sdm845. All these have been tested
to only make sure that the C-states are entered from Linux point-of-view. 

We will continue to add more states and make power measurements to tweak
some of these numbers, but getting these merged will allow other people to
use these platforms to work on cpuidle, eas and related topics.


Amit Kucheria (6):
  arm64: dts: Fix various entry-method properties to reflect
    documentation
  Documentation: arm: Link idle-states binding to code
  arm64: dts: qcom: msm8916: Add entry-method property for the
    idle-states node
  arm64: dts: qcom: msm8916: Use more generic idle state names
  arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states
  arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states

Niklas Cassel (1):
  arm64: dts: qcom: qcs404: Add PSCI cpuidle low power states

Raju P.L.S.S.S.N (1):
  arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states

 .../devicetree/bindings/arm/idle-states.txt   |  7 +++
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 13 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 28 +++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 32 ++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 18 ++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 62 +++++++++++++++++++
 7 files changed, 156 insertions(+), 6 deletions(-)

-- 
2.17.1
