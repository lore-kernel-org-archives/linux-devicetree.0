From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 2/5] coresight: refactor with function of_coresight_get_cpu
Date: Fri,  3 Mar 2017 14:00:06 +0800
Message-ID: <1488520809-31670-3-git-send-email-leo.yan@linaro.org>
References: <1488520809-31670-1-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488520809-31670-1-git-send-email-leo.yan@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, John Stultz <john.stultz@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, mike.leach@linaro.org
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

This is refactor to add function of_coresight_get_cpu(), so it's used to
retrieve CPU id for coresight component. Finally can use it as a common
function for multiple places.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/hwtracing/coresight/of_coresight.c | 37 ++++++++++++++++++++----------
 include/linux/coresight.h                  |  2 ++
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
index 629e031..d9a12fb 100644
--- a/drivers/hwtracing/coresight/of_coresight.c
+++ b/drivers/hwtracing/coresight/of_coresight.c
@@ -101,14 +101,36 @@ static int of_coresight_alloc_memory(struct device *dev,
 	return 0;
 }
 
+int of_coresight_get_cpu(struct device_node *node)
+{
+	int cpu;
+	struct device_node *dn;
+
+	dn = of_parse_phandle(node, "cpu", 0);
+
+	/* Affinity defaults to CPU0 */
+	if (!dn)
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		if (dn == of_get_cpu_node(cpu, NULL)) {
+			of_node_put(dn);
+			return cpu;
+		}
+	}
+
+	/* Affinity to CPU0 if no cpu nodes are found */
+	of_node_put(dn);
+	return 0;
+}
+
 struct coresight_platform_data *of_get_coresight_platform_data(
 				struct device *dev, struct device_node *node)
 {
-	int i = 0, ret = 0, cpu;
+	int i = 0, ret = 0;
 	struct coresight_platform_data *pdata;
 	struct of_endpoint endpoint, rendpoint;
 	struct device *rdev;
-	struct device_node *dn;
 	struct device_node *ep = NULL;
 	struct device_node *rparent = NULL;
 	struct device_node *rport = NULL;
@@ -175,16 +197,7 @@ struct coresight_platform_data *of_get_coresight_platform_data(
 		} while (ep);
 	}
 
-	/* Affinity defaults to CPU0 */
-	pdata->cpu = 0;
-	dn = of_parse_phandle(node, "cpu", 0);
-	for (cpu = 0; dn && cpu < nr_cpu_ids; cpu++) {
-		if (dn == of_get_cpu_node(cpu, NULL)) {
-			pdata->cpu = cpu;
-			break;
-		}
-	}
-	of_node_put(dn);
+	pdata->cpu = of_coresight_get_cpu(node);
 
 	return pdata;
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2a5982c..7b29743 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -263,9 +263,11 @@ static inline int coresight_timeout(void __iomem *addr, u32 offset,
 #endif
 
 #ifdef CONFIG_OF
+extern int of_coresight_get_cpu(struct device_node *node);
 extern struct coresight_platform_data *of_get_coresight_platform_data(
 				struct device *dev, struct device_node *node);
 #else
+static int of_coresight_get_cpu(struct device_node *node) { return 0; }
 static inline struct coresight_platform_data *of_get_coresight_platform_data(
 	struct device *dev, struct device_node *node) { return NULL; }
 #endif
-- 
2.7.4
