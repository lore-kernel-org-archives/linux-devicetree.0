From: Wojciech Baranowski <baranowski@chromium.org>
Subject: [PATCH] of/platform: Allow missing address for dev name lookup
Date: Fri, 18 Nov 2011 10:09:08 -0500
Message-ID: <1321628948.21392.37.camel@zalecze.wat.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

While looking up linux name for platform device, check the address only if it
has been supplied in lookup table.

Signed-off-by: Wojciech Baranowski <baranowski@chromium.org>
---
 drivers/of/platform.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index cbd5d70..94763c0 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -314,12 +314,14 @@ static const struct of_dev_auxdata *of_dev_lookup(const struct of_dev_auxdata *l
 	if (!lookup)
 		return NULL;
 
-	for(; lookup->name != NULL; lookup++) {
+	for (; lookup->name != NULL; lookup++) {
 		if (!of_device_is_compatible(np, lookup->compatible))
 			continue;
-		if (of_address_to_resource(np, 0, &res))
+		if (lookup->phys_addr &&
+				of_address_to_resource(np, 0, &res))
 			continue;
-		if (res.start != lookup->phys_addr)
+		if (lookup->phys_addr &&
+				res.start != lookup->phys_addr)
 			continue;
 		pr_debug("%s: devname=%s\n", np->full_name, lookup->name);
 		return lookup;
-- 
1.7.3.1
