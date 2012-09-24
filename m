From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/4] regulator: deprecate regulator-compatible DT property
Date: Mon, 24 Sep 2012 13:25:00 -0600
Message-ID: <1348514703-10152-2-git-send-email-swarren@wwwdotorg.org>
References: <1348514703-10152-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348514703-10152-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When the bindings for the TPS6586x regulator were being proposed, I
asserted that DT node naming rules for bus child nodes should also be
applied to nodes inside the TPS6586x regulator node itself. In other
words, that each node providing regulator init data should be named
after the type of object it represented ("regulator") and hence that
some other property was required to indicate which regulator the node
described ("regulator-compatible"). In turn this led to multiple nodes
having the same name, thus requiring node names to use a unit address
to make them unique, thus requiring reg properties within the nodes and

However, subsequent discussion indicates that the rules I was asserting
only applies to standardized bus nodes, and within a device's own node,
the binding can basically do anything sane that it wants.

Hence, this change deprecates the register-compatible property, and
instead uses node names to replace this functionality. This greatly
simplifies the device tree content, making them smaller and more legible.

The code is changed such that old device trees continue to work.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch is based on regulator's topic/core branch.
---
 .../devicetree/bindings/regulator/regulator.txt    |    5 +++-
 drivers/regulator/of_regulator.c                   |   25 +++++++++----------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 66ece3f..ecfc6cc 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -11,10 +11,13 @@ Optional properties:
 - regulator-boot-on: bootloader/firmware enabled regulator
 - <name>-supply: phandle to the parent supply/regulator node
 - regulator-ramp-delay: ramp delay for regulator(in uV/uS)
+
+Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
   regulators, and if the chip's binding contains a child node that
   describes each regulator, then this property indicates which regulator
-  this child node is intended to configure.
+  this child node is intended to configure. If this property is missing,
+  the node's name will be used instead.
 
 Example:
 
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 3e4106f..6f68491 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -92,16 +92,18 @@ struct regulator_init_data *of_get_regulator_init_data(struct device *dev,
 EXPORT_SYMBOL_GPL(of_get_regulator_init_data);
 
 /**
- * of_regulator_match - extract regulator init data when node
- * property "regulator-compatible" matches with the regulator name.
+ * of_regulator_match - extract multiple regulator init data from device tree.
  * @dev: device requesting the data
  * @node: parent device node of the regulators
  * @matches: match table for the regulators
  * @num_matches: number of entries in match table
  *
- * This function uses a match table specified by the regulator driver and
- * looks up the corresponding init data in the device tree  if
- * regulator-compatible matches. Note that the match table is modified
+ * This function uses a match table specified by the regulator driver to
+ * parse regulator init data from the device tree. @node is expected to
+ * contain a set of child nodes, each providing the init data for one
+ * regulator. The data parsed from a child node will be matched to a regulator
+ * based on either the deprecated property regulator-compatible if present,
+ * or otherwise the child node's name. Note that the match table is modified
  * in place.
  *
  * Returns the number of matches found or a negative error code on failure.
@@ -112,26 +114,23 @@ int of_regulator_match(struct device *dev, struct device_node *node,
 {
 	unsigned int count = 0;
 	unsigned int i;
-	const char *regulator_comp;
+	const char *name;
 	struct device_node *child;
 
 	if (!dev || !node)
 		return -EINVAL;
 
 	for_each_child_of_node(node, child) {
-		regulator_comp = of_get_property(child,
+		name = of_get_property(child,
 					"regulator-compatible", NULL);
-		if (!regulator_comp) {
-			dev_err(dev, "regulator-compatible is missing for node %s\n",
-				child->name);
-			continue;
-		}
+		if (!name)
+			name = child->name;
 		for (i = 0; i < num_matches; i++) {
 			struct of_regulator_match *match = &matches[i];
 			if (match->of_node)
 				continue;
 
-			if (strcmp(match->name, regulator_comp))
+			if (strcmp(match->name, name))
 				continue;
 
 			match->init_data =
-- 
1.7.0.4
