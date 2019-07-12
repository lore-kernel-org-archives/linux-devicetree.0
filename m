From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv8 0/5] Add coresight support for SDM845, MSM8998 and MSM8996
Date: Fri, 12 Jul 2019 19:46:22 +0530
Message-ID: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Marc Gonzalez <marc.w.gonzalez@free.fr>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for coresight on SDM845, MSM8998, and MSM8996.

* Patch 1 adds device tree nodes for SDM845 coresight components.

* Patch 2 adds device tree nodes for MSM8998 coresight components.

* Patch 3 adds device tree nodes for MSM8996 coresight components.

* Patch 4 adds ETM PIDs for SDM845 and MSM8996.

* Patch 5 adds coresight CPU debug module for Qualcomm Kryo.

All the previous dependencies are now merged.

This patch series has been tested on SDM845 MTP and MSM8996
based Dragonboard 820c and MSM8998 MTP.

v8:
 * Change to clocks instead of power domain for SDM845.
 * Fix compilation with uci_id_debug struct changed to const.
 * Rebase on top of linux-next.

v7:
 * Change uci_id_debug struct to const.
 * Update the subject as suggested by Suzuki.

v6:
 * Update the UCI table with the new macro introduced by
   Mike.
 * Rebase on top of coresight-next and provide a tree with
   all the dependent patches applied.

v5:
 * Added coresight support for MSM8998.
 * Added ETM PIDs for SDM845 and MSM8996 as suggested
   by Suzuki.
 * Added UCI table for Coresight CPU debug module.

v4:
 * Mask out the minor version as suggested by Mathieu.
 * Added the dependent patch description in patch 1.

v3:
 * Added arm,scatter-gather property as suggested by Suzuki.

v2:
 * Added coresight support for msm8996 based on Vivek's patch.
   Cleaned up and added coresight cpu debug nodes for msm8996.
 * Merged coresight dtsi file into sdm845.dtsi as suggested by Bjorn
 * Addressed Mathieu's feedback about masking the minor version in
   etm4_arch_supported() and added a comment for reason to bypass
   the AMBA bus discovery method.

Sai Prakash Ranjan (4):
  arm64: dts: qcom: sdm845: Add Coresight support
  arm64: dts: qcom: msm8998: Add Coresight support
  coresight: etm4x: Add ETM PIDs for SDM845 and MSM8996
  coresight: cpu-debug: Add support for Qualcomm Kryo

Vivek Gautam (1):
  arm64: dts: qcom: msm8996: Add Coresight support

 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 434 +++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 435 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 451 ++++++++++++++++++
 .../hwtracing/coresight/coresight-cpu-debug.c |  33 +-
 drivers/hwtracing/coresight/coresight-etm4x.c |  14 +-
 drivers/hwtracing/coresight/coresight-priv.h  |  10 +-
 6 files changed, 1350 insertions(+), 27 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
