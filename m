From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 2/2] coresight: Abort probe if cpus are not available
Date: Fri, 21 Jun 2019 00:01:52 +0530
Message-ID: <65050e4cb2b0433f3cb9b1ca0bf6ec49d0751086.1561054498.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Currently coresight etm and cpu-debug will go ahead with
the probe even when corresponding cpus are not available
and error out later in the probe path. In such cases, it
is better to abort the probe earlier.

Without this, setting *nosmp* will throw below errors:

 [    5.910622] coresight-cpu-debug 850000.debug: Coresight debug-CPU0 initialized
 [    5.914266] coresight-cpu-debug 852000.debug: CPU1 debug arch init failed
 [    5.921474] coresight-cpu-debug 854000.debug: CPU2 debug arch init failed
 [    5.928328] coresight-cpu-debug 856000.debug: CPU3 debug arch init failed
 [    5.935330] coresight etm0: CPU0: ETM v4.0 initialized
 [    5.941875] coresight-etm4x 85d000.etm: ETM arch init failed
 [    5.946794] coresight-etm4x: probe of 85d000.etm failed with error -22
 [    5.952707] coresight-etm4x 85e000.etm: ETM arch init failed
 [    5.958945] coresight-etm4x: probe of 85e000.etm failed with error -22
 [    5.964853] coresight-etm4x 85f000.etm: ETM arch init failed
 [    5.971096] coresight-etm4x: probe of 85f000.etm failed with error -22

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 8b03fa573684..3f4559596c6b 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -168,6 +168,9 @@ static int of_coresight_get_cpu(struct device *dev)
 	cpu = of_cpu_node_to_id(dn);
 	of_node_put(dn);
 
+	if (num_online_cpus() <= cpu)
+		return -ENODEV;
+
 	return cpu;
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
