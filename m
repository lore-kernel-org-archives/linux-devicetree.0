From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [RFC PATCH 3/8] coresight: Cleanup platform description data
Date: Fri,  1 Jun 2018 14:16:02 +0100
Message-ID: <1527858967-16047-4-git-send-email-suzuki.poulose@arm.com>
References: <1527858967-16047-1-git-send-email-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527858967-16047-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mathieu.poirier@linaro.org, sudeep.holla@arm.com, robh@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com, matt.sealey@arm.com, charles.garcia-tobin@arm.com, john.horley@arm.com, mike.leach@linaro.org, coresight@lists.linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

Nobody uses the "clk" field in struct coresight_platform_data.
Remove it.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 include/linux/coresight.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d950dad..32aaa1c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -94,7 +94,6 @@ struct coresight_dev_subtype {
  * @child_ports:child component port number the current component is
 		connected  to.
  * @nr_outport:	number of output ports for this component.
- * @clk:	The clock this component is associated to.
  */
 struct coresight_platform_data {
 	int cpu;
@@ -104,7 +103,6 @@ struct coresight_platform_data {
 	const char **child_names;
 	int *child_ports;
 	int nr_outport;
-	struct clk *clk;
 };
 
 /**
-- 
2.7.4
