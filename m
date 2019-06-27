From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 0/2] coresight: Do not default to CPU0 for missing CPU phandle
Date: Thu, 27 Jun 2019 23:45:27 +0530
Message-ID: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

In case of missing CPU phandle, the affinity is set default to
CPU0 which is not a correct assumption. Fix this in coresight
platform to set affinity to invalid and abort the probe in drivers.
Also update the dt-bindings accordingly.

v5:
 * Separate out the dt-bindings patch.

v4:
 * Fix return for !CONFIG_ACPI and !CONFIG_OF.

v3:
 * Addressed review comments from Suzuki and updated
   acpi_coresight_get_cpu.
 * Removed patch 2 which had invalid check for online
   cpus.

v2:
 * Addressed review comments from Suzuki and Mathieu.
 * Allows the probe of etm and cpu-debug to abort earlier
   in case of unavailability of respective cpus.

Sai Prakash Ranjan (2):
  dt-bindings: coresight: Change CPU phandle to required property
  coresight: Do not default to CPU0 for missing CPU phandle

 .../bindings/arm/coresight-cpu-debug.txt      |  4 ++--
 .../devicetree/bindings/arm/coresight.txt     |  8 +++++---
 .../hwtracing/coresight/coresight-cpu-debug.c |  3 +++
 drivers/hwtracing/coresight/coresight-etm3x.c |  3 +++
 drivers/hwtracing/coresight/coresight-etm4x.c |  3 +++
 .../hwtracing/coresight/coresight-platform.c  | 20 +++++++++----------
 6 files changed, 26 insertions(+), 15 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
