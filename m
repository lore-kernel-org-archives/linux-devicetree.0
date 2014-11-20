From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of/selftest: Fix testing when /aliases is missing
Date: Thu, 20 Nov 2014 15:40:30 +0000
Message-ID: <1416498030-5878-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The /aliases node isn't always present in the device tree, but the
unittest code assumes that /aliases is there. Add a check when inserting
the testcase data to see if of_aliases needs to be updated, and undo the
settings when the nodes are removed.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
---
 drivers/of/selftest.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index e6c14dc400e9..e2d79afa9dc6 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -899,7 +899,11 @@ static void selftest_data_remove(void)
 	while (last_node_index-- > 0) {
 		if (nodes[last_node_index]) {
 			np = of_find_node_by_path(nodes[last_node_index]->full_name);
-			if (strcmp(np->full_name, "/aliases") != 0) {
+			if (np == nodes[last_node_index]) {
+				if (of_aliases == np) {
+					of_node_put(of_aliases);
+					of_aliases = NULL;
+				}
 				detach_node_and_children(np);
 			} else {
 				for_each_property_of_node(np, prop) {
@@ -920,6 +924,8 @@ static int __init of_selftest(void)
 	res = selftest_data_add();
 	if (res)
 		return res;
+	if (!of_aliases)
+		of_aliases = of_find_node_by_path("/aliases");
 
 	np = of_find_node_by_path("/testcase-data/phandle-tests/consumer-a");
 	if (!np) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
