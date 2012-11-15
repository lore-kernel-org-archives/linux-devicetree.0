From: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 3/4] dtc/libfdt: introduce fdt types for annotation by
 endian checkers
Date: Wed, 14 Nov 2012 18:59:58 -0600
Message-ID: <1352941199-19393-3-git-send-email-kim.phillips@freescale.com>
References: <E1TYeB5-0003oB-IS@jdl.com>
 <1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352941199-19393-1-git-send-email-kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Projects such as linux and u-boot run sparse on libfdt.  libfdt
contains the notion of endianness via usage of endian conversion
functions such as fdt32_to_cpu.  As such, in order to pass endian
checks, libfdt has to annotate its fdt variables such that sparse
can warn when mixing bitwise and regular integers.  This patch adds
these new fdtXX_t types and, ifdef __CHECKER__ (a symbol sparse
defines), includes the bitwise annotation.

Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
v2:
adds bitwise awareness: determine host endianness manually, and
annotate swabs with __force in fdtXX_to_cpu and cpu_to_fdtXX
conversion functions (the inline endian condition checks are
optimized out at compile time).  This allows us to be able to check
libfdt bitwise conversions with sparse by building dtc with make
CC=cgcc. v2 also moves fdt32 definitions from fdt.h to libfdt_env.h
and changes fdt32 definitions to use __bitwise instead of __be32. No
separate _FDT_SPARSE was introduced because there's no need: using
__CHECKER__ directly is valid because it only occurs once, and in
libfdt_env.h.
In addition, the libfdt sparse fixes have been moved to a subsequent
patch.

v3:  address comments from jdl:
o single set of fdt typedefs, since __bitwise is not defined if !CHECKER
o re-work EXTRACT_BYTE to take 'x' as a parameter, not a global
o SWAB function macros converted to take lowercase 'x' as a parameter,
  not a global

 libfdt/fdt.h        | 42 ++++++++++++++++----------------
 libfdt/libfdt_env.h | 69 +++++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 75 insertions(+), 36 deletions(-)

diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 48ccfd9..45dd134 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -4,45 +4,45 @@
 #ifndef __ASSEMBLY__
 
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
@@ -51,10 +51,10 @@ struct fdt_property {
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
diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 213d7fb..f0d97b9 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -5,25 +5,64 @@
 #include <stdint.h>
 #include <string.h>
 
-#define EXTRACT_BYTE(n)	((unsigned long long)((uint8_t *)&x)[n])
-static inline uint16_t fdt16_to_cpu(uint16_t x)
-{
-	return (EXTRACT_BYTE(0) << 8) | EXTRACT_BYTE(1);
-}
-#define cpu_to_fdt16(x) fdt16_to_cpu(x)
+#ifdef __CHECKER__
+#define __force __attribute__((force))
+#define __bitwise __attribute__((bitwise))
+#else
+#define __force
+#define __bitwise
+#endif
+
+typedef uint16_t __bitwise fdt16_t;
+typedef uint32_t __bitwise fdt32_t;
+typedef uint64_t __bitwise fdt64_t;
+
+#define EXTRACT_BYTE(x, n) ((unsigned long long)((uint8_t *)&x)[n])
+#define __SWAB16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
+#define __SWAB32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
+		     (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
+#define __SWAB64(x) ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
+		     (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
+		     (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
+		     (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
 
-static inline uint32_t fdt32_to_cpu(uint32_t x)
-{
-	return (EXTRACT_BYTE(0) << 24) | (EXTRACT_BYTE(1) << 16) | (EXTRACT_BYTE(2) << 8) | EXTRACT_BYTE(3);
+/*
+ * determine host endianness:
+ * *__first_byte is 0x11 on big endian systems
+ * *__first_byte is 0x44 on little endian systems
+ */
+static const uint32_t __native = 0x11223344u;
+static const uint8_t *__first_byte = (const uint8_t *)&__native;
+
+#define DEF_FDT_TO_CPU(bits) \
+static inline uint##bits##_t fdt##bits##_to_cpu(fdt##bits##_t x) \
+{ \
+	if (*__first_byte == 0x11) \
+		return (__force uint##bits##_t)x; \
+	else \
+		return (__force uint##bits##_t)__SWAB##bits(x); \
 }
-#define cpu_to_fdt32(x) fdt32_to_cpu(x)
+DEF_FDT_TO_CPU(16)
+DEF_FDT_TO_CPU(32)
+DEF_FDT_TO_CPU(64)
 
-static inline uint64_t fdt64_to_cpu(uint64_t x)
-{
-	return (EXTRACT_BYTE(0) << 56) | (EXTRACT_BYTE(1) << 48) | (EXTRACT_BYTE(2) << 40) | (EXTRACT_BYTE(3) << 32)
-		| (EXTRACT_BYTE(4) << 24) | (EXTRACT_BYTE(5) << 16) | (EXTRACT_BYTE(6) << 8) | EXTRACT_BYTE(7);
+#define DEF_CPU_TO_FDT(bits) \
+static inline fdt##bits##_t cpu_to_fdt##bits(uint##bits##_t x) \
+{ \
+	if (*__first_byte == 0x11) \
+		return (__force fdt##bits##_t)x; \
+	else \
+		return (__force fdt##bits##_t)__SWAB##bits(x); \
 }
-#define cpu_to_fdt64(x) fdt64_to_cpu(x)
+DEF_CPU_TO_FDT(16)
+DEF_CPU_TO_FDT(32)
+DEF_CPU_TO_FDT(64)
+
+#undef DEF_CPU_TO_FDT
+#undef DEF_FDT_TO_CPU
+#undef __SWAB64
+#undef __SWAB32
+#undef __SWAB16
 #undef EXTRACT_BYTE
 
 #endif /* _LIBFDT_ENV_H */
-- 
1.8.0
