From: Kim Phillips <kim.phillips@freescale.com>
Subject: [PATCH] libfdt: introduce fdt type annotation for use by
 endian checkers
Date: Tue, 30 Oct 2012 16:57:54 -0500
Message-ID: <20121030165754.65b34c78cd0d3a0d6ab7d34e@freescale.com>
References: <1350433728-24120-1-git-send-email-kim.phillips@freescale.com>
	<507F4B0B.1020401@gmail.com>
	<20121018121112.GI23523@truffula.fritz.box>
	<20121018173022.32f1745249d162d1aa453694@freescale.com>
	<20121019004324.GN23523@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20121019004324.GN23523@truffula.fritz.box>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Jon Loeliger <jdl@jdl.com>
Cc: u-boot@lists.denx.de, devicetree-discuss@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

Projects such as linux and u-boot run sparse on libfdt.  libfdt
contains the notion of endianness via usage of endian conversion
functions such as fdt32_to_cpu.  As such, in order to pass endian
checks, libfdt has to annotate its fdt variables as big endian.
This patch does that ifdef __CHECKER__ (a symbol sparse defines),
for two new fdt types: fdt32_t and fdt64_t, and subsequently
silences warnings emitted by sparse when parsing libfdt.

Signed-off-by: Kim Phillips <kim.phillips@freescale.com>
---
note: wasn't sure whether to introduce the new fdt32 types, or
just have libfdt use __be32 directly.

 libfdt/fdt.c     |  2 +-
 libfdt/fdt.h     | 50 +++++++++++++++++++++++++++++---------------------
 libfdt/fdt_ro.c  |  2 +-
 libfdt/fdt_rw.c  |  4 ++--
 libfdt/fdt_sw.c  |  4 ++--
 libfdt/fdt_wip.c |  2 +-
 libfdt/libfdt.h  | 32 ++++++++++++++++----------------
 7 files changed, 52 insertions(+), 44 deletions(-)

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
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 48ccfd9..0d9c856 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -3,46 +3,54 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef __CHECKER__
+typedef __be32 fdt32_t;
+typedef __be64 fdt64_t;
+#else
+typedef uint32_t fdt32_t;
+typedef uint64_t fdt64_t;
+#endif
+
 struct fdt_header {
-	uint32_t magic;			 /* magic word FDT_MAGIC */
-	uint32_t totalsize;		 /* total size of DT block */
-	uint32_t off_dt_struct;		 /* offset to structure */
-	uint32_t off_dt_strings;	 /* offset to strings */
-	uint32_t off_mem_rsvmap;	 /* offset to memory reserve map */
-	uint32_t version;		 /* format version */
-	uint32_t last_comp_version;	 /* last compatible version */
+	fdt32_t magic;			 /* magic word FDT_MAGIC */
+	fdt32_t totalsize;		 /* total size of DT block */
+	fdt32_t off_dt_struct;		 /* offset to structure */
+	fdt32_t off_dt_strings;		 /* offset to strings */
+	fdt32_t off_mem_rsvmap;		 /* offset to memory reserve map */
+	fdt32_t version;		 /* format version */
+	fdt32_t last_comp_version;	 /* last compatible version */
 
 	/* version 2 fields below */
-	uint32_t boot_cpuid_phys;	 /* Which physical CPU id we're
+	fdt32_t boot_cpuid_phys;	 /* Which physical CPU id we're
 					    booting on */
 	/* version 3 fields below */
-	uint32_t size_dt_strings;	 /* size of the strings block */
+	fdt32_t size_dt_strings;	 /* size of the strings block */
 
 	/* version 17 fields below */
-	uint32_t size_dt_struct;	 /* size of the structure block */
+	fdt32_t size_dt_struct;		 /* size of the structure block */
 };
 
 struct fdt_reserve_entry {
-	uint64_t address;
-	uint64_t size;
+	fdt64_t address;
+	fdt64_t size;
 };
 
 struct fdt_node_header {
-	uint32_t tag;
+	fdt32_t tag;
 	char name[0];
 };
 
 struct fdt_property {
-	uint32_t tag;
-	uint32_t len;
-	uint32_t nameoff;
+	fdt32_t tag;
+	fdt32_t len;
+	fdt32_t nameoff;
 	char data[0];
 };
 
 #endif /* !__ASSEMBLY */
 
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
-#define FDT_TAGSIZE	sizeof(uint32_t)
+#define FDT_TAGSIZE	sizeof(fdt32_t)
 
 #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
 #define FDT_END_NODE	0x2		/* End node */
@@ -51,10 +59,10 @@ struct fdt_property {
 #define FDT_NOP		0x4		/* nop */
 #define FDT_END		0x9
 
-#define FDT_V1_SIZE	(7*sizeof(uint32_t))
-#define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(uint32_t))
-#define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(uint32_t))
+#define FDT_V1_SIZE	(7*sizeof(fdt32_t))
+#define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
+#define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
 #define FDT_V16_SIZE	FDT_V3_SIZE
-#define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(uint32_t))
+#define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
 
 #endif /* _FDT_H */
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
