From: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] of: fix "/cpus" reference leak in of_numa_parse_cpu_nodes()
Date: Mon, 17 Apr 2017 20:29:17 -0400
Message-ID: <1492475357-10784-1-git-send-email-tyreld@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The call to of_find_node_by_path("/cpus") returns the cpus device_node
with its reference count incremented. There is no matching of_node_put()
call in of_numa_parse_cpu_nodes() which results in a leaked reference
to the "/cpus" node.

This patch adds an of_node_put() to release the reference.

fixes: 298535c00a2c ("of, numa: Add NUMA of binding implementation.")
Signed-off-by: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 drivers/of/of_numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index a53982a..2db1f7a 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -57,6 +57,8 @@ static void __init of_numa_parse_cpu_nodes(void)
 		else
 			node_set(nid, numa_nodes_parsed);
 	}
+
+	of_node_put(cpus);
 }
 
 static int __init of_numa_parse_memory_nodes(void)
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
