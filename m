From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/5] powerpc: pseries: vio: match parent nodes with of_find_node_by_path
Date: Mon, 21 Aug 2017 10:16:48 -0500
Message-ID: <20170821151651.25096-3-robh@kernel.org>
References: <20170821151651.25096-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170821151651.25096-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, David Laight <David.Laight@aculab.com>
List-Id: devicetree@vger.kernel.org

In preparation to remove the full path from device_node.full_name, use
of_find_node_by_path instead of open coding with strcmp.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
v2:
- rebased to linux-next and removed spurious change fro patch 1.

 arch/powerpc/platforms/pseries/vio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index aa5ca74316fa..5754572deb23 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1357,9 +1357,9 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
 	 */
 	parent_node = of_get_parent(of_node);
 	if (parent_node) {
-		if (!strcmp(parent_node->full_name, "/ibm,platform-facilities"))
+		if (parent_node == of_find_node_by_path("/ibm,platform-facilities"))
 			family = PFO;
-		else if (!strcmp(parent_node->full_name, "/vdevice"))
+		else if (parent_node == of_find_node_by_path("/vdevice"))
 			family = VDEVICE;
 		else {
 			pr_warn("%s: parent(%pOF) of %s not recognized.\n",
-- 
2.11.0
