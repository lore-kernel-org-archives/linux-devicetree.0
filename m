From: Andres Salomon <dilinger@queued.net>
Subject: [PATCH] of: add some debugging statements if initrd isn't found
Date: Fri, 3 Feb 2012 14:15:20 -0800
Message-ID: <20120203141520.4900a23b@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


While debugging initrd problems in a FDT blob, it's nice to both terminate
the "Looking for initrd properties... " with a newline, as well as letting us
know which property wasn't found.

Signed-off-by: Andres Salomon <dilinger@queued.net>
---
 drivers/of/fdt.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ea2bd1b..92234f7 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -561,13 +561,17 @@ void __init early_init_dt_check_for_initrd(unsigned long node)
 	pr_debug("Looking for initrd properties... ");
 
 	prop = of_get_flat_dt_prop(node, "linux,initrd-start", &len);
-	if (!prop)
+	if (!prop) {
+		pr_debug("couldn't find linux,initrd-start\n");
 		return;
+	}
 	start = of_read_ulong(prop, len/4);
 
 	prop = of_get_flat_dt_prop(node, "linux,initrd-end", &len);
-	if (!prop)
+	if (!prop) {
+		pr_debug("couldn't find linux,initrd-end\n");
 		return;
+	}
 	end = of_read_ulong(prop, len/4);
 
 	early_init_dt_setup_initrd_arch(start, end);
-- 
1.7.2.5
