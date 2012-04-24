From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/8 v2] regulator: add node validation checks
Date: Tue, 24 Apr 2012 16:36:04 -0700
Message-ID: <1335310570-12455-3-git-send-email-rklein@nvidia.com>
References: <1335310570-12455-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335310570-12455-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This change adds some validation logic to the logic for parsing nodes for
regulator init data. The idea is to catch nodes that are defined but not used
which likely means invalid nodes.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 v2: split off some node validation checks from original patch which implemented
     them specifically for the tps65910

 drivers/regulator/of_regulator.c |   38 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 45a5f85..4d5eb06 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -86,6 +86,12 @@ struct regulator_init_data *of_get_regulator_init_data(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(of_get_regulator_init_data);
 
+/* structure used for verifying regulator nodes */
+struct of_regulator_node_info {
+	struct device_node *np;
+	int count;
+};
+
 /**
  * of_find_regulator_init_data_from_device - extract all regulator_init_data
  * @dev: device requesting for regulator_init_data
@@ -103,13 +109,27 @@ int of_find_regulator_init_data_from_device(struct device *dev,
 	struct regulator_init_data **init_data, int num_regulators)
 {
 	struct device_node *child = NULL;
+	struct of_regulator_node_info *ninfo;
+	int node_cnt = 0;
 	int idx = 0;
 
 	if (!dev || !node)
 		return -EINVAL;
 
+	for_each_child_of_node(node, child)
+		node_cnt++;
+
+	ninfo = kzalloc(sizeof(*ninfo) * node_cnt, GFP_KERNEL);
+	if (!ninfo)
+		return -ENOMEM;
+
+	/* initialize list to have node addresses */
+	for_each_child_of_node(node, child)
+		ninfo[idx++].np = child;
+
 	for (idx = 0; idx < num_regulators; idx++) {
 		struct device_node *np = of_find_node_by_name(node, names[idx]);
+		int node_idx = 0;
 
 		/* didn't find a match, thats fine */
 		if (!np)
@@ -120,10 +140,28 @@ int of_find_regulator_init_data_from_device(struct device *dev,
 		if (!init_data[idx]) {
 			dev_err(dev, "failed to parse dt for regulator %s\n",
 				child->name);
+			kfree(ninfo);
 			return -EINVAL;
 		}
+
+		/* mark node as used for later checks */
+		for (node_idx = 0; node_idx < node_cnt; node_idx++) {
+			if (np == ninfo[node_idx].np) {
+				ninfo[node_idx].count++;
+				break;
+			}
+		}
+	}
+
+	/* look for unused nodes */
+	for (idx = 0; idx < node_cnt; idx++) {
+		if (ninfo[idx].count == 0)
+			dev_warn(dev, "unused regulator node found: %s\n",
+					ninfo[idx].np->name);
 	}
 
+	kfree(ninfo);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_find_regulator_init_data_from_device);
-- 
1.7.0.4
