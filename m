From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH] of/selftest: Fix off-by-one error in removal path
Date: Wed, 19 Nov 2014 17:18:22 +0000
Message-ID: <1416417502-25869-1-git-send-email-grant.likely@linaro.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Gaurav Minocha <gaurav.minocha.os@gmail.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The removal path for selftest data has an off by one error that causes
the code to dereference beyond the end of the nodes[] array on the first
pass through. The old code only worked by chance on a lot of platforms,
but the bug was recently exposed on aarch64.

The fix is simple. Decrement the node count before dereferencing, not
after.

Reported-by: Kevin Hilman <khilman@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Gaurav Minocha <gaurav.minocha.os@gmail.com>
Cc: <stable@vger.kernel.org> # v3.17+
---
 drivers/of/selftest.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index 11b873c54a77..e6c14dc400e9 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -896,7 +896,7 @@ static void selftest_data_remove(void)
 		return;
 	}
 
-	while (last_node_index >= 0) {
+	while (last_node_index-- > 0) {
 		if (nodes[last_node_index]) {
 			np = of_find_node_by_path(nodes[last_node_index]->full_name);
 			if (strcmp(np->full_name, "/aliases") != 0) {
@@ -908,7 +908,6 @@ static void selftest_data_remove(void)
 				}
 			}
 		}
-		last_node_index--;
 	}
 }
 
-- 
1.9.1
