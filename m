From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv6 0/6] Add coresight support for SDM845, MSM8998 and MSM8996
Date: Thu, 31 Jan 2019 19:52:18 +0530
Message-ID: <cover.1548943727.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for coresight on SDM845, MSM8998, and MSM8996.

* Patch 1 adds device tree nodes for SDM845 coresight components.

* Patch 2 adds device tree nodes for MSM8998 coresight components.

* Patch 3 adds device tree nodes for MSM8996 coresight components.

* Patch 4 enables support for ETMv4.2 and enables SDM845 to make
  use of same driver(etm4x).

* Patch 5 adds ETM PIDs for SDM845 and MSM8996.

* Patch 6 adds UCI table for coresight CPU debug module.

NOTE: All the dependent patches are applied in the below tree,
      the first 12 commits represent the dependent patches.
 * https://github.com/saiprakash-ranjan/linux/tree/coresight-next

Patch 1 and 4 depends on below AOSS QMP, AMBA bus pclk and address cell change:
 * https://lore.kernel.org/lkml/20190131003933.11436-5-bjorn.andersson@linaro.org/
 * https://lore.kernel.org/lkml/20190131003933.11436-6-bjorn.andersson@linaro.org/
 * https://lore.kernel.org/lkml/20190131003933.11436-7-bjorn.andersson@linaro.org/
 * https://lore.kernel.org/lkml/20190131003933.11436-10-bjorn.andersson@linaro.org/
 * https://lore.kernel.org/lkml/20190131020141.28352-1-bjorn.andersson@linaro.org/
 * https://lore.kernel.org/lkml/20190117042940.25487-2-bjorn.andersson@linaro.org/

Patch 2 depends on MSM8998 rpm clocks and rpmcc nodes:
 * https://lore.kernel.org/lkml/1545099336-5615-1-git-send-email-jhugo@codeaurora.org/
 * https://lore.kernel.org/lkml/1548866144-30265-1-git-send-email-jhugo@codeaurora.org/
 * https://lore.kernel.org/lkml/6da00186-e7c9-c93d-a80a-65eda2516451@free.fr/

Patch 5 and 6 depends on UCI support by Mike Leach:
 * https://lore.kernel.org/lkml/20190130234051.2294-1-mike.leach@linaro.org/ 

This patch series has been tested on SDM845 MTP and MSM8996
based Dragonboard 820c and MSM8998 MTP.

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

Sai Prakash Ranjan (5):
  arm64: dts: qcom: sdm845: Add Coresight support
  arm64: dts: qcom: msm8998: Add Coresight support
  coresight: etm4x: Add support to enable ETMv4.2
  coresight: etm4x: Add ETM PIDs for SDM845 and MSM8996
  coresight: debug: Add Unique Component Identifier (UCI) table

Vivek Gautam (1):
  arm64: dts: qcom: msm8996: Add Coresight support

 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 434 +++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 435 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 434 +++++++++++++++++
 .../hwtracing/coresight/coresight-cpu-debug.c |  33 +-
 drivers/hwtracing/coresight/coresight-etm4x.c |  17 +-
 5 files changed, 1330 insertions(+), 23 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
