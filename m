Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:44723 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933329Ab3HNV1Z (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 17:27:25 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V6 4/5] of: call __of_parse_phandle_with_args from of_parse_phandle
Date: Wed, 14 Aug 2013 15:27:11 -0600
Message-Id: <1376515632-12594-4-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

The simplest case of __of_parse_phandle_with_args() now implements the
semantics of of_parse_phandle(). Rewrite of_parse_phandle() to call
__of_parse_phandle_with_args() rather than open-coding the simple case.

Optimize __of_parse_phandle_with_args() so that it doesn't call
of_find_node_by_phandle() except when it's strictly needed. This avoids
introducing too much overhead when replacing of_parse_phandle().

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
v6: Fixed commit description to match code change. Enhance
    __of_parse_phandle_with_args() to avoid calling
    of_find_node_by_phandle() except when needed.
v5: New patch.
---
 drivers/of/base.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 3a5cd9e..c8be59d 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1112,13 +1112,20 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 		if (phandle) {
 			/*
 			 * Find the provider node and parse the #*-cells
-			 * property to determine the argument length
+			 * property to determine the argument length.
+			 *
+			 * This is not needed if the cell count is hard-coded
+			 * (i.e. cells_name not set, but cell_count is set),
+			 * except when we're going to return the found node
+			 * below.
 			 */
-			node = of_find_node_by_phandle(phandle);
-			if (!node) {
-				pr_err("%s: could not find phandle\n",
-					 np->full_name);
-				goto err;
+			if (cells_name || cur_index == index) {
+				node = of_find_node_by_phandle(phandle);
+				if (!node) {
+					pr_err("%s: could not find phandle\n",
+						np->full_name);
+					goto err;
+				}
 			}
 
 			if (cells_name) {
@@ -1203,14 +1210,16 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 struct device_node *of_parse_phandle(const struct device_node *np,
 				     const char *phandle_name, int index)
 {
-	const __be32 *phandle;
-	int size;
+	struct of_phandle_args args;
+
+	if (index < 0)
+		return NULL;
 
-	phandle = of_get_property(np, phandle_name, &size);
-	if ((!phandle) || (size < sizeof(*phandle) * (index + 1)))
+	if (__of_parse_phandle_with_args(np, phandle_name, NULL, 0,
+					 index, &args))
 		return NULL;
 
-	return of_find_node_by_phandle(be32_to_cpup(phandle + index));
+	return args.np;
 }
 EXPORT_SYMBOL(of_parse_phandle);
 
-- 
1.8.1.5

