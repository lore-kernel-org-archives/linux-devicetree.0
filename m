From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 5/5] mtd: ofpart: move ofpart partitions to a dedicated dt
 node
Date: 18 Aug 2015 15:34:09 -0000
Message-ID: <78e45e51c94899f92ec5d189846c5dd5cf9d8f7a.1439911625.git.hramrach@gmail.com>
References: <cover.1439911625.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <cover.1439911625.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Michal Suchanek <hramrach@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Parsing direct subnodes of a mtd device as partitions is unreliable
since the mtd device is also part of its bus subsystem and can contain
bus data in subnodes.

Move ofpart data to a subnode of its own so it is clear which data is
part of the partition layout.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
v2:
 - fix indent
v3:
 - fix possible memory leak when parittions are allocated but no valid
   partition is found
 - rename dt node ofpart -> partitions
---
 drivers/mtd/ofpart.c | 63 ++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index aa26c32..669c345 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -29,23 +29,33 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 				   struct mtd_partition **pparts,
 				   struct mtd_part_parser_data *data)
 {
-	struct device_node *node;
+	struct device_node *mtd_node;
+	struct device_node *ofpart_node;
 	const char *partname;
 	struct device_node *pp;
-	int nr_parts, i;
+	int nr_parts, i, ret = 0;
+	bool dedicated = true;
 
 
 	if (!data)
 		return 0;
 
-	node = data->of_node;
-	if (!node)
+	mtd_node = data->of_node;
+	if (!mtd_node)
 		return 0;
 
+	ofpart_node = of_get_child_by_name(mtd_node, "partitions");
+	if (!ofpart_node) {
+		pr_warn("%s: 'partitions' subnode not found on %s. Trying to parse direct subnodes as partitions.\n",
+			master->name, mtd_node->full_name);
+		ofpart_node = mtd_node;
+		dedicated = false;
+	}
+
 	/* First count the subnodes */
 	nr_parts = 0;
-	for_each_child_of_node(node,  pp) {
-		if (node_has_compatible(pp))
+	for_each_child_of_node(ofpart_node,  pp) {
+		if (!dedicated && node_has_compatible(pp))
 			continue;
 
 		nr_parts++;
@@ -59,22 +69,36 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		return -ENOMEM;
 
 	i = 0;
-	for_each_child_of_node(node,  pp) {
+	for_each_child_of_node(ofpart_node,  pp) {
 		const __be32 *reg;
 		int len;
 		int a_cells, s_cells;
 
-		if (node_has_compatible(pp))
+		if (!dedicated && node_has_compatible(pp))
 			continue;
 
 		reg = of_get_property(pp, "reg", &len);
 		if (!reg) {
-			nr_parts--;
-			continue;
+			if (dedicated) {
+				pr_debug("%s: ofpart partition %s (%s) missing reg property.\n",
+					 master->name, pp->full_name,
+					 mtd_node->full_name);
+				goto ofpart_fail;
+			} else {
+				nr_parts--;
+				continue;
+			}
 		}
 
 		a_cells = of_n_addr_cells(pp);
 		s_cells = of_n_size_cells(pp);
+		if (len / 4 != a_cells + s_cells) {
+			pr_debug("%s: ofpart partition %s (%s) error parsing reg property.\n",
+				 master->name, pp->full_name,
+				 mtd_node->full_name);
+			goto ofpart_fail;
+		}
+
 		(*pparts)[i].offset = of_read_number(reg, a_cells);
 		(*pparts)[i].size = of_read_number(reg + a_cells, s_cells);
 
@@ -92,15 +116,20 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		i++;
 	}
 
-	if (!i) {
-		of_node_put(pp);
-		pr_err("No valid partition found on %s\n", node->full_name);
-		kfree(*pparts);
-		*pparts = NULL;
-		return -EINVAL;
-	}
+	if (!nr_parts)
+		goto ofpart_none;
 
 	return nr_parts;
+
+ofpart_fail:
+	pr_err("%s: error parsing ofpart partition %s (%s)\n",
+	       master->name, pp->full_name, mtd_node->full_name);
+	ret = -EINVAL;
+ofpart_none:
+	of_node_put(pp);
+	kfree(*pparts);
+	*pparts = NULL;
+	return ret;
 }
 
 static struct mtd_part_parser ofpart_parser = {
-- 
2.1.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
