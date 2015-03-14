From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [Patch 2/5] dt: unittest: typo in error string
Date: Fri, 13 Mar 2015 23:59:01 -0700
Message-ID: <5503DC35.7020003@gmail.com>
References: <5503C65F.4030000@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5503C65F.4030000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Fix bug pointed out by checkpatch.

Splitting string incorrectly removed a space between two words.

Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 drivers/of/unittest.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: b/drivers/of/unittest.c
===================================================================
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -212,8 +212,9 @@ static void __init of_selftest_check_tre
 	child_count = of_selftest_check_node_linkage(of_root);
 
 	selftest(child_count > 0, "Device node data structure is corrupted\n");
-	selftest(child_count == allnode_count, "allnodes list size (%i) doesn't match"
-		 "sibling lists size (%i)\n", allnode_count, child_count);
+	selftest(child_count == allnode_count,
+		 "allnodes list size (%i) doesn't match sibling lists size (%i)\n",
+		 allnode_count, child_count);
 	pr_debug("allnodes list size (%i); sibling lists size (%i)\n", allnode_count, child_count);
 }
 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
