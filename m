From: Rob Herring <robh@kernel.org>
Subject: [PATCH] powerpc: Rework btext_find_display to use of_stdout and device_type helpers
Date: Fri, 16 Nov 2018 16:10:59 -0600
Message-ID: <20181116221104.23024-3-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Remove directly accessing device_node.type pointer and use the accessors
instead. This will eventually allow removing the type pointer.

In the process, the of_stdout pointer can be used instead of finding the
stdout node again.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/kernel/btext.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index b4241ed1456e..488b0875ed66 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -232,20 +232,12 @@ static int btext_initialize(struct device_node *np)
 
 int __init btext_find_display(int allow_nonstdout)
 {
-	const char *name;
-	struct device_node *np = NULL; 
+	struct device_node *np = of_stdout; 
 	int rc = -ENODEV;
 
-	name = of_get_property(of_chosen, "linux,stdout-path", NULL);
-	if (name != NULL) {
-		np = of_find_node_by_path(name);
-		if (np != NULL) {
-			if (strcmp(np->type, "display") != 0) {
-				printk("boot stdout isn't a display !\n");
-				of_node_put(np);
-				np = NULL;
-			}
-		}
+	if (!of_node_is_type(np, "display")) {
+		printk("boot stdout isn't a display !\n");
+		np = NULL;
 	}
 	if (np)
 		rc = btext_initialize(np);
-- 
2.19.1
