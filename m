From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 03/10] coresight: platform: Fix refcounting for graph nodes
Date: Thu, 19 Jul 2018 11:55:07 +0100
Message-ID: <1531997715-6767-4-git-send-email-suzuki.poulose@arm.com>
References: <1531997715-6767-1-git-send-email-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531997715-6767-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, robh@kernel.org, mathieu.poirier@linaro.org, sudeep.holla@arm.com, frowand.list@gmail.com, devicetree@vger.kernel.org, mark.rutland@arm.com, matt.sealey@arm.com, charles.garcia-tobin@arm.com, coresight@lists.linaro.org, john.horley@arm.com, mike.leach@linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

The coresight driver doesn't drop the references on the
remote endpoint/port nodes. Add the missing of_node_put()
calls.

Reported-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v1:
 - Splitted from of_node recounting fix, part 2
---
 drivers/hwtracing/coresight/of_coresight.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
index 68faaf8..6c2f95a 100644
--- a/drivers/hwtracing/coresight/of_coresight.c
+++ b/drivers/hwtracing/coresight/of_coresight.c
@@ -167,6 +167,11 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		(*i)++;
 	} while (0);
 
+	if (rparent)
+		of_node_put(rparent);
+	if (rport)
+		of_node_put(rport);
+
 	return ret;
 }
 
-- 
2.7.4
