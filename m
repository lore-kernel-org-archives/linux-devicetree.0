From: Laurentiu Tudor <b10716@freescale.com>
Subject: [PATCH] of: make sure of_alias is initialized before accessing it
Date: Wed, 27 Aug 2014 17:09:39 +0300
Message-ID: <53FDE6A3.3080303@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Laurentiu Tudor <Laurentiu.Tudor@freescale.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Simply swap of_alias and of_chosen initialization so
that of_alias ends up read first. This must be done
because it is accessed couple of lines below when
trying to initialize the of_stdout using the alias
based legacy method.

[Fixes a752ee5 - tty: Update hypervisor tty drivers to                          
use core stdout parsing code]

Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@freescale.com>
Cc: Grant Likely <grant.likely@linaro.org>
---
 drivers/of/base.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d8574ad..52f8506 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1847,6 +1847,10 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 {
 	struct property *pp;
 
+	of_aliases = of_find_node_by_path("/aliases");
+	if (!of_aliases)
+		return;
+
 	of_chosen = of_find_node_by_path("/chosen");
 	if (of_chosen == NULL)
 		of_chosen = of_find_node_by_path("/chosen@0");
@@ -1862,10 +1866,6 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 			of_stdout = of_find_node_by_path(name);
 	}
 
-	of_aliases = of_find_node_by_path("/aliases");
-	if (!of_aliases)
-		return;
-
 	for_each_property_of_node(of_aliases, pp) {
 		const char *start = pp->name;
 		const char *end = start + strlen(start);
-- 
1.8.3.1
