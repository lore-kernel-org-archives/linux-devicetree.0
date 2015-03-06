From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] libfdt: Add fdt_path_offset_namelen()
Date: Fri,  6 Mar 2015 10:12:38 -0500
Message-ID: <1425654758-2575-1-git-send-email-peter@hurleysoftware.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Properties may contain path names which are not NUL-terminated.
For example, the 'stdout-path' property allows the form 'path:options',
where the ':' character terminates the path specifier.

Allow these path names to be used in-place for path descending;
add fdt_path_offset_namelen(), which limits the path name to 'namelen'
characters.

Reimplement fdt_path_offset() as a trivial wrapper.

Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_ro.c    | 22 ++++++++++++++--------
 libfdt/libfdt.h    | 11 +++++++++++
 libfdt/version.lds |  1 +
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 50007f6..a65e4b5 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -154,9 +154,9 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
 	return fdt_subnode_offset_namelen(fdt, parentoffset, name, strlen(name));
 }
 
-int fdt_path_offset(const void *fdt, const char *path)
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 {
-	const char *end = path + strlen(path);
+	const char *end = path + namelen;
 	const char *p = path;
 	int offset = 0;
 
@@ -164,7 +164,7 @@ int fdt_path_offset(const void *fdt, const char *path)
 
 	/* see if we have an alias */
 	if (*path != '/') {
-		const char *q = strchr(path, '/');
+		const char *q = memchr(path, '/', end - p);
 
 		if (!q)
 			q = end;
@@ -177,14 +177,15 @@ int fdt_path_offset(const void *fdt, const char *path)
 		p = q;
 	}
 
-	while (*p) {
+	while (p < end) {
 		const char *q;
 
-		while (*p == '/')
+		while (*p == '/') {
 			p++;
-		if (! *p)
-			return offset;
-		q = strchr(p, '/');
+			if (p == end)
+				return offset;
+		}
+		q = memchr(p, '/', end - p);
 		if (! q)
 			q = end;
 
@@ -198,6 +199,11 @@ int fdt_path_offset(const void *fdt, const char *path)
 	return offset;
 }
 
+int fdt_path_offset(const void *fdt, const char *path)
+{
+	return fdt_path_offset_namelen(fdt, path, strlen(path));
+}
+
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
 	const struct fdt_node_header *nh = _fdt_offset_ptr(fdt, nodeoffset);
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 02baa84..50b13b4 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -318,6 +318,17 @@ int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
 int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
 
 /**
+ * fdt_path_offset_namelen - find a tree node by its full path
+ * @fdt: pointer to the device tree blob
+ * @path: full path of the node to locate
+ * @namelen: number of characters of path to consider
+ *
+ * Identical to fdt_path_offset(), but only consider the first namelen
+ * characters of path as the path name.
+ */
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
+
+/**
  * fdt_path_offset - find a tree node by its full path
  * @fdt: pointer to the device tree blob
  * @path: full path of the node to locate
diff --git a/libfdt/version.lds b/libfdt/version.lds
index 80b322b..80e945e 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -8,6 +8,7 @@ LIBFDT_1.2 {
 		fdt_get_mem_rsv;
 		fdt_subnode_offset_namelen;
 		fdt_subnode_offset;
+		fdt_path_offset_namelen;
 		fdt_path_offset;
 		fdt_get_name;
 		fdt_get_property_namelen;
-- 
2.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
