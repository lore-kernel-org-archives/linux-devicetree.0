From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH 06/20] coresight: Handle errors in finding input/output ports
Date: Tue,  5 Jun 2018 22:43:17 +0100
Message-ID: <1528235011-30691-7-git-send-email-suzuki.poulose@arm.com>
References: <1528235011-30691-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1528235011-30691-1-git-send-email-suzuki.poulose@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh@kernel.org, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>, john.horley@arm.com, linux-kernel@vger.kernel.org, arm@kernel.org, sudeep.holla@arm.com, matt.sealey@arm.com, mike.leach@linaro.org, frowand.list@gmail.com, charles.garcia-tobin@arm.com
List-Id: devicetree@vger.kernel.org

If we fail to find the input / output port for a LINK component
while enabling a path, we should fail gracefully rather than
assuming port "0".

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index 69e9136..3c1c058 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -107,7 +107,7 @@ static int coresight_find_link_inport(struct coresight_device *csdev,
 	dev_err(&csdev->dev, "couldn't find inport, parent: %s, child: %s\n",
 		dev_name(&parent->dev), dev_name(&csdev->dev));
 
-	return 0;
+	return -ENODEV;
 }
 
 static int coresight_find_link_outport(struct coresight_device *csdev,
@@ -125,7 +125,7 @@ static int coresight_find_link_outport(struct coresight_device *csdev,
 	dev_err(&csdev->dev, "couldn't find outport, parent: %s, child: %s\n",
 		dev_name(&csdev->dev), dev_name(&child->dev));
 
-	return 0;
+	return -ENODEV;
 }
 
 static int coresight_enable_sink(struct coresight_device *csdev, u32 mode)
@@ -178,6 +178,9 @@ static int coresight_enable_link(struct coresight_device *csdev,
 	else
 		refport = 0;
 
+	if (refport < 0)
+		return refport;
+
 	if (atomic_inc_return(&csdev->refcnt[refport]) == 1) {
 		if (link_ops(csdev)->enable) {
 			ret = link_ops(csdev)->enable(csdev, inport, outport);
-- 
2.7.4
