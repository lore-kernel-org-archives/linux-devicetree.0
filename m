From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 0/7]  Add coresight support for SDM845, MSM8998 and MSM8996
Date: Tue, 29 Jan 2019 00:43:57 +0530
Message-ID: <cover.1548419933.git.saiprakash.ranjan@codeaurora.org>
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

* Patch 6 adds UCI table for coresight CPU debug module and
  also adds a helper macro for making ID insertion simpler.

* Patch 7 is a trivial removal of duplicate header file.

Patch 1 and 4 depends on below AOSS QMP patches by Bjorn:
 https://patchwork.kernel.org/patch/10749469/
 https://patchwork.kernel.org/patch/10749481/
 https://patchwork.kernel.org/patch/10749479/
 https://patchwork.kernel.org/patch/10749475/

Patch 2 depends on MSM8998 rpm clocks and rpmcc nodes:
 https://lore.kernel.org/lkml/1545099336-5615-1-git-send-email-jhugo@codeaurora.org/
 https://lore.kernel.org/lkml/8f431bde-0e67-8088-5119-7a951d0ead52@free.fr/

Patch 5 and 6 depends on UCI support by Mike Leach:
 https://lore.kernel.org/lkml/20190121233151.13363-2-mike.leach@linaro.org/

This patch series has been tested on SDM845 MTP and MSM8996
based Dragonboard 820c and MSM8998 MTP.

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

Sai Prakash Ranjan (6):
  arm64: dts: qcom: sdm845: Add Coresight support
  arm64: dts: qcom: msm8998: Add Coresight support
  coresight: etm4x: Add support to enable ETMv4.2
  coresight: etm4x: Add ETM PIDs for SDM845 and MSM8996
  coresight: debug: Add Unique Component Identifier (UCI) table
  arm64: dts: qcom: sdm845: Remove the duplicate header inclusion

Vivek Gautam (1):
  arm64: dts: qcom: msm8996: Add Coresight support

 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 434 +++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 435 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 435 +++++++++++++++++-
 .../hwtracing/coresight/coresight-cpu-debug.c |  41 +-
 drivers/hwtracing/coresight/coresight-etm4x.c |   7 +-
 5 files changed, 1337 insertions(+), 15 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
