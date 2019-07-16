Return-Path: <SRS0=Oxx0=VN=gmail.com=nishkadg.linux@kernel.org>
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] of: resolver: Add of_node_put() before return and break
Date: Tue, 16 Jul 2019 11:13:30 +0530
Message-Id: <20190716054331.2775-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: pantelis.antoniou@konsulko.com, frowand.list@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return or break from the middle of the loop, there is no
put, thus causing a memory leak. Hence add an of_node_put before the
return or break in three places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/of/resolver.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index c1b67dd7cd6e..83c766233181 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -206,16 +206,22 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 	for_each_child_of_node(local_fixups, child) {
 
 		for_each_child_of_node(overlay, overlay_child)
-			if (!node_name_cmp(child, overlay_child))
+			if (!node_name_cmp(child, overlay_child)) {
+				of_node_put(overlay_child);
 				break;
+			}
 
-		if (!overlay_child)
+		if (!overlay_child) {
+			of_node_put(child);
 			return -EINVAL;
+		}
 
 		err = adjust_local_phandle_references(child, overlay_child,
 				phandle_delta);
-		if (err)
+		if (err) {
+			of_node_put(child);
 			return err;
+		}
 	}
 
 	return 0;
-- 
2.19.1
