From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH] libfdt: Teach fdt_path_offset() about ':' path separator
Date: Wed,  4 Mar 2015 11:44:19 -0500
Message-ID: <1425487459-20955-1-git-send-email-peter@hurleysoftware.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Peter Hurley <peter@hurleysoftware.com>, Leif Lindholm <leif.lindholm@linaro.org>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

stdout-path defines ':' as a path separator and commit 75c28c09af99a
("of: add optional options parameter to of_find_node_by_path()") added
the necessary support to parse paths terminated with ':' path separator.
commit 7914a7c5651a5 ("of: support passing console options with
stdout-path") added options string support to the stdout-path property,
which broke earlycon.

Add the same support to fdt_path_offset() so earlycon can parse and
process stdout-path properties containing an options string.

Cc: Leif Lindholm <leif.lindholm@linaro.org>
Cc: <stable@vger.kernel.org> # 3.19+
Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 scripts/dtc/libfdt/fdt_ro.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
index 02b6d68..a96e452 100644
--- a/scripts/dtc/libfdt/fdt_ro.c
+++ b/scripts/dtc/libfdt/fdt_ro.c
@@ -156,7 +156,8 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
 
 int fdt_path_offset(const void *fdt, const char *path)
 {
-	const char *end = path + strlen(path);
+	const char *separator = strchr(path, ':');
+	const char *end = separator ? separator : path + strlen(path);
 	const char *p = path;
 	int offset = 0;
 
@@ -166,7 +167,7 @@ int fdt_path_offset(const void *fdt, const char *path)
 	if (*path != '/') {
 		const char *q = strchr(path, '/');
 
-		if (!q)
+		if (!q || q > end)
 			q = end;
 
 		p = fdt_get_alias_namelen(fdt, p, q - p);
@@ -177,7 +178,7 @@ int fdt_path_offset(const void *fdt, const char *path)
 		p = q;
 	}
 
-	while (*p) {
+	while (p < end) {
 		const char *q;
 
 		while (*p == '/')
@@ -185,7 +186,7 @@ int fdt_path_offset(const void *fdt, const char *path)
 		if (! *p)
 			return offset;
 		q = strchr(p, '/');
-		if (! q)
+		if (!q || q > end)
 			q = end;
 
 		offset = fdt_subnode_offset_namelen(fdt, offset, p, q-p);
-- 
2.3.1
