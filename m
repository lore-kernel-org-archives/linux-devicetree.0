From: ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 2/2] of: Make of_find_node_by_path() traverse /aliases for
 relative paths.
Date: Thu, 10 Nov 2011 17:11:29 -0800
Message-ID: <1320973889-30079-3-git-send-email-ddaney.cavm@gmail.com>
References: <1320973889-30079-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320973889-30079-1-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Currently all paths passed to of_find_node_by_path() must begin with a
'/', indicating a full path to the desired node.

Augment the look-up code so that if a path does *not* begin with '/',
the path is used as the name of an /aliases property.  The value of
this alias is then used as the full node path to be found.

Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
---
 drivers/of/base.c |   65 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 9b6588e..cf765c7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -365,22 +365,81 @@ EXPORT_SYMBOL(of_get_next_child);
 
 /**
  *	of_find_node_by_path - Find a node matching a full OF path
- *	@path:	The full path to match
+ *	@path: Either the full path to match, or if the path does not
+ *	       start with '/', the name of a property of the /aliases
+ *	       node (an alias).  In the case of an alias, the node
+ *	       matching the alias' value will be returned.
  *
  *	Returns a node pointer with refcount incremented, use
  *	of_node_put() on it when done.
  */
 struct device_node *of_find_node_by_path(const char *path)
 {
-	struct device_node *np = allnodes;
+	struct device_node *np = NULL;
+	struct device_node *aliases = NULL;
+	char *alias = NULL;
+	char *new_path = NULL;
+	char *ps;
 
 	read_lock(&devtree_lock);
-	for (; np; np = np->allnext) {
+
+	/*
+	 * The following code has three possibilities:
+	 * 1) '/' at start of string; path == ps; (based at root)
+	 * 2) '/' at offset in string; path < ps; (relative to alias)
+	 * 3) '/' not found; ps == NULL; (alias only)
+	 *
+	 * If ps != path, then it is either a pure alias (ps == NULL),
+	 * or an alias with a relative path (path < ps).  Either way,
+	 * look up the path pointed to by the alias.
+	 */
+	ps = strchr(path, '/');
+	if (path != ps) {
+		aliases = of_find_node_by_path("/aliases");
+		if (!aliases)
+			goto out;
+
+		/*
+		 * Duplicate the alias part of the string so it can be
+		 * NULL terminated.
+		 */
+		alias = kstrndup(path,
+				 ps ? (ps - path) : strlen(path), GFP_KERNEL);
+		if (!alias)
+			goto out;
+		path = of_get_property(aliases, alias, NULL);
+		if (!path || path[0] != '/')
+			goto out;
+
+		/* If ps is not NULL, then there is a relative path to append */
+		if (ps) {
+			new_path = kzalloc(strlen(path) + strlen(ps) + 1,
+					   GFP_KERNEL);
+			if (!new_path)
+				goto out;
+
+			sprintf(new_path, "%s%s", path, ps);
+			path = new_path;
+		}
+	}
+
+	/*
+	 * At this point, path now points to the full unaliased path
+	 * to a node, regardless of whether or not it started with an
+	 * alias.
+	 */
+
+	for (np = allnodes; np; np = np->allnext) {
 		if (np->full_name && (of_node_cmp(np->full_name, path) == 0)
 		    && of_node_get(np))
 			break;
 	}
+out:
+	if (aliases)
+		of_node_put(aliases);
 	read_unlock(&devtree_lock);
+	kfree(alias);
+	kfree(new_path);
 	return np;
 }
 EXPORT_SYMBOL(of_find_node_by_path);
-- 
1.7.2.3
