From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/3] Add coresight support for SDM845
Date: Wed,  9 Jan 2019 23:16:46 +0530
Message-ID: <cover.1547054308.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for coresight on SDM845. 

* Patch 1 adds device tree nodes for SDM845 coresight components.

* Patch 2 enables support for ETMv4.2 and enables SDM845 to make
  use of same driver(etm4x).

* Patch 3 is a trivial removal of duplicate header file.

Patch 1 and 2 depends on below AOSS QMP patches by Bjorn:
 https://patchwork.kernel.org/patch/10749469/ 
 https://patchwork.kernel.org/patch/10749481/
 https://patchwork.kernel.org/patch/10749479/
 https://patchwork.kernel.org/patch/10749475/ 

This patch series has been tested on SDM845 MTP.

Sai Prakash Ranjan (3):
  arm64: dts: qcom: sdm845: Add Coresight support
  coresight: etm4x: Add support to enable ETMv4.2
  arm64: dts: qcom: sdm845: Remove the duplicate header inclusion

 .../arm64/boot/dts/qcom/sdm845-coresight.dtsi | 437 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   3 +-
 drivers/hwtracing/coresight/coresight-etm4x.c |   2 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
 4 files changed, 441 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-coresight.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
