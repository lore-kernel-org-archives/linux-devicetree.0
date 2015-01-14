From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] of: Add missing of_node_put() in of_find_node_by_path()
Date: Wed, 14 Jan 2015 16:45:56 +0100
Message-ID: <1421250356-16690-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When traversing all nodes and moving to a new path component, the old
one must be released by calling of_node_put(). Else the refcounts of the
parent node(s) will not be decremented.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Background.

While investigating a reference count imbalance issue with
CONFIG_OF_DYNAMIC=y, I wrote the debug code below to validate the
reference counts of the nodes I was interested in.
During the first call of check_refcnts(), it gathers all reference
counts. During a subsequent call, it verifies that they are still the
same.

Surprisingly, lots of reference counts were wrong, and kept incrementing
every time check_refcnts() was called.

I was just wondering whether it would be useful to have a reference
count test in OF_UNITTEST, but now I see the "select OF_DYNAMIC" will go
away?

Feel free to (ab)use the code below and derive a unittest from it...

static struct to_check {
	const char *path;
	int refcnt;
} to_check[] = {
	{ "/" },
	{ "/cpus/cpu@0" },
	{ "/cpus/cpu@1" },
	/* ... other paths I was interested in ... */
};

static void check_refcnts(void)
{
	static bool called;
	unsigned int i;
	const char *path;
	struct device_node *np;
	int refcnt;
	unsigned int errors = 0;

	pr_info("----- %s reference counts -----\n",
		called ? "Checking" : "Saving");
	for (i = 0; i < ARRAY_SIZE(to_check); i++) {
		path = to_check[i].path;
		np = of_find_node_by_path(path);
		if (!np)
			continue;

		refcnt = atomic_read(&np->kobj.kref.refcount);
		if (!called) {
			pr_info("%s %d\n", path, refcnt);
			to_check[i].refcnt = refcnt;
		} else if (refcnt == to_check[i].refcnt) {
			pr_info("%s %d (OK)\n", path, refcnt);
		} else {
			pr_info("%s %d (should be %d)\n", path, refcnt,
				to_check[i].refcnt);
			errors++;
		}

		of_node_put(np);
	}

	if (called)
		pr_info("----- Checking done (%u errors) -----\n", errors);
	else
		pr_info("----- Saving done -----\n");

	called = true;
}
---
 drivers/of/base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 36536b6a8834acd2..f3e346e19c69d1f2 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -791,8 +791,10 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 	if (!np)
 		np = of_node_get(of_root);
 	while (np && *path == '/') {
+		struct device_node *parent = np;
 		path++; /* Increment past '/' delimiter */
-		np = __of_find_node_by_path(np, path);
+		np = __of_find_node_by_path(parent, path);
+		of_node_put(parent);
 		path = strchrnul(path, '/');
 	}
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
