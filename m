From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] Removes OF_UNITTEST dependency on OF_DYNAMIC config
 symbol
Date: Thu, 22 Jan 2015 16:56:01 +0000
Message-ID: <20150122165601.E4BA6C40A80@trevor.secretlab.ca>
References: <1420960791-26761-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420960791-26761-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 10 Jan 2015 23:19:51 -0800
, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> This patch intends to remove the unittests dependency on
> the functions defined in dynamic.c. So, rather than calling
> of_attach_node defined in dynamic.c, minimal functionality
> required to attach a new node is re-defined in unittest.c.
> Also, now after executing the tests the test data is not
> removed from the device tree so there is no need to call
> of_detach_node.
> 
> Tested with and without OF_DYNAMIC enabled on ppc, arm and
> x86
> 
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Looks good, but it leaves in some stale node removal code. I've fixed it
up and applied for v3.19. Here is my fixup:

---

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 139363af5c88..28beed1b3c2c 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -27,11 +27,6 @@ static struct selftest_results {
 	int failed;
 } selftest_results;
 
-#define NO_OF_NODES 3
-static struct device_node *nodes[NO_OF_NODES];
-static int last_node_index;
-static bool selftest_live_tree;
-
 #define selftest(result, fmt, ...) ({ \
 	bool failed = !(result); \
 	if (failed) { \
@@ -830,13 +825,6 @@ static int attach_node_and_children(struct device_node *np)
 		return 0;
 	}
 
-	/* Children of the root need to be remembered for removal */
-	if (np->parent == of_root) {
-		if (WARN_ON(last_node_index >= NO_OF_NODES))
-			return -EINVAL;
-		nodes[last_node_index++] = np;
-	}
-
 	child = np->child;
 	np->child = NULL;
 
@@ -899,8 +887,6 @@ static int __init selftest_data_add(void)
 	}
 
 	if (!of_root) {
-		/* enabling flag for removing nodes */
-		selftest_live_tree = true;
 		of_root = selftest_data_node;
 
 		for_each_of_allnodes(np)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
