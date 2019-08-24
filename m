From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v1 2/2] of: Let of_for_each_phandle fallback to non-negative cell_count
Date: Sat, 24 Aug 2019 15:28:46 +0200
Message-ID: <20190824132846.8589-2-u.kleine-koenig@pengutronix.de>
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

Referencing device tree nodes from a property allows to pass arguments.
This is for example used for referencing gpios. This looks as follows:

	gpio_ctrl: gpio-controller {
		#gpio-cells = <2>
		...
	}

	someothernode {
		gpios = <&gpio_ctrl 5 0 &gpio_ctrl 3 0>;
		...
	}

To know the number of arguments this must be either fixed, or the
referenced node is checked for a $cells_name (here: "#gpio-cells")
property and with this information the start of the second reference can
be determined.

Currently regulators are referenced with no additional arguments. To
allow some optional arguments without having to change all referenced
nodes this change introduces a way to specify a default cell_count. So
when a phandle is parsed we check for the $cells_name property and use
it as before if present. If it is not present we fall back to
cells_count if non-negative and only fail if cells_count is smaller than
zero.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/of/base.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 55e7f5bb0549..2f25d2dfecfa 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1335,11 +1335,20 @@ int of_phandle_iterator_next(struct of_phandle_iterator *it)
 
 			if (of_property_read_u32(it->node, it->cells_name,
 						 &count)) {
-				pr_err("%pOF: could not get %s for %pOF\n",
-				       it->parent,
-				       it->cells_name,
-				       it->node);
-				goto err;
+				/*
+				 * If both cell_count and cells_name is given,
+				 * fall back to cell_count in absence
+				 * of the cells_name property
+				 */
+				if (it->cell_count >= 0) {
+					count = it->cell_count;
+				} else {
+					pr_err("%pOF: could not get %s for %pOF\n",
+					       it->parent,
+					       it->cells_name,
+					       it->node);
+					goto err;
+				}
 			}
 		} else {
 			count = it->cell_count;
@@ -1505,7 +1514,7 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 {
 	if (index < 0)
 		return -EINVAL;
-	return __of_parse_phandle_with_args(np, list_name, cells_name, 0,
+	return __of_parse_phandle_with_args(np, list_name, cells_name, -1,
 					    index, out_args);
 }
 EXPORT_SYMBOL(of_parse_phandle_with_args);
@@ -1588,7 +1597,7 @@ int of_parse_phandle_with_args_map(const struct device_node *np,
 	if (!pass_name)
 		goto free;
 
-	ret = __of_parse_phandle_with_args(np, list_name, cells_name, 0, index,
+	ret = __of_parse_phandle_with_args(np, list_name, cells_name, -1, index,
 					   out_args);
 	if (ret)
 		goto free;
@@ -1756,7 +1765,7 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
 	struct of_phandle_iterator it;
 	int rc, cur_index = 0;
 
-	rc = of_phandle_iterator_init(&it, np, list_name, cells_name, 0);
+	rc = of_phandle_iterator_init(&it, np, list_name, cells_name, -1);
 	if (rc)
 		return rc;
 
-- 
2.20.1
