From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [v3 2/5] coresight: refactor with function of_coresight_get_cpu
Date: Thu,  9 Mar 2017 11:01:44 +0000
Message-ID: <1489057304-1851-1-git-send-email-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: leo.yan@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, Wei Xu <xuwei5@hisilicon.com>, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, mathieu.poirier@linaro.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mike.leach@linaro.org, Michael Turquette <mturquette@baylibre.com>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

On 03/03/17 06:00, Leo Yan wrote:
> This is refactor to add function of_coresight_get_cpu(), so it's used to
> retrieve CPU id for coresight component. Finally can use it as a common
> function for multiple places.
>
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  drivers/hwtracing/coresight/of_coresight.c | 37 ++++++++++++++++++++----------
>  include/linux/coresight.h                  |  2 ++
>  2 files changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
> index 629e031..d9a12fb 100644
> --- a/drivers/hwtracing/coresight/of_coresight.c
> +++ b/drivers/hwtracing/coresight/of_coresight.c
> @@ -101,14 +101,36 @@ static int of_coresight_alloc_memory(struct device *dev,
>  	return 0;
>  }
>
> +int of_coresight_get_cpu(struct device_node *node)
> +{
> +	int cpu;
> +	struct device_node *dn;
> +
> +	dn = of_parse_phandle(node, "cpu", 0);
> +
> +	/* Affinity defaults to CPU0 */
> +	if (!dn)
> +		return 0;
> +
> +	for_each_possible_cpu(cpu) {
> +		if (dn == of_get_cpu_node(cpu, NULL)) {

We should do of_node_put() on the node returned by of_get_cpu_node,
and I accept that this was there before the refactoring. We could do
something like :


----8>------



[PATCH] coresight: of_coresight_get_cpu: Add missing of_node_put

The of_coresight_get_cpu iterates over the possible CPU nodes
to find a given cpu phandle. However it does not drop the reference
to the node pointer returned by the of_get_cpu_node.

Cc: Leo Yan <leo.yan@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/of_coresight.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
index d9a12fb..8c6f4a0 100644
--- a/drivers/hwtracing/coresight/of_coresight.c
+++ b/drivers/hwtracing/coresight/of_coresight.c
@@ -104,7 +104,8 @@ static int of_coresight_alloc_memory(struct device *dev,
 int of_coresight_get_cpu(struct device_node *node)
 {
 	int cpu;
-	struct device_node *dn;
+	bool found;
+	struct device_node *dn, *np;
 
 	dn = of_parse_phandle(node, "cpu", 0);
 
@@ -113,15 +114,16 @@ int of_coresight_get_cpu(struct device_node *node)
 		return 0;
 
 	for_each_possible_cpu(cpu) {
-		if (dn == of_get_cpu_node(cpu, NULL)) {
-			of_node_put(dn);
-			return cpu;
-		}
+		np = of_get_cpu_node(cpu, NULL);
+		found = (dn == np);
+		of_node_put(np);
+		if (found)
+			break;
 	}
 
-	/* Affinity to CPU0 if no cpu nodes are found */
 	of_node_put(dn);
-	return 0;
+	/* Affinity to CPU0 if no cpu nodes are found */
+	return cpu_possible(cpu) ? cpu : 0;
 }
 
 struct coresight_platform_data *of_get_coresight_platform_data(
-- 
2.7.4
