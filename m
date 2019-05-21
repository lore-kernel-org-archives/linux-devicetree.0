From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 0/9] qcom: Add cpuidle to some platforms
Date: Tue, 21 May 2019 15:05:10 +0530
Message-ID: <cover.1558430617.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, niklas.cassel@linaro.org, marc.w.gonzalez@free.fr, sibis@codeaurora.org, daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Changes since v1:
 - Reworded changes to the idle-state documentation on Sudeep's feedback.
 - Renamed several idle-state node names to be homogeneous across qcom
   platforms. We now use cpu_sleep_0_0 format for the node name while using
   LITTLE_CPU_SLEEP_0 format for labels to help differentiate the different
   states for different CPU types.
 - Add a new patch to add capacity-dmips-mhz property for msm8996 to allow
   topology code to find its true capacity.
 - Add power-collapse state to msm8998 in additon to the retention state.
 - Added acks

MSM8998 changes are untested for v2 because I couldn't access the mtp I
usually have access to. Hopefully Marc and Sibi can help with testing.

Description
-----------
Fix up a few entry-method="psci" issues and then add cpuidle low power
states for msm8996, msm8998, qcs404, sdm845. All these have been tested
to only make sure that the C-states are entered from Linux point-of-view.

We will continue to add more states and make power measurements to tweak
some of these numbers, but getting these merged will allow other people to
use these platforms to work on cpuidle, eas and related topics.


Amit Kucheria (7):
  arm64: dts: fsl: ls1028a: Fix entry-method property to reflect
    documentation
  Documentation: arm: Link idle-states binding to "enable-method"
    property
  arm64: dts: qcom: msm8916: Add entry-method property for the
    idle-states node
  arm64: dts: qcom: msm8916: Use more generic idle state names
  arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states
  arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
  arm64: dts: msm8996: Add proper capacity scaling for the cpus

Niklas Cassel (1):
  arm64: dts: qcom: qcs404: Add PSCI cpuidle low power states

Raju P.L.S.S.S.N (1):
  arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states

 .../devicetree/bindings/arm/idle-states.txt   | 13 +++-
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 13 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 21 ++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 50 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 18 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 69 +++++++++++++++++++
 7 files changed, 177 insertions(+), 9 deletions(-)

-- 
2.17.1
