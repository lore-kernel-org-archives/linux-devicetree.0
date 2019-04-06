From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 2/4] coresight: replicator: Add new device id for static replicator
Date: Sat,  6 Apr 2019 19:21:43 +0800
Message-ID: <20190406112145.15184-3-leo.yan@linaro.org>
References: <20190406112145.15184-1-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406112145.15184-1-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Wanglai Shi <shiwanglai@hisilicon.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds a device id for the new static replicator compatible
string; it changes the driver name from "coresight-replicator" to
"coresight-static-replicator" as well.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 4e0da85efd2d..e6a03642bbdb 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -285,13 +285,14 @@ static const struct dev_pm_ops replicator_dev_pm_ops = {
 
 static const struct of_device_id static_replicator_match[] = {
 	{.compatible = "arm,coresight-replicator"},
+	{.compatible = "arm,coresight-static-replicator"},
 	{}
 };
 
 static struct platform_driver static_replicator_driver = {
 	.probe          = static_replicator_probe,
 	.driver         = {
-		.name   = "coresight-replicator",
+		.name   = "coresight-static-replicator",
 		.of_match_table = static_replicator_match,
 		.pm	= &replicator_dev_pm_ops,
 		.suppress_bind_attrs = true,
-- 
2.17.1
