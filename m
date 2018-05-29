From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 04/12] coresight: tmc-etr: Disallow perf mode
Date: Tue, 29 May 2018 14:15:29 +0100
Message-ID: <1527599737-28408-5-git-send-email-suzuki.poulose@arm.com>
References: <1527599737-28408-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1527599737-28408-1-git-send-email-suzuki.poulose@arm.com>
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org, robert.walker@arm.com, frowand.list@gmail.com, mike.leach@linaro.org
List-Id: devicetree@vger.kernel.org

We don't support ETR in perf mode yet. So, don't
even try to enable the hardware, even by mistake.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 28 ++-----------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 1de05c9..18c9a18 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -211,32 +211,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 
 static int tmc_enable_etr_sink_perf(struct coresight_device *csdev)
 {
-	int ret = 0;
-	unsigned long flags;
-	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	/*
-	 * In Perf mode there can be only one writer per sink.  There
-	 * is also no need to continue if the ETR is already operated
-	 * from sysFS.
-	 */
-	if (drvdata->mode != CS_MODE_DISABLED) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	drvdata->mode = CS_MODE_PERF;
-	tmc_etr_enable_hw(drvdata);
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
-
-	return ret;
+	/* We don't support perf mode yet ! */
+	return -EINVAL;
 }
 
 static int tmc_enable_etr_sink(struct coresight_device *csdev, u32 mode)
-- 
2.7.4
