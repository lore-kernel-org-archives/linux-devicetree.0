From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 03/12] coresight: tmc-etr: Do not clean trace buffer
Date: Tue, 29 May 2018 14:15:28 +0100
Message-ID: <1527599737-28408-4-git-send-email-suzuki.poulose@arm.com>
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

We zero out the entire trace buffer used for ETR before it is enabled,
for helping with debugging. With the addition of scatter-gather mode,
the buffer could be bigger and non-contiguous.

Get rid of this step; if someone wants to debug, they can always add it
as and when needed.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index f88342d..1de05c9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -13,9 +13,6 @@ static void tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
 {
 	u32 axictl, sts;
 
-	/* Zero out the memory to help with debug */
-	memset(drvdata->vaddr, 0, drvdata->size);
-
 	CS_UNLOCK(drvdata->base);
 
 	/* Wait for TMCSReady bit to be set */
@@ -340,9 +337,8 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 	if (drvdata->mode == CS_MODE_SYSFS) {
 		/*
 		 * The trace run will continue with the same allocated trace
-		 * buffer. The trace buffer is cleared in tmc_etr_enable_hw(),
-		 * so we don't have to explicitly clear it. Also, since the
-		 * tracer is still enabled drvdata::buf can't be NULL.
+		 * buffer. Since the tracer is still enabled drvdata::buf can't
+		 * be NULL.
 		 */
 		tmc_etr_enable_hw(drvdata);
 	} else {
-- 
2.7.4
