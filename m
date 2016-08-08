From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH 3/4] powerpc/mm: allow memory hotplug into a memoryless node
Date: Mon,  8 Aug 2016 13:27:22 -0500
Message-ID: <1470680843-28702-4-git-send-email-arbab@linux.vnet.ibm.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove the check which prevents us from hotplugging into an empty node.

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 80d067d..bc70c4f 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1127,7 +1127,7 @@ static int hot_add_node_scn_to_nid(unsigned long scn_addr)
 int hot_add_scn_to_nid(unsigned long scn_addr)
 {
 	struct device_node *memory = NULL;
-	int nid, found = 0;
+	int nid;
 
 	if (!numa_enabled || (min_common_depth < 0))
 		return first_online_node;
@@ -1143,17 +1143,6 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
 	if (nid < 0 || !node_online(nid))
 		nid = first_online_node;
 
-	if (NODE_DATA(nid)->node_spanned_pages)
-		return nid;
-
-	for_each_online_node(nid) {
-		if (NODE_DATA(nid)->node_spanned_pages) {
-			found = 1;
-			break;
-		}
-	}
-
-	BUG_ON(!found);
 	return nid;
 }
 
-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
