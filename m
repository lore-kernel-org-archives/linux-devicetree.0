From: Kim Phillips <kim.phillips@freescale.com>
Subject: [PATCH 3/4 v2] dtc/libfdt: introduce fdt types for
 annotation by endian checkers
Date: Tue, 13 Nov 2012 18:34:17 -0600
Message-ID: <20121113183417.7706e5c6044eb273309ef46e@freescale.com>
References: <1350433728-24120-1-git-send-email-kim.phillips@freescale.com>
	<507F4B0B.1020401@gmail.com>
	<20121018121112.GI23523@truffula.fritz.box>
	<20121018173022.32f1745249d162d1aa453694@freescale.com>
	<20121019004324.GN23523@truffula.fritz.box>
	<20121030165754.65b34c78cd0d3a0d6ab7d34e@freescale.com>
	<20121106074819.GG23553@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20121106074819.GG23553@truffula.fritz.box>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: David Gibson <david@gibson.dropbear.id.au>, Jon Loeliger <jdl@jdl.com>
Cc: u-boot@lists.denx.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Projects such as linux and u-boot run sparse on libfdt.  libfdt
contains the notion of endianness via usage of endian conversion
functions such as fdt32_to_cpu.  As such, in order to pass endian
checks, libfdt has to annotate its fdt variables such that sparse
can warn when mixing bitwise and regular integers.  This patch adds
these new fdtXX_t types and, ifdef __CHECKER__ (a symbol sparse
defines), includes the bitwise annotation.

Signed-off-by: Kim Phillips <kim.phillips@freescale.com>
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

I hope this addresses all your comments, David.

 libfdt/fdt.h        | 42 +++++++++++++++++-----------------
 libfdt/libfdt_env.h | 66 +++++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 73 insertions(+), 35 deletions(-)

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
index 213d7fb..302d5cb 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -5,25 +5,63 @@
 #include <stdint.h>
 #include <string.h>
 
+#ifdef __CHECKER__
+#define __force __attribute__((force))
+#define __bitwise __attribute__((bitwise))
+typedef uint16_t __bitwise fdt16_t;
+typedef uint32_t __bitwise fdt32_t;
+typedef uint64_t __bitwise fdt64_t;
+#else
+#define __force
+#define __bitwise
+typedef uint16_t fdt16_t;
+typedef uint32_t fdt32_t;
+typedef uint64_t fdt64_t;
+#endif
+
 #define EXTRACT_BYTE(n)	((unsigned long long)((uint8_t *)&x)[n])
-static inline uint16_t fdt16_to_cpu(uint16_t x)
-{
-	return (EXTRACT_BYTE(0) << 8) | EXTRACT_BYTE(1);
-}
-#define cpu_to_fdt16(x) fdt16_to_cpu(x)
+#define __SWAB16X ((EXTRACT_BYTE(0) << 8) | EXTRACT_BYTE(1))
+#define __SWAB32X ((EXTRACT_BYTE(0) << 24) | (EXTRACT_BYTE(1) << 16) | (EXTRACT_BYTE(2) << 8) | EXTRACT_BYTE(3))
+#define __SWAB64X ((EXTRACT_BYTE(0) << 56) | (EXTRACT_BYTE(1) << 48) | (EXTRACT_BYTE(2) << 40) | (EXTRACT_BYTE(3) << 32) \
+		  | (EXTRACT_BYTE(4) << 24) | (EXTRACT_BYTE(5) << 16) | (EXTRACT_BYTE(6) << 8) | EXTRACT_BYTE(7))
 
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
+		return (__force uint##bits##_t)__SWAB##bits##X; \
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
+		return (__force fdt##bits##_t)__SWAB##bits##X; \
 }
-#define cpu_to_fdt64(x) fdt64_to_cpu(x)
+DEF_CPU_TO_FDT(16)
+DEF_CPU_TO_FDT(32)
+DEF_CPU_TO_FDT(64)
+
+#undef DEF_FDT_TO_CPU
+#undef DEF_CPU_TO_FDT
+#undef __SWAB64X
+#undef __SWAB32X
+#undef __SWAB16X
 #undef EXTRACT_BYTE
 
 #endif /* _LIBFDT_ENV_H */
-- 
1.8.0
