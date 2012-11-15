From: Kim Phillips <kim.phillips@freescale.com>
Subject: [PATCH v2 4/4] dtc/libfdt: uintXX_t to fdtXX_t conversion
Date: Wed, 14 Nov 2012 18:59:59 -0600
Message-ID: <1352941199-19393-4-git-send-email-kim.phillips@freescale.com>
References: <E1TYeB5-0003oB-IS@jdl.com>
	<1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: jdl@jdl.com
Cc: u-boot@lists.denx.de, devicetree-discuss@lists.ozlabs.org, Kim Phillips <kim.phillips@freescale.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

Now that fdt types are defined and annotated, use them to
make sparse happy.

Signed-off-by: Kim Phillips <kim.phillips@freescale.com>
---
v2: reworded commit text

 libfdt/fdt.c     |  2 +-
 libfdt/fdt_ro.c  |  2 +-
 libfdt/fdt_rw.c  |  4 ++--
 libfdt/fdt_sw.c  |  4 ++--
 libfdt/fdt_wip.c |  2 +-
 libfdt/libfdt.h  | 32 ++++++++++++++++----------------
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index e56833a..57faba3 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -92,7 +92,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
-	const uint32_t *tagp, *lenp;
+	const fdt32_t *tagp, *lenp;
 	uint32_t tag;
 	int offset = startoffset;
 	const char *p;
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 02b6d68..42da2bd 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -322,7 +322,7 @@ const void *fdt_getprop(const void *fdt, int nodeoffset,
 
 uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
 {
-	const uint32_t *php;
+	const fdt32_t *php;
 	int len;
 
 	/* FIXME: This is a bit sub-optimal, since we potentially scan
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 24437df..fdba618 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -339,7 +339,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	int nodelen;
 	int err;
 	uint32_t tag;
-	uint32_t *endtag;
+	fdt32_t *endtag;
 
 	FDT_RW_CHECK_HEADER(fdt);
 
@@ -366,7 +366,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	nh->tag = cpu_to_fdt32(FDT_BEGIN_NODE);
 	memset(nh->name, 0, FDT_TAGALIGN(namelen+1));
 	memcpy(nh->name, name, namelen);
-	endtag = (uint32_t *)((char *)nh + nodelen - FDT_TAGSIZE);
+	endtag = (fdt32_t *)((char *)nh + nodelen - FDT_TAGSIZE);
 	*endtag = cpu_to_fdt32(FDT_END_NODE);
 
 	return offset;
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 55ebebf..f422754 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -153,7 +153,7 @@ int fdt_begin_node(void *fdt, const char *name)
 
 int fdt_end_node(void *fdt)
 {
-	uint32_t *en;
+	fdt32_t *en;
 
 	FDT_SW_CHECK_HEADER(fdt);
 
@@ -213,7 +213,7 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
 int fdt_finish(void *fdt)
 {
 	char *p = (char *)fdt;
-	uint32_t *end;
+	fdt32_t *end;
 	int oldstroffset, newstroffset;
 	uint32_t tag;
 	int offset, nextoffset;
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index 6025fa1..c5bbb68 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -74,7 +74,7 @@ int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 
 static void _fdt_nop_region(void *start, int len)
 {
-	uint32_t *p;
+	fdt32_t *p;
 
 	for (p = start; (char *)p < ((char *)start + len); p++)
 		*p = cpu_to_fdt32(FDT_NOP);
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 73f4975..8e57a06 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -882,8 +882,8 @@ int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 static inline int fdt_setprop_inplace_u32(void *fdt, int nodeoffset,
 					  const char *name, uint32_t val)
 {
-	val = cpu_to_fdt32(val);
-	return fdt_setprop_inplace(fdt, nodeoffset, name, &val, sizeof(val));
+	fdt32_t tmp = cpu_to_fdt32(val);
+	return fdt_setprop_inplace(fdt, nodeoffset, name, &tmp, sizeof(tmp));
 }
 
 /**
@@ -917,8 +917,8 @@ static inline int fdt_setprop_inplace_u32(void *fdt, int nodeoffset,
 static inline int fdt_setprop_inplace_u64(void *fdt, int nodeoffset,
 					  const char *name, uint64_t val)
 {
-	val = cpu_to_fdt64(val);
-	return fdt_setprop_inplace(fdt, nodeoffset, name, &val, sizeof(val));
+	fdt64_t tmp = cpu_to_fdt64(val);
+	return fdt_setprop_inplace(fdt, nodeoffset, name, &tmp, sizeof(tmp));
 }
 
 /**
@@ -993,13 +993,13 @@ int fdt_begin_node(void *fdt, const char *name);
 int fdt_property(void *fdt, const char *name, const void *val, int len);
 static inline int fdt_property_u32(void *fdt, const char *name, uint32_t val)
 {
-	val = cpu_to_fdt32(val);
-	return fdt_property(fdt, name, &val, sizeof(val));
+	fdt32_t tmp = cpu_to_fdt32(val);
+	return fdt_property(fdt, name, &tmp, sizeof(tmp));
 }
 static inline int fdt_property_u64(void *fdt, const char *name, uint64_t val)
 {
-	val = cpu_to_fdt64(val);
-	return fdt_property(fdt, name, &val, sizeof(val));
+	fdt64_t tmp = cpu_to_fdt64(val);
+	return fdt_property(fdt, name, &tmp, sizeof(tmp));
 }
 static inline int fdt_property_cell(void *fdt, const char *name, uint32_t val)
 {
@@ -1154,8 +1154,8 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 static inline int fdt_setprop_u32(void *fdt, int nodeoffset, const char *name,
 				  uint32_t val)
 {
-	val = cpu_to_fdt32(val);
-	return fdt_setprop(fdt, nodeoffset, name, &val, sizeof(val));
+	fdt32_t tmp = cpu_to_fdt32(val);
+	return fdt_setprop(fdt, nodeoffset, name, &tmp, sizeof(tmp));
 }
 
 /**
@@ -1189,8 +1189,8 @@ static inline int fdt_setprop_u32(void *fdt, int nodeoffset, const char *name,
 static inline int fdt_setprop_u64(void *fdt, int nodeoffset, const char *name,
 				  uint64_t val)
 {
-	val = cpu_to_fdt64(val);
-	return fdt_setprop(fdt, nodeoffset, name, &val, sizeof(val));
+	fdt64_t tmp = cpu_to_fdt64(val);
+	return fdt_setprop(fdt, nodeoffset, name, &tmp, sizeof(tmp));
 }
 
 /**
@@ -1296,8 +1296,8 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 static inline int fdt_appendprop_u32(void *fdt, int nodeoffset,
 				     const char *name, uint32_t val)
 {
-	val = cpu_to_fdt32(val);
-	return fdt_appendprop(fdt, nodeoffset, name, &val, sizeof(val));
+	fdt32_t tmp = cpu_to_fdt32(val);
+	return fdt_appendprop(fdt, nodeoffset, name, &tmp, sizeof(tmp));
 }
 
 /**
@@ -1331,8 +1331,8 @@ static inline int fdt_appendprop_u32(void *fdt, int nodeoffset,
 static inline int fdt_appendprop_u64(void *fdt, int nodeoffset,
 				     const char *name, uint64_t val)
 {
-	val = cpu_to_fdt64(val);
-	return fdt_appendprop(fdt, nodeoffset, name, &val, sizeof(val));
+	fdt64_t tmp = cpu_to_fdt64(val);
+	return fdt_appendprop(fdt, nodeoffset, name, &tmp, sizeof(tmp));
 }
 
 /**
-- 
1.8.0
