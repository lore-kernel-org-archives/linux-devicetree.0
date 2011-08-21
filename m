From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 2/2] arch/powerpc/platforms/powermac/setup.c: add missing of_node_put
Date: Sun, 21 Aug 2011 18:10:01 +0200
Message-ID: <1313943001-12884-2-git-send-email-julia@diku.dk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

np is initialized to the result of calling a function that calls
of_node_get, so of_node_put should be called before the pointer is dropped.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1,e2;
@@

* e = \(of_find_node_by_type\|of_find_node_by_name\)(...)
  ... when != of_node_put(e)
      when != true e == NULL
      when != e2 = e
  e = e1
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/platforms/powermac/setup.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 96580b1..970ea1d 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -494,11 +494,15 @@ static int __init pmac_declare_of_platform_devices(void)
 		return -1;
 
 	np = of_find_node_by_name(NULL, "valkyrie");
-	if (np)
+	if (np) {
 		of_platform_device_create(np, "valkyrie", NULL);
+		of_node_put(np);
+	}
 	np = of_find_node_by_name(NULL, "platinum");
-	if (np)
+	if (np) {
 		of_platform_device_create(np, "platinum", NULL);
+		of_node_put(np);
+	}
         np = of_find_node_by_type(NULL, "smu");
         if (np) {
 		of_platform_device_create(np, "smu", NULL);
