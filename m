From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/4] powerpc: pseries: vio: match parent nodes with of_find_node_by_path
Date: Tue, 25 Jul 2017 16:44:24 -0500
Message-ID: <20170725214427.25768-2-robh@kernel.org>
References: <20170725214427.25768-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170725214427.25768-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: devicetree@vger.kernel.org

In preparation to remove the full path from device_node.full_name, use
of_find_node_by_path instead of open coding with strcmp.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/pseries/vio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 3201feb6d32b..28a9505e4919 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1357,9 +1357,9 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
 	 */
 	parent_node = of_get_parent(of_node);
 	if (parent_node) {
-		if (!strcmp(parent_node->full_name, "ibm,platform-facilities"))
+		if (parent_node == of_find_node_by_path("/ibm,platform-facilities"))
 			family = PFO;
-		else if (!strcmp(parent_node->full_name, "vdevice"))
+		else if (parent_node == of_find_node_by_path("/vdevice"))
 			family = VDEVICE;
 		else {
 			pr_warn("%s: parent(%pOF) of %s not recognized.\n",
-- 
2.11.0
